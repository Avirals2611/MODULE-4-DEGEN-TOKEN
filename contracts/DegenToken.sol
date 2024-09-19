// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    struct NFTStructure {
        uint256 id;
        string name;
        uint amount;
    }

    NFTStructure[] public NFTDetails;

    constructor() ERC20("Degen", "DGN") {
        NFTStructure memory nft1 = NFTStructure(1, "ProPlayer NFT value", 200);
        NFTStructure memory nft2 = NFTStructure(2, "SuperNinja value", 100);
        NFTStructure memory nft3 = NFTStructure(3, "DegenCap value", 75);

        NFTDetails.push(nft1);
        NFTDetails.push(nft2);
        NFTDetails.push(nft3);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address _receiver, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _transfer(msg.sender, _receiver, amount);
    }

    function checkBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function gameStore() public view returns (NFTStructure[] memory) {
        return NFTDetails;
    }

    function addNFT(string memory name, uint amount) public {
        NFTDetails.push(NFTStructure(NFTDetails.length + 1, name, amount));
    }

    function redeemTokens(uint256 choice) external {
        require(
            choice >= 1 && choice <= NFTDetails.length,
            "Invalid selection"
        );

        NFTStructure memory x = NFTDetails[choice - 1];
        uint tokenAmount = x.amount;
        delete NFTDetails[choice - 1];
        require(balanceOf(msg.sender) >= tokenAmount, "Insufficient balance");
        _transfer(msg.sender, owner(), tokenAmount);
    }
}
