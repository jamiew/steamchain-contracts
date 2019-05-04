pragma solidity ^0.5.1;

contract SteamGame {
    uint appid;
    string name;

    function setAppId(uint x) public {
        appid = x;
    }

    function getAppId() public view returns (uint) {
        return appid;
    }
    
    function setName(string memory x) public {
        name = x;
    }
    
    function getName() public view returns (string memory) {
        return name;
    }
}
