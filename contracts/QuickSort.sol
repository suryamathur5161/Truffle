//SPDX-License-Identifier: MIT
pragma solidity^0.8.10;

contract ResultStorage
{
	uint[] public result;
}

contract Sorting is ResultStorage
{
	function sort(uint[] calldata data) public returns(uint[] calldata)
	{
		quickSort(data,int(0),int(data.length-1));
		result=data;
		return data;
	}


	function quickSort(uint[] memory data,int left,int right) internal
	{
		int i=left;
		int j=right;
		uint pivot=data[uint((left+right)/2)];
		if(i==j)return;
		while(i<=j)
		{
			while(data[uint(i)]<pivot)i++;
			while(pivot<data[uint(j)])j--;
			if(i<=j)
			{
				(data[uint(i)],data[uint(j)])=(data[uint(j)],data[uint(i)]);
				i++;
				j--;
			}
		}
		
		if(left<j)
		{
			quickSort(data,left,j);
		}
		if(right>i)
		{
			quickSort(data,i,right);
		}
	}
}
