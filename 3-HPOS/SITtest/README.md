
Dimension default consensus (consensus_type = 0) is that 2/3+1 node confirmation is required for the block to enter the 99% irreversible state, which does not reach the final irreversible state.
This is due to the strong validation mechanism adopted by dimension, so that the confirmed block also needs to be 99% confirmed to reach the final irreversible state, so a block ultimately needs two rounds of confirmation to reach the final irreversible state.
For example in the case of 21 nodes, a node at last out of the block height is 1000, then in 12 * * 2/3 (21) - 11 = 157 pieces, which is this piece of 99% during the height of 1157 irreversible, again after 12 * * 2/3 (21) = 168 block, namely in 1325 height, height is 1000 blocks to achieve irreversible state, so the difference between the chain head_block_num and last_irreversible_block_num value is between 325 and 336 piece,
This means that it takes at least 162.5 seconds for a block to reach the final irreversible state.
The consensus engine provides consensus switching, the governance node creates a proposal to propose consensus switching, and the proposal can be switched after passing.

```shell
Consensus_type = 0 2/3+1 12*(21*2/3)+12*(21*2/3)-11=325 blocks 162.5 seconds
Consensus_type = 1 1/2+1 12*(21*2/3)+12*(21*1/2)-11=283 blocks 141.5 seconds
Consensus_type =2 1/3+1 12*(21*2/3)+12*(21*1/3)-11=241 blocks 120.5 seconds
```
