import React, { useState, useEffect } from 'react';
import './App.css';
import { toast,ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { ConnectWallet, useAddress,ThirdwebProvider,ChainId,useContract,useMintNFT,useListings ,useBuyNow, useCreateDirectListing} from "@thirdweb-dev/react";
import {NATIVE_TOKEN_ADDRESS} from "@thirdweb-dev/sdk"
import { ethers } from 'ethers';
const App = () => {
  const [nfts, setNfts] = useState([]);
  const address = useAddress();
  const [isConnected, setIsConnected] = useState(false);
  const { contract } = useContract("0xADb1edc91933891Cd0E558A3e96777b6cF37D163");
   const { data: listings, isLoading, error } = useListings(contract, { start: 0, count: 100 });
    const [showLoader, setShowLoader] = useState(true);
  /* const {
    mutate: createlisting,
    load,
    err,
  } = useCreateDirectListing(contract);*/
   const {
    mutate: buyNow,
    Loading,
    errors,
  } = useBuyNow(contract);


//createDirectListing(directListingData)
 
  /*const metadata = {
    name: "Cool NFT",
    description: "This is a cool NFT",
    image: "https://www.carlogos.org/logo/Jaguar-logo-2012-640x287.jpg" // This can be an image url or file
  }
  
  const metadataWithSupply = {
    metadata,
    supply: 1000, // The number of this NFT you want to mint
  } */

  const listing = {
  // address of the contract the asset you want to list is on
  assetContractAddress: "0xe051d132b4aeae3bb3e3beac20f8e4989c41bf4c",
  // token ID of the asset you want to list
  tokenId: "1",
  // when should the listing open up for offers
  startTimestamp: new Date(),
  // how long the listing will be open for
  listingDurationInSeconds: 8640000,
  // how many of the asset you want to list
  quantity: 20,
  // address of the currency contract that will be used to pay for the listing
  currencyContractAddress: NATIVE_TOKEN_ADDRESS,
  // how much the asset will be sold for
  buyoutPricePerToken: "0.01",
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
    if(listings){
    console.log(listings);
    setNfts(listings);
    setShowLoader(false);
    }
    
    // Set the dummy data to the nfts state
  }, [listings]);

  const handleBuyClick = async (nft) => {
    if (address) {
 /*     const tx = await contract.direct.createListing(listing);
const receipt = tx.receipt; // the transaction receipt
const id = tx.id; // the id of the newly created listing*/
setShowLoader(true);
    await contract.buyoutListing(nft.id, 1);
    setShowLoader(false);
    toast.success("NFT bought successfully")
      
    } else {
      toast.error('Please connect your wallet to buy NFTs');
    }
  };
  return (
    <div>
       <header>
        {showLoader && (
        <div className="loader">
          <div className="spinner"></div>
        </div>
      )}
        <div className="logo">
        
          <h1>NFT Marketplace</h1>
        </div>
        <div>
      <ConnectWallet />
    </div>
      </header>
      <div className="card-grid">
        {nfts.map((nft) => (
          <div className="card" key={nft.id}>
            <div className="card-image">
              <img src={nft.asset.image} alt={nft.name} />
            </div>
            <div className="card-info">
              <h3>{nft.asset.name}</h3>
              <p>{nft.asset.description}</p>
              <p> Quantity : {nft.quantity.toString()}</p>
              <h3>{ethers.utils.formatEther(nft.buyoutPrice)} Matic</h3>     

            </div>
            <div className="card-actions">
              <button className="buy-button" onClick={() => handleBuyClick(nft)}>Buy</button>
            </div>
          </div>
        ))}
        
      </div>
      
      <ToastContainer />
     
    </div>
    
    
  );
};

export default App;
