// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;




import "@thirdweb-dev/contracts/base/ERC1155LazyMint.sol";

interface ERC20 {
    function totalSupply() external view returns (uint supply);
    function balanceOf(address _owner) external view returns (uint balance);
    function transfer(address _to, uint _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint _value) external returns (bool success);
    function approve(address _spender, uint _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint remaining);
    function decimals() external view returns(uint digits);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}


contract Nft1155 is ERC1155LazyMint {
    ERC20 token;
    constructor(
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps,
        address erc20addr
    ) ERC1155LazyMint(_name, _symbol, _royaltyRecipient, _royaltyBps) {
    token = ERC20(erc20addr);
    }

    function verifyClaim(address _claimer, uint256 _tokenId, uint256 _quantity) public  view virtual override {
     // require(balanceOf((claimer));==1,"can only mint one");
        require(token.balanceOf(_claimer)>30,"no tokens");
    }
}