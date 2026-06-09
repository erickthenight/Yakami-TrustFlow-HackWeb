using UnityEngine;
using System.Collections;
using UnityEngine.Networking;
// Script de Integração Web3 para o Gêmeo Digital (Unity 3D)
// Autores: Erick Mattos & Helen Araújo - YAKAMI TECH

public class YakamiMetaverseWeb3 : MonoBehaviour
{
    [Header("Configurações do Smart Contract (Sepolia)")]
    public string contractAddress = "0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc";
    public string rpcUrl = "https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID";
    
    [Header("Elementos Interativos VR")]
    public Material painelAprovado;
    public Renderer totemRenderer;

    /// <summary>
    /// Função chamada quando o usuário (ex: Oficial de Compliance) 
    /// aperta o botão virtual no Metaverso (LegalHub) com o controle VR.
    /// </summary>
    public void AcionarGatilhoAprovacao()
    {
        Debug.Log("Gatilho VR acionado. Iniciando transação na Blockchain Sepolia...");
        
        // Altera o feedback visual no metaverso (Muda o totem para verde)
        if (totemRenderer != null) {
            totemRenderer.material = painelAprovado;
        }

        // Dispara a chamada on-chain para a função recompensarUsuario()
        StartCoroutine(EnviarTransacaoWeb3());
    }

    private IEnumerator EnviarTransacaoWeb3()
    {
        // NOTA: Em produção, utiliza-se Nethereum SDK para assinar transações com MetaMask.
        // Este é um mock arquitetural demonstrando o fluxo do Payload para o Smart Contract.
        
        string jsonPayload = "{\"jsonrpc\":\"2.0\",\"method\":\"eth_sendTransaction\",\"params\":[{\"to\":\"" + contractAddress + "\", \"data\":\"0x...\"}],\"id\":1}";
        
        UnityWebRequest request = new UnityWebRequest(rpcUrl, "POST");
        byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(jsonPayload);
        request.uploadHandler = new UploadHandlerRaw(bodyRaw);
        request.downloadHandler = new DownloadHandlerBuffer();
        request.SetRequestHeader("Content-Type", "application/json");

        yield return request.SendWebRequest();

        if (request.result == UnityWebRequest.Result.Success)
        {
            Debug.Log("✅ Sucesso Web3! Contrato acionado e recompensa liberada. Hash: " + request.downloadHandler.text);
        }
        else
        {
            Debug.LogError("Erro de comunicação com a EVM: " + request.error);
        }
    }
}
