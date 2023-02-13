// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/base/ERC20Base.sol";

contract aureus is ERC20Base {
      constructor(
        string memory _name,
        string memory _symbol
    )
        ERC20Base(
            _name,
            _symbol
        )
    {}


    function faucet() public {
        _mint(msg.sender,50);
    }
}
