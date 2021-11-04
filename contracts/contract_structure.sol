// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import { Base64 } from "./libraries/base64.sol";

contract epicNFT is ERC721URIStorage {
    
    // keep track of tokens
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    // NFTs token name and it's symbol.
    constructor() ERC721 ("flowerNFT", "FLWR") {
        console.log("Token created!");
    }
    
    // A function our user will hit to get their NFT.
    function mintNFT() public {
        
        // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        // Make JSON metadata and base64 encode it.
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "', 'NFT_NAME',
                        '", "description": "', 'RANDOM_NFT_DESCRIPTION.', 
                        '", "image": "IPFS_LINK_OR_ENCODED_DATA_OR_WHATEVER_APPROPRIATE"}'
                    )
                )
            )
        );

        // prepend data:application/json;base64, to our data.
        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );
        
        // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);
        
        // Set the NFTs data.
        _setTokenURI(newItemId, finalTokenUri);

        console.log("ID %s has been minted to %s", newItemId, msg.sender);
        
        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}