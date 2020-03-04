# ConsensusX description of test


## Environmental preparation

- Local nodeos is up and connected to the testnet
- Have executed sudo ./eonio_install.sh or dimension code installed in the root directory

## Operation instructions

```shell
cleon get block 10
```

After running, you'll see the block information that contains the consensus number,like this


![pass.png](https://github.com/dimensionofficial/C.H.A.O.S.-Framework/blob/master/1-DynamicNode/SITtest/image.png)


- Switch consensus by initiating a proposal
- Then wait for the vote,if passed you will see the following changes in the consensus number by runing
```shell 
cleon get schedule
```

![pass.png](https://github.com/dimensionofficial/C.H.A.O.S.-Framework/blob/master/1-DynamicNode/SITtest/image.png)

## Test content

The script mainly tests the following logic:

- Whether the consensus is switchable
- Consensus type
- Number of consensus
