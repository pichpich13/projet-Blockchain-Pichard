// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Sign
 * @dev Sign & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract Marketplace {
    
    enum ShippingStatus {
        Pending,
        Shipped,
        Delivered
    }
    
    ShippingStatus public status;
    
    event MissionComplete();
    
    address owner;
    
    constructor() {
        status = ShippingStatus.Pending;
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
    modifier onlyCustomer {
        require(msg.sender != owner, "Only the customer can call this function");
        _;
    }
    
    function ship() public onlyOwner {
        status = ShippingStatus.Shipped;
        emit MissionComplete();
    }
    
    function deliver() public onlyOwner {
        status = ShippingStatus.Delivered;
        emit MissionComplete();
    }
    
    function getStatus() public view onlyOwner returns (ShippingStatus) {
        return status;
    }
    
    function checkStatus() public onlyCustomer payable returns (ShippingStatus) {
        require(msg.value >= 1 ether, "Payment of 1 ether required to check status");
        return status;
    }
}
