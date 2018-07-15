pragma solidity ^0.4.24;  
/*
@ TDM61 B version 2561 Thai Bath real value 
@ Author : Anan Paenthongkham
@Main funcion
@improved ERC-20 stand token to be TDM61 B version 2561
*/

import './TDM-B61-Convertor.sol' ; 

contract logging {
   event Transfer(address _server , address _to, uint256 _value);
   event Approval(address indexed _owner, address indexed _spender, uint _value);
} 

contract TDMB61 is  logging , exchange_converter { 
    // ====  //
    
    string name ; 
    string symbol ;
    uint  decimals ; 
    string TokenInfo ;
   
mapping (address =>  mapping (address => uint)) allowed; 
    
    
     
    function TDMB61 (  )  { 
        FinaceMinistor = 0x6c4811FEB65FD028A3d5Bdd53Fe65681F620471D  ; 
        ThaiBankGorvernor = 0x7fFA8706B4BC45D25746456fe48E0376BBa66546 ; 
        SystemAddr = msg.sender ; 
        name = "THAI BAHT TDM61";
        TokenInfo = "THAI BAHT : TDM61 2561 "  ;
        decimals = 18;
        symbol = "BAHT"; 
        totalSupply = 0 ;
        totalProofTokens = 0 ; 
        totalRequestTokens = 1 ; 
        
    }
     
   function pingTokenInfo () public view returns (string Info , uint256 totalSupplys , address yourAddress , uint BlockNumber ) {
       return ( TokenInfo , totalSupply , msg.sender , block.number ) ; 
    }
    
    function transfer(address _to, uint256 _value)public  returns (bool success) {
        require ( listedUsers[_to] != 0 , " Receiver A/C must registored in network with ") ; 
        if (balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) { 
        require ( listedUsers[_to] != 0 , " Receiver A/C must registor with ") ; 
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            emit Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }
    
    function approve(address _spender, uint  _value)public returns (uint success) {
       allowed[msg.sender][_spender] = _value;
       emit Approval(msg.sender, _spender, _value);
        return _value;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        require ( users[_owner].userAddr == msg.sender || msg.sender == Auditors[msg.sender].accoutAddress || 
        issuers[msg.sender].accoutAddress == msg.sender || 
        msg.sender == _spender
        , " Only owner or auditor can see this " ) ; 
		return allowed[_owner][_spender];
    }
    
    function balanceOf(address _owner)public  view returns (uint256 balance) {
        require ( users[_owner].userAddr == msg.sender || msg.sender == Auditors[msg.sender].accoutAddress || 
        issuers[msg.sender].accoutAddress == msg.sender , " Only owner or auditor can see balance " ) ; 
        return balances[_owner];
    }
    
} 



