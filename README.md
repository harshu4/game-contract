[4:25 am, 14/02/2023] ~: ## Brief

Game Link :  [Click Here](https://game.galacticwar.live/)

Market Place Link :  [Click Here](https://market.galacticwar.live/)

Github Link :  [Click Here](https://github.com/ssd39/galacticwar-ae)

SmartContract Link :  [Click Here](https://explorer.testnet.aeternity.io/contracts/transactions/ct_RHS3j98rN4RTqrmQkd8s5GF2uFUYGBsSxsyY2KwUQuBu7pFn4)

Calling all gamers and blockchain enthusiasts! Are you ready for a revolutionary gaming experience? Our innovative player vs player battle game is here to change the gaming world with its cutting-edge use of zero-knowledge proof and blockchain technology.

Our game consists of three rounds, where two players battle against each other with hidden moves that are provable through our use of zero-knowledge proof. This adds an extra layer of excitement to the game as players try to outmaneuver each other.

## Why ❓

We developed this game to offer an unparalleled gaming experience that utilizes cutting-edge technology to provide fair play and security. By incorporating zero-knowledge proof and blockchain technology, we have created a game that is truly provable and secure.

Our use of a ThirdWeb marketplace for trading characters and gamepasses ensures a dynamic and engaging gameplay experience, while our development in Unity WebGL with ReadyPlayerThree auth provides unparalleled levels of security and fair play.

Through this game, we aim to revolutionize the world of gaming by creating a platform that is accessible, exciting, and innovative. Join us today and become part of the future of gaming!

## Gameplay 📜

![alt text](https://i.ibb.co/7bSHr0K/oni.png)
*Choose your own strategy*  
Welcome to our revolutionary player vs player battle game where players engage in three rounds of intense combat! The first player to win at least two rounds is crowned the victor.

The game is played in rounds and begins when player one commits to a hash and calls the smart contract. Player two then sends their move in plaintext. Player one reveals their move, which is the pre-image of the previously submitted hash. This process ensures fair play and eliminates any possibility of cheating.

In each round, players have three moves to choose from: wand attack, sword attack, and shield defense. With each move, players strategize and outmaneuver their opponents to come out on top.

But that's not all! Our game also features a ThirdWeb marketplace for trading characters and gamepasses, and utilizes zero-knowledge proof and blockchain technology to ensure provable moves and security. Built in Unity WebGL with ReadyPlayerThree auth for token-gated game access, our game offers a truly cutting-edge gaming experience. Join us today and become part of the future of gaming!

## Architecture ✨

Usually Gamers spend a lot of there time and effort to advance in a game and when online games shut down or there servers are compromised there is a significant amount of value loss here. Some of the rare assets even take years of hardwork to earn. But when this efforts are spent on centralized games there is a high chance that in future you might not be able to retain ownership of your assets. We aim to solve this by creating a game in which all assets are stored as NFT so that owner can retain full ownership of there assets. We have devised our architecture to resolve this shortfalls of traditional games.

*Assets - Contract Kit*  :  We have three types of assets ERC-1155, ERC-721 and ERC20 all of which are made using the contract kit of thirdweb, as there are already custom modules available for lazy minting and airdropping. We have used the marketplace contract in our marketplace to trade gamepass.

*Ingame Logic*  :  Our ingame logic is a custom contract which handles all the logic of game from managing the state of ongoing games to preserving the records and awarding winner the reward,

*Third Web - Gaming Kit*  :  Inorder to interact with smart contracts from browser based wallets in our unity game we used gaming kit as it removes all the hassles of maintaining various callbacks and states. all our contract interaction utilizes the gaming kit

*Third Web- Auth*  : In order to token-gate our game to only our gamepass holders we have utilized the auth functionality provided by the third-web

*Third Web- Storage* :- Our game has several large videos which are needed to be played during the gameplay we have stored this videos in the third web storage.

## Attractions ☘️


-   Zero-knowledge proof and blockchain technology to ensure provable moves and security
-   Three rounds of intense combat where the first player to win two rounds is crowned the victor
-   Use of a ThirdWeb marketplace for trading characters and gamepasses
-   Three moves to choose from: wand attack, sword attack, and shield defense
-   Fair play ensured by committing to a hash, sending moves in plaintext, and revealing the pre-image of the hash
-   Developed in Unity WebGL with ReadyPlayerThree auth for token-gated game access
-   A dynamic and engaging gaming experience that is accessible, exciting, and innovative
-   A revolutionary platform that is part of the future of gaming


## Challenges we ran into 😏

-   *Creating Video*  : Video rendering and developing requires a lot of minute details to be taken care of , it took us a lot of time to create the videos
-   *Designing architecture*  :  It took us some time to think how we can truly leverage the power of decentralization inorder for this game, and making the game scalable for multiple avatars
    

## Future Updates ✔️

We truly feel that NFT , Gaming and Streaming are interconnected. We want to take this project to it's full potential. Future updates that we have planned are :

- Adding support for gaseless relayers so players don't have to worry about gas fees when they are playing game
- Adding more characters so players can also trade their characters in the marketplace 
-   More moves to choose from: players could have additional moves that could add more depth and complexity to the game
-   Different game modes: we could introduce different game modes that would provide new and exciting challenges for players
-   Tournaments: we could organize regular tournaments that would allow players to compete against each other for prizes and recognition
-   Team battles: we could introduce team battles where groups of players can team up to battle against other groups
-   Social features: we could add social features such as chat, friend lists, and leaderboards to make the game more social and engaging
-   Enhanced graphics and sound: we could improve the graphics and sound of the game to create a more immersive and engaging experience
-   Mobile compatibility: we could make the game compatible with mobile devices to reach a wider audience and make it more accessible
