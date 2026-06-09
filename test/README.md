# 🧪 Suite de Testes (Hardhat & Chai)

Este diretório contém a suite de testes automatizados para o protocolo **YAKAMI TrustFlow**. O objetivo é garantir a integridade, segurança e o comportamento esperado dos Smart Contracts antes e após o deploy na rede Sepolia.

## 📋 Cenários de Validação

### `RegistroTest.js`
Este arquivo consolida a lógica de testes unitários e de integração, utilizando o framework **Chai** para asserções. Os principais cenários validados incluem:

* **Registro de Nós (ECO Stations):** Verificação de integridade na inclusão de novos nós na rede ciberfísica, garantindo que apenas dispositivos autorizados integrem o ecossistema.
* **Mecanismos de Escrow:** Validação da retenção e liberação automática de fundos, assegurando que o contrato execute a liquidação apenas quando as condições de telemetria forem atendidas.
* **Lógica de Pagamento Condicional:** Testes de estresse na função `claimReward()`, validando se as recompensas (Tokens YKM) são calculadas corretamente de acordo com os *Tiers* de performance (Bronze, Prata, Ouro, Diamante).
* **Segurança:** Testes de proteção contra acesso indevido às funções administrativas e resistência a possíveis falhas de reentrância.

## 🛠 Como executar os testes
Para rodar a suite de testes e verificar a conformidade do projeto, execute o seguinte comando na raiz do repositório:

```bash
npx hardhat test
