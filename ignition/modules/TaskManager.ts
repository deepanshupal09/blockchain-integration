// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const TaskManagerModule = buildModule("TaskManagerModule", (m) => {
  // Deploy the TaskManager contract with no constructor parameters.
  const taskManager = m.contract("TaskManager", []);

  return { taskManager };
});

export default TaskManagerModule;
