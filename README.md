# Project Title
Assessment 4 of ETH-AVAX COURSE

## Description
In this assessment, we have to first create a NFT token and deploy it to fuji test net and interact with that nft. We have created a token DGN.

## Getting Started
### Executing
      * First fork this repo.
      * Then clone the forked repo.
      * Run npm i
      * Add fuji testnet to metamask
      * Get Fuji faucet.
      * Create .env file
      * Create your Snow trace api and generate your private key from metamask  and paste them in .env file.
      * run command ``` npx hardhat run --network fuji .\scripts\deploy.js ```
      * Now your contract is deployed.
      * Verify it using command npx hardhat verify tokenAddress --network fuji
      * View transactions on etherscan.io

## Help
#### Adding fuji network
      * name: fuji
      * rpc url: https://api.avax-test.network/ext/bc/C/rpc
      * Chain id: 43113
      * Currency : AVAX
      
##### Faucet Link : https://faucet.avax.network/

#### My contract Address :0xF5062780D71ab6De9c29e19234C1c94Aac54BD26

### Commands
    * npm i
    * npx hardhat run --network fuji .\scripts\deploy.js
    * npx hardhat verify tokenAddress --network fuji


## Authors
Alok Raturi

## License
This project is licensed under the MIT License.
