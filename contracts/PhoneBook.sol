//SPDX-License-Identifier:MIT
pragma solidity^0.8.10;


contract PhoneBook
{

	mapping(string=>uint256) internal book;
	
	function addPeople(string memory _name,uint256 _phone) public returns(bool)
	{
		book[_name]=_phone;
		return true;
	}

	function find(string memory _name) public returns(uint256)
	{
		return(book[_name]);
	}
}


