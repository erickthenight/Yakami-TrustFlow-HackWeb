const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("YAKAMI TrustFlow - RegistroDeUsuariosComRecompensa", function () {
  let Contrato;
  let yakamiContract;
  let admin;
  let operador;

  beforeEach(async function () {
    [admin, operador] = await ethers.getSigners();
    Contrato = await ethers.getContractFactory("RegistroDeUsuariosComRecompensa");
    yakamiContract = await Contrato.deploy();
  });

  it("Deve definir o criador como admin", async function () {
    expect(await yakamiContract.admin()).to.equal(admin.address);
  });

  it("Deve registrar um operador de IoT/DePIN com sucesso", async function () {
    await yakamiContract.registarOperador(operador.address, "YAKAMI_SENSOR_001");
    const dadosOperador = await yakamiContract.operadores(operador.address);
    expect(dadosOperador.registado).to.equal(true);
    expect(dadosOperador.sensorId).to.equal("YAKAMI_SENSOR_001");
  });

  it("Deve emitir a recompensa (YKM) após a validação do serviço ciberfísico", async function () {
    // 1. Registra o operador primeiro
    await yakamiContract.registarOperador(operador.address, "YAKAMI_SENSOR_001");
    
    // 2. Aciona o pagamento condicional simulando a regra de negócio do TrustCode
    const valorRecompensa = ethers.parseEther("0.05");
    await expect(yakamiContract.recompensarOperador(operador.address, { value: valorRecompensa }))
      .to.emit(yakamiContract, "RecompensaEmitida")
      .withArgs(operador.address, valorRecompensa);
  });
});
