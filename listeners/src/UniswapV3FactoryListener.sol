// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-generated/Generated.sol";

/// Index calls to the UniswapV3Factory.createPool function on Ethereum
/// To hook on more function calls, specify that this listener should implement that interface and follow the compiler errors.
contract UniswapV3FactoryListener is UniswapV3Factory$OnCreatePoolFunction {
    /// Emitted events are indexed.
    /// To change the data which is indexed, modify the event or add more events.
    event PoolCreated(uint64 chainId, address caller, address pool, address token0, address token1, uint24 fee, uint256  blockNumber);
    
    // For now let's test sqrtPriceX96 from uniswap v3
    event SlotRead(
        address pool,
        uint160 sqrtPriceX96,
        int24 tick,
        uint16 observationIndex,
        uint16 observationCardinality,
        uint16 observationCardinalityNext,
        uint8 feeProtocol,
        bool unlocked
    );

    // event Slot0V4Read(
    //     address pool,
    //     uint160 sqrtPriceX96,
    //     int24 tick,
    //     uint24 feeProtocol,
    //     uint24 lpFee
    // );
    // address internal constant BASE_POOL_UNISWAP_V4 = 0x80beff8b9913bdcd1307bf9da0f2d90eed8d55b;

    /// The handler called whenever the UniswapV3Factory.createPool function is called.
    /// Within here you write your indexing specific logic (e.g., call out to other contracts to get more information).
    /// The only requirement for handlers is that they have the correct signature, but usually you will use generated interfaces to help write them.
    function onCreatePoolFunction(
        FunctionContext memory ctx,
        UniswapV3Factory$CreatePoolFunctionInputs memory inputs,
        UniswapV3Factory$CreatePoolFunctionOutputs memory outputs
    ) external override {
        emit PoolCreated(
            uint64(block.chainid), ctx.txn.call.callee(), outputs.pool, inputs.tokenA, inputs.tokenB, inputs.fee, block.number
        );

        // Read slot0() from the newly created Uniswap v3 pool (outputs.pool)
        (bool ok, bytes memory slot0Data) = outputs.pool.staticcall(
            abi.encodeWithSelector(0x3850c7bd) // selector for slot0()
        );
        require(ok, "slot0() staticcall failed");

        (
            uint160 sqrtPriceX96,
            int24  tick,
            uint16 observationIndex,
            uint16 observationCardinality,
            uint16 observationCardinalityNext,
            uint8  feeProtocol,
            bool   unlocked
        ) = abi.decode(slot0Data, (uint160,int24,uint16,uint16,uint16,uint8,bool));

        emit SlotRead(
            outputs.pool,
            sqrtPriceX96,
            tick,
            observationIndex,
            observationCardinality,
            observationCardinalityNext,
            feeProtocol,
            unlocked
        );

        // Hard‑coded Base pool address (instead of outputs.pool)
        // This will not work since on this block height there was no BASE_POOL_UNISWAP_V4
        // (bool success, bytes memory result) = BASE_POOL_UNISWAP_V4.staticcall(
        //     abi.encodeWithSelector(0x3850c7bd)
        // );
        // require(success, "slot0() staticcall failed");

        // (
        //     uint160 sqrtPriceX96,
        //     int24  tick,
        //     uint24 feeProtocol,
        //     uint24 lpFee
        // ) = abi.decode(result, (uint160,int24,uint24,uint24));

        // emit Slot0V4Read(
        //     BASE_POOL,
        //     sqrtPriceX96,
        //     tick,
        //     feeProtocol,
        //     lpFee
        // );
    }
}
