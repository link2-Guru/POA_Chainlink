// SPDX-License-Identifier: MIT
// pragma solidity 0.6.9;
pragma solidity 0.6.9;

import "@chainlink/contracts/v0.6/interfaces/AggregatorV3Interface.sol";
import {IAMB} from "./IAMB.sol";
import {IPrice} from "./IPrice.sol";

contract Chainlink {
    uint256 public constant DEFAULT_GAS_LIMIT = 2e6;
    int256 public price;

    /**
     * Network: Kovan
     * Aggregator: ETH/USD
     * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
     */
    // constructor() public {
    //     priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    // }

    // https://market.link/feeds/b6ae7431-efeb-49e3-9c28-a1feeaabdbd0
    function getPrice() external {
        // https://docs.chain.link/docs/ethereum-addresses#config
        AggregatorV3Interface aggregator =
            AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);

        (uint80 _roundId, int256 _price, , uint256 _timestamp, ) =
            aggregator.latestRoundData();
        price = _price;

        // https://docs.tokenbridge.net/kovan-sokol-amb-bridge/about-the-kovan-sokol-amb
        IAMB amb = IAMB(0xFe446bEF1DbF7AFE24E81e05BC8B271C1BA9a560);
        bytes4 methodSelector = IPrice.setPrice.selector;

        bytes memory data = abi.encodeWithSelector(methodSelector, _price);

        amb.requireToPassMessage(
            0xcdd440d33D8A1,// 合约地址
            data,
            DEFAULT_GAS_LIMIT
        );
    }
}
