// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

/**
 * @title RegistroDeUsuariosComRecompensa
 * @author Erick Mattos - Yakami Tech
 * @notice MVP da Camada de Liquidação - Oráculo Ciberfísico YAKAMI TECH
 * 
 * =========================================================================
 * 📚 COMENTÁRIOS CONCEITUAIS OBRIGATÓRIOS (ITEM 7 DA TAREFA)
 * =========================================================================
 * 
 * 1. O QUE É GAS?
 *    Gas é a unidade de medida do esforço computacional necessário para 
 *    executar operações na rede Ethereum. Cada instrução (soma, armazenamento, 
 *    chamada externa) consome uma quantidade específica de gas. O usuário paga 
 *    em ETH pelo gas consumido: gasUsed × gasPrice. Isso previne loops infinitos 
 *    e ataques de negação de serviço (DoS), alinhando incentivos econômicos.
 * 
 * 2. COMO FUNCIONA A EVM (Ethereum Virtual Machine)?
 *    A EVM é o ambiente de execução descentralizado que processa Smart Contracts.
 *    É uma máquina de estado global que garante que o código execute exatamente 
 *    da mesma forma em todos os nós da rede mundial. Cada transação altera o 
 *    estado da blockchain de forma determinística e auditável por qualquer pessoa.
 * 
 * 3. CONTRATOS TRADICIONAIS VS. SMART CONTRACTS:
 *    • Contratos civis tradicionais: dependem de intermediários humanos 
 *      (cartórios, advogados, tribunais), são lentos, caros e sujeitos a 
 *      interpretação subjetiva ou corrupção.
 *    • Smart Contracts: são "autoverificáveis" e "autoexecutáveis". Se as 
 *      condições lógicas são atendidas, a execução ocorre automaticamente, 
 *      sem possibilidade de censura, com regras imutáveis após o deploy.
 * =========================================================================
 */

contract RegistroDeUsuariosComRecompensa {

    // ========================================================================
    // 📦 ESTRUTURA DE DADOS (Obrigatório: simulação de token ERC-20)
    // ========================================================================
    
    /**
     * @struct Usuario
     * @dev Representa um usuário ou dispositivo registrado no ecossistema
     * @param nome Identificador único (ex: "EcoGateway_Tumbira_01" ou ID do hardware)
     * @param cadastrado Flag de controle que indica se o endereço já foi registrado
     * @param saldoTokens Saldo acumulado de tokens utilitários (simulação ERC-20 conceitual)
     */
    struct Usuario {
        string nome;
        bool cadastrado;
        uint256 saldoTokens;
    }

    // ========================================================================
    // 🗄️ ESTADO DO CONTRATO
    // ========================================================================

    /// @notice Mapeamento de endereços para estruturas Usuario (obrigatório)
    mapping(address => Usuario) public usuarios;
    
    /// @notice Endereço do administrador do sistema (Gatekeeper da rede)
    address public immutable admin;

    // ========================================================================
    // 📡 EVENTOS (Obrigatório: auditoria off-chain)
    // ========================================================================

    /// @notice Emitido quando um novo usuário/dispositivo é registrado
    event UsuarioRegistrado(address indexed carteira, string nome);
    
    /// @notice Emitido quando tokens de recompensa são distribuídos
    event RecompensaEnviada(address indexed carteira, uint256 valor);

    // ========================================================================
    // 🔐 MODIFIER DE SEGURANÇA (Obrigatório: controle de acesso)
    // ========================================================================

    /**
     * @dev Restringe acesso a funções críticas apenas para o administrador
     * @notice Reverte a transação se msg.sender não for o admin
     */
    modifier somenteAdmin() {
        require(msg.sender == admin, "Erro: Acesso restrito ao administrador.");
        _;
    }

    // ========================================================================
    // 🔧 CONSTRUCTOR
    // ========================================================================

    /**
     * @dev Executado uma única vez no momento do deploy
     * @notice Define o criador do contrato como administrador inicial
     */
    constructor() {
        admin = msg.sender;
    }

    // ========================================================================
    // 📝 FUNÇÕES PÚBLICAS (Obrigatórias: registrar, recompensar, consultar)
    // ========================================================================

    /**
     * @notice Registra um novo usuário ou dispositivo no ecossistema
     * @param _nome Identificador único do usuário/dispositivo (ex: ID do Eco-Gateway)
     * @dev Emite evento `UsuarioRegistrado` para rastreamento off-chain
     * @dev Valida que o nome não seja vazio e impede registros duplicados
     */
    function registrarUsuario(string calldata _nome) public {
        // Segurança: Evitar registros duplicados por endereço
        require(!usuarios[msg.sender].cadastrado, "Erro: Usuario ja registrado.");
        // Segurança: Validar que o nome não seja vazio (previne dados inválidos)
        require(bytes(_nome).length > 0, "Erro: O nome nao pode estar vazio.");

        // Registra o novo usuário na estrutura de dados
        usuarios[msg.sender] = Usuario({
            nome: _nome,
            cadastrado: true,
            saldoTokens: 0
        });

        // Emite evento para auditoria e indexação off-chain
        emit UsuarioRegistrado(msg.sender, _nome);
    }

    /**
     * @notice Distribui tokens de recompensa para um usuário registrado
     * @param _carteira Endereço do usuário que receberá a recompensa
     * @param _valor Quantidade de tokens a creditar (simulação de ERC-20)
     * @dev Apenas o administrador pode chamar (modifier somenteAdmin)
     * @dev Valida que o beneficiário exista e que o valor seja positivo
     */
    function recompensarUsuario(address _carteira, uint256 _valor) public somenteAdmin {
        // Segurança: Garantir que o destinatário esteja registrado e ativo
        require(usuarios[_carteira].cadastrado, "Erro: Beneficiario nao encontrado.");
        // Segurança: Validar que o valor da recompensa seja positivo
        require(_valor > 0, "Erro: O valor deve ser positivo.");

        // Atualização do saldo (simulação de token ERC-20 conceitual)
        usuarios[_carteira].saldoTokens += _valor;

        // Emite evento para rastreamento off-chain de recompensas
        emit RecompensaEnviada(_carteira, _valor);
    }

    /**
     * @notice Consulta os dados públicos de um usuário registrado
     * @param _carteira Endereço do usuário a ser consultado
     * @return nome Identificador do usuário/dispositivo
     * @return saldo Saldo atual de tokens utilitários
     * @dev Função `view`: não modifica estado, sem custo de gas para chamadas externas
     */
    function consultarUsuario(address _carteira) public view returns (string memory nome, uint256 saldo) {
        // Nota: Em produção, considere retornar valores padrão em vez de reverter
        // para melhor experiência em frontends Web3
        require(usuarios[_carteira].cadastrado, "Erro: Carteira nao possui registro.");
        
        Usuario memory user = usuarios[_carteira];
        return (user.nome, user.saldoTokens);
    }

    // ========================================================================
    // 🌿 CASO DE USO REAL: YAKAMI TECH (Documentação Estratégica)
    // ========================================================================

    /**
     * @notice CONTEXTO OPERACIONAL - YAKAMI ENGENHARIA E INTELIGENCIA DE DADOS
     * 
     * @dev Este contrato é a camada base (Settlement Layer) do protocolo "YAKAMI-Net",
     *      uma infraestrutura DePIN (Decentralized Physical Infrastructure Network)
     *      operada na Amazônia Legal para monitoramento ambiental descentralizado.
     * 
     * @dev O "Usuario" registrado representa:
     *      • Um dispositivo IoT físico (YAKAMI Eco-Station) que coleta telemetria
     *        de qualidade da água, ar e biodiversidade;
     *      • Ou um operador humano credenciado para validar dados em campo.
     * 
     * @dev A função `recompensarUsuario` simula o mecanismo de incentivo econômico:
     *      • Em produção, seria acionada automaticamente por um Oráculo de Hardware
     *        (Chainlink Keepers ou similar) sempre que o dispositivo comprovasse
     *        envio válido de dados auditáveis;
     *      • Os "tokens" creditados (saldoTokens) representam DataCredits utilitários
     *        que podem ser trocados por benefícios na rede (acesso a dados premium,
     *        participação em governança, ou conversão futura para token ERC-20 real).
     * 
     * @dev IMPACTO ESTRATÉGICO:
     *      • Mercado de Carbono: Prova criptográfica de preservação para créditos RWA;
     *      • Defesa Nacional: Monitoramento de fronteiras com dados judicialmente auditáveis;
     *      • Logística Fluvial: Rastreamento de cargas com prova inviolável de rota e integridade.
     * 
     * @dev DIFERENCIAL COMPETITIVO:
     *      A YAKAMI TECH não vende hardware. A YAKAMI TECH vende a 
     *      "CERTIDÃO DE NASCIMENTO" dos dados do Sul Global — imutável, 
     *      soberana e auditável por qualquer parte interessada, eliminando 
     *      a dependência de satélites estrangeiros bloqueados por nuvens.
     */
}
