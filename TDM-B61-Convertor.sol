pragma solidity ^0.4.24; 

/*
@ TDM61 B version 2561 Thai Bath real value 
@ Author : Anan Paenthongkham
@copy right 2018  Anan Paenthongkham
@ Coin Exchange  functions
@improved ERC-20 stand token to be TDM61 B version 2561
*/

import './TDM-B61-Registor.sol' ; 

contract exchange_converter is registor {
    
 mapping (address => uint256)  balances;
 uint256 public totalSupply;
 
  struct createToken {
      bool requestedCoin ;
      bool issuerRequestAudit ;
      bool audited ; 
      uint256 balance ; 
      address receiver ; 
      string issuer_message ; 
      string auditor_message ;
      address auditorAddress ;
      address issuerAddress ; 
  } 
  
  mapping ( uint256 => createToken ) createTokens ; 
  uint256 totalRequestTokens ; 
  uint256 totalProofTokens ; 
  //  mapping (address => ) ;
  
   function moneyToCoiniIssuerProof ( address _to  , uint256 _value , string _message , bool _confirm  )public  returns ( string Information  )  {
      require ( createTokens[totalRequestTokens].issuerRequestAudit == false , createTokens[totalRequestTokens].issuer_message )  ; 
      require ( createTokens[totalRequestTokens].requestedCoin  == false  ,  " this order was requested   "  ) ;   
      require ( _value >= 1 , " Balance  must  more than zero " )  ; 
    if (_confirm) {
        createTokens[totalRequestTokens].balance = _value ;
        createTokens[totalRequestTokens].receiver = _to ; 
        createTokens[totalRequestTokens].issuerRequestAudit = true ;
        createTokens[totalRequestTokens].requestedCoin = true  ; 
        createTokens[totalRequestTokens].issuerAddress = msg.sender ; 
        createTokens[totalRequestTokens].issuer_message = _message ; 
        totalRequestTokens += 1 ; 
        return ( "Send  Auditor to confirm " ) ;
    }else {
        createTokens[totalRequestTokens].balance = 0  ;
        createTokens[totalRequestTokens].receiver = _to ; 
        createTokens[totalRequestTokens].issuerRequestAudit = false ; 
        createTokens[totalRequestTokens].requestedCoin = true  ; 
        createTokens[totalRequestTokens].issuerAddress = msg.sender ; 
        createTokens[totalRequestTokens].issuer_message = _message ; 
        return ( " Recorded cancle request " ) ;
    }
    
  } 
  
    function moneyToCoinAuditorProof ( uint256 _createToken , string _message , bool _confirm  ) public returns ( string Information  )  {
    require ( createTokens[_createToken].audited == false , createTokens[_createToken].auditor_message )  ; 
    require ( createTokens[_createToken].issuerRequestAudit == true , "Issuser not yet confirm " )  ; 
    if (_confirm) {
        balances[createTokens[_createToken].receiver] = createTokens[_createToken].balance ;
        createTokens[_createToken].audited = true ; 
        createTokens[_createToken].auditor_message =  _message ;
        totalSupply = totalSupply + createTokens[_createToken].balance ; 
        createTokens[_createToken].auditorAddress = msg.sender ;
        totalProofTokens += 1 ; 
        totalSupply = totalSupply +  createTokens[_createToken].balance  ; 
        emit InsertBalances( _createToken , msg.sender, createTokens[_createToken].balance) ;
        return ( "Audited OK" ) ; 
    }else{
        createTokens[_createToken].auditor_message =  _message ; 
        createTokens[_createToken].audited = true ; 
        createTokens[_createToken].auditorAddress = msg.sender ; 
        return ( "Audited NOT OK " )  ; 
    }
    
    
  }
  
  function strConcat(string _a, string _b, string _c, string _d, string _e ) internal pure returns (string){ 
        bytes memory _ba = bytes(_a); 
        bytes memory _bb = bytes(_b); 
        bytes memory _bc = bytes(_c); 
        bytes memory _bd = bytes(_d); 
        bytes memory _be = bytes(_e); 
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length ); 
        bytes memory babcde = bytes(abcde); 
        uint k = 0;
        uint i = 0;
        for (i ; i < _ba.length; i++) babcde[k++] = _ba[i]; 
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i]; 
        for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i]; 
        for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i]; 
        for (i = 0; i < _be.length; i++) babcde[k++] = _be[i]; 
        return string(babcde); 
    } 
  
  

}
