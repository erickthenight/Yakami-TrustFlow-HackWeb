using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;

namespace YakamiTech.TrustFlow
{
    /// <summary>
    /// Script de frontend (Metaverso Unity) que atua como gatilho visual para as funções do Smart Contract.
    /// Simula a interação do utilizador com o Totem de Compliance para libertar pagamentos.
    /// </summary>
    public class ValidacaoContrato : MonoBehaviour
    {
        [Header("Configurações Visuais e Feedback")]
        public Material materialAprovado;
        private Material materialBase;
        private Renderer rend;
        private AudioSource audioSource;

        void Start()
        {
            rend = GetComponent<Renderer>();
            materialBase = rend.material;
            audioSource = GetComponent<AudioSource>();
        }

        /// <summary>
        /// Função executada pelo XR Simple Interactable quando o utilizador prime o gatilho do comando VR.
        /// Na versão de produção, esta função faria o trigger da API (Nethereum/Web3) para a Sepolia.
        /// </summary>
        public void AssinarContratoELibertarPagamento()
        {
            // Feedback Visual: Muda para a cor de "Aprovado" (Verde)
            if (rend != null && materialAprovado != null)
            {
                rend.material = materialAprovado;
            }
            
            // Feedback Sonoro
            if (audioSource != null)
            {
                audioSource.Play();
            }
            
            // Log de execução para auditoria
            Debug.Log("[YAKAMI TrustFlow] - Condição de negócio validada pelo operador.");
            Debug.Log("[YAKAMI TrustFlow] - Call enviada para a Sepolia: Função recompensarOperador() acionada com sucesso.");
        }
    }
}
