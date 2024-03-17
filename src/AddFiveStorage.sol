// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// NOTE: How to have a contract inherit the functionality of another contract

// Step 1: First import the other contract
import {SimpleStorage} from "./SimpleStorage.sol";

// Step 2: Declare the inheritance
// This means that all of the functions inside the "SimpleStorage" contract,
// can be used by the AddFiveStorage contract

contract AddFiveStorage is SimpleStorage {

// NOTE: How to override a function that was inherited from another contract.

// In this example, the contract AddFiveStorage has inherited the function,
// called "store" from the contract SimpleStorage.

// However I don't just want to inherit this contract. 
// I want it to behave differently when it is used by AddFiveStorage
// However,
// I want the original code of the "store" function in the SimpleStorage,
// to be left untouched.

// NOTE: Step 1: Copy the function but add the keyword "override"

    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5; 
    }

// NOTE: Step 2: Go to the location of the function in the original contract,
// Add the keyword "virtual" to that contract to make it overridable

// E.g. 

    // function store(uint256 _favoriteNumber) public virtual {
    //     myFavoriteNumber = _favoriteNumber;
    // }


}
