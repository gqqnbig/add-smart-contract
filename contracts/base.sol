pragma solidity 0.8.4;


abstract contract Base {

    uint x;

    constructor(uint x_) {
        x = x_;
    }

    function run(uint y) public virtual view returns (uint) {}
}
