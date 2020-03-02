# Dynamic Node  

In the existing blockchain platforms, if there's a new node joining, the old node has to wait and re-modify after the downtime, then the network will take effect after the network reboot. This process is unacceptable for most business scenarios; thus, how to ensure high availability, scalability, and performance is the greatest challenge to commercial blockchain networks.

The quantity adjustment of nodes in Dimension network is implemented by the Dynamic Node mechanism. The Dynamic Node is a validating mechanism based on structuring on-chain authorized delegation and mutual validating vote system among consensus nodes.

The quantity adjustment proposal requires two-thirds votes from existing nodes. The Dimension network will then maintain the entire accounting task after the new adjustment. This dynamic adjustment not only improves the flexibility of the blockchain system, but it also ensures smoother operation of the network, which also reduces costs and avoids potential risks.

## Mechanism Overview

When the entire blockchain network continues to run, multiple business parties want to participate in the production of nodes at different times. In order to satisfy the appeal in this application scenario, one of the characteristics of dynamic nodes is to allow the number of outgoing nodes on the blockchain network to change dynamically, which is no longer limited by the number set at the initial start of the main-net, but allows the blockchain network to flexibly adjust according to different business requirements.

We introduce a node registration proposal mechanism, which is applied by the node to be joined or the node governance committee to publicly vote on the proposal via the verification node. The verification node may vote for “yes”, “no”, “strongly negative” or “abstain” in the specific time period. At least half of the voters must vote for “yes” and the proposal can be passed. If one-quarter of the verification nodes vote “strongly against” or one-third of the verification nodes vote “no”, the proposal will be rejected. It also provides extensions to the approval process, supporting the corresponding contract call interface and command line interface.

In the Dimension network, users need to stake EON to obtain the corresponding voting rights of the proposal. And when stake EON exchanges the number of votes, Dimension evades the one-to-one mapping method, but considers the fairness of network governance and avoids the absolute concentration of voting rights, and sets the number of votes to be gradually increased. That is, the sum of the weights of the EON exchanged by the plurality of accounts f(a) + f(b), which is less than the weight of the votes f(a+b) obtained by re-submitting the plurality of accounts EON into a single account. The conversion function is f(x), and the above characteristics can be expressed as f(a) + f(b) < f(a+b). The conversion function is also non-contiguous, that is, the number of votes of two accounts with similar stakes can be the same.

## System roles

Accounts in Dimension are classified into different categories according to the number of EON stakes, and different roles have different rights and obligations.

![Alt text](https://github.com/dimensionofficial/C.H.A.O.S./blob/master/Pic/DynamicNode-system%20roles.png)

## General Account

All the newly created accounts on the blockchain are general accounts. General accounts can be staked a certain amount of EON in exchange for corresponding voting rights and become governance accounts. Then they can vote on the proposal and make joint decisions on the entry and exit of dynamic nodes. When the governance account redeems EON, it is converted into an general account, and no longer has the corresponding network governance authority. The general account is the base account in Dimension network, and most accounts are part of the general account.

## Governance Account

The governance account is a premium account and has the authority to initiate a proposal. The content of the proposal is not limited to the entry and exit of dynamic nodes, but also includes the initiation and voting of relevant governance proposals to participate in or apply for Dimension network. In order to ensure the stable operation of the Dimension network, it is not recommended to frequently initiate proposal applications, such as adjusting the producer nodes. In principle, the network will periodically open the proposal application window to facilitate the overall orderly management of the network. At the same time, in order to ensure the fairness, the network will set a threshold, only when a common account that stakes a certain number of EONs can apply for a governance account. The governance account can apply for a proposal to become a producer node, or simply exercise the corresponding governance rights by submitting a proposal or voting. Dimension will provide occasional incentives for governance accounts that actively participate in network governance without violations.
