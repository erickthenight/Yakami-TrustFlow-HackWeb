// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

// ---------------------------------------------------
// ETAPA 4: ORÁCULO (Interface da Chainlink)
// ---------------------------------------------------
interface AggregatorV3Interface {
    function latestRoundData() external view returns (uint80, int256, uint256, uint256, uint80);
}

// ---------------------------------------------------
// ETAPA 2: TOKEN ERC-20 (Moeda de Recompensa)
// ---------------------------------------------------
contract YakamiToken is ERC20 {
    constructor() ERC20("Yakami DataCredit", "YKM") {
        // Emite 1 milhão de tokens para o tesouro inicial
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}

// ---------------------------------------------------
// ETAPA 2: NFT ERC-721 (Certificado de EcoStation)
// ---------------------------------------------------
contract YakamiNFT is ERC721, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint256 private _nextTokenId;

    constructor() ERC721("Yakami EcoStation ID", "YECO") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mintEcoStation(address to) public onlyRole(MINTER_ROLE) {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }
}

// ---------------------------------------------------
// ETAPAS 2 e 3: STAKING, DAO E SEGURANÇA
// ---------------------------------------------------
contract YakamiProtocol is AccessControl, ReentrancyGuard {
    YakamiToken public token;
    YakamiNFT public nft;
    AggregatorV3Interface public priceFeed;

    // Estrutura da DAO
    struct Proposal {
        string description;
        uint256 votesFor;
        uint256 votesAgainst;
        bool executed;
    }

    mapping(uint256 => Proposal) public proposals;
    uint256 public proposalCount;
    mapping(address => mapping(uint256 => bool)) public hasVoted;
    
    // Mapeamento de Staking
    mapping(address => uint256) public stakedBalances;

    constructor(address _token, address _nft, address _priceFeed) {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        token = YakamiToken(_token);
        nft = YakamiNFT(_nft);
        // Endereço da Chainlink na Sepolia
        priceFeed = AggregatorV3Interface(_priceFeed); 
    }

    // --- STAKING (Compromisso do Sensor) ---
    function stake(uint256 amount) external nonReentrant {
        require(amount > 0, "Valor deve ser maior que 0");
        token.transferFrom(msg.sender, address(this), amount);
        stakedBalances[msg.sender] += amount;
    }

    function unstake(uint256 amount) external nonReentrant {
        require(stakedBalances[msg.sender] >= amount, "Saldo insuficiente no stake");
        stakedBalances[msg.sender] -= amount;
        token.transfer(msg.sender, amount);
    }

    // --- ORÁCULO (Ajuste de Preço) ---
    function getEthUsdPrice() public view returns (int256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return price; // Usado para ajustar recompensas de staking dinamicamente
    }

    // --- DAO SIMPLIFICADA (Governança) ---
    function createProposal(string memory description) external {
        proposals[proposalCount] = Proposal(description, 0, 0, false);
        proposalCount++;
    }

    function vote(uint256 proposalId, bool support) external {
        require(stakedBalances[msg.sender] > 0, "Apenas membros com stake podem votar");
        require(!hasVoted[msg.sender][proposalId], "Voce ja votou nesta proposta");

        hasVoted[msg.sender][proposalId] = true;
        
        // O peso do voto é equivalente ao valor em stake
        if (support) {
            proposals[proposalId].votesFor += stakedBalances[msg.sender];
        } else {
            proposals[proposalId].votesAgainst += stakedBalances[msg.sender];
        }
    }
}
