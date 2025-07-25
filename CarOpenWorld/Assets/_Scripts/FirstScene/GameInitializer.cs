using UnityEngine;
using UnityEngine.SceneManagement;

public class GameInitializer : MonoBehaviour
{
    public GameObject nameInputUIPrefab; // Assign your input UI prefab here
    public float timeToLoadMainmenu;
    [SerializeField] float timeToLoadAppOpen = 3f;
    [SerializeField] float timeToShowAppOpen = 5f;
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

    private void OnEnable()
    {
        Invoke(nameof(LoadAppOpen), timeToLoadAppOpen);
        Invoke(nameof(ShowAppOpen), timeToShowAppOpen);
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

    void LoadAppOpen()
    {
        if (AdmobAdsManager.Instance)
        {
            AdmobAdsManager.Instance.Btn_App_Load();
        }
    }
    void ShowAppOpen()
    {
        if (AdmobAdsManager.Instance)
        {
            AdmobAdsManager.Instance.Btn_App_Show();
        }
    }


}
