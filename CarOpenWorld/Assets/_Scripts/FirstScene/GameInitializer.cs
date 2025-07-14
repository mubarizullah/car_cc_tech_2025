using UnityEngine;
using UnityEngine.SceneManagement;

public class GameInitializer : MonoBehaviour
{
    public GameObject nameInputUIPrefab; // Assign your input UI prefab here
    public float timeToLoadMainmenu = 3f;

    void Start()
    {
        // Check if player name exists
        if (!PlayerPrefs.HasKey("PlayerName"))
        {
            // Instantiate input UI to get player name
            nameInputUIPrefab.SetActive(true);
        }
        else
        {
            nameInputUIPrefab.SetActive(false);
            SceneManager.LoadScene(1);
            // Player name already exists, load it in PlayerManager
            if (PlayerManager.Instance != null)
            {
                PlayerManager.Instance.playerName = PlayerPrefs.GetString("PlayerName");
            }
        }
    }

}
