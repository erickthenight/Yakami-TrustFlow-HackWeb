# 🖥️ Frontend Architecture: YAKAMI TrustFlow

A nossa arquitetura de interface foi concebida sob o paradigma de **Micro-Frontends de Alta Disponibilidade**. Em vez de uma aplicação monolítica, dividimos a interface conforme a necessidade de cada ator do ecossistema, garantindo resiliência e foco industrial:

## 1. Dashboard Web (Camada de Gestão)
* **Tecnologia:** Mendix (Low-Code Corporativo).
* **Função:** Interface de alta disponibilidade para operadores portuários, fiscais e órgãos de defesa monitorarem o fluxo de dados em tempo real.
* **Status:** Em produção (Sandbox).
* **Acesso:** [YAKAMI ECO FLOW - Mendix App](https://yakamistationflow-sandbox.mxapps.io/index.html?profile=Responsive)

## 2. Gêmeo Digital Imersivo (Camada de Execução Tática)
* **Tecnologia:** Unity 3D / Meta XR SDK.
* **Função:** Interface de gatilho ciberfísico. O operador utiliza imersão VR para assinar transações na blockchain Sepolia, transformando a interação cartorial/logística numa experiência tática.
* **Arquitetura de Integração:** O script `YakamiMetaverseWeb3.cs` neste repositório atua como o *Bridge*, conectando os assets 3D do Metaverso diretamente aos nossos Smart Contracts on-chain.
* **Gestão de Assets:** Devido à alta fidelidade (assets > 2GB), o projeto utiliza versionamento via LFS (Large File Storage) e repositórios satélites para garantir a fluidez da experiência VR.

## 🔗 Módulos de Integração (Repositórios Satélites)
Para garantir a modularidade, o ecossistema integra-se com os seguintes módulos táticos:
* **[LegalHub / Cartório Digital]( https://github.com/helenaraujo-adv/Atividade_Final_Metaverso_Avan-ado_Helen_Araujo):** Módulo de governança jurídica e smart contracts imersivos (Resp: Helen Araújo).
* **[Centro de Comando C4-AMAZON]( https://github.com/erickthenight/C4-Amazon-VR-Avancado-TIC29):** Módulo de controle tático e monitoramento logístico em tempo real (Resp: Erick Mattos).

---
*Esta arquitetura permite que a YAKAMI TECH escale o monitoramento (via Web) e a execução tática (via Metaverso) de forma independente, mantendo a integridade da Blockchain como nossa única fonte da verdade (Source of Truth).*
