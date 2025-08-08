// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";
import "./UniswapV4SwapListener.sol";

contract Triggers is BaseTriggers {
    function triggers() external virtual override {
        UniswapV4SwapListener listener = new UniswapV4SwapListener();
        addTrigger(
            chainContract(Chains.Base, 0x498581ff718922c3f8e6a244956af099b2652b2b),
            listener.triggerOnSwapEvent()
        );
    }
}
