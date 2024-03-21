const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");


// deployed  --> 0x94791C982a6d132D5E547a563aE038243C2e6A9F  
const TokenModule = buildModule("TokenModule", (m) => {
  const token = m.contract("HealthRecords");

  return { token };
});

module.exports = TokenModule;