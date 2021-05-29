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
    // with the "setTokenAddress" function later
    address public _tokenAddress = 0x4197057a560F8ad619d11d59F15dF1fe967F0101;
    
    // number of tokens to send to each recipient
    uint256 tokens = 10;
    // decimals of the token
    uint256 decimals = 9;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function multisend(address[] _to) public  returns (bool _success) {
        require(msg.sender == owner, "only the owner can send airdrop");
        require(_to.length > 0);
        
        
        // send the values to all the recipients
        for (uint8 i = 0; i < _to.length; i++) {
            require((ERC20Interface(_tokenAddress).transfer(_to[i], tokens * 10 ** decimals)) == true);
        }

        return true;
    }    
    
    function setTokenAddress(address _address) public {
        require(msg.sender == owner, "only the owner can set address");

        _tokenAddress = _address;
    }
    
    function withdrawTokens(address _tokenAddr) public {
        require(msg.sender == owner, "only the owner remove");
        require(ERC20Interface(_tokenAddr).balanceOf(address(this)) > 0, "can not withdraw 0 or negative");

        require((ERC20Interface(_tokenAddr).transfer(owner, ERC20Interface(_tokenAddr).balanceOf(address(this))) ) == true);
    }
    
}
