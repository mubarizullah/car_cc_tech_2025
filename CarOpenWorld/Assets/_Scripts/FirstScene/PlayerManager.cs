using UnityEngine;
using System;

public class PlayerManager : MonoBehaviour
{
    public static PlayerManager Instance;

    public string playerName = "";

    public int totalCoins;

    public int selectedCarIndex;

    public static event Action<int> OnCoinsUpdated;


    void Awake()
    {
        // Singleton pattern
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);

            // Load saved player name if exists
            if (PlayerPrefs.HasKey(PlayerPrefsKeys.PlayerName))
            {
                playerName = PlayerPrefs.GetString(PlayerPrefsKeys.PlayerName,"PLAYER_25896");
            }

            LoadCoins();  
            StartCoins();

            if (PlayerPrefs.HasKey(PlayerPrefsKeys.SelectedCarIndex))
            {
                selectedCarIndex = PlayerPrefs.GetInt(PlayerPrefsKeys.SelectedCarIndex,0);
            }

        }
        else
        {
            Destroy(gameObject);
        }
    }

    public void AddCoins(int coins)
    {
        totalCoins += coins;
        PlayerPrefs.SetInt(PlayerPrefsKeys.TotalCoins, totalCoins);
        PlayerPrefs.Save();
        OnCoinsUpdated?.Invoke(totalCoins);
    }

    public void LoadCoins()
    {
        if (PlayerPrefs.HasKey(PlayerPrefsKeys.TotalCoins))
        {
            totalCoins = PlayerPrefs.GetInt(PlayerPrefsKeys.TotalCoins);
        }
    }

    void StartCoins()
    {
        if (PlayerPrefs.GetInt(PlayerPrefsKeys.NewGameCoins)==0)
        {
            AddCoins(1000);
            PlayerPrefs.SetInt(PlayerPrefsKeys.NewGameCoins, 1);
        }
    }

    [ContextMenu("Ad 50 coins")]
    public void Add50Coins()
    {
        AddCoins(50);
    }
}
