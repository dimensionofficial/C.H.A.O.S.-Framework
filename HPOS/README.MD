# HPoS 

- While analyzing the existing mainstream consensus, one single consensus may be convenient and easy to implement, but there are still many disadvantages in the efficiency and security of block generation. Therefore, a new type of consensus mechanism, Hybrid Proof of Stake (HPoS), is proposed.


- At the same time, the nodes use the Byzantine BFT algorithm BFT reach a mutual consensus. Any malicious node will be disqualified and given a specific deduction in contribution plus an economic penalty.
  - The consensus node will then pack the result and the certificate into the block, and other nodes only have to verify the certificate to determine the legitimacy of the block, which can efficiently reduce the time of the block verification and improve the performance. 

- HPoS will be implemented in two phases, HPoS-P and HPoS-R.

  - In the first phase, HPoS-P, a PBTF-based consensus mechanism that uses permissioned voting system and majority rules of delegation will be implemented. It also supports Byzantine Fault Tolerance and supervisory nodes participation; this means better access control, higher performance, and lower energy consumption. HPoS-P can effectively support Dimension to provide a vigorous and stable blockchain network service.

  - Therefore, in the second phase, the upgraded hybrid consensus design, HPoS-R, will be implemented based on Robust Byzantine Fault Tolerance (RBFT), which further improves the robustness and simplicity of the system. 

- It will shift the focus of structuring an optimal mounting system that maximizes performance to building a system, which uses RBFT to provide adequate and predictable performance (10K+TPS) and support a wide range of scenarios for enterprise services. 

