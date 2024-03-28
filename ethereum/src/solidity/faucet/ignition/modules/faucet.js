const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("FaucetModule", (m) => {
  const faucet = m.contract("Faucet", [], {});

  return { faucet };
});

