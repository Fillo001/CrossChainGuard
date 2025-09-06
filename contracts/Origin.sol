// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Origin {
    struct Deposit {
        address user;
        uint256 amount;
        uint256 stopLoss;
    }

    mapping(address => Deposit) public deposits;

    event NewDeposit(address indexed user, uint256 amount, uint256 stopLoss);

    function deposit(uint256 _stopLoss) external payable {
        require(msg.value > 0, "You must send some ETH");

        deposits[msg.sender] = Deposit({
            user: msg.sender,
            amount: msg.value,
            stopLoss: _stopLoss
        });

        emit NewDeposit(msg.sender, msg.value, _stopLoss);
    }

    function getDeposit(address _user) external view returns (Deposit memory) {
        return deposits[_user];
    }
}
