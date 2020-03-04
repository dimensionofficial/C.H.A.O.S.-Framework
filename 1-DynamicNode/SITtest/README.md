#Dynamic node logic test script description


## Environmental preparation

- Local nodeos is up and connected to the testnet
- Have executed sudo ./eosio_install.sh or dimension code installed in the root directory

## Operation instructions

```shell
git clone https://github.com/dimensionofficial/dimension-testnet.git
cd dimension-testnet/test
./logic.sh
```

After running, you will be prompted to enter the http-server-address port of the nodeos that is locally connected to the test network. For example, you can enter

```shell
8888
```

You can run the logic test script by entering it correctly. The following figure shows the verification.

![pass.png](https://github.com/dimensionofficial/C.H.A.O.S.-Framework/blob/master/1-DynamicNode/SITtest/image.png)

## Test content

The script mainly tests the following logic:

- Can non-government nodes initiate proposals
- Can non-government nodes update governance node information
- Whether non-government nodes can execute completed proposals
- Whether the governance node can execute outstanding proposals
