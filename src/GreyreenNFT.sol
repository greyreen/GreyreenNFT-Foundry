// src/GreyreenNFT.sol (Nihai ve Hata Atlatıcı Kod)

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import yolları (Supply'ı kaldırdık, çünkü sorun çıkarıyor)
import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {AccessControl} from "openzeppelin-contracts/contracts/access/AccessControl.sol";

// Sözleşme yapısını basitleştirme
contract GreyreenNFT is ERC721URIStorage, AccessControl { 
    uint256 private _tokenIdCounter = 0; 
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor() 
        ERC721("Greyreen NFT Collection", "GRN")
    {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function safeMint(address to, string memory uri) public onlyRole(MINTER_ROLE) {
        _tokenIdCounter++;
        uint256 tokenId = _tokenIdCounter;

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
    
    // TotalSupply'ı manuel olarak ekleyelim
    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter;
    }

    // Override listesi basitleştirildi
    function supportsInterface(bytes4 interfaceId) public view override(ERC721URIStorage, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}