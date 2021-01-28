// SPDX-License-Identifier: MIT
// pragma solidity 0.6.9;
pragma solidity 0.6.9;

interface IPrice {
    // function hello() external view returns(string memory);
    function setPrice(int256 _price)
        external
        payable
        returns (int256);

    function getPrice() external view returns (int256);
}
