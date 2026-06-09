# 🖥️ Frontend Architecture: YAKAMI TrustFlow

A nossa arquitetura de interface foi concebida sob o paradigma de **Micro-Frontends de Alta Disponibilidade**. Em vez de uma aplicação monolítica, dividimos a interface conforme a necessidade de cada ator do ecossistema, garantindo resiliência e foco industrial:

## 1. Dashboard Web (Camada de Gestão)
* **Tecnologia:** Mendix (Low-Code Corporativo).
* **Função:** Interface de alta disponibilidade para operadores portuários, fiscais e órgãos de defesa monitorarem o fluxo de dados em tempo real.
* **Status:** Em produção (Sandbox).
* **Acesso:** [YAKAMI ECO FLOW - Mendix App](https://yakamistationflow-sandbox.mxapps.io/index.html?profile=Responsive)

## 2. Gêmeo Digital Imersivo (Camada de Execução Tática)
* **Tecnologia:** Unity 3D / Meta XR SDK.
* **Função:** Interface de gatilho ciberfísico. O operador utiliza imersão VR para assinar transações na blockchain Sepolia, transformando a interação cartorial/logística em uma experiência tática.
* **Arquitetura de Integração:** O script `YakamiMetaverseWeb3.cs` neste repositório atua como o *Bridge*, conectando os assets 3D do Metaverso diretamente aos nossos Smart Contracts on-chain.
* **Repositórios de Asset 3D:** Os assets de alta fidelidade (mais de 2GB) estão versionados em LFS (Large File Storage) em repositórios dedicados para otimizar o tempo de build e garantir a fluidez da experiência VR.

---
*Esta arquitetura permite que a YAKAMI TECH escale o monitoramento (via Web) e a execução tática (via Metaverso) de forma independente, mantendo a integridade da Blockchain como nossa única fonte da verdade (Source of Truth).*
Interface de gatilho para os Smart Contracts. O operador interage no VR para assinar transações na Sepolia. Os repositórios completos do frontend Unity estão hospedados de forma isolada devido ao peso dos assets 3D:
* **LegalHub / Cartório Digital:** [Repositório GitHub (Helen)](https://github.com/helenaraujo-adv/Atividade_Final_Metaverso_Avan-ado_Helen_Araujo)
* **Centro de Comando C4-AMAZON:** [Repositório GitHub (Erick)](https://github.com/erickthenight/C4-Amazon-VR-Avancado-TIC29)
