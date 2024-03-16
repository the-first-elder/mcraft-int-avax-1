// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Token {
    string public name = 'MetaToken';
    string public symbol = 'MTK';
    uint public totalSupply;

    mapping(address => uint) public balances;

    function mint(address _receiver, uint _amount) public {
        require(_amount > 0, "Amount cannot be less than zero");
        totalSupply += _amount;
        balances[_receiver] += _amount;
    }

    function burn(address _owner, uint _amount) public {
        // require(_owner == msg.sender, "You are not the owner");
        if(_owner != msg.sender){revert();}
        totalSupply -= _amount;
        balances[_owner] -= _amount;
    }

    function transfer(address _recipient, uint _amount) public {
        require(msg.sender != _recipient, "You cannot transfer to yourself");
        assert(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }
}
