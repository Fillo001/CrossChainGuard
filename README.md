# CrossChainGuard

**Short Description:** Automated stop-loss and fund protection across chains

---

## Project Overview

CrossChainGuard is a decentralized application (dApp) built on **Reactive Network**.  
It automatically monitors user deposits in the Origin contract and triggers safe actions in the Destination contract using **Reactive Smart Contracts (RSCs)**.  

**Problem solved:** In DeFi, users risk losing funds if stop-loss or automated actions fail.  
**Solution:** RSCs automatically react to blockchain events, ensuring funds are protected **without manual intervention**.  

---

## Contracts

1. **Origin.sol**  
   - Handles user deposits and stop-loss setup  
   - Emits events when deposits are made  

2. **Reactive.sol**  
   - Listens to Origin events  
   - Triggers actions in Destination contract automatically  

3. **Destination.sol**  
   - Executes the triggered actions (returns ETH, swaps tokens, or moves funds)  

---

## Deployment Instructions

### Testnet (Recommended First)
1. Connect MetaMask to **Reactive Testnet** ([https://dev.reactive.network/reactive-mainnet](https://dev.reactive.network/reactive-mainnet))  
2. Deploy **Destination.sol** → Copy address  
3. Deploy **Origin.sol** → Copy address  
4. Deploy **Reactive.sol** with constructor:
   - `_origin` = Origin contract address  
   - `_destination` = Destination contract address  
5. Test workflow:
   - Call `deposit` in Origin  
   - Trigger `react` in Reactive  
   - Confirm Destination executes actions  

### Mainnet (For Submission)
- Repeat same steps on **Reactive Mainnet**  
- Replace testnet addresses with mainnet addresses  
- Record all **contract addresses** and **transaction hashes**  

---

## Contract Addresses

| Contract      | Address          |
|---------------|----------------|
| Origin        | 0x...           |
| Reactive      | 0x...           |
| Destination   | 0x...           |

---

## Transaction Hashes

| Action                       | Transaction Hash |
|-------------------------------|----------------|
| Origin Deposit 1              | 0x...           |
| Origin Deposit 2              | 0x...           |
| Reactive Trigger 1            | 0x...           |
| Reactive Trigger 2            | 0x...           |
| Destination Execution 1       | 0x...           |
| Destination Execution 2       | 0x...           |

---

## Workflow

1. User deposits funds into **Origin contract**  
2. Origin emits `NewDeposit` event  
3. **Reactive contract** detects event automatically  
4. Reactive contract checks conditions (stop-loss or thresholds)  
5. If triggered, Reactive calls **Destination contract**  
6. Destination executes action (returns ETH, swaps, or moves funds)  
7. Events confirm execution  

---

## Demo Video

- Link to ≤5 minute video demonstrating full workflow on mainnet  

---

## How Reactive Smart Contracts Help

- Traditional smart contracts cannot automatically react to on-chain events  
- RSCs make cross-chain automation **possible and efficient**  
- Reduces manual intervention, risk, and improves security  

---

## How to Contribute

1. Fork the repository  
2. Clone to local machine  
3. Make your changes  
4. Submit a pull request  

---

## License

This project is licensed under the **MIT License** – see [LICENSE](LICENSE) for details.

---
