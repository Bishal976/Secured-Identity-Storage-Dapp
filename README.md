# Secured Identity Storage Dapp

This application is a completely Decentralized secured storage solution for Identity informations, which uses a local blockchain on hardhat to keep track of users data, which is stord on IPFS in a decentralized fashion and also enables the user to share data among other users in the network, It also enables users to maintain access roles for their data (who can access and who can't). 

&nbsp;

### *  Prerequisites

#### 1. Install Metamask chrome extension (if not already): [Installation Link](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en)

#### 2. Log in to Metamask by creating an account.

&nbsp;

### *  Run these scripts in the seperate terminal (Make sure to Rerun, everytime the project restarts):

### 1. `npx hardhat node`

    Starts the hardhat node at http://127.0.0.1:8545
    This returns a set of accounts along with their private keys, "In this project we will be using these demo accounts to share access of our data across"

### 2. Import some accounts to metamask wallet (chrome extension): [Check how to import](https://support.metamask.io/hc/en-us/articles/360015489331-How-to-import-an-account)
    Minimum 2 account should be imported to metamask

### 3. `npx hardhat run --network localhost script/deploy.js `

    Compiles and Deploys the smart contract on the hardhat blockchain

&nbsp;

### * Congratulations, the backend should be running successfully, now the UI needs to be started: [Checkout how to start the UI here](https://github.com/Bishal976/Secured-Identity-Storage-Dapp-UI)

