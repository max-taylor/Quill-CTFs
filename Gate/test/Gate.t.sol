// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Gate.sol";
import "../src/Guardian.sol";

// https://leftasexercise.com/2021/09/08/a-deep-dive-into-solidity-function-selectors-encoding-and-state-variables/
contract CounterTest is Test {
    Gate public gate;
    Guardian public guardian;

    function setUp() public {
        gate = new Gate();
        guardian = new Guardian(gate);
    }

    function testGate() public {
        bytes memory bytesVal = "3409104";
        console.log(bytesVal.length);
        gate.open(address(guardian));

        assertEq(gate.opened(), true);
    }
}
