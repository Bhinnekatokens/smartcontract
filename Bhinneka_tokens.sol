pragma solidity ^0.4.6;
contract tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }


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

  function assert(bool assertion) internal {
    if (!assertion) throw;
  }
}


contract EdgelessToken is SafeMath {
    /* Public variables of the token */
    string public standard = 'ERC20';
    string public name = 'BHINNEKA';
    string public symbol = 'BNK';
    uint8 public decimals = 18;
    uint256 public totalSupply = 26000000 ;
    address public owner = 0x7D98fa238C3bBF0f2BCD1bcE19eFA028474B4E07;


    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;


    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
	event Burned(uint amount);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function EdgelessToken(address _owner) {
        // Owner is the crowdsale contract
        owner = 0x7D98fa238C3bBF0f2BCD1bcE19eFA028474B4E07;
        balanceOf[owner] = 26000000;              // Premine all tokens for airdrop, Bounty and donation
        totalSupply = 26000000;                   // Update total supply
    }


    /* Send some of your tokens to a given address */
    function transfer(address _to, uint256 _value) returns (bool success){
    }

    /* Allow another contract or person to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }



}
