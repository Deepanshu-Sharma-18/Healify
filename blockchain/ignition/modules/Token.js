const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");



const TokenModule = buildModule("TokenModule", (m) => {
  const token = m.contract("HealthRecords");

  return { token };
});

module.exports = TokenModule;