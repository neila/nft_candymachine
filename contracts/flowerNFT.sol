// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import { Base64 } from "./libraries/base64.sol";

contract flowerNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // We split the SVG at the part where it asks for the background color.
    string svgPartOne = "<svg version='1.1' width='720' height='720' viewBox='0 0 320 320' fill='none' stroke='#000' stroke-linecap='round' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'><defs><path id='r1'><animate id='p1' attributeName='d' values='m160,160l0,0 0,0;m130,110l30,-17 30,17;m130,60l30,-17 30,17;m160,20l0,0 0,0' dur='6s' repeatCount='indefinite'/><animate attributeName='stroke-width' values='0;4;4;4;0' dur='6s' repeatCount='indefinite' begin='p1.begin'/></path><path id='r2'><animate attributeName='d' values='m160,160l0,0 0,0;m130,110l30,-17 30,17;m130,60l30,-17 30,17;m160,20l0,0 0,0' dur='6s' repeatCount='indefinite' begin='p1.begin+1s'/><animate attributeName='stroke-width' values='0;4;4;4;0' dur='6s' repeatCount='indefinite' begin='p1.begin+1s'/></path><path id='r3'><animate attributeName='d' values='m160,160l0,0 0,0;m130,110l30,-17 30,17;m130,60l30,-17 30,17;m160,20l0,0 0,0' dur='6s' repeatCount='indefinite' begin='p1.begin+2s'/><animate attributeName='stroke-width' values='0;4;4;4;0' dur='6s' repeatCount='indefinite' begin='p1.begin+2s'/></path><path id='r4'><animate id='p1' attributeName='d' values='m160,160l0,0 0,0;m130,110l30,-17 30,17;m130,60l30,-17 30,17;m160,20l0,0 0,0' dur='6s' repeatCount='indefinite' begin='p1.begin+3s'/><animate attributeName='stroke-width' values='0;4;4;4;0' dur='6s' repeatCount='indefinite' begin='p1.begin+3s'/></path><path id='r5'><animate attributeName='d' values='m160,160l0,0 0,0;m130,110l30,-17 30,17;m130,60l30,-17 30,17;m160,20l0,0 0,0' dur='6s' repeatCount='indefinite' begin='p1.begin+4s'/><animate attributeName='stroke-width' values='0;4;4;4;0' dur='6s' repeatCount='indefinite' begin='p1.begin+4s'/></path><path id='r6'><animate attributeName='d' values='m160,160l0,0 0,0;m130,110l30,-17 30,17;m130,60l30,-17 30,17;m160,20l0,0 0,0' dur='6s' repeatCount='indefinite' begin='p1.begin+5s'/><animate attributeName='stroke-width' values='0;4;4;4;0' dur='6s' repeatCount='indefinite' begin='p1.begin+5s'/></path><linearGradient id='skyGradient' x1='100%' y1='100%'><stop offset='0%' stop-color='lightblue' stop-opacity='.5'><animate attributeName='stop-color' values='lightblue;blue;red;red;black;red;red;purple;lightblue' dur='6s' repeatCount='indefinite' /></stop><stop offset='100%' stop-color='lightblue' stop-opacity='.5'><animate attributeName='stop-color' values='lightblue;orange;purple;purple;black;purple;purple;blue;lightblue' dur='6s' repeatCount='indefinite' /><animate attributeName='offset' values='.95;.80;.60;.40;.20;0;.20;.40;.60;.80;.95' dur='6s' repeatCount='indefinite' /></stop></linearGradient><linearGradient id='tropicGradient' x1='100%' y1='100%'><stop offset='0%' stop-color='green' stop-opacity='.5'><animate attributeName='stop-color' values='green;yellow;red;purple;red;yellow;green' dur='6s' repeatCount='indefinite' /></stop><stop offset='100%' stop-color='green' stop-opacity='.5'><animate attributeName='stop-color' values='purple;red;yellow;orange;yellow;red;purple' dur='6s' repeatCount='indefinite' /><animate attributeName='offset' values='.95;.80;.60;.40;.20;0;.20;.40;.60;.80;.95' dur='6s' repeatCount='indefinite' /></stop></linearGradient><linearGradient id='forestGradient' x1='100%' y1='100%'><stop offset='0%' stop-color='orange' stop-opacity='.5'><animate attributeName='stop-color' values='green;yellow;red;purple;red;yellow;green' dur='6s' repeatCount='indefinite' /></stop><stop offset='100%' stop-color='green' stop-opacity='.5'><animate attributeName='stop-color' values='green;white;lightblue;blue;lightblue;white;green' dur='6s' repeatCount='indefinite' /><animate attributeName='offset' values='.95;.80;.60;.40;.20;0;.20;.40;.60;.80;.95' dur='6s' repeatCount='indefinite' /></stop></linearGradient></defs><use xlink:href='#r1' stroke='";

    struct svgBase { 
        string svgPartTwo;
        string svgPartThree;
        string svgPartFour;
        string svgPartFive;
        string svgPartSix;
        string svgPartSeven;
        string svgPartEight;
        string svgPartNine;
        string svgPartTen;
        string svgPartEleven;
        string svgPartTwelve;
        string svgPartThirteen;
        string svgPartFourteen;
        string svgPartFifteen;
        string svgPartSixteen;
        string svgPartSeventeen;
        string svgPartEighteen;
        string svgPartNineteen;
        string svgPartTwenty;
        string svgPartTwentyOne;
        string svgPartTwentyTwo;
        string svgPartTwentyThree;
        string svgPartTwentyFour;
        string svgPartTwentyFive;
        string svgPartTwentySix;
        string svgPartTwentySeven;
        string svgPartTwentyEight;
        string svgPartTwentyNine;
        string svgPartThirty;
        string svgPartThirtyOne;
        string svgPartThirtyTwo;
        string svgPartThirtyThree;
        string svgPartThirtyFour;
        string svgPartThirtyFive;
        string svgPartThirtySix;
    }

    svgBase unique_base = svgBase(
        "'/><use xlink:href='#r1' transform='rotate(60 160 160)' stroke='",
        "'/><use xlink:href='#r1' transform='rotate(120 160 160)' stroke='", 
        "'/><use xlink:href='#r1' transform='rotate(180 160 160)' stroke='",
        "'/><use xlink:href='#r1' transform='rotate(240 160 160)' stroke='",
        "'/><use xlink:href='#r1' transform='rotate(300 160 160)' stroke='",
        "'/><use xlink:href='#r2' transform='rotate(30 160 160)' stroke='",
        "'/><use xlink:href='#r2' transform='rotate(90 160 160)' stroke='",
        "'/><use xlink:href='#r2' transform='rotate(150 160 160)' stroke='",
        "'/><use xlink:href='#r2' transform='rotate(210 160 160)' stroke='",
        "'/><use xlink:href='#r2' transform='rotate(270 160 160)' stroke='",
        "'/><use xlink:href='#r2' transform='rotate(330 160 160)' stroke='",
        "'/><use xlink:href='#r3' stroke='",
        "'/><use xlink:href='#r3' transform='rotate(60 160 160)' stroke='",
        "'/><use xlink:href='#r3' transform='rotate(120 160 160)' stroke='",
        "'/><use xlink:href='#r3' transform='rotate(180 160 160)' stroke='",
        "'/><use xlink:href='#r3' transform='rotate(240 160 160)' stroke='",
        "'/><use xlink:href='#r3' transform='rotate(300 160 160)' stroke='",
        "'/><use xlink:href='#r4' transform='rotate(30 160 160)' stroke='",
        "'/><use xlink:href='#r4' transform='rotate(90 160 160)' stroke='",
        "'/><use xlink:href='#r4' transform='rotate(150 160 160)' stroke='",
        "'/><use xlink:href='#r4' transform='rotate(210 160 160)' stroke='",
        "'/><use xlink:href='#r4' transform='rotate(270 160 160)' stroke='",
        "'/><use xlink:href='#r4' transform='rotate(330 160 160)' stroke='",
        "'/><use xlink:href='#r5' stroke='",
        "'/><use xlink:href='#r5' transform='rotate(60 160 160)' stroke='",
        "'/><use xlink:href='#r5' transform='rotate(120 160 160)' stroke='",
        "'/><use xlink:href='#r5' transform='rotate(180 160 160)' stroke='",
        "'/><use xlink:href='#r5' transform='rotate(240 160 160)' stroke='",
        "'/><use xlink:href='#r5' transform='rotate(300 160 160)' stroke='",
        "'/><use xlink:href='#r6' transform='rotate(30 160 160)' stroke='",
        "'/><use xlink:href='#r6' transform='rotate(90 160 160)' stroke='",
        "'/><use xlink:href='#r6' transform='rotate(150 160 160)' stroke='",
        "'/><use xlink:href='#r6' transform='rotate(210 160 160)' stroke='",
        "'/><use xlink:href='#r6' transform='rotate(270 160 160)' stroke='",
        "'/><use xlink:href='#r6' transform='rotate(330 160 160)' stroke='"
    );

    struct color {
        string randomColor1;
        string randomColor2;
        string randomColor3;
        string randomColor4;
    }

    string[] colors = ["red", "black", "yellow", "blue", "green", "#08C2A8", "#5816cc", "#91e615", "#9a4175", "#a0c588", "#eb7717", "url(#forestGradient)", "url(#tropicalGradient)", "url(#skyGradient)"];

    event newTokenMinted(address sender, uint256 tokenId);

    constructor() ERC721("FlowerNFT", "FLWR") {
        console.log("Wow, your flower just blossomed! Woah!");
    }

    function pickRandomColor1(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("COLORone", Strings.toString(tokenId))));
        rand = rand % colors.length;
        return colors[rand];
    }

    function pickRandomColor2(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("COLORtwo", Strings.toString(tokenId))));
        rand = rand % colors.length;
        return colors[rand];
    }

    function pickRandomColor3(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("COLORthree", Strings.toString(tokenId))));
        rand = rand % colors.length;
        return colors[rand];
    }

    function pickRandomColor4(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("COLORfour", Strings.toString(tokenId))));
        rand = rand % colors.length;
        return colors[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function mintNFT() public {
        uint256 newItemId = _tokenIds.current();

        color memory unique_color = color(pickRandomColor1(newItemId), pickRandomColor2(newItemId), pickRandomColor3(newItemId), pickRandomColor4(newItemId));

        string[] memory batches = new string[](12);
        batches[0] = string(abi.encodePacked(svgPartOne, unique_color.randomColor1, unique_base.svgPartTwo, unique_color.randomColor2, unique_base.svgPartThree, unique_color.randomColor1));
        batches[1] = string(abi.encodePacked(unique_base.svgPartFour, unique_color.randomColor2, unique_base.svgPartFive, unique_color.randomColor1, unique_base.svgPartSix, unique_color.randomColor2));
        batches[2] = string(abi.encodePacked(unique_base.svgPartSeven, unique_color.randomColor3, unique_base.svgPartEight, unique_color.randomColor1, unique_base.svgPartNine, unique_color.randomColor4));
        batches[3] = string(abi.encodePacked(unique_base.svgPartTen, unique_color.randomColor3, unique_base.svgPartEleven, unique_color.randomColor1, unique_base.svgPartTwelve, unique_color.randomColor4));
        batches[4] = string(abi.encodePacked(unique_base.svgPartThirteen, unique_color.randomColor2, unique_base.svgPartFourteen, unique_color.randomColor2, unique_base.svgPartFifteen, unique_color.randomColor3));
        batches[5] = string(abi.encodePacked(unique_base.svgPartSixteen, unique_color.randomColor3, unique_base.svgPartSeventeen, unique_color.randomColor4, unique_base.svgPartEighteen, unique_color.randomColor4));
        batches[6] = string(abi.encodePacked(unique_base.svgPartNineteen, unique_color.randomColor1, unique_base.svgPartTwenty, unique_color.randomColor3, unique_base.svgPartTwentyOne, unique_color.randomColor4));
        batches[7] = string(abi.encodePacked(unique_base.svgPartTwentyTwo, unique_color.randomColor3, unique_base.svgPartTwentyThree, unique_color.randomColor1, unique_base.svgPartTwentyFour, unique_color.randomColor4));
        batches[8] = string(abi.encodePacked(unique_base.svgPartTwentyFive, unique_color.randomColor2, unique_base.svgPartTwentySix, unique_color.randomColor1, unique_base.svgPartTwentySeven, unique_color.randomColor4));
        batches[9] = string(abi.encodePacked(unique_base.svgPartTwentyEight, unique_color.randomColor2, unique_base.svgPartTwentyNine, unique_color.randomColor1, unique_base.svgPartThirty, unique_color.randomColor4));
        batches[10] = string(abi.encodePacked(unique_base.svgPartThirtyOne, unique_color.randomColor3, unique_base.svgPartThirtyTwo, unique_color.randomColor4, unique_base.svgPartThirtyThree, unique_color.randomColor3));
        batches[11] = string(abi.encodePacked(unique_base.svgPartThirtyFour, unique_color.randomColor4, unique_base.svgPartThirtyFive, unique_color.randomColor3, unique_base.svgPartThirtySix, unique_color.randomColor4));

        string memory superbatch1 = string(abi.encodePacked(batches[0], batches[1], batches[2], batches[3], batches[4], batches[5]));
        string memory superbatch2 = string(abi.encodePacked(batches[6], batches[7], batches[8], batches[9], batches[10], batches[11]));


        // I concatenate it all together, and then close the <text> and <svg> tags.
        string memory finalSvg = string(
            abi.encodePacked(
                superbatch1,
                superbatch2,
                "'/></svg>"
                )
        );
        
        // Get all the JSON metadata in place and base64 encode it.
        
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Generative flower (', string(abi.encodePacked(unique_color.randomColor1, unique_color.randomColor2)),
                        ')", "description": "A geometric flower blossoms in the ruins of what eventually became the metaverse.", "image": "data:image/svg+xml;base64,',
                        // We add data:image/svg+xml;base64 and then append our base64 encoded svg.
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );

        // Just like before, we prepend data:application/json;base64, to our data.
        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );


        console.log("\n--------------------");
        console.log(finalTokenUri);
        console.log("--------------------\n");

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, finalTokenUri);

        _tokenIds.increment();

        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        emit newTokenMinted(msg.sender, newItemId);
    }
}
