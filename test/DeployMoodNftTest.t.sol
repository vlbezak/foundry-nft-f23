// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../script/DeployMoodNft.s.sol";

contract MoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testSvgToImageUri() public {
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgIGhlaWdodD0iNDAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgZmlsbD0ieWVsbG93IiByPSI3OCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIi8+PGcgY2xhc3M9ImV5ZXMiPjxjaXJjbGUgY3g9IjYxIiBjeT0iODIiIHI9IjEyIi8+PGNpcmNsZSBjeD0iMTI3IiBjeT0iODIiIHI9IjEyIi8+PC9nPjxwYXRoIGQ9Im0xMzYuODEgMTE2LjUzYy42OSAyNi4xNy02NC4xMSA0Mi04MS41Mi0uNzMiIHN0eWxlPSJmaWxsOm5vbmU7IHN0cm9rZTogYmxhY2s7IHN0cm9rZS13aWR0aDogMzsiLz48L3N2Zz4=";
        string memory svg = '<svg viewBox="0 0 200 200" width="400"  height="400" xmlns="http://www.w3.org/2000/svg"><circle cx="100" cy="100" fill="yellow" r="78" stroke="black" stroke-width="3"/><g class="eyes"><circle cx="61" cy="82" r="12"/><circle cx="127" cy="82" r="12"/></g><path d="m136.81 116.53c.69 26.17-64.11 42-81.52-.73" style="fill:none; stroke: black; stroke-width: 3;"/></svg>';
        string memory result = deployer.svgToImageUri(svg);
        console.log(result);
        assertEq(keccak256(abi.encodePacked(expectedUri)), keccak256(abi.encodePacked(result)));

    }
}
