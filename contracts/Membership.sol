//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Whitelist {
    function _burn(
        address,
        uint256,
        uint256
    ) public {}
}

contract Membership is ERC721URIStorage, Ownable {
    struct set {
        uint256 upper_index;
        uint256 lower_index;
    }
    mapping(string => set) hair;
    mapping(string => set) background;
    mapping(string => set) gender;
    mapping(uint256 => uint256) remainingNFTS;
    address whitelist;
    uint256 nftRemainingCount;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor(address _whitelist, uint256 _totalNFT) ERC721("Member", "MEM") {
        whitelist = _whitelist;
        nftRemainingCount = _totalNFT;
    }

    function extendAuction(uint256 blocktime)
        public
        onlyOwner
        returns (uint256)
    {}

    function giveMembership(
        string memory _hair,
        string memory _background,
        string memory _gender,
        address _originalTokenId,
        address _from
    ) public onlyOwner returns (uint256) {
        // Burn the original NFT
        Whitelist(whitelist)._burn(_from, _originalTokenId, 1);

        // Find the right NFT

        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        nftRemainingCount.decrement();
        return newItemId;
    }

    modifier intersection(
        uint256 _a,
        uint256 _b,
        uint256 _c,
        uint256 _d
    ) {}
}
