//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    uint8 public maxWhitelistedAddress;

    mapping(address => bool) public whitelistedAddress;
        
    uint8 public numAddressWhitelisted;

    constructor(uint8 _maxWhitelistAddresses) {
            maxWhitelistedAddress = _maxWhitelistAddresses;
    }

    function addAddressToWhitelist() public{
        require(!whitelistedAddress[msg.sender],  "Sender has already been whitelisted");
        require(numAddressWhitelisted < maxWhitelistedAddress, "Address can't be added, limit reached");
        whitelistedAddress[msg.sender] = true;
        numAddressWhitelisted += 1;
    }
}