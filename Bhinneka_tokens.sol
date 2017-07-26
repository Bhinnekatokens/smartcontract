pragma solidity ^0.4.6;
 
contract SafeMath {
  //internals
 
  function safeMul(uint a, uint b) internal returns (uint) {
    uint c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }
 
  function safeSub(uint a, uint b) internal returns (uint) {
    assert(b <= a);
    return a - b;
  }
 
  function safeAdd(uint a, uint b) internal returns (uint) {
    uint c = a + b;
    assert(c>=a && c>=b);
    return c;
  }
 
}
 
contract BNKToken is SafeMath {
    /* Public variables of the token */
    string public standard = 'ERC20';
    string public name = 'BHINNEKA TOKEN';
    string public symbol = 'BNK';
    uint8 public decimals = 8;
    uint256 public totalSupply = 26000000;
    address public owner = 0x7D98fa238C3bBF0f2BCD1bcE19eFA028474B4E07;
 
    /* This creates an array with all the balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
 
 
    /* This generates a public event on the blockchain that will notify all clients */
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Burned(uint amount);
 
 
    /* A contract or  person attempts to get the tokens of somebody else. */
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        var _allowance = allowance[_from][msg.sender];
        balanceOf[_from] = safeSub(balanceOf[_from],_value); // Subtract from the sender
        balanceOf[_to] = safeAdd(balanceOf[_to],_value);     // Add the same to the recipient
        allowance[_from][msg.sender] = safeSub(_allowance,_value);
        Transfer(_from, _to, _value);
        return true;
    }
}
