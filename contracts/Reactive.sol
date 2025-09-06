// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IOrigin {
    function deposits(address _user) external view returns (address user, uint256 amount, uint256 stopLoss);
}

interface IDestination {
    function execute(address _user, uint256 _amount) external;
}

contract Reactive {
    IOrigin public originContract;
    IDestination public destinationContract;

    // Event to log automatic execution
    event ActionTriggered(address indexed user, uint256 amount);

    constructor(address _origin, address _destination) {
        originContract = IOrigin(_origin);
        destinationContract = IDestination(_destination);
    }

    // This function is called by Reactive Network when Origin emits NewDeposit
    function react(address _user) external {
        // Get the user's deposit
        (address user, uint256 amount, uint256 stopLoss) = originContract.deposits(_user);

        // Here we simulate stop-loss condition (for real use, check price feed)
        uint256 currentPrice = getCurrentPrice(); // placeholder function
        if (currentPrice < stopLoss) {
            // Trigger destination contract
            destinationContract.execute(user, amount);

            // Emit log
            emit ActionTriggered(user, amount);
        }
    }

    // Placeholder function for price feed
    function getCurrentPrice() internal pure returns (uint256) {
        return 900; // Example: pretend the price dropped below stop-loss
    }
}
