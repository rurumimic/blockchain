# Faucet

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/faucet.js --network localhost
```

## Console

```bash
npx hardhat console --network localhost
```

```js
const hre = require("hardhat")
const [sender] = await hre.ethers.getSigners()

const addr = "0xHEX..."
const Contract = await hre.ethers.getContractAt("Faucet", addr)

let response

response = await sender.sendTransaction({
    to: addr,
    value: hre.ethers.parseEther("1.0"),
})
await response.wait()

response = await Contract.withdraw(hre.ethers.parseEther("0.05"))
await response.wait()

let balance = await hre.ethers.provider.getBalance(Contract)
```

