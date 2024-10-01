// SPDX-License-Identifier: MIT
pragma solidity >0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address private owner;
    string[3] private items = ["Pencil","Eraser","Scale"];
    uint[3] private prices = [10, 5, 7];
    mapping(address => string[]) private ownedAssets;
    constructor() ERC20("Degen", "DGN"){
        owner = msg.sender;
    }
//This gives the access only to the owner
    modifier onlyOwner{
        require(owner==msg.sender,"Only owner has access");
        _;
    }
//Used to mint tokens to the specified address.
    function mintTo(address _to,uint _val) public onlyOwner{
        _mint(_to,_val);
    }
//This is used to burn tokens from caller's address
    function burnFrom(uint _val) public {
        _burn(msg.sender, _val);
    }
//Function to redeem an item by its index
    function redeem(uint _item) public {

        require(_item-1 < items.length && _item-1 >= 0, "Item index out of bounds");
        uint price = prices[_item-1];
        _burn(msg.sender, price);
         ownedAssets[msg.sender].push(items[_item - 1]);
    }
// This will used to transfer tokens to a specified address
    function transferTo(address _to, uint _val) public  {
        _transfer(msg.sender, _to, _val);
    }
//This will give the items which we defined in string above, like pencil eraser and scale
    function getOwnedAssets(address _owner) public view returns (string[] memory) {
        return ownedAssets[_owner];
    }

    
}
