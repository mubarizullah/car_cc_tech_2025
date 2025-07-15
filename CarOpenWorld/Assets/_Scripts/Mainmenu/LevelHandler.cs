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

    [Header("Refrence")]
    public GameObject loadingScreen;

    private void Start()
    {
        noTrafficMode.onClick.AddListener(() => ModeSelected(2));  // No Traffic
        trafficMode.onClick.AddListener(() => ModeSelected(3));    // Traffic
        stuntMode.onClick.AddListener(() => ModeSelected(4));      // Stunts
    }

    void ModeSelected(int modeIndex)
    {
        loadingScreen.SetActive(true);
        OnModeClicked?.Invoke(modeIndex);
    }
}
