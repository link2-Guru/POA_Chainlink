const Price = artifacts.require("price");

module.exports = function (deployer) {
    deployer.deploy(Price);
};
