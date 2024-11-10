// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract EzyCoin{

    string public coinName = "EzyCoin";
    string public coinSymbol = "Ezy";
    uint public coinSupply = 0;

    mapping (address => uint)public coinBalances;

    function mintCoins(address to, uint amount) public{
        coinSupply += amount;
        coinBalances[to] += amount;
    }

    function burnCoins(address from, uint amount)public {
        require(coinBalances[from] >= amount, "Low Coin Balance to burn");
        coinSupply -= amount;
        coinBalances[from] -= amount;
    }

    function transferCoins(address from, address reciepient, uint amount)public {
        require(coinBalances[from]>= amount,"Not Enough Coin to transfer");
        coinBalances[from] -= amount;
        coinBalances[reciepient] += amount;
        coinSupply -= amount;
    }
}
