// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title YAKAMI TrustFlow - Registro e Recompensa DePIN
 * @dev Contrato inteligente para automatizar o registo de nós (sensores/operadores) 
 * e a libertação de repasses financeiros na Amazónia, eliminando intermediários.
 */
contract RegistroDeUsuariosComRecompensa {
    address public admin;

    struct Operador {
        bool registado;
        string sensorId;
        uint256 recompensasTotais;
    }

    // Mapeamento que liga a carteira do operador aos seus dados
    mapping(address => Operador) public operadores;

    // Eventos para rastreabilidade na blockchain (Metaverso Frontend pode ouvir estes eventos)
    event OperadorRegistado(address indexed operador, string sensorId);
    event RecompensaEmitida(address indexed operador, uint256 valor);

    constructor() {
        // O criador do contrato é o administrador (ex: Sistema YAKAMI)
        admin = msg.sender;
    }

    modifier apenasAdmin() {
        require(msg.sender == admin, "Apenas o admin pode executar esta acao de governanca");
        _;
    }

    /**
     * @dev Regista um novo técnico ou sensor na rede YAKAMI.
     */
    function registarOperador(address _carteira, string memory _sensorId) public apenasAdmin {
        require(!operadores[_carteira].registado, "Operador ja registado na rede.");
        
        operadores[_carteira] = Operador({
            registado: true,
            sensorId: _sensorId,
            recompensasTotais: 0
        });

        emit OperadorRegistado(_carteira, _sensorId);
    }

    /**
     * @dev Liberta o pagamento condicional automaticamente quando o serviço é validado.
     * Funciona como um Escrow automatizado.
     */
    function recompensarOperador(address payable _carteira) public payable apenasAdmin {
        require(operadores[_carteira].registado, "Operador nao registado na rede YAKAMI.");
        require(msg.value > 0, "O valor da recompensa deve ser maior que zero.");

        // Atualiza o histórico imutável
        operadores[_carteira].recompensasTotais += msg.value;
        
        // Executa a transferência de valor (Simulação do Token YKM)
        (bool sucesso, ) = _carteira.call{value: msg.value}("");
        require(sucesso, "Falha na transferencia automatica do valor.");

        emit RecompensaEmitida(_carteira, msg.value);
    }
}
