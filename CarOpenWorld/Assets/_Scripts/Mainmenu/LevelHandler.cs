using System;
using UnityEngine;
using UnityEngine.UI;

public class LevelHandler : MonoBehaviour
{
    public static event Action<int> OnModeClicked;

    [Header("Buttons")]
    public Button noTrafficMode;
    public Button trafficMode;
    public Button stuntMode;
    [Space(3)]
    //public Button mode2Lock;
    //public Button mode3Lock;
    [Space(3)]
    public Button backButton;
    [Header("Refrence")]
    public GameObject garagePanel;
    public GameObject loadingScreen;
    //public GameObject secondLockedMessage;
    //public GameObject thirdLockedMessage;

    

    private void Start()
    {
        noTrafficMode.onClick.AddListener(() => ModeSelected(2));  // No Traffic
        trafficMode.onClick.AddListener(() => ModeSelected(3));    // Traffic
        stuntMode.onClick.AddListener(() => ModeSelected(4));      // Stunts

        backButton.onClick.AddListener(OnBackButtonPressed);

        //mode2Lock.onClick.AddListener(() => secondLockedMessage.SetActive(true));
        //mode3Lock.onClick.AddListener(() => thirdLockedMessage.SetActive(true));
    }

    void ModeSelected(int modeIndex)
    {
        loadingScreen.SetActive(true);
        OnModeClicked?.Invoke(modeIndex);
    }

    void OnBackButtonPressed()
    {
        garagePanel.SetActive(true);
        gameObject.SetActive(false);
    }

    void CheckModes()
    {
        //if (PlayerPrefs.GetInt("M2Free") == 1)
        //{
        //    mode2Lock.gameObject.SetActive(false);
        //}
        //if (PlayerPrefs.GetInt("M3Free") == 1)
        //{
        //    mode3Lock.gameObject.SetActive(false);
        //}
    }
}
