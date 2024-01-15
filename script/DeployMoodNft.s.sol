// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft moodNft){
        string memory sadSvg = vm.readFile("./images/dynamic/sad.svg");
        string memory happySvg = vm.readFile("./images/dynamic/happy.svg");
        console.log(sadSvg);

        vm.startBroadcast();
        moodNft = new MoodNft(svgToImageUri(sadSvg), svgToImageUri(happySvg));
        vm.stopBroadcast();
    }

    function svgToImageUri(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}