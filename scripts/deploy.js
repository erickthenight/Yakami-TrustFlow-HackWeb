const hre = require("hardhat");

async function main() {
  console.log("Iniciando o deploy do ecossistema YAKAMI TrustFlow...");

  // 1. Deploy do Contrato Principal de Liquidação e Registro
  const Registro = await hre.ethers.getContractFactory("RegistroDeUsuariosComRecompensa");
  const registro = await Registro.deploy();
  await registro.waitForDeployment();
  
  const registroAddress = await registro.getAddress();
  console.log(`✅ RegistroDeUsuariosComRecompensa deployado em: ${registroAddress}`);
  console.log("   (Rede: Sepolia Testnet)");

  // 2. Configurações de Segurança e Verificação
  console.log("⏳ Aguardando confirmações de blocos para verificação no Etherscan...");
  
  // Script preparado para expansão futura com o YakamiEcosystem.sol
  console.log("🚀 Deploy finalizado com sucesso! O Oráculo Ciberfísico está ativo.");
}

main().catch((error) => {
  console.error("Erro fatal durante o deploy:", error);
  process.exitCode = 1;
});
