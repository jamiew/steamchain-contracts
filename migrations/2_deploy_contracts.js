var BasicStorage = artifacts.require("./BasicStorage.sol");
var Steamchain = artifacts.require("./Steamchain.sol");

module.exports = function(deployer) {
  deployer.deploy(BasicStorage);
	deployer.deploy(Steamchain);
}

