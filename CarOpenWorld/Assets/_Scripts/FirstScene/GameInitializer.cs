using UnityEngine;
using UnityEngine.SceneManagement;

public class GameInitializer : MonoBehaviour
{
    public GameObject nameInputUIPrefab; // Assign your input UI prefab here
    public float timeToLoadMainmenu;
    public GameObject loadingPanel;
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
            AlreadyHaveName();
        }
    }

    void AlreadyHaveName()
    {
        nameInputUIPrefab.SetActive(false);
        loadingPanel.SetActive(true);


        // Player name already exists, load it in PlayerManager
        if (PlayerManager.Instance != null)
        {
            PlayerManager.Instance.playerName = PlayerPrefs.GetString("PlayerName");
        }
        Invoke(nameof(LoadScene), timeToLoadMainmenu);
    }

    void LoadScene()
    {
        SceneManager.LoadScene(1);
    }


}
