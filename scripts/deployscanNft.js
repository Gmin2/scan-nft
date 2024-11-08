
const { ethers } = require("hardhat");
const path = require("path");
async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying MoneyPool contract with the account:", deployer.address);

  const MoneyPool = await ethers.getContractFactory("CustomNFT");
  const moneyPool = await MoneyPool.deploy();
  await moneyPool.waitForDeployment();

  console.log("MoneyPool deployed to:", await moneyPool.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

  // 0x30d0d3566fEA24dEe51eA19dB39cC65505Af5Aa5 customNFT

