require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** * @type import('hardhat/config').HardhatUserConfig 
 * Arquivo de configuração YAKAMI TECH para o Desafio TrustCode
 */
module.exports = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC_URL || "https://rpc.sepolia.org",
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
    },
    // Preparação para futura mainnet e L2 (Polygon/Arbitrum) para escalar o DePIN
    polygonMumbai: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};
