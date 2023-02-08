// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/WETH10.sol";

import "../src/Exploit.sol";

contract Weth10Test is Test {
    WETH10 public weth;
    address owner;
    address bob;

    function setUp() public {
        weth = new WETH10();
        bob = makeAddr("bob");

        vm.deal(address(weth), 10 ether);
        vm.deal(address(bob), 1 ether);
    }

    function testHack() public {
        Exploit exploit = new Exploit(weth);

        exploit.messingAround();
        // assertEq(
        //     address(weth).balance,
        //     10 ether,
        //     "weth contract should have 10 ether"
        // );

        // vm.startPrank(bob);

        // // hack time!

        // Exploit exploit = new Exploit(weth);

        // exploit.exploit{value: 0.5 ether}(payable(bob));

        // vm.stopPrank();
        // assertEq(address(weth).balance, 0, "empty weth contract");
        // assertEq(bob.balance, 11 ether, "player should end with 11 ether");
    }
}
