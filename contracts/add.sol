pragma solidity 0.8.4;

import "./base.sol";


contract Add is Base{


    constructor(uint x_) Base(x_) { }

    function run(uint y) public view override returns (uint) {
        return x + y;
    }
}
