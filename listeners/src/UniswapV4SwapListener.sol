// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-generated/Generated.sol";

interface IPoolToTokenSource {
    function poolToToken(bytes32) external view returns (address);
}

contract UniswapV4SwapListener is UniswapV4PoolManager$OnSwapEvent {
    event SwapExecuted(
        bytes32 id,
        address sender,
        int128 amount0,
        int128 amount1,
        uint160 sqrtPriceX96,
        uint128 liquidity,
        int24 tick,
        uint24 fee
    );

    IPoolToTokenSource public constant POOL_TO_TOKEN_SOURCE =
        IPoolToTokenSource(0x49C9677d55c3D48F5e86eFA3600154440c15F6c8);
   
    function onSwapEvent(
        EventContext memory ctx,
        UniswapV4PoolManager$SwapEventParams memory inputs
    ) external override {
        address token = POOL_TO_TOKEN_SOURCE.poolToToken(inputs.id);
        if (token == address(0)) {
            // Not one of our pools – do nothing
            return;
        }
        emit SwapExecuted(
            inputs.id,
            inputs.sender,
            inputs.amount0,
            inputs.amount1,
            inputs.sqrtPriceX96,
            inputs.liquidity,
            inputs.tick,
            inputs.fee
        );
    }
}
