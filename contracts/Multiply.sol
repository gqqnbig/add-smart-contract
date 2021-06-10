pragma solidity 0.8.4;

import "./add.sol";


contract Multiply is Base {

    constructor(uint x_) Base(x_) { }


    function run(Add add, uint y) public view returns (uint) {
		return add.run(x) * y;
    }
}
