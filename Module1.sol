// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Movie {
    uint256 public viewersNumber;

    function setMovieNumber(uint256 _number) external {
        require(_number != 0, "Viewers number cannot be empty");

        if (_number > 1000) {
            revert("Viewers number is too many");
        }

        assert(viewersNumber + _number > viewersNumber);

        viewersNumber = _number;
    }
}
