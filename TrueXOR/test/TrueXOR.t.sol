// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/TrueXOR.sol";
import "../src/BoolGiver.sol";

contract CounterTest is Test {
    TrueXOR public trueXOR;
    BoolGiver public boolGiver;

    function setUp() public {
        trueXOR = new TrueXOR();
        boolGiver = new BoolGiver();
    }

    function testTrueXOR() public {
        // Not sure how else to get around the msg.sender == tx.origin comparison in foundry tests
        vm.prank(address(this), address(this));
        assertEq(trueXOR.callMe(address(boolGiver)), true);
    }
}
