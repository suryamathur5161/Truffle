// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ResultStorage
{
	uint public result;
}

contract Calculator is ResultStorage
{
	Product internal product;
	Addition internal addition;

	constructor()
	{
		product=new Product();
		addition=new Addition();
	}
	function add(uint x) public 
	{
		bytes4 methodID=Addition.calculate.selector;
		(bool success, bytes memory c)=address(addition).delegatecall(abi.encode(methodID,x));
		require(success);
	}
	function multiple(uint x) public
	{
		bytes4 methodID=Product.calculate.selector;
		(bool success, bytes memory c)=address(product).delegatecall(abi.encode(methodID,x));
		require(success);
	}
}

contract Addition is ResultStorage
{
	function calculate(uint x) public returns(uint)
	{
		uint temp=result+x;
		assert(temp>=result);
		result=temp;
		return result;
	}
}

contract Product is ResultStorage
{
	function calculate(uint x) public returns(uint)
	{
		if(x==0)result=0;
		else
		{
			uint temp=result*x;
			assert(temp/result==x);
			result=temp;
		}
		return result;
	}
}


