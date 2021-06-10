pragma solidity 0.8.4;


contract Add {

    uint x;

    event reportRun(uint result);

    /**
    * The contract constructor
    */
    constructor(uint x_) {
        x = x_;
    }

    function run(uint y) public view returns (uint) {
        return x + y;
    }
}
