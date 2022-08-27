// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Blockgame20 is ERC20 {
    // 1 token per eth is 1000
    uint256 public tokenPerEth = 1000 * 0.1;

    constructor() ERC20("Tanget", "TGT") {
        // mint initial one million tokens to the deployer
        _mint(msg.sender, 1000000 * 0.1);
    }

    function buyToken(address _recipient) public payable {
        // amount to mint to the recipient depends on the number of eth sent
        uint256 amountToMint = (msg.value * tokenPerEth) / 10**decimals();
        _mint(_recipient, amountToMint);
    }
}
