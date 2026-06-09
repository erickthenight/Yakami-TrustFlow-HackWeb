# 🛡️ Smart Contracts (Solidity)

Este diretório contém a camada lógica de execução on-chain do projeto **YAKAMI TrustFlow**. Estes contratos foram desenvolvidos para garantir a automação de governança, o processamento de pagamentos (Escrow) e a liquidação financeira imutável na rede **Sepolia Testnet**.

## 📑 Arquitetura de Contratos

### `RegistroDeUsuariosComRecompensa.sol`
O motor central do nosso protocolo de governança DePIN. 
* **Função:** Gerencia o registro de estações de telemetria, valida o histórico de atividade (Proof-of-Uptime) e automatiza o processo de *escrow* para a liberação de recompensas aos mantenedores locais.

### `YakamiEcosystem.sol`
A arquitetura de alto nível do ecossistema YKM.
* **Governança:** Estrutura pronta para votações descentralizadas (DAO).
* **Interoperabilidade:** Integração nativa com oráculos (Chainlink) para alimentação de dados ciberfísicos externos.
* **Tokenomics:** Suporte total a ativos (ERC-20 para o token YKM e ERC-721 para NFTs de certificação de nós da rede).

## ⚙️ Especificações Técnicas
* **Linguagem:** Solidity ^0.8.20
* **Framework:** Hardhat
* **Segurança:** Implementação de padrões OpenZeppelin para controle de acesso, proteção contra reentrância e governança segura.

---
*Este módulo é o coração da nossa proposta de valor, unindo a infraestrutura física (sensores) à eficiência da tecnologia blockchain.*
