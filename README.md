# VoteBlock A Decentralized Voting Application

This is a demo application to implement voting in solidity smart contract using ReactJS. 


## Installation

After you cloned the repository, you want to install the packages using

```shell
npm install
```

After that create a .env file like shown in the .env.example file. To get a URL and private key of a volta network you can visit to this website [here](https://energy-web-foundation-origin.readthedocs-hosted.com/en/latest/volta-deployment/) and for the contract address you can follow the below process. 

You first need to compile the contract and upload it to the blockchain network. Run the following commands to compile and upload the contract.

```shell
npx hardhat compile
npx hardhat run --network volta scripts/deploy.js
```

Once the contract is uploaded to the blockchain, copy the contract address and paste it in the .env file and src/Constant/constant.js file. You can also use another blockchain by writing the blockchain's endpoint in hardhat-config.

Once you have pasted your private key and contract address in the .env file, simply run command

```shell
npm start
```
