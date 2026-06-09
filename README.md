# 🌳 YAKAMI TrustFlow: Smart Contracts para Governança e DePIN na Amazônia

**Equipe:** YAKAMI TECH (Erick Mattos & Helen Araújo)
**Desafio:** Desafio 2 - TrustCode (Smart Contracts)

## 📌 1. O Problema
Na Bacia Amazônica, operações logísticas e a manutenção de infraestrutura ambiental dependem inteiramente de **validações manuais, confiança informal e processos altamente burocratizados**. 
Quando um técnico ribeirinho faz a manutenção de um sensor ambiental ou quando uma carga de compliance ESG precisa ser liberada no porto, o fluxo financeiro e jurídico passa por dezenas de intermediários. Isso gera lentidão, fraudes, atraso em repasses financeiros e falta de transparência na auditoria.

## 💡 2. A Solução (TrustCode YAKAMI)
Criamos o **YAKAMI TrustFlow**, um ecossistema que utiliza Smart Contracts para **automatizar a governança, a liberação de repasses financeiros (YKM Tokens) e o compliance jurídico**.
Em vez de um inspetor humano preencher uma planilha para liberar um pagamento ou assinar um papel para liberar uma carga, nosso Smart Contract automatiza essas condições. 

O grande diferencial inovador do nosso projeto é o **Frontend**: em vez de uma página web 2D em React, construímos um **Gêmeo Digital no Metaverso (Unity)**. O Metaverso atua como a interface visual onde os operadores interagem com os totens de assinatura digital para acionar as funções do Smart Contract on-chain.

## ⚙️ 3. Como o Smart Contract Automatiza o Fluxo (Regras de Negócio)
Nosso contrato (`RegistroDeUsuariosComRecompensa`) atua como um *Escrow* e Gestor de Serviços automatizado:
1. **Identidade e Registro (`registrarUsuario`):** O contrato registra imutavelmente a identidade do operador ou do nó físico (ex: `YAKAMI_SENSOR_001`). Sem intermediários.
2. **Execução Condicional (`recompensarUsuario`):** Quando a condição é validada no Metaverso/Terminal de Compliance, o contrato **libera automaticamente o pagamento** (recompensa) para a carteira do operador, cortando a burocracia bancária e a necessidade de aprovação de um gerente humano.

## 🔗 4. Links e Entregáveis
* **Endereço do Smart Contract (Sepolia Testnet):** [0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc](https://sepolia.etherscan.io/address/0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc)
* **Vídeo Pitch (Demonstração):** [INSERIR LINK DO YOUTUBE AQUI]
* **Apresentação de Slides:** [INSERIR LINK DO PDF AQUI]
* **Repositórios Frontend (Metaverso Unity):**
* * [Cartório Digital/Compliance (Helen)](https://github.com/helenaraujo-adv/Atividade_Final_Metaverso_Avan-ado_Helen_Araujo)
  * [Centro de Comando Logístico (Erick)](https://github.com/erickthenight/C4-Amazon-VR-Avancado-TIC29)

## 🛠️ 5. Tecnologias Utilizadas
* **Blockchain:** Solidity (v0.8.20), Remix IDE, Sepolia Testnet.
* **Frontend Imersivo:** Unity 3D (2022.3 LTS), Meta XR SDK, C# (para scripts de interação com os terminais virtuais).

## 🤖 6. Declaração de Uso de IA (Transparência - Regra 12)
Em conformidade com o regulamento do HackWeb, declaramos que ferramentas de Inteligência Artificial Generativa (Google Gemini) foram utilizadas de forma assistiva para: 
* Revisão ortográfica e estruturação da documentação técnica (README e roteiros de pitch).
* Geração de templates arquiteturais para os relatórios do Unity.
* *Nota:* A lógica de negócios, a programação em C#/Solidity e a concepção da solução YAKAMI são de autoria intelectual humana da equipe.
