const Migrations = artifacts.require("Migrations");
const Tokens = artifacts.require("Neofi");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Tokens);
};
