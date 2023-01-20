const ExerciceSolutionToken = artifacts.require("ExerciceSolutionToken");

var account1="0xE70AE39bDaB3c3Df5225E03032D31301E2E71B6b";

module.exports = function (deployer, network, accounts) {
	deployer.deploy(ExerciceSolutionToken)
};