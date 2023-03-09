const HDWalletProvider = require('truffle-hdwallet-provider');
// take the mnemonic and alchemy key from .env file
require('dotenv').config();
const alchemyKey = process.env.ALCHEMY_KEY;
const mnemonic = process.env.MNEMONIC;

module.exports = {
  networks: { 
    mumbai: {
      provider: () => new HDWalletProvider(mnemonic, `https://polygon-mumbai.g.alchemy.com/v2/${alchemyKey}`),
      network_id: 80001,
      confirmations: 2,
      timeoutBlocks: 2000,
      skipDryRun: true
    }
  },
  compilers: {
    solc: {
      version: "0.8.9",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        },
      },
    },
  },
};
