# ⚙️ Automação, Deploy e Ciclo de Vida

Este diretório contém os scripts de automação necessários para gerir o ciclo de vida dos nossos Smart Contracts. Eles são fundamentais para garantir que o *deployment* no ambiente de testes (Sepolia) ocorra de forma segura, replicável e transparente.

## 📜 Scripts Disponíveis

### `deploy.js`
Este é o script principal de implantação utilizando o framework **Hardhat**. Sua função é:
* **Automação do Deploy:** Realiza o envio dos contratos `RegistroDeUsuariosComRecompensa.sol` e `YakamiEcosystem.sol` para a Blockchain.
* **Integridade de Endereços:** Registra e exibe os endereços (*addresses*) dos contratos recém-criados, garantindo que a comunicação entre o frontend e a rede esteja sempre sincronizada.
* **Verificação:** Inclui gatilhos para integração com o *Etherscan API*, permitindo a verificação pública do código-fonte logo após o deploy.

### 📡 Nota sobre Integração Ciberfísica
* `TelemetriaRadio.cs`: Script de integração que atua como ponto de coleta e interface entre os dados de telemetria externa (sensores de rádio) e a camada de validação dos Smart Contracts, garantindo a integridade dos dados enviados para a rede.

## 🚀 Como utilizar
Para realizar um novo deploy no ambiente de testes, utilize o comando na raiz do repositório:

```bash
npx hardhat run scripts/deploy.js --network sepolia
