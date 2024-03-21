require("@nomicfoundation/hardhat-toolbox");

require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */

console.log(process.env.PRIVATE_KEY)
const URL = process.env.URL
const PRIVATE_KEY = process.env.PRIVATE_KEY

module.exports = {
  solidity: "0.8.0",
  networks: {
    sepolia : {
      url: URL,
      accounts: [PRIVATE_KEY],
    },
  },
};
