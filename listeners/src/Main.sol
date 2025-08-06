// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";
import "./UniswapV3FactoryListener.sol";

contract Triggers is BaseTriggers {
    function triggers() external virtual override {
        UniswapV3FactoryListener listener = new UniswapV3FactoryListener();
        addTrigger(
            chainContract(Chains.Base, 0x33128a8fC17869897dcE68Ed026d694621f6FDfD),
            listener.triggerOnCreatePoolFunction()
        );
    }
}
