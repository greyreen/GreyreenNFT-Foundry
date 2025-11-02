// test/GreyreenNFT.t.sol
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {GreyreenNFT} from "../src/GreyreenNFT.sol"; 

contract GreyreenNFTTest is Test {
    GreyreenNFT public nft;

    address public constant ALICE = address(0xAA);
    address public constant BOB = address(0xBB);
    string public constant BASE_URI = "https://example.com/nft/";

    function setUp() public {
        vm.startPrank(address(this));
        nft = new GreyreenNFT();
        vm.stopPrank();
    }

    // TEST 1: Mint Yetkisi Kontrolü
    function test_OnlyMinterCanMint() public {
        vm.prank(address(this));
        nft.safeMint(ALICE, string.concat(BASE_URI, "1"));
        
        // BOB (rolü yok) Mint yapmaya çalıştığında hata fırlatmalı
        vm.prank(BOB);
        vm.expectRevert(); 
        nft.safeMint(BOB, string.concat(BASE_URI, "2"));
    }

    // TEST 2: Token ID ve Sahiplik Kontrolü (TOTAL SUPPLY KONTROLÜ İLE)
    function test_TokenIdAndOwnership() public {
        vm.prank(address(this));
        nft.safeMint(ALICE, string.concat(BASE_URI, "1"));
        nft.safeMint(BOB, string.concat(BASE_URI, "2"));
        
        // Sözleşmede manuel olarak eklediğimiz totalSupply() fonksiyonunu kontrol et
        assertEq(nft.totalSupply(), 2, "Total supply should be 2 after two mints.");
        assertEq(nft.ownerOf(1), ALICE, "Token 1 should be owned by ALICE.");
        assertEq(nft.ownerOf(2), BOB, "Token 2 should be owned by BOB.");
    }
}