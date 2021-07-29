# Demonstration of language features of Solidity

Clone this repo. Run [Ganache](https://www.trufflesuite.com/ganache) and add this repo to a workspace.

![](https://user-images.githubusercontent.com/614159/127429738-296640b4-c9e9-4406-adf5-45a2f7096953.png)

If on Windows, open Powershell and test the following commands.

```bash
# Build json files from solidity smart contract files.
> truffle build
> truffle console --network development
# instantiate an instance of contract Add
# you can run this multiple times.
# Check on ganache that a new block will be created which shows the same contract address.
truffle(development)> exec deployAdd.js 
Using network 'development'.

Contract is deployed at 0xbF50eD21C37cC765777405Af91BBC0D3250C0E31
# instantiate an instance of contract Multiply
truffle(development)> exec deployMultiply.js
Using network 'development'.

Contract is deployed at 0x4B245410aa5FAaE4155D7098A8203A6AEf205076
# The at() method is provided from truffle console.
# Because deployAdd.js instantiates Add with parameter 4, here we name the instance add4.
truffle(development)> let add4= await Add.at('0xbF50eD21C37cC765777405Af91BBC0D3250C0E31')
undefined
truffle(development)> let multiply5 = await Multiply.at('0x4B245410aa5FAaE4155D7098A8203A6AEf205076')
undefined
# Test add4. 4 plus 10 is 14. 4 plus 6 is 10.
truffle(development)> add4.run(10)
BN { negative: 0, words: [ 14, <1 empty item> ], length: 1, red: null }
truffle(development)> add4.run(6)
BN { negative: 0, words: [ 10, <1 empty item> ], length: 1, red: null }
# Test multiply5. (5+4)*6 is 54.
truffle(development)> multiply5.run(add4.address, 6)
BN { negative: 0, words: [ 54, <1 empty item> ], length: 1, red: null }
```

The two contracts inherit from contract `Base`, which proves Solidity supports inheritance. `Base` is an `abstract` contract and has virtual methods.

Constract instances can be passed around, as Multiply.run() shows, although we actually pass in the address of the contract instance. 

Each contract can be instancitated multiple times and each instance is stored in a block. Solidity has an operation `selfdestruct` which might be seen as deconstructor. However, `selfdestruct` only removes the storage and the balance of the contract instance, it does not alter a history block. If someone sends Ether to removed contracts, the Ether is forever lost.

Solidity does not support generic. (https://github.com/ethereum/solidity/issues/869)
