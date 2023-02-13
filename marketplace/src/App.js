import React, { useState, useEffect } from 'react';
import './App.css';
import { toast,ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { ConnectWallet, useAddress,ThirdwebProvider,ChainId,useContract,useMintNFT } from "@thirdweb-dev/react";

const App = () => {
  const [nfts, setNfts] = useState([]);
  const address = useAddress();
  const [isConnected, setIsConnected] = useState(false);
  const { contract } = useContract("0xE051D132b4Aeae3Bb3E3BEaC20f8e4989c41Bf4c");
  const {
    mutate: mintNft,
    isLoading,
    error,
  } = useMintNFT(contract);
  const metadata = {
    name: "Cool NFT",
    description: "This is a cool NFT",
    image: "https://www.carlogos.org/logo/Jaguar-logo-2012-640x287.jpg" // This can be an image url or file
  }
  
  const metadataWithSupply = {
    metadata,
    supply: 1000, // The number of this NFT you want to mint
  }
  // Dummy data for the nfts
  const dummyNfts = [
    {
      id: 1,
      name: "NFT 1",
      image: "https://picsum.photos/id/237/200/300",
      description: "This is the description for NFT 1"
    },
    {
      id: 2,
      name: "NFT 2",
      image: "https://picsum.photos/id/238/200/300",
      description: "This is the description for NFT 2"
    },
    {
      id: 3,
      name: "NFT 3",
      image: "https://picsum.photos/id/239/200/300",
      description: "This is the description for NFT 3"
    }
  ];

  useEffect(() => {
    // Set the dummy data to the nfts state
    setNfts(dummyNfts);
  }, []);

  const handleBuyClick = () => {
    if (address) {
      console.log(contract)
      console.log(mintNft)
      mintNft({...metadataWithSupply,to:address});
    } else {
      toast.error('Please connect your wallet to buy NFTs');
    }
  };
  return (
    <div>
       <header>
        <div className="logo">
          <img src="/solana-logo.svg" alt="Solana" />
          <h1>Solana NFT Marketplace</h1>
        </div>
        <div>
      <ConnectWallet />
    </div>
      </header>
      <div className="card-grid">
        {nfts.map((nft) => (
          <div className="card" key={nft.id}>
            <div className="card-image">
              <img src={nft.image} alt={nft.name} />
            </div>
            <div className="card-info">
              <h3>{nft.name}</h3>
              <p>{nft.description}</p>
            </div>
            <div className="card-actions">
              <button className="buy-button" onClick={handleBuyClick}>Buy</button>
            </div>
          </div>
        ))}
        
      </div>
      
      <ToastContainer />
     
    </div>
    
    
  );
};

export default App;
