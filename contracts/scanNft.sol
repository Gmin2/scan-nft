// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomNFT is ERC721, Ownable {
    uint256 private _tokenIds;
    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("CustomNFT", "CNFT") Ownable(msg.sender) {}

    function mint() public onlyOwner {
        _tokenIds += 1;
        _mint(msg.sender, _tokenIds);
    }

    function approve(address spender, uint256 id) public override {
        super.approve(spender, id);
    }

    function balanceOf(address owner) public view override returns (uint256) {
        return super.balanceOf(owner);
    }

    function getApproved(uint256 id) public view override returns (address) {
        return super.getApproved(id);
    }

    function isApprovedForAll(address owner, address operator) public view override returns (bool) {
        return super.isApprovedForAll(owner, operator);
    }

    function name() public view override returns (string memory) {
        return super.name();
    }

    function ownerOf(uint256 id) public view override returns (address) {
        return super.ownerOf(id);
    }

    // Removed the non-virtual function override
    function transferFrom(address from, address to, uint256 id) public override {
        super.transferFrom(from, to, id);
    }

    function setApprovalForAll(address operator, bool approved) public override {
        super.setApprovalForAll(operator, approved);
    }

    function supportsInterface(bytes4 interfaceId) public view override returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function symbol() public view override returns (string memory) {
        return super.symbol();
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        return _tokenURIs[id];
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIds;
    }

    // Helper to set token URI
    function _setTokenURI(uint256 tokenId, string memory uri) internal {
        _tokenURIs[tokenId] = uri;
    }
}