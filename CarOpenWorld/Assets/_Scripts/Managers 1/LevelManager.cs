using UnityEngine;
using UnityEngine.SceneManagement;

public class LevelManager : MonoBehaviour
{
    public GameObject[] levels;             // Assign level GameObjects here
    public int currentLevelIndex = 0;       // Currently active level
    private int latestUnlockedLevel = 0;    // Highest unlocked level

    private const string SaveKey = "LatestUnlockedLevel";

    void Start()
    {
        // Load saved progress
        latestUnlockedLevel = PlayerPrefs.GetInt(SaveKey, 0);
        currentLevelIndex = latestUnlockedLevel;
        LoadLevel(currentLevelIndex);
    }

    public void NextLevel()
    {
        if (currentLevelIndex + 1 < levels.Length)
        {
            currentLevelIndex++;

            if (currentLevelIndex > latestUnlockedLevel)
            {
                latestUnlockedLevel = currentLevelIndex;
                PlayerPrefs.SetInt(SaveKey, latestUnlockedLevel);
                PlayerPrefs.Save();
            }

            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        }
        else
        {
            Debug.Log("No more levels available.");
        }
    }

    public void LatestLevel()
    {
        currentLevelIndex = PlayerPrefs.GetInt(SaveKey, 0);
        LoadLevel(currentLevelIndex);
    }

    public void RestartLevel()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        Time.timeScale = 1f;
    }

    private void LoadLevel(int index)
    {
        foreach (var level in levels)
        {
            level.SetActive(false);
            Debug.Log("Gameobject" + level.name + " is deactivated");
        }
        for (int i = 0; i < levels.Length; i++)
        {
            levels[i].SetActive(i == index);
            Debug.Log("Gameobject" + levels[i].name + " active state is " + levels[i].activeSelf);
        }

        Debug.Log($"Level {index + 1} loaded.");
    }

    // Optional: Reset saved progress (for testing or UI button)
    public void ResetProgress()
    {
       
    }
}
