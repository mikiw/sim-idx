/// Test commands for `sim listeners evaluate`.
/// Prod Contract
/// Init events:
///   sim listeners evaluate --chain-id 8453 --start-block 33583935 --end-block 33583945 --listeners UniswapV4SwapListener
/// Swap events:
///   sim listeners evaluate --chain-id 8453 --start-block 33929640 --end-block 33929650 --listeners UniswapV4SwapListener
/// 
/// Dev Contract
/// Init events:
///   sim listeners evaluate --chain-id 8453 --start-block 32330140 --end-block 32330150 --listeners UniswapV4SwapListener
/// Swap events:
///.  sim listeners evaluate --chain-id 8453 --start-block 34405070 --end-block 34405080 --listeners UniswapV4SwapListener

pragma solidity ^0.8.13;


import "sim-idx-generated/Generated.sol";

interface AggregatorV4Interface {
    function decimals() external view returns (uint8);
    function latestRoundData() external view returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    );
}

interface IPoolToTokenSource {
    function poolToToken(bytes32) external view returns (address);
}

interface IERC20Metadata {
    function decimals() external view returns (uint8);
    function symbol() external view returns (string memory);
}

contract UniswapV4SwapListener is UniswapV4PoolManager$OnSwapEvent, UniswapV4PoolManager$OnInitializeEvent {
    struct SwapExecutedData {
        bytes32 id;
        bytes32 transactionHash;
        uint256 blockHeight;
        uint256 blockTimestamp;
        address sender;
        int128 amount0;
        int128 amount1;
        uint256 price;
        uint160 sqrtPriceX96;
        uint128 liquidity;
        int24 tick;
        uint24 fee;
    }
    event SwapExecuted(SwapExecutedData);

    struct PoolInitializedData {
        bytes32 id;
        bytes32 transactionHash;
        uint256 blockHeight;
        uint256 blockTimestamp;
        address token0;
        address token1;
        uint8 token0Decimals;
        uint8 token1Decimals;
        string token0Symbol;
        string token1Symbol;
    }
    event PoolInitialized(PoolInitializedData);

    // TODO: we need to update dev env with new contract factory
    // dev 0x3B9dFa40bea19f24f97d0c20fB85ea15bBE12330
    // prod 0x49C9677d55c3D48F5e86eFA3600154440c15F6c8
    IPoolToTokenSource public constant POOL_TO_TOKEN_SOURCE =
        IPoolToTokenSource(0x3B9dFa40bea19f24f97d0c20fB85ea15bBE12330);

    address public constant ETH_USD_AGGREGATOR = 0x71041dddad3595F9CEd3DcCFBe3D1F4b0a16Bb70;
    address public constant USDC_USD_AGGREGATOR = 0x7e860098F58bBFC8648a4311b374B1D669a2bc6B;

    function _normalizeTo1e18(uint256 value, uint8 inDecimals) internal pure returns (uint256) {
        if (inDecimals == 18) return value;
        if (inDecimals < 18) {
            return value * (10 ** uint256(18 - inDecimals));
        } else {
            return value / (10 ** uint256(inDecimals - 18));
        }
    }

    function _readUsdPrice1e18(address feed) internal view returns (uint256) {
        AggregatorV4Interface agg = AggregatorV4Interface(feed);
        int256 answer;
        uint8 dec = 8;
        // Guard latestRoundData (can revert on some historical blocks)
        try agg.latestRoundData() returns (uint80, int256 a, uint256, uint256, uint80) {
            answer = a;
        } catch {
            return 0;
        }
        // Guard decimals()
        try agg.decimals() returns (uint8 d) {
            dec = d;
        } catch {}
        if (answer <= 0) {
            return 0;
        }
        return _normalizeTo1e18(uint256(answer), dec);
    }
   
    function _readTokenMeta(address token) internal view returns (uint8 dec, string memory sym) {
        dec = 18;
        sym = "TOKEN";
        if (token == address(0)) {
            return (dec, sym);
        }
        try IERC20Metadata(token).decimals() returns (uint8 d) {
            dec = d;
        } catch {}
        try IERC20Metadata(token).symbol() returns (string memory s) {
            sym = s;
        } catch {}
    }

    function _isTrackedPool(bytes32 id) internal view returns (bool) {
        try POOL_TO_TOKEN_SOURCE.poolToToken(id) returns (address a) {
            return a != address(0);
        } catch {
            return false;
        }
    }

    function onSwapEvent(
        EventContext memory ctx,
        UniswapV4PoolManager$SwapEventParams memory inputs
    ) external override
    {
        if (!_isTrackedPool(inputs.id)) {
            return;
        }

        // TODO: add USDC_USD_AGGREGATOR later
        uint256 priceUsd = _readUsdPrice1e18(ETH_USD_AGGREGATOR);

        SwapExecutedData memory ev;
        ev.id = inputs.id;
        ev.transactionHash = ctx.txn.hash();
        ev.blockHeight = block.number;
        ev.blockTimestamp = block.timestamp;
        ev.sender = tx.origin;
        ev.amount0 = inputs.amount0;
        ev.amount1 = inputs.amount1;
        ev.price = priceUsd;
        ev.sqrtPriceX96 = inputs.sqrtPriceX96;
        ev.liquidity = inputs.liquidity;
        ev.tick = inputs.tick;
        ev.fee = inputs.fee;
        emit SwapExecuted(ev);
    }

    function onInitializeEvent(
        EventContext memory ctx,
        UniswapV4PoolManager$InitializeEventParams memory inputs
    ) external override
    {
        if (!_isTrackedPool(inputs.id)) { return; }

        address token0Addr = inputs.currency0;
        address token1Addr = inputs.currency1;

        (uint8 d0, string memory s0) = _readTokenMeta(token0Addr);
        (uint8 d1, string memory s1) = _readTokenMeta(token1Addr);

        PoolInitializedData memory ev;
        ev.id = inputs.id;
        ev.transactionHash = ctx.txn.hash();
        ev.blockHeight = block.number;
        ev.blockTimestamp = block.timestamp;
        ev.token0 = token0Addr;
        ev.token1 = token1Addr;
        ev.token0Decimals = d0;
        ev.token1Decimals = d1;
        ev.token0Symbol = s0;
        ev.token1Symbol = s1;
        emit PoolInitialized(ev);
    }
}
