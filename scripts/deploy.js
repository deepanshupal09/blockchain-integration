const { ethers } = require("hardhat");

async function main() {
  // Get signers using the properly initialized ethers instance
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const balance = await deployer.getBalance();
  console.log("Account balance:", ethers.utils.formatEther(balance), "ETH");

  const TaskManager = await ethers.getContractFactory("TaskManager");
  const taskManager = await TaskManager.deploy();

  await taskManager.deployed();
  console.log("TaskManager deployed to:", taskManager.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });