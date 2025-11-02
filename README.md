# 🖼️ Greyreen NFT Collection (Foundry Certified ERC-721)

## 🚀 Proje Özeti

Bu proje, bir önceki süreçte yaşanan Hardhat/Node uyumsuzluklarını aşmak için endüstri standardı **Foundry (Forge)** araçlarıyla yeniden oluşturulmuş, tamamen test edilmiş bir ERC-721 sözleşmesidir. Erişim kontrolü (`AccessControl`) kullanarak sadece yetkili adreslerin NFT basabilmesini sağlar.

**Projenin Amacı:** Stabil bir Foundry ortamında, kompleks OpenZeppelin uzantılarını (ERC721URIStorage) sorunsuz çalıştırma yeteneğini kanıtlamak.

## 🛠️ Teknoloji Yığını

* **Çerçeve:** Foundry (Forge & Cast) - **NPM/Node'dan Bağımsız**
* **Sözleşme Dili:** Solidity (`^0.8.20`)
* **Kütüphaneler:** OpenZeppelin Contracts (ERC721, AccessControl, ERC721URIStorage)

## 🟢 İŞLEVSELLİK KANITI (TESTLER BAŞARILI)

Projenin sadece derlenmekle kalmayıp, mantıksal olarak doğru çalıştığı **Solidity testleri** ile kanıtlanmıştır.

| Test Adı | Durum | Açıklama |
| :--- | :--- | :--- |
| `test_OnlyMinterCanMint` | PASSED | Sadece rolü olanın Mint yapabildiği. |
| `test_TokenIdAndOwnership` | PASSED | Token ID'lerinin doğru arttığı ve sahipliğin doğru atandığı. |

### Kurulum ve Çalıştırma

```bash
# 1. Depoyu klonlayın
git clone [https://github.com/greyreen/GreyreenNFT-Foundry.git](https://github.com/greyreen/GreyreenNFT-Foundry.git)
cd GreyreenNFT-Foundry

# 2. Kütüphaneleri kurun (OpenZeppelin)
forge install

# 3. Testleri çalıştırın (Çalıştığını kanıtlar)
forge test