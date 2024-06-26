// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

interface IDescendingPriceAuction {
    struct DPAConfig {
        uint256 ceiling;
        uint256 floor;
        uint256 collectionId;
        address paymentToken;
        address payee;
        uint256 endBlock;
        address[] tokens;
        uint256[] tokenAmounts;
    }

    struct DPA {
        uint256 id;
        uint256 ceiling;
        uint256 floor;
        uint256 absoluteDecay;
        uint256 collectionId;
        address paymentToken;
        address payee;
        uint256 startBlock;
        uint256 endBlock;
        bool stopped;
        address winner;
        uint256 winningBlock;
        uint256 winningPrice;
        address[] tokens;
        uint256[] tokenAmounts;
    }

    event AuctionCreated(uint256 indexed id, uint256 indexed collectionId, address indexed auctioneer);
    event CollectionCreated(uint256 id, address owner);
    event CollectionTransfer(uint256 id, address from, address to);
    event AuctionStopped(uint256 indexed id, uint256 price);
    event AuctionWon(uint256 indexed id, uint256 price, address paymentToken, address indexed winner);

    function getAuction(uint256 _id) external view returns (DPA memory);

    function totalAuctions() external view returns (uint256);

    function totalCollections() external view returns (uint256);

    function collectionLength(uint256 _id) external view returns (uint256);

    function neerGroupLength(address _neer) external view returns (uint256);

    function auctionOfNeerByIndex(address _neer, uint256 i) external view returns (uint256);

    function auctionOfCollByIndex(uint256 _id, uint256 i) external view returns (uint256);

    function createAuction(DPAConfig memory _auction) external returns (uint256);

    function stopAuction(uint256 _id) external;

    function bid(uint256 _id) external;

    function getCurrentPrice(uint256 _id) external view returns (uint256);

    function createCollection() external returns (uint256);

    function transferCollection(address _to, uint256 _id) external;
}
