using UnityEngine;
using UnityEngine.UI;

public class LevelHandler : MonoBehaviour
{
    [Space(5)]
    [Header("Buttons")]
    public Button levelStartButton;

    [Space(5)]
    [Header("Refrence")]
    public GameObject loadingScreen;


    private void Start()
    {
        levelStartButton.onClick.AddListener(OnFirstLevelBoxClicked);
    }

    void OnFirstLevelBoxClicked()
    {
        loadingScreen.SetActive(true);
    }
}
