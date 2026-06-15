//SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC20 is ERC20, Ownable {
    //构造函数：代币名称、符合、初始铸造
    constructor() ERC20("Demo Token", "DEMO") Ownable(msg.sender) {
        //初始铸造10000枚代币，部署者持有
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    //管理员可铸币
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    //任意用户销毁自己的代币
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
