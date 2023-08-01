// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {LessonTwelveHelper} from "../src/12-LessonHelper.sol";

contract Handler is Test {
    LessonTwelveHelper helper;
    uint128[] public inputs;

    constructor(LessonTwelveHelper _helper) {
        helper = _helper;
    }

    function getInputs() public view returns (uint128[] memory) {
        return inputs;
    }

    function hellFunction128(uint128 input) public returns (uint256 result) {
        inputs.push(input);
        try helper.hellFunc(input) returns (uint256) {
            console.log("revert LessonTwelve__AHAHAHAHAHA()");
        } catch {
            revert("OK OK ON EST BEIN ICI");
            // console.log("_updateAndRewardSolver(yourTwitterHandle)");
        }
        result = helper.hellFunc(input);
    }

    // function hellFunction(uint256 input) public returns (uint256 result) {
    //     input = bound(input, 0, type(uint128).max - 1);
    //     vm.startPrank(helper.getOwner());
    //     result = helper.hellFunc(uint128(input));

    //     (bool successOne, bytes memory numberrBytes) = address(helper).call(
    //         abi.encodeWithSignature("getNumberr()")
    //     );
    //     (bool successTwo, bytes memory ownerBytes) = address(helper).call(
    //         abi.encodeWithSignature("getOwner()")
    //     );

    //     if (!successOne || !successTwo) {
    //         console.log("revert LessonTwelve__AHAHAHAHAHA()");
    //     }

    //     uint128 numberr = abi.decode(numberrBytes, (uint128));
    //     address exploitOwner = abi.decode(ownerBytes, (address));

    //     if (msg.sender != exploitOwner) {
    //         console.log("tut", numberr);
    //         console.log("revert LessonTwelve__AHAHAHAHAHA()");
    //     }

    //     try helper.hellFunc(uint128(input)) returns (uint256) {
    //         console.log("revert LessonTwelve__AHAHAHAHAHA()");
    //     } catch {
    //         revert("OK OK ON EST BEIN ICI");
    //         // console.log("_updateAndRewardSolver(yourTwitterHandle)");
    //     }

    //     console.log("Result is: ", result);
    //     vm.stopPrank();
    // }
}
