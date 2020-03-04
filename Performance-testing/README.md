# Performance-testing 


## 2 test methods

- Dimension built in a Txn plug-in, can initiate bulk transfer transactions, so this pressure test also use this plug-in test, plug-in official description


## test steps

- a.Create Data and configuration files 

```shell
mkdir ~/eon.data
cat << EOF > ~/eon.data/logging.json
```
- b. BOOT NODE STARTS A single-node test network for block and package transactions
- c. Start a single non-block full node and load the plug-in
- d. Create the Wallet, import the Dimension private key, and set the bios contract
- e. The full node begins to generate transactions, such as 20 transactions per 20ms (i. e. 1000TPS) 
- f. Observe the packing performance of the boot node




![pass.png](https://github.com/dimensionofficial/C.H.A.O.S.-Framework/blob/master/Performance-testing/1.png__thumbnail)


- g. Adjust the parameters to increase the number of transactions, such as generating 40 transactions per 20ms (2000TPS) , and observe the packing performance of the boot node
- h. Repeat step g until TPS can no longer be added


## Test results
- 1000 TPS
- Observing the boot node packing performance chart of step F in 2.1, it is found that TPS is stable at 1000 and the average latency is less than 50ms.

- 2000 TPS 
- Doubling the number of transactions such as generating 40 transactions per 20ms (i.e. 2000TPS) :


```shell 
curl --data-binary '["", 20, 40]' http://127.0.0.1:3333/v1/txn_test_gen/start_generation
```
- The boot node packing performance is shown below. It is observed that TPS is still stable at 2000 and average latency is less than 100ms.

![pass.png](https://github.com/dimensionofficial/C.H.A.O.S.-Framework/blob/master/Performance-testing/2.png__thumbnail)


- 3000 TPS
- Continue to increase the number of transactions such as 60 transactions per 20ms (i.e. 3000TPS) :
```shell
curl --data-binary '["", 20, 60]' http://127.0.0.1:3333/v1/txn_test_gen/start_generation
```
- The performance of BOOT node packing is shown in the figure below. It is observed that TPS fluctuates between 800-3700, and latency also fluctuates between 60-400ms with the fluctuation of block trading volume.

![pass.png](https://github.com/dimensionofficial/C.H.A.O.S.-Framework/blob/master/Performance-testing/32.png__thumbnail)

- Final results
-To sum up, in a single-node Cloud Server (8 GB of memory, 4-core Intel r Xeon R Platinum 8269 CY CPU@2.50 GHZ) test environment, the maximum TPS that can be achieved by invoking the simplest permission check transaction (an average CPU cost of 100 per transaction and a net average cost of 20) is 3900, which is consistent with the Eos main network.
In addition, the actual TPS may be lower than 3900, considering the network delay between nodes. However, the performance of the whole network depends on the transaction packaging performance of nodes to a great extent, so tps of the network can be effectively improved when the performance of the node machine (mainly CPU) is improved. Machine performance in test environment is not high, so from this point of view can actually improve machine performance to offset the impact of transmission delay.

