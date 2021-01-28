// SPDX-License-Identifier: MIT
// pragma solidity 0.6.9;
pragma solidity 0.6.9;

contract Price {
    int256 public price;

    function setPrice(int256 _price) public payable returns (int256) {
        price = _price;
    }

    function getPrice() public view returns (int256) {
        return price;
    }
}
