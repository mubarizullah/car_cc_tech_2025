using TMPro;
using UnityEngine;

public class MainmenuUi : MonoBehaviour
{
    public TextMeshProUGUI nameText;
    public TextMeshProUGUI totalCoins;

    private void Start()
    {
        if (PlayerManager.Instance)
        {
            UpdateCoins(PlayerManager.Instance.totalCoins);
            PlayerManager.OnCoinsUpdated += UpdateCoins;
            UpdateNameText();
        }
    }

    private void OnDestroy()
    {

        PlayerManager.OnCoinsUpdated -= UpdateCoins;
    }

    private void UpdateCoins(int obj)
    {
        totalCoins.text = obj.ToString();
    }

    void UpdateNameText()
    {
        if (PlayerManager.Instance)
        {
            nameText.text = PlayerManager.Instance.playerName;
        }
        else
        {
            nameText.text = "Player0811";
        }
    }

}
