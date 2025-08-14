// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import "sim-idx-generated/Generated.sol";

interface AggregatorV3Interface {
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
    function poolToTokens(bytes32) external view returns (address token0, address token1);
}

interface IERC20Metadata {
    function decimals() external view returns (uint8);
    function symbol() external view returns (string memory);
}

contract UniswapV4SwapListener is UniswapV4PoolManager$OnSwapEvent {
    // For now I removed liquidity, tick and sqrtPriceX96 to avoid struct flattening on sim idx
    event SwapExecuted(
        bytes32 id,
        bytes32 transactionHash,
        uint256 blockHeight,
        uint256 blockTimestamp,
        address sender,
        int128 amount0,
        int128 amount1,
        address token0,
        address token1,
        uint8 token0Decimals,
        uint8 token1Decimals,
        string token0Symbol,
        string token1Symbol,
        uint256 price
    );

    IPoolToTokenSource public constant POOL_TO_TOKEN_SOURCE =
        IPoolToTokenSource(0x49C9677d55c3D48F5e86eFA3600154440c15F6c8);

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
        AggregatorV3Interface agg = AggregatorV3Interface(feed);
        (, int256 answer,, ,) = agg.latestRoundData();
        require(answer > 0, "price <= 0");
        uint8 dec = agg.decimals();
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

    function _poolToken0(bytes32 id) internal view returns (address token0) {
        (token0, ) = POOL_TO_TOKEN_SOURCE.poolToTokens(id);
    }

    function _poolToken1(bytes32 id) internal view returns (address token1) {
        (, token1) = POOL_TO_TOKEN_SOURCE.poolToTokens(id);
    }

    function _tokenDecimals(address token) internal view returns (uint8) {
        (uint8 d, ) = _readTokenMeta(token);
        return d;
    }

    function _tokenSymbol(address token) internal view returns (string memory) {
        (, string memory s) = _readTokenMeta(token);
        return s;
    }

    function onSwapEvent(
        EventContext memory ctx,
        UniswapV4PoolManager$SwapEventParams memory inputs
    ) external override {
        if (POOL_TO_TOKEN_SOURCE.poolToToken(inputs.id) == address(0)) {
            // Not one of our pools
            return;
        }

        // Read normalized ETH/USDC to USD price (1e18) from Chainlink Base oracle
        // TODO: Add USDC/ETH detection logic later
        // uint256 usdcUsd = _readUsdPrice1e18(USDC_USD_AGGREGATOR);
        uint256 priceUsd = _readUsdPrice1e18(ETH_USD_AGGREGATOR);

        address token0Addr = _poolToken0(inputs.id);
        address token1Addr = _poolToken1(inputs.id);
        uint8 token0Dec = _tokenDecimals(token0Addr);
        uint8 token1Dec = _tokenDecimals(token1Addr);
        string memory token0Sym = _tokenSymbol(token0Addr);
        string memory token1Sym = _tokenSymbol(token1Addr);

        emit SwapExecuted(
            inputs.id,
            ctx.txn.hash(),
            block.number,
            block.timestamp,
            inputs.sender,
            inputs.amount0,
            inputs.amount1,
            token0Addr,
            token1Addr,
            token0Dec,
            token1Dec,
            token0Sym,
            token1Sym,
            priceUsd
        );
    }
}
