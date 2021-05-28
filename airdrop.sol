pragma solidity ^0.4.11;

contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract Airdrop {

    address public owner;
    
    // address of the token to airdrop, can be changed
    // with the "setTokenAddress function later"
    address public _tokenAddress = 0x4197057a560F8ad619d11d59F15dF1fe967F0101;
    
    // number of tokens to send to each recipient
    uint256 tokens = 10;
    // decimals of the token
    uint256 decimals = 9;
    
    constructor() public {
        owner = msg.sender;
    }
    
}
