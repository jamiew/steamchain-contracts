pragma solidity ^0.5.7;

contract Steamchain {
    uint256 public gameCount = 0;
    mapping(uint => Game) public games;
    mapping(string => Game) public gamesByAppID;
    mapping(string => Game) public gamesByUsername;
    mapping(address => Game) public gamesByUserAddress;

    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    struct Game {
        uint id;
        string appID;
        string username;
        address userAddress;
        // User user;
    }
    
    struct User {
        // string id; // Steam user ID?
        string username; // Steam username
        address userAddress; // Ethereum wallet address
    }

    constructor() public {
        owner = msg.sender;
    }

    function addGame(
        string memory _appID,
        string memory _username,
        address _userAddress
    )
        public
        onlyOwner
    {
        incrementCount();
        // _userAddress = msg.sender; // TODO how to do multisignature for this, with other user?
        Game memory game = Game(gameCount, _appID, _username, _userAddress);
        games[gameCount] = game;
        gamesByAppID[_appID] = game;
        gamesByUsername[_username] = game;
        gamesByUserAddress[_userAddress] = game;
    }
    
    function incrementCount() internal {
        gameCount += 1;
    }
}
