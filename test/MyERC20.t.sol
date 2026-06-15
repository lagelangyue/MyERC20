//SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "forge-std/Test.sol";
import "../src/MyERC20.sol";

contract MyERC20Test is Test {
    MyERC20 public token;
    address public user1 = address(0x1111);
    address public user2 = address(0x2222);

    function setUp() public {
        //部署合约
        token = new MyERC20();
    }

    //测试初始代币铸造
    function testInitialSupply() public {
        assertEq(
            token.balanceOf(address(this)),
            10000 * 10 ** token.decimals()
        );
    }

    //测试转账
    function testTransfer() public {
        uint256 amount = 1000;
        token.transfer(user1, amount);
        assertEq(token.balanceOf(user1), amount);
    }

    //测试铸币权限
    function testMint() public {
        uint256 amount = 500;
        token.mint(user2, amount);
        assertEq(token.balanceOf(user2), amount);
    }

    //测试销毁代币
    function testBurn() public {
        uint256 amount = 200;
        token.transfer(user1, amount);
        vm.prank(user1);
        token.burn(amount);
        assertEq(token.balanceOf(user1), 0);
    }
}
