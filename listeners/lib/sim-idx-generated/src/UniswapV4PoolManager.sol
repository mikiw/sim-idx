// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/sim-idx-sol/src/Triggers.sol";
import "lib/sim-idx-sol/src/Context.sol";

function UniswapV4PoolManager$Abi() pure returns (Abi memory) {
    return Abi("UniswapV4PoolManager");
}
struct UniswapV4PoolManager$AllowanceFunctionInputs {
    address owner;
    address spender;
    uint256 id;
}

struct UniswapV4PoolManager$AllowanceFunctionOutputs {
    uint256 amount;
}

struct UniswapV4PoolManager$ApproveFunctionInputs {
    address spender;
    uint256 id;
    uint256 amount;
}

struct UniswapV4PoolManager$ApproveFunctionOutputs {
    bool outArg0;
}

struct UniswapV4PoolManager$BalanceOfFunctionInputs {
    address owner;
    uint256 id;
}

struct UniswapV4PoolManager$BalanceOfFunctionOutputs {
    uint256 balance;
}

struct UniswapV4PoolManager$BurnFunctionInputs {
    address from;
    uint256 id;
    uint256 amount;
}

struct UniswapV4PoolManager$ClearFunctionInputs {
    address currency;
    uint256 amount;
}

struct UniswapV4PoolManager$CollectProtocolFeesFunctionInputs {
    address recipient;
    address currency;
    uint256 amount;
}

struct UniswapV4PoolManager$CollectProtocolFeesFunctionOutputs {
    uint256 amountCollected;
}

struct UniswapV4PoolManager$PoolKey {
    address currency0;
    address currency1;
    uint24 fee;
    int24 tickSpacing;
    address hooks;
}

struct UniswapV4PoolManager$DonateFunctionInputs {
    UniswapV4PoolManager$PoolKey key;
    uint256 amount0;
    uint256 amount1;
    bytes hookData;
}

struct UniswapV4PoolManager$DonateFunctionOutputs {
    int256 delta;
}

struct UniswapV4PoolManager$Extsload0x1E2EAEAFFunctionInputs {
    bytes32 slot;
}

struct UniswapV4PoolManager$Extsload0x1E2EAEAFFunctionOutputs {
    bytes32 outArg0;
}

struct UniswapV4PoolManager$Extsload0x35FD631AFunctionInputs {
    bytes32 startSlot;
    uint256 nSlots;
}

struct UniswapV4PoolManager$Extsload0x35FD631AFunctionOutputs {
    bytes32[] outArg0;
}

struct UniswapV4PoolManager$Extsload0xDBD035FFFunctionInputs {
    bytes32[] slots;
}

struct UniswapV4PoolManager$Extsload0xDBD035FFFunctionOutputs {
    bytes32[] outArg0;
}

struct UniswapV4PoolManager$Exttload0x9BF6645FFunctionInputs {
    bytes32[] slots;
}

struct UniswapV4PoolManager$Exttload0x9BF6645FFunctionOutputs {
    bytes32[] outArg0;
}

struct UniswapV4PoolManager$Exttload0xF135BAAAFunctionInputs {
    bytes32 slot;
}

struct UniswapV4PoolManager$Exttload0xF135BAAAFunctionOutputs {
    bytes32 outArg0;
}

struct UniswapV4PoolManager$InitializeFunctionInputs {
    UniswapV4PoolManager$PoolKey key;
    uint160 sqrtPriceX96;
}

struct UniswapV4PoolManager$InitializeFunctionOutputs {
    int24 tick;
}

struct UniswapV4PoolManager$IsOperatorFunctionInputs {
    address owner;
    address operator;
}

struct UniswapV4PoolManager$IsOperatorFunctionOutputs {
    bool isOperator;
}

struct UniswapV4PoolManager$MintFunctionInputs {
    address to;
    uint256 id;
    uint256 amount;
}

struct UniswapV4PoolManager$IPoolManager$ModifyLiquidityParams {
    int24 tickLower;
    int24 tickUpper;
    int256 liquidityDelta;
    bytes32 salt;
}

struct UniswapV4PoolManager$ModifyLiquidityFunctionInputs {
    UniswapV4PoolManager$PoolKey key;
    UniswapV4PoolManager$IPoolManager$ModifyLiquidityParams params;
    bytes hookData;
}

struct UniswapV4PoolManager$ModifyLiquidityFunctionOutputs {
    int256 callerDelta;
    int256 feesAccrued;
}

struct UniswapV4PoolManager$OwnerFunctionOutputs {
    address outArg0;
}

struct UniswapV4PoolManager$ProtocolFeeControllerFunctionOutputs {
    address outArg0;
}

struct UniswapV4PoolManager$ProtocolFeesAccruedFunctionInputs {
    address currency;
}

struct UniswapV4PoolManager$ProtocolFeesAccruedFunctionOutputs {
    uint256 amount;
}

struct UniswapV4PoolManager$SetOperatorFunctionInputs {
    address operator;
    bool approved;
}

struct UniswapV4PoolManager$SetOperatorFunctionOutputs {
    bool outArg0;
}

struct UniswapV4PoolManager$SetProtocolFeeFunctionInputs {
    UniswapV4PoolManager$PoolKey key;
    uint24 newProtocolFee;
}

struct UniswapV4PoolManager$SetProtocolFeeControllerFunctionInputs {
    address controller;
}

struct UniswapV4PoolManager$SettleFunctionOutputs {
    uint256 outArg0;
}

struct UniswapV4PoolManager$SettleForFunctionInputs {
    address recipient;
}

struct UniswapV4PoolManager$SettleForFunctionOutputs {
    uint256 outArg0;
}

struct UniswapV4PoolManager$SupportsInterfaceFunctionInputs {
    bytes4 interfaceId;
}

struct UniswapV4PoolManager$SupportsInterfaceFunctionOutputs {
    bool outArg0;
}

struct UniswapV4PoolManager$IPoolManager$SwapParams {
    bool zeroForOne;
    int256 amountSpecified;
    uint160 sqrtPriceLimitX96;
}

struct UniswapV4PoolManager$SwapFunctionInputs {
    UniswapV4PoolManager$PoolKey key;
    UniswapV4PoolManager$IPoolManager$SwapParams params;
    bytes hookData;
}

struct UniswapV4PoolManager$SwapFunctionOutputs {
    int256 swapDelta;
}

struct UniswapV4PoolManager$SyncFunctionInputs {
    address currency;
}

struct UniswapV4PoolManager$TakeFunctionInputs {
    address currency;
    address to;
    uint256 amount;
}

struct UniswapV4PoolManager$TransferFunctionInputs {
    address receiver;
    uint256 id;
    uint256 amount;
}

struct UniswapV4PoolManager$TransferFunctionOutputs {
    bool outArg0;
}

struct UniswapV4PoolManager$TransferFromFunctionInputs {
    address sender;
    address receiver;
    uint256 id;
    uint256 amount;
}

struct UniswapV4PoolManager$TransferFromFunctionOutputs {
    bool outArg0;
}

struct UniswapV4PoolManager$TransferOwnershipFunctionInputs {
    address newOwner;
}

struct UniswapV4PoolManager$UnlockFunctionInputs {
    bytes data;
}

struct UniswapV4PoolManager$UnlockFunctionOutputs {
    bytes result;
}

struct UniswapV4PoolManager$UpdateDynamicLpFeeFunctionInputs {
    UniswapV4PoolManager$PoolKey key;
    uint24 newDynamicLPFee;
}

struct UniswapV4PoolManager$ApprovalEventParams {
    address owner;
    address spender;
    uint256 id;
    uint256 amount;
}

struct UniswapV4PoolManager$DonateEventParams {
    bytes32 id;
    address sender;
    uint256 amount0;
    uint256 amount1;
}

struct UniswapV4PoolManager$InitializeEventParams {
    bytes32 id;
    address currency0;
    address currency1;
    uint24 fee;
    int24 tickSpacing;
    address hooks;
    uint160 sqrtPriceX96;
    int24 tick;
}

struct UniswapV4PoolManager$ModifyLiquidityEventParams {
    bytes32 id;
    address sender;
    int24 tickLower;
    int24 tickUpper;
    int256 liquidityDelta;
    bytes32 salt;
}

struct UniswapV4PoolManager$OperatorSetEventParams {
    address owner;
    address operator;
    bool approved;
}

struct UniswapV4PoolManager$OwnershipTransferredEventParams {
    address user;
    address newOwner;
}

struct UniswapV4PoolManager$ProtocolFeeControllerUpdatedEventParams {
    address protocolFeeController;
}

struct UniswapV4PoolManager$ProtocolFeeUpdatedEventParams {
    bytes32 id;
    uint24 protocolFee;
}

struct UniswapV4PoolManager$SwapEventParams {
    bytes32 id;
    address sender;
    int128 amount0;
    int128 amount1;
    uint160 sqrtPriceX96;
    uint128 liquidity;
    int24 tick;
    uint24 fee;
}

struct UniswapV4PoolManager$TransferEventParams {
    address caller;
    address from;
    address to;
    uint256 id;
    uint256 amount;
}

abstract contract UniswapV4PoolManager$OnApprovalEvent {
    function onApprovalEvent(EventContext memory ctx, UniswapV4PoolManager$ApprovalEventParams memory inputs) virtual external;

    function triggerOnApprovalEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0xb3fd5071835887567a0671151121894ddccc2842f1d10bedad13e0d17cace9a7),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onApprovalEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnDonateEvent {
    function onDonateEvent(EventContext memory ctx, UniswapV4PoolManager$DonateEventParams memory inputs) virtual external;

    function triggerOnDonateEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0x29ef05caaff9404b7cb6d1c0e9bbae9eaa7ab2541feba1a9c4248594c08156cb),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDonateEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnInitializeEvent {
    function onInitializeEvent(EventContext memory ctx, UniswapV4PoolManager$InitializeEventParams memory inputs) virtual external;

    function triggerOnInitializeEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0xdd466e674ea557f56295e2d0218a125ea4b4f0f6f3307b95f85e6110838d6438),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onInitializeEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnModifyLiquidityEvent {
    function onModifyLiquidityEvent(EventContext memory ctx, UniswapV4PoolManager$ModifyLiquidityEventParams memory inputs) virtual external;

    function triggerOnModifyLiquidityEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0xf208f4912782fd25c7f114ca3723a2d5dd6f3bcc3ac8db5af63baa85f711d5ec),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onModifyLiquidityEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnOperatorSetEvent {
    function onOperatorSetEvent(EventContext memory ctx, UniswapV4PoolManager$OperatorSetEventParams memory inputs) virtual external;

    function triggerOnOperatorSetEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0xceb576d9f15e4e200fdb5096d64d5dfd667e16def20c1eefd14256d8e3faa267),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOperatorSetEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnOwnershipTransferredEvent {
    function onOwnershipTransferredEvent(EventContext memory ctx, UniswapV4PoolManager$OwnershipTransferredEventParams memory inputs) virtual external;

    function triggerOnOwnershipTransferredEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOwnershipTransferredEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnProtocolFeeControllerUpdatedEvent {
    function onProtocolFeeControllerUpdatedEvent(EventContext memory ctx, UniswapV4PoolManager$ProtocolFeeControllerUpdatedEventParams memory inputs) virtual external;

    function triggerOnProtocolFeeControllerUpdatedEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0xb4bd8ef53df690b9943d3318996006dbb82a25f54719d8c8035b516a2a5b8acc),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onProtocolFeeControllerUpdatedEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnProtocolFeeUpdatedEvent {
    function onProtocolFeeUpdatedEvent(EventContext memory ctx, UniswapV4PoolManager$ProtocolFeeUpdatedEventParams memory inputs) virtual external;

    function triggerOnProtocolFeeUpdatedEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0xe9c42593e71f84403b84352cd168d693e2c9fcd1fdbcc3feb21d92b43e6696f9),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onProtocolFeeUpdatedEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSwapEvent {
    function onSwapEvent(EventContext memory ctx, UniswapV4PoolManager$SwapEventParams memory inputs) virtual external;

    function triggerOnSwapEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0x40e9cecb9f5f1f1c5b9c97dec2917b7ee92e57ba5563708daca94dd84ad7112f),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSwapEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnTransferEvent {
    function onTransferEvent(EventContext memory ctx, UniswapV4PoolManager$TransferEventParams memory inputs) virtual external;

    function triggerOnTransferEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes32(0x1b3d7edb2e9c0b0e7c525b20aaaef0f5940d2ed71663c7d39266ecafac728859),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferEvent.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnAllowanceFunction {
    function onAllowanceFunction(FunctionContext memory ctx, UniswapV4PoolManager$AllowanceFunctionInputs memory inputs, UniswapV4PoolManager$AllowanceFunctionOutputs memory outputs) virtual external;

    function triggerOnAllowanceFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x598af9e7),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAllowanceFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreAllowanceFunction {
    function preAllowanceFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$AllowanceFunctionInputs memory inputs) virtual external;

    function triggerPreAllowanceFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x598af9e7),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preAllowanceFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnApproveFunction {
    function onApproveFunction(FunctionContext memory ctx, UniswapV4PoolManager$ApproveFunctionInputs memory inputs, UniswapV4PoolManager$ApproveFunctionOutputs memory outputs) virtual external;

    function triggerOnApproveFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x426a8493),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onApproveFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreApproveFunction {
    function preApproveFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$ApproveFunctionInputs memory inputs) virtual external;

    function triggerPreApproveFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x426a8493),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preApproveFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnBalanceOfFunction {
    function onBalanceOfFunction(FunctionContext memory ctx, UniswapV4PoolManager$BalanceOfFunctionInputs memory inputs, UniswapV4PoolManager$BalanceOfFunctionOutputs memory outputs) virtual external;

    function triggerOnBalanceOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x00fdd58e),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBalanceOfFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreBalanceOfFunction {
    function preBalanceOfFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$BalanceOfFunctionInputs memory inputs) virtual external;

    function triggerPreBalanceOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x00fdd58e),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBalanceOfFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnBurnFunction {
    function onBurnFunction(FunctionContext memory ctx, UniswapV4PoolManager$BurnFunctionInputs memory inputs) virtual external;

    function triggerOnBurnFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf5298aca),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBurnFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreBurnFunction {
    function preBurnFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$BurnFunctionInputs memory inputs) virtual external;

    function triggerPreBurnFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf5298aca),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBurnFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnClearFunction {
    function onClearFunction(FunctionContext memory ctx, UniswapV4PoolManager$ClearFunctionInputs memory inputs) virtual external;

    function triggerOnClearFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x80f0b44c),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onClearFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreClearFunction {
    function preClearFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$ClearFunctionInputs memory inputs) virtual external;

    function triggerPreClearFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x80f0b44c),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preClearFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnCollectProtocolFeesFunction {
    function onCollectProtocolFeesFunction(FunctionContext memory ctx, UniswapV4PoolManager$CollectProtocolFeesFunctionInputs memory inputs, UniswapV4PoolManager$CollectProtocolFeesFunctionOutputs memory outputs) virtual external;

    function triggerOnCollectProtocolFeesFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x8161b874),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onCollectProtocolFeesFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreCollectProtocolFeesFunction {
    function preCollectProtocolFeesFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$CollectProtocolFeesFunctionInputs memory inputs) virtual external;

    function triggerPreCollectProtocolFeesFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x8161b874),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preCollectProtocolFeesFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnDonateFunction {
    function onDonateFunction(FunctionContext memory ctx, UniswapV4PoolManager$DonateFunctionInputs memory inputs, UniswapV4PoolManager$DonateFunctionOutputs memory outputs) virtual external;

    function triggerOnDonateFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x234266d7),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDonateFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreDonateFunction {
    function preDonateFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$DonateFunctionInputs memory inputs) virtual external;

    function triggerPreDonateFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x234266d7),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preDonateFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnExtsload0x1E2EAEAFFunction {
    function onExtsload0x1E2EAEAFFunction(FunctionContext memory ctx, UniswapV4PoolManager$Extsload0x1E2EAEAFFunctionInputs memory inputs, UniswapV4PoolManager$Extsload0x1E2EAEAFFunctionOutputs memory outputs) virtual external;

    function triggerOnExtsload0x1E2EAEAFFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x1e2eaeaf),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onExtsload0x1E2EAEAFFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreExtsload0x1E2EAEAFFunction {
    function preExtsload0x1E2EAEAFFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$Extsload0x1E2EAEAFFunctionInputs memory inputs) virtual external;

    function triggerPreExtsload0x1E2EAEAFFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x1e2eaeaf),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preExtsload0x1E2EAEAFFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnExtsload0x35FD631AFunction {
    function onExtsload0x35FD631AFunction(FunctionContext memory ctx, UniswapV4PoolManager$Extsload0x35FD631AFunctionInputs memory inputs, UniswapV4PoolManager$Extsload0x35FD631AFunctionOutputs memory outputs) virtual external;

    function triggerOnExtsload0x35FD631AFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x35fd631a),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onExtsload0x35FD631AFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreExtsload0x35FD631AFunction {
    function preExtsload0x35FD631AFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$Extsload0x35FD631AFunctionInputs memory inputs) virtual external;

    function triggerPreExtsload0x35FD631AFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x35fd631a),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preExtsload0x35FD631AFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnExtsload0xDBD035FFFunction {
    function onExtsload0xDBD035FFFunction(FunctionContext memory ctx, UniswapV4PoolManager$Extsload0xDBD035FFFunctionInputs memory inputs, UniswapV4PoolManager$Extsload0xDBD035FFFunctionOutputs memory outputs) virtual external;

    function triggerOnExtsload0xDBD035FFFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xdbd035ff),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onExtsload0xDBD035FFFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreExtsload0xDBD035FFFunction {
    function preExtsload0xDBD035FFFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$Extsload0xDBD035FFFunctionInputs memory inputs) virtual external;

    function triggerPreExtsload0xDBD035FFFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xdbd035ff),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preExtsload0xDBD035FFFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnExttload0x9BF6645FFunction {
    function onExttload0x9BF6645FFunction(FunctionContext memory ctx, UniswapV4PoolManager$Exttload0x9BF6645FFunctionInputs memory inputs, UniswapV4PoolManager$Exttload0x9BF6645FFunctionOutputs memory outputs) virtual external;

    function triggerOnExttload0x9BF6645FFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x9bf6645f),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onExttload0x9BF6645FFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreExttload0x9BF6645FFunction {
    function preExttload0x9BF6645FFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$Exttload0x9BF6645FFunctionInputs memory inputs) virtual external;

    function triggerPreExttload0x9BF6645FFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x9bf6645f),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preExttload0x9BF6645FFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnExttload0xF135BAAAFunction {
    function onExttload0xF135BAAAFunction(FunctionContext memory ctx, UniswapV4PoolManager$Exttload0xF135BAAAFunctionInputs memory inputs, UniswapV4PoolManager$Exttload0xF135BAAAFunctionOutputs memory outputs) virtual external;

    function triggerOnExttload0xF135BAAAFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf135baaa),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onExttload0xF135BAAAFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreExttload0xF135BAAAFunction {
    function preExttload0xF135BAAAFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$Exttload0xF135BAAAFunctionInputs memory inputs) virtual external;

    function triggerPreExttload0xF135BAAAFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf135baaa),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preExttload0xF135BAAAFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnInitializeFunction {
    function onInitializeFunction(FunctionContext memory ctx, UniswapV4PoolManager$InitializeFunctionInputs memory inputs, UniswapV4PoolManager$InitializeFunctionOutputs memory outputs) virtual external;

    function triggerOnInitializeFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x6276cbbe),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onInitializeFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreInitializeFunction {
    function preInitializeFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$InitializeFunctionInputs memory inputs) virtual external;

    function triggerPreInitializeFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x6276cbbe),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preInitializeFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnIsOperatorFunction {
    function onIsOperatorFunction(FunctionContext memory ctx, UniswapV4PoolManager$IsOperatorFunctionInputs memory inputs, UniswapV4PoolManager$IsOperatorFunctionOutputs memory outputs) virtual external;

    function triggerOnIsOperatorFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xb6363cf2),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onIsOperatorFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreIsOperatorFunction {
    function preIsOperatorFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$IsOperatorFunctionInputs memory inputs) virtual external;

    function triggerPreIsOperatorFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xb6363cf2),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preIsOperatorFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnMintFunction {
    function onMintFunction(FunctionContext memory ctx, UniswapV4PoolManager$MintFunctionInputs memory inputs) virtual external;

    function triggerOnMintFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x156e29f6),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onMintFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreMintFunction {
    function preMintFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$MintFunctionInputs memory inputs) virtual external;

    function triggerPreMintFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x156e29f6),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preMintFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnModifyLiquidityFunction {
    function onModifyLiquidityFunction(FunctionContext memory ctx, UniswapV4PoolManager$ModifyLiquidityFunctionInputs memory inputs, UniswapV4PoolManager$ModifyLiquidityFunctionOutputs memory outputs) virtual external;

    function triggerOnModifyLiquidityFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x5a6bcfda),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onModifyLiquidityFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreModifyLiquidityFunction {
    function preModifyLiquidityFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$ModifyLiquidityFunctionInputs memory inputs) virtual external;

    function triggerPreModifyLiquidityFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x5a6bcfda),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preModifyLiquidityFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnOwnerFunction {
    function onOwnerFunction(FunctionContext memory ctx, UniswapV4PoolManager$OwnerFunctionOutputs memory outputs) virtual external;

    function triggerOnOwnerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x8da5cb5b),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOwnerFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreOwnerFunction {
    function preOwnerFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreOwnerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x8da5cb5b),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preOwnerFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnProtocolFeeControllerFunction {
    function onProtocolFeeControllerFunction(FunctionContext memory ctx, UniswapV4PoolManager$ProtocolFeeControllerFunctionOutputs memory outputs) virtual external;

    function triggerOnProtocolFeeControllerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf02de3b2),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onProtocolFeeControllerFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreProtocolFeeControllerFunction {
    function preProtocolFeeControllerFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreProtocolFeeControllerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf02de3b2),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preProtocolFeeControllerFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnProtocolFeesAccruedFunction {
    function onProtocolFeesAccruedFunction(FunctionContext memory ctx, UniswapV4PoolManager$ProtocolFeesAccruedFunctionInputs memory inputs, UniswapV4PoolManager$ProtocolFeesAccruedFunctionOutputs memory outputs) virtual external;

    function triggerOnProtocolFeesAccruedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x97e8cd4e),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onProtocolFeesAccruedFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreProtocolFeesAccruedFunction {
    function preProtocolFeesAccruedFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$ProtocolFeesAccruedFunctionInputs memory inputs) virtual external;

    function triggerPreProtocolFeesAccruedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x97e8cd4e),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preProtocolFeesAccruedFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSetOperatorFunction {
    function onSetOperatorFunction(FunctionContext memory ctx, UniswapV4PoolManager$SetOperatorFunctionInputs memory inputs, UniswapV4PoolManager$SetOperatorFunctionOutputs memory outputs) virtual external;

    function triggerOnSetOperatorFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x558a7297),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetOperatorFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreSetOperatorFunction {
    function preSetOperatorFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$SetOperatorFunctionInputs memory inputs) virtual external;

    function triggerPreSetOperatorFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x558a7297),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetOperatorFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSetProtocolFeeFunction {
    function onSetProtocolFeeFunction(FunctionContext memory ctx, UniswapV4PoolManager$SetProtocolFeeFunctionInputs memory inputs) virtual external;

    function triggerOnSetProtocolFeeFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x7e87ce7d),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetProtocolFeeFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreSetProtocolFeeFunction {
    function preSetProtocolFeeFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$SetProtocolFeeFunctionInputs memory inputs) virtual external;

    function triggerPreSetProtocolFeeFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x7e87ce7d),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetProtocolFeeFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSetProtocolFeeControllerFunction {
    function onSetProtocolFeeControllerFunction(FunctionContext memory ctx, UniswapV4PoolManager$SetProtocolFeeControllerFunctionInputs memory inputs) virtual external;

    function triggerOnSetProtocolFeeControllerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x2d771389),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetProtocolFeeControllerFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreSetProtocolFeeControllerFunction {
    function preSetProtocolFeeControllerFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$SetProtocolFeeControllerFunctionInputs memory inputs) virtual external;

    function triggerPreSetProtocolFeeControllerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x2d771389),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetProtocolFeeControllerFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSettleFunction {
    function onSettleFunction(FunctionContext memory ctx, UniswapV4PoolManager$SettleFunctionOutputs memory outputs) virtual external;

    function triggerOnSettleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x11da60b4),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSettleFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreSettleFunction {
    function preSettleFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreSettleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x11da60b4),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSettleFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSettleForFunction {
    function onSettleForFunction(FunctionContext memory ctx, UniswapV4PoolManager$SettleForFunctionInputs memory inputs, UniswapV4PoolManager$SettleForFunctionOutputs memory outputs) virtual external;

    function triggerOnSettleForFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x3dd45adb),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSettleForFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreSettleForFunction {
    function preSettleForFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$SettleForFunctionInputs memory inputs) virtual external;

    function triggerPreSettleForFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x3dd45adb),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSettleForFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSupportsInterfaceFunction {
    function onSupportsInterfaceFunction(FunctionContext memory ctx, UniswapV4PoolManager$SupportsInterfaceFunctionInputs memory inputs, UniswapV4PoolManager$SupportsInterfaceFunctionOutputs memory outputs) virtual external;

    function triggerOnSupportsInterfaceFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x01ffc9a7),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSupportsInterfaceFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreSupportsInterfaceFunction {
    function preSupportsInterfaceFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$SupportsInterfaceFunctionInputs memory inputs) virtual external;

    function triggerPreSupportsInterfaceFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x01ffc9a7),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSupportsInterfaceFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSwapFunction {
    function onSwapFunction(FunctionContext memory ctx, UniswapV4PoolManager$SwapFunctionInputs memory inputs, UniswapV4PoolManager$SwapFunctionOutputs memory outputs) virtual external;

    function triggerOnSwapFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf3cd914c),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSwapFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreSwapFunction {
    function preSwapFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$SwapFunctionInputs memory inputs) virtual external;

    function triggerPreSwapFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf3cd914c),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSwapFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnSyncFunction {
    function onSyncFunction(FunctionContext memory ctx, UniswapV4PoolManager$SyncFunctionInputs memory inputs) virtual external;

    function triggerOnSyncFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xa5841194),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSyncFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreSyncFunction {
    function preSyncFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$SyncFunctionInputs memory inputs) virtual external;

    function triggerPreSyncFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xa5841194),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSyncFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnTakeFunction {
    function onTakeFunction(FunctionContext memory ctx, UniswapV4PoolManager$TakeFunctionInputs memory inputs) virtual external;

    function triggerOnTakeFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x0b0d9c09),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTakeFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreTakeFunction {
    function preTakeFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$TakeFunctionInputs memory inputs) virtual external;

    function triggerPreTakeFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x0b0d9c09),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTakeFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnTransferFunction {
    function onTransferFunction(FunctionContext memory ctx, UniswapV4PoolManager$TransferFunctionInputs memory inputs, UniswapV4PoolManager$TransferFunctionOutputs memory outputs) virtual external;

    function triggerOnTransferFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x095bcdb6),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreTransferFunction {
    function preTransferFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$TransferFunctionInputs memory inputs) virtual external;

    function triggerPreTransferFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x095bcdb6),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTransferFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnTransferFromFunction {
    function onTransferFromFunction(FunctionContext memory ctx, UniswapV4PoolManager$TransferFromFunctionInputs memory inputs, UniswapV4PoolManager$TransferFromFunctionOutputs memory outputs) virtual external;

    function triggerOnTransferFromFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xfe99049a),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferFromFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreTransferFromFunction {
    function preTransferFromFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$TransferFromFunctionInputs memory inputs) virtual external;

    function triggerPreTransferFromFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xfe99049a),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTransferFromFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnTransferOwnershipFunction {
    function onTransferOwnershipFunction(FunctionContext memory ctx, UniswapV4PoolManager$TransferOwnershipFunctionInputs memory inputs) virtual external;

    function triggerOnTransferOwnershipFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf2fde38b),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferOwnershipFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreTransferOwnershipFunction {
    function preTransferOwnershipFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$TransferOwnershipFunctionInputs memory inputs) virtual external;

    function triggerPreTransferOwnershipFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0xf2fde38b),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTransferOwnershipFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnUnlockFunction {
    function onUnlockFunction(FunctionContext memory ctx, UniswapV4PoolManager$UnlockFunctionInputs memory inputs, UniswapV4PoolManager$UnlockFunctionOutputs memory outputs) virtual external;

    function triggerOnUnlockFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x48c89491),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onUnlockFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreUnlockFunction {
    function preUnlockFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$UnlockFunctionInputs memory inputs) virtual external;

    function triggerPreUnlockFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x48c89491),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preUnlockFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$OnUpdateDynamicLpFeeFunction {
    function onUpdateDynamicLpFeeFunction(FunctionContext memory ctx, UniswapV4PoolManager$UpdateDynamicLpFeeFunctionInputs memory inputs) virtual external;

    function triggerOnUpdateDynamicLpFeeFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x52759651),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onUpdateDynamicLpFeeFunction.selector
        });
    }
}

abstract contract UniswapV4PoolManager$PreUpdateDynamicLpFeeFunction {
    function preUpdateDynamicLpFeeFunction(PreFunctionContext memory ctx, UniswapV4PoolManager$UpdateDynamicLpFeeFunctionInputs memory inputs) virtual external;

    function triggerPreUpdateDynamicLpFeeFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "UniswapV4PoolManager",
            selector: bytes4(0x52759651),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preUpdateDynamicLpFeeFunction.selector
        });
    }
}

contract UniswapV4PoolManager$EmitAllEvents is
  UniswapV4PoolManager$OnApprovalEvent,
UniswapV4PoolManager$OnDonateEvent,
UniswapV4PoolManager$OnInitializeEvent,
UniswapV4PoolManager$OnModifyLiquidityEvent,
UniswapV4PoolManager$OnOperatorSetEvent,
UniswapV4PoolManager$OnOwnershipTransferredEvent,
UniswapV4PoolManager$OnProtocolFeeControllerUpdatedEvent,
UniswapV4PoolManager$OnProtocolFeeUpdatedEvent,
UniswapV4PoolManager$OnSwapEvent,
UniswapV4PoolManager$OnTransferEvent
{
  event Approval(address owner, address spender, uint256 id, uint256 amount);
event Donate(bytes32 id, address sender, uint256 amount0, uint256 amount1);
event Initialize(bytes32 id, address currency0, address currency1, uint24 fee, int24 tickSpacing, address hooks, uint160 sqrtPriceX96, int24 tick);
event ModifyLiquidity(bytes32 id, address sender, int24 tickLower, int24 tickUpper, int256 liquidityDelta, bytes32 salt);
event OperatorSet(address owner, address operator, bool approved);
event OwnershipTransferred(address user, address newOwner);
event ProtocolFeeControllerUpdated(address protocolFeeController);
event ProtocolFeeUpdated(bytes32 id, uint24 protocolFee);
event Swap(bytes32 id, address sender, int128 amount0, int128 amount1, uint160 sqrtPriceX96, uint128 liquidity, int24 tick, uint24 fee);
event Transfer(address caller, address from, address to, uint256 id, uint256 amount);

  function onApprovalEvent(EventContext memory ctx, UniswapV4PoolManager$ApprovalEventParams memory inputs) virtual external override {
    emit Approval(inputs.owner, inputs.spender, inputs.id, inputs.amount);
  }
function onDonateEvent(EventContext memory ctx, UniswapV4PoolManager$DonateEventParams memory inputs) virtual external override {
    emit Donate(inputs.id, inputs.sender, inputs.amount0, inputs.amount1);
  }
function onInitializeEvent(EventContext memory ctx, UniswapV4PoolManager$InitializeEventParams memory inputs) virtual external override {
    emit Initialize(inputs.id, inputs.currency0, inputs.currency1, inputs.fee, inputs.tickSpacing, inputs.hooks, inputs.sqrtPriceX96, inputs.tick);
  }
function onModifyLiquidityEvent(EventContext memory ctx, UniswapV4PoolManager$ModifyLiquidityEventParams memory inputs) virtual external override {
    emit ModifyLiquidity(inputs.id, inputs.sender, inputs.tickLower, inputs.tickUpper, inputs.liquidityDelta, inputs.salt);
  }
function onOperatorSetEvent(EventContext memory ctx, UniswapV4PoolManager$OperatorSetEventParams memory inputs) virtual external override {
    emit OperatorSet(inputs.owner, inputs.operator, inputs.approved);
  }
function onOwnershipTransferredEvent(EventContext memory ctx, UniswapV4PoolManager$OwnershipTransferredEventParams memory inputs) virtual external override {
    emit OwnershipTransferred(inputs.user, inputs.newOwner);
  }
function onProtocolFeeControllerUpdatedEvent(EventContext memory ctx, UniswapV4PoolManager$ProtocolFeeControllerUpdatedEventParams memory inputs) virtual external override {
    emit ProtocolFeeControllerUpdated(inputs.protocolFeeController);
  }
function onProtocolFeeUpdatedEvent(EventContext memory ctx, UniswapV4PoolManager$ProtocolFeeUpdatedEventParams memory inputs) virtual external override {
    emit ProtocolFeeUpdated(inputs.id, inputs.protocolFee);
  }
function onSwapEvent(EventContext memory ctx, UniswapV4PoolManager$SwapEventParams memory inputs) virtual external override {
    emit Swap(inputs.id, inputs.sender, inputs.amount0, inputs.amount1, inputs.sqrtPriceX96, inputs.liquidity, inputs.tick, inputs.fee);
  }
function onTransferEvent(EventContext memory ctx, UniswapV4PoolManager$TransferEventParams memory inputs) virtual external override {
    emit Transfer(inputs.caller, inputs.from, inputs.to, inputs.id, inputs.amount);
  }

  function allTriggers() view external returns (Trigger[] memory) {
    Trigger[] memory triggers = new Trigger[](10);
    triggers[0] = this.triggerOnApprovalEvent();
    triggers[1] = this.triggerOnDonateEvent();
    triggers[2] = this.triggerOnInitializeEvent();
    triggers[3] = this.triggerOnModifyLiquidityEvent();
    triggers[4] = this.triggerOnOperatorSetEvent();
    triggers[5] = this.triggerOnOwnershipTransferredEvent();
    triggers[6] = this.triggerOnProtocolFeeControllerUpdatedEvent();
    triggers[7] = this.triggerOnProtocolFeeUpdatedEvent();
    triggers[8] = this.triggerOnSwapEvent();
    triggers[9] = this.triggerOnTransferEvent();
    return triggers;
  }
}