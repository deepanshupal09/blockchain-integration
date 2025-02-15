// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title TaskManager
 * @dev This contract allows users to store and verify tasks using their hash values.
 */
contract TaskManager {
    // Mapping of task hash to completion status.
    mapping(bytes32 => bool) public taskCompleted;

    // Events to log when a task is added and when it is verified.
    event TaskAdded(bytes32 indexed taskHash);
    event TaskVerified(bytes32 indexed taskHash);

    /**
     * @notice Add a new task by storing its hash.
     * @param _taskHash The hash of the task details (generated off-chain).
     */
    function addTask(bytes32 _taskHash) public {
        // Check that the task hasn't been added before.
        require(taskCompleted[_taskHash] == false, "Task already added");
        
        // Initialize the task as not completed.
        taskCompleted[_taskHash] = false;
        
        // Emit an event to record that the task has been added.
        emit TaskAdded(_taskHash);
    }

    /**
     * @notice Verify or mark a task as complete.
     * @param _taskHash The hash of the task that is being verified.
     */
    function verifyTask(bytes32 _taskHash) public {
        // Ensure the task hasn't already been verified.
        require(taskCompleted[_taskHash] == false, "Task already verified");
        
        // Mark the task as complete.
        taskCompleted[_taskHash] = true;
        
        // Emit an event to log that the task has been verified.
        emit TaskVerified(_taskHash);
    }

    /**
     * @notice Check if a task is complete.
     * @param _taskHash The hash of the task.
     * @return A boolean indicating if the task is complete.
     */
    function isTaskComplete(bytes32 _taskHash) public view returns (bool) {
        return taskCompleted[_taskHash];
    }
}
