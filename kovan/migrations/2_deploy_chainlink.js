const Price = artifacts.require("chainlink");

module.exports = function (deployer) {
    deployer.deploy(Price);
};
