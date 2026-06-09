# 🌳 YAKAMI TrustFlow: Smart Contracts para Governança na Amazônia
*(Projeto baseado no TrustCode Template Oficial - HackWeb Web3)*

## 📌 Sobre o desafio & Objetivo Oficial
**Objetivo do TrustCode:** Construir Smart Contracts capazes de automatizar acordos, pagamentos e regras de negócio.
**Nosso Foco (YAKAMI):** Na Bacia Amazônica, operações logísticas e manutenções ambientais dependem de validações manuais e extrema burocracia. Nosso objetivo é substituir essa confiança informal por um Smart Contract de Escrow e Recompensas, utilizando um Gêmeo Digital Imersivo (Unity) como interface de gatilho para as funções on-chain.

## 🚀 Exemplos de aplicação da nossa solução
* **Escrow Corporativo:** Liberação condicional de recursos baseada em validações físicas.
* **Pagamentos Automáticos:** Repasse instantâneo de Tokens YKM para os mantenedores ribeirinhos.
* **Governança e Rastreabilidade:** Registro imutável de compliance logístico e ambiental.

## 🛠 Tecnologias utilizadas
* **Blockchain:** Solidity, Hardhat, Sepolia Testnet, Remix IDE, OpenZeppelin.
* **Frontend Imersivo (Metaverso):** Unity 3D, Meta XR SDK, C# (Integração Web3).
* **Frontend Web:** Mendix (Plataforma Low-code corporativa).

## 📁 Estrutura do Repositório
* `/contracts` -> Contém o Smart Contract principal de automação (`RegistroDeUsuariosComRecompensa.sol`) e a arquitetura avançada com DAO/Tokenomics (`YakamiEcosystem.sol`).
* `/scripts` -> Contém o script de execução e deploy da rede (`deploy.js`).
* `/frontend` -> Referências para as aplicações e o script de integração Web3 via Metaverso (`YakamiMetaverseWeb3.cs`).
* `/assets` e `/docs` -> Documentação técnica em formato PDF, apresentações e recursos visuais.
* `/test` -> Diretório com os testes automatizados de validação do contrato (`RegistroTest.js`).
* `hardhat.config.js` -> Configuração do ambiente de compilação e integração com a rede Sepolia.

## ⚙️ Como executar (Demonstração Funcional)
A nossa infraestrutura não requer execução local obrigatória via Hardhat, pois o MVP já está provisionado em rede pública e em painéis acessíveis:
1. **Verificar o Smart Contract:** Acesse as transações diretamente na rede Sepolia (link nos Requisitos Mínimos).
2. **Testar o Dashboard Web:** [Acesso ao Sandbox Mendix](https://yakamistationflow-sandbox.mxapps.io/index.html?profile=Responsive).
3. **Página Oficial do Hackathon:** [www.yakami.com.br/hackweb.html](https://www.yakami.com.br/hackweb.html)

## ✅ Requisitos mínimos entregues
* **Contrato deployado:** [0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc](https://sepolia.etherscan.io/address/0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc)
* **Fluxo demonstrável (Vídeo-Pitch):** [https://youtu.be/xxCw4utw1m8](https://youtu.be/xxCw4utw1m8)
* **Apresentação e Documentação:** Disponíveis integralmente na [Landing Page Executiva do Projeto](https://www.yakami.com.br/hackweb.html) e nas pastas `/assets` e `/docs` deste repositório.
* **Declaração de uso de IA (Regra 12):** Ferramentas de IA Generativa foram utilizadas de forma estritamente assistiva para revisão textual, formatação de documentação e geração de templates markdown. A lógica de negócios, a arquitetura de código em Solidity e o design do ecossistema são de autoria intelectual da equipe.

## 👥 Equipe
* **Erick Mattos - CEO & Tech Lead** (Arquitetura Sistêmica, Smart Contracts e Metaverso Tático). Traz ao projeto expertise em gestão eletrônica e logística fundamentada em sua atuação nos sistemas pioneiros do OGMO e AHIMOC, essencial para a modelagem realista das regras de negócio do porto digital.
* **Helen Araújo - CLO / Chief Legal Officer** (Governança, Compliance Web3 e Metaverso Jurídico).
