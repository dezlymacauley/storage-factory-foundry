// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//-----------------------------------------------------------------------------

import {SimpleStorage} from "./SimpleStorage.sol";

//-----------------------------------------------------------------------------

// This StorageFactory contract will be deploying a SimpleStorage contract.
contract StorageFactory {

    // simpleStorage (lowercase s) is a variable that will store,
    // newly created SimpleStorage contracts.

    SimpleStorage[] public listOfSimpleStorageContracts;
    // address[] public listOfSimpleStorageContractsAddresses;

    function createSimpleStorageContract() public {
       
        // This will create a new SimpleStorage contract
        SimpleStorage newSimpleStorageContract = new SimpleStorage();

        // This will add the new SimpleStorage contract,
        // to the list of contracts
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
        
    }
    
    // sfStore stands for storage factory store
    function sfStore(
        uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber
    ) public {
       
        // To interact with a contract,
        // you need the ABI - Application Binary Interface
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();

    }

}
