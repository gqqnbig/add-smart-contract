pragma solidity 0.8.4;

import "./add.sol";


contract Multiply {

    uint x;

    event reportRun(uint result);

    /**
    * The contract constructor
    */
    constructor(uint x_) public {
        x = x_;
    }


    function run(Add add, uint y) public view returns (uint) {
		return add.run(x) * y;
    }
}
