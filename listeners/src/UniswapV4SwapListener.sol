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
}

contract UniswapV4SwapListener is UniswapV4PoolManager$OnSwapEvent {
    // TODO: add token0 and token1: decimals, id/address and symbol
    // TODO: What else do we need?
    // - volumes
    // - 24h volues
    // - total volumes

    event SwapExecuted(
        bytes32 id,
        bytes32 transactionHash,
        uint256 blockHeight,
        uint256 blockTimestamp,
        address sender,
        int128 amount0,
        int128 amount1,
        uint160 sqrtPriceX96,
        uint128 liquidity,
        int24 tick,
        uint24 fee,
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
   
    function onSwapEvent(
        EventContext memory ctx,
        UniswapV4PoolManager$SwapEventParams memory inputs
    ) external override {
        if (POOL_TO_TOKEN_SOURCE.poolToToken(inputs.id) == address(0)) {
            // Not one of our pools
            return;
        }

        // Read normalized ETH/USD price (1e18) from Chainlink Base oracle
        uint256 ethUsd = _readUsdPrice1e18(ETH_USD_AGGREGATOR);

        emit SwapExecuted(
            inputs.id,
            ctx.txn.hash(),
            block.number,
            block.timestamp,
            inputs.sender,
            inputs.amount0,
            inputs.amount1,
            inputs.sqrtPriceX96,
            inputs.liquidity,
            inputs.tick,
            inputs.fee,
            ethUsd
        );
    }
}
