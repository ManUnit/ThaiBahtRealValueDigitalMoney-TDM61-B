pragma solidity ^0.4.24;
/*
@ TDM61 B version 2561 Thai Bath real value 
@ Author : Anan Paenthongkham
@ copy right 2018  Anan Paenthongkham
@ Registor  funcions
@improved ERC-20 stand token to be TDM61 B version 2561
*/
contract  registor  {
    
    address FinaceMinistor  ;
    address ThaiBankGorvernor  ;
    address SystemAddr  ;
    
    struct auditor { 
      string name ;
      string lastname ;
      string  IDCard  ;
      address accoutAddress ; 
      bool MinistorEmpowered  ; 
      bool ThaiBankGvnEmpowered ;
      address FinanceMinistorAddr ;
      address thaiBankGorvernorAddr ;
    }
     
    mapping (address => auditor ) Auditors ;
    
    
    /*
    
    Full Smart contract code request  email to : hs1gab@gmail.com 
    
    ^/
