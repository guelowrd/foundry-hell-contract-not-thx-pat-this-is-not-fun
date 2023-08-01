// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {LessonTwelveHelper} from "../src/12-LessonHelper.sol";
import {DeployLessonHelper} from "../script/DeployLessonHelper.s.sol";
import {Handler} from "./Handler.t.sol";

contract Invariants is StdInvariant, Test {
    DeployLessonHelper deployer;
    LessonTwelveHelper helper;
    Handler handler;

    function setUp() external {
        deployer = new DeployLessonHelper();
        helper = deployer.run();
        handler = new Handler(helper);
        console.log("Helper address is: ", address(helper));
        targetContract(address(handler));
    }

    function invariant_hellFunction128ReturnsSomethingSpecific() public view {
        // vm.startPrank(helper.getOwner());
        uint256 result = helper.hellFunc(98);
        // 2
        // 86
        // 115792089237316195423570985008687907853269984665640564039457584007913129639935
        // 4567922181068988507597666311282
        // 30049578511147215784808879450479838836096153794904741217038751371271103053824
        // 115792089237316195423570985008687907853269984665640564039457584007913129639932
        // 2412691959995678396471783196572
        console.log("Result128 is: ", result);
        uint128[] memory inputs = handler.getInputs();
        if (inputs.length > 10) {
            for (uint256 i = 0; i < 10; i++) {
                console.log("Input: ", inputs[i]);
            }
        }
        // vm.stopPrank();
        assert(true);
    }

    function invariant_hellFunctionReturnsSomethingSpecific() public view {
        // vm.startPrank(helper.getOwner());
        console.log("Owner is: ", helper.getOwner());
        uint256 result = helper.hellFunc(2412691959995678396471783196572);
        // 2
        // 86
        // 115792089237316195423570985008687907853269984665640564039457584007913129639935
        // 4567922181068988507597666311282
        // 30049578511147215784808879450479838836096153794904741217038751371271103053824
        // 115792089237316195423570985008687907853269984665640564039457584007913129639932
        // 2412691959995678396471783196572
        console.log("Result0 is: ", result);
        // vm.stopPrank();
        assert(true);
    }

    function testHellFunctionReturnsSomethingSpecific() public view {
        uint128 numberr = 4567922181068988507597666311282;
        //////////////////340282366920938463463374607431768211455;
        try helper.hellFunc(numberr) returns (uint256) {
            console.log(
                "revert LessonTwelve__AHAHAHAHAHA()",
                helper.hellFunc(numberr)
            );
            revert("NAN CEST RATe");
        } catch {
            assert(true);
        }
    }
}
