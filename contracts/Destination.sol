// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Destination {
    // Event to log executed actions
    event Executed(address indexed user, uint256 amount);

    // Function to execute action triggered by Reactive Contract
    function execute(address _user, uint256 _amount) external {
        // For simplicity, just send back ETH to user
        // In real DeFi, this could swap tokens or move funds to safe pools

        payable(_user).transfer(_amount);

        // Log the action
        emit Executed(_user, _amount);
    }

    // Fallback function to receive ETH
    receive() external payable {}
}
