// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;
import "@openzeppelin/contracts/utils/Strings.sol";


import "@openzeppelin/contracts/utils/introspection/IERC165.sol";

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

interface IERC1155 is IERC165 {
    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);

    event TransferBatch(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256[] ids,
        uint256[] values
    );
    event ApprovalForAll(address indexed account, address indexed operator, bool approved);
    event URI(string value, uint256 indexed id);
function balanceOf(address account, uint256 id) external view returns (uint256);

    function balanceOfBatch(
        address[] calldata accounts,
        uint256[] calldata ids
    ) external view returns (uint256[] memory);
    function setApprovalForAll(address operator, bool approved) external;

    function isApprovedForAll(address account, address operator) external view returns (bool);

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes calldata data) external;

    
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external;
}



contract aureus {


ERC20 token;
IERC1155 nft;
 struct Game {
    uint gameid;
    mapping(uint => bytes32) player1movehide;
    mapping(uint => uint) player2move;
    mapping(uint => uint) player1move;
    address player1;
    address player2;
    uint currentmove ;
    bool player1turn;
    bool gamestarted;
    bool gameeneded;
    uint gamewinner;
 }

struct Game2 {
    uint gameid;
    address player1;
    address player2;
    uint currentmove ;
    bool player1turn;
    bool gamestarted;
    bool gameeneded;
    uint gamewinner;
 }
mapping (uint => Game) games;
uint gamecount;

constructor(address tokenaddr,address nftaddr){
    nft = IERC1155(nftaddr);
    token = ERC20(tokenaddr);
}


function start() public{
     Game storage newGame = games[gamecount];
     require(token.balanceOf(msg.sender) > 10,"balance low");
     require(token.allowance(msg.sender,address(this))> 10,"add more allowance");
    
     token.transferFrom(msg.sender,address(this),10);
     newGame.gameid  = gamecount;
     newGame.currentmove = 0;
     newGame.gameeneded = false;
     newGame.gamestarted = false;
     newGame.player1 = msg.sender;
    newGame.player2 = address(0);
    gamecount = gamecount+1;


}

function join(uint gameid) public {
         require(token.balanceOf(msg.sender) > 10,"balance low");
     require(token.allowance(msg.sender,address(this))> 10,"add more allowance");
    
     token.transferFrom(msg.sender,address(this),10);

    Game storage game = games[gameid];
     require(game.gameeneded == false,"add more allowance");
    
    game.player2 = msg.sender;
    game.gamestarted = true;
    game.player1turn = true;


}

function playmove1(uint gameid,bytes32 move) public{
    Game storage game = games[gameid];
    require(game.player1turn == true);
     require(game.gameeneded == false,"add more allowance");
    
    require(game.player1movehide[game.currentmove] == 0);
    require(game.currentmove<3);
       require(msg.sender == game.player1);
    game.player1movehide[game.currentmove] = move;
    game.player1turn = false;
}

function reversemove(uint gameid,uint move) public{
    Game storage game = games[gameid];
    require(game.player1turn == false);
     require(game.gameeneded == false,"add more allowance");
    
    require(game.player1movehide[game.currentmove]!= 0);
    require(msg.sender == game.player2);
    require(game.currentmove<3);
    
    game.player2move[game.currentmove] = move;
    game.player1turn = true;




}

function revealmove(uint gameid,string memory move) public{
    Game storage game = games[gameid];
    require(game.player1turn == true);
     require(game.gameeneded == false,"add more allowance");
    
    require(game.player1movehide[game.currentmove]!= 0);    
    require(game.player2move[game.currentmove] != 0);
       require(msg.sender == game.player1);
   require(sha256(abi.encodePacked(move)) == game.player1movehide[game.currentmove]);
   require(game.currentmove<3);
    
    game.player1move[game.currentmove] = st2num(move);
    game.player1turn = true;
    game.currentmove = game.currentmove+1;
    if(game.currentmove == 3){
        finalize(gameid);
    }
}
// 1=wand 2-talwar 3-defense

function finalize(uint gameid) public {
    Game storage game = games[gameid];
    require(game.currentmove == 3,"the move is not 3");
     require(game.gameeneded == false,"add more allowance");
    
    uint player1point;
    uint player2point;
    
    for(uint i=0; i<3; i++){
        if(game.player1move[i] == game.player2move[i]){

        }
        else if(game.player1move[i]>game.player2move[i]){
            if(((game.player1move[i]) == 3)&&(game.player2move[i] == 1)){
                player2point = player2point+1;
            }

            else{
                player1point = player1point+1;
            }
        }

        else{
             if(((game.player2move[i]) == 3)&&(game.player1move[i] == 1)){
                player1point = player1point+1;
            }

            else{
                player2point = player2point+1;
            }

        }


     }

     if(player1point > player2point){
        token.transfer(payable(game.player1),18);

     }
     else if(player2point > player1point){
        token.transfer(payable(game.player2),18);

     }
    else{
        token.transfer(payable(game.player1),9);
        token.transfer(payable(game.player2),9);
        
    }
    game.gameeneded = true;





}
function st2num(string memory numString) public pure returns(uint) {
        uint  val=0;
        bytes   memory stringBytes = bytes(numString);
        for (uint  i =  0; i<stringBytes.length; i++) {
            uint exp = stringBytes.length - i;
            bytes1 ival = stringBytes[i];
            uint8 uval = uint8(ival);
           uint jval = uval - uint(0x30);
   
           val +=  (uint(jval) * (10**(exp-1))); 
        }
      return val;
    }

function game(uint gameid) public  returns(Game2 memory){
      Game2 memory newGame;
      newGame.gameid = games[gameid].gameid;
      newGame.player1 = games[gameid].player1;
      newGame.player2 = games[gameid].player2;
      return newGame;
}   

function tosha(string memory move) public view returns(bytes32){
    return sha256(abi.encodePacked(move));
}


}