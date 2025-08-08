// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-generated/Generated.sol";

contract UniswapV4SwapListener is UniswapV4PoolManager$OnSwapEvent {
    // TODO: Add pool address later
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
   
    function onSwapEvent(
        EventContext memory ctx,
        UniswapV4PoolManager$SwapEventParams memory inputs
    ) external override {
        emit SwapExecuted(
            inputs.id, inputs.sender, inputs.amount0, inputs.amount1, inputs.sqrtPriceX96, inputs.liquidity, inputs.tick, inputs.fee
        );
    }
}
