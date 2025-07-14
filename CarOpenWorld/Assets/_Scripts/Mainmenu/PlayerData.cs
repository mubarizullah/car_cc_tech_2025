using System.Collections.Generic;
using UnityEngine;

public class PlayerData : MonoBehaviour
{
    public static PlayerData Instance;

    // List of unlocked car names
    public List<string> unlockedCars = new List<string>();

    void Awake()
    {
        // Singleton pattern
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }

        LoadData(); // Load previously unlocked cars
    }

    void LoadData()
    {
        // Example: Load comma-separated car names from PlayerPrefs
        string saved = PlayerPrefs.GetString("UnlockedCars", "");
        if (!string.IsNullOrEmpty(saved))
        {
            unlockedCars = new List<string>(saved.Split(','));
        }
    }

    public void SaveData()
    {
        // Save unlocked cars as comma-separated names
        string saveStr = string.Join(",", unlockedCars);
        PlayerPrefs.SetString("UnlockedCars", saveStr);
        PlayerPrefs.Save();
    }

    public bool IsCarUnlocked(string carName)
    {
        return unlockedCars.Contains(carName);
    }

    public void UnlockCar(string carName)
    {
        if (!unlockedCars.Contains(carName))
        {
            unlockedCars.Add(carName);
            SaveData();
        }
    }
}
