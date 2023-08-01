// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {LessonTwelveHelper} from "../src/12-LessonHelper.sol";

contract DeployLessonHelper is Script {
    function run() external returns (LessonTwelveHelper) {
        vm.startBroadcast(address(this));
        LessonTwelveHelper helper = new LessonTwelveHelper();
        vm.stopBroadcast();
        console.log("Helper address is: ", address(helper));
        return helper;
    }
}
