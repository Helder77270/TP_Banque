pragma solidity >=0.5.0 <0.8.0;

contract Banque {

    uint256 bankBalance;
    address payable _owner;
    
    constructor () public {
        bankBalance = 7000000;
        balances[msg.sender] = 1;
        wallet[msg.sender] = 1;
       _owner = msg.sender;
    }
    
    mapping (address => uint256) public balances;
    mapping (address => uint256) public wallet;
    
     function getContractAddress() public view returns(address _address){
        return address(this);
    }
    
    function loan(uint256 _amount) public returns (bool){
        require(_amount < bankBalance,"C'est trop");
        require(msg.sender!= address(0),"L'address 0 n'existe pas");
        balances[msg.sender] += _amount;
        return true;
    }
    
     function withdraw(uint256 _amount) public returns (bool){
        require(msg.sender != address(0),"L'address 0 n'existe pas");
        require(balances[msg.sender] >= _amount,"T'es pauvre tu peux pas retirer");
        balances[msg.sender] -= _amount;
        wallet[msg.sender] += _amount;
        return true;
    }
    
    function deposit(uint256 _amount) public returns (bool){
        require(msg.sender != address(0),"L'address 0 n'existe pas");
        require(wallet[msg.sender] >= _amount,"T'as passez d'argent");
        balances[msg.sender] += _amount;
        wallet[msg.sender] -= _amount;
        return true;
    }

    function getWalletBalance(address _add) public view returns(uint256){
        return wallet[_add];
    }
    
    function getBalance(address _add) public view returns(uint256){
        return balances[_add];
    }
}