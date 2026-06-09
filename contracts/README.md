# ⚙️ Arquitetura Lógica e Tokenomics (YAKAMI TrustFlow)

Este diretório contém os Smart Contracts que formam a espinha dorsal da rede ciberfísica da YAKAMI TECH. Mais do que simples automação, o código reflete um modelo económico (Tokenomics) desenhado para sustentabilidade a longo prazo e proteção de Propriedade Intelectual (INPI).

## 📊 Modelo Económico Circular (Token YKM)
A lógica dos contratos `RegistroDeUsuariosComRecompensa.sol` e `YakamiEcosystem.sol` materializa o nosso Quadro Reivindicatório de patente:

**1. Distribuição Baseada em Prova de Operação (Proof-of-Uptime):**
O contrato inteligente monitoriza o tempo de atividade dos nós físicos (ECO Stations) num ciclo fechado de 7 dias e executa a distribuição do tesouro centralizado de forma automatizada. (Vide diagrama *Tokenomics_YKM_Distribuicao.jpg* na pasta `/assets`).

**2. Escalonamento em Tiers (Níveis de Recompensa):**
A liquidação on-chain é classificada em quatro níveis rigorosos:
* **Bronze:** Mínimo de 40h de atividade = 50 tokens YKM.
* **Prata:** Mínimo de 80h de atividade = 120 tokens YKM.
* **Ouro:** Mínimo de 120h de atividade = 250 tokens YKM.
* **Diamante:** Mínimo de 160h de atividade = 500 tokens YKM.
*(O contrato prevê uma penalidade algorítmica de 50% em caso de inatividade no momento exato da apuração do ciclo).*

**3. Mecanismo Deflacionário (Corporate Burn):**
Para garantir a escassez programada e o controlo da inflação, a arquitetura do contrato aplica um sistema de retenção que destrói permanentemente **2% do suprimento circulante** a cada transação corporativa comercial realizada no ecossistema logístico.

## 🔗 Integração Social e DePIN
Os contratos garantem a circularidade económica através da transferência direta dos ativos para as carteiras digitais dos mantenedores locais. Através da capacitação contínua, os jovens da região ribeirinha assumem a operação descentralizada da infraestrutura, convertendo as recompensas logísticas on-chain em valor real no seu quotidiano.
