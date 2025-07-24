using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class UiManager : MonoBehaviour
{

    ///////////////---MISSION STATEMENT---///////////////

    [Space(5)]
    [Header("----MISSION STATEMENT----")]

    [Space(1f)]
    [Header("Panel")]

    [Space(1f)]
    [Header("Buttons")]



    ///////////////---COMPLETE---///////////////


    [Space(5)]
    [Header("----LEVEL COMPLETE----")]

    [Space(1f)]
    [Header("Panel")]
    public GameObject levelCompletePanel;

    [Space(1f)]
    [Header("Buttons")]
    public Button nextLevelButton;



    ///////////////---FAIL---///////////////

    [Space(5)]
    [Header("----LEVEL FAIL----")]


    [Space(1f)]
    [Header("Panel")]
    public GameObject levelFailPanel;

    [Space(1f)]
    [Header("Buttons")]
    public Button F_Restart;
    public Button F_Home;


    ///////////////---SETTING---///////////////

    [Space(5)]
    [Header("----SETTING----")]

    [Space(1f)]
    [Header("Panel")]
    public GameObject gameSettingPanel;
    [Space(1f)]
    [Header("Buttons")]
    public Button settingButton;
    public Button settingBackButton;
    public Button S_RestartButton;
    public Button S_Home;


    [Space(5)]
    [Header("Others")]
    public TimeHandler timeHandler;
    public LevelManager levelManager;
    public string mainMenuSceneName;

    private void Start()
    {
        GameStateEvents.OnLevelComplete += LevelComplete;
        GameStateEvents.OnLevelFail += LevelFail;
        GameStateEvents.OnSettingOpen += GameSetting;



        //BUTTONS ASSIGNMENTS
        nextLevelButton.onClick.AddListener(NextLevel);
        F_Home.onClick.AddListener(Home);
        S_RestartButton.onClick.AddListener(Restart);
        settingButton.onClick.AddListener(GameSetting);
        settingBackButton.onClick.AddListener(GameSettingBack);

        S_RestartButton.onClick.AddListener(Restart);
        S_Home.onClick.AddListener(Home);
    }

    private void OnDestroy()
    {
        GameStateEvents.OnLevelComplete -= LevelComplete;
        GameStateEvents.OnLevelFail -= LevelFail;
        GameStateEvents.OnSettingOpen -= GameSetting;
    }

    void LevelComplete()
    {
        levelCompletePanel.SetActive(true);
        timeHandler.PauseTime();
        timeHandler.DontConsiderTimer();
    }
    void LevelFail()
    {
        Time.timeScale = 0;
        levelFailPanel.SetActive(true);
    }
    void GamePause()
    {
        //gamePausePanel.SetActive(true);
        TimeScaleZero();
    }
    void GameResume()
    {
        //gamePausePanel.SetActive(false);
        TimeScaleOne();
    }
    void GameSetting()
    {
        timeHandler.PauseTime();
        timeHandler.DontConsiderTimer();
        gameSettingPanel.SetActive(true);
        TimeScaleZero();
    }
    void GameSettingBack()
    {
        timeHandler.ResumeTime();
        timeHandler.ConsiderTimer();
        gameSettingPanel.SetActive(false);
        TimeScaleOne();
    }
    void NextLevel()
    {
        levelCompletePanel.SetActive(false);
        levelManager.NextLevel();
        TimeScaleOne();
    }

    public void Restart()
    {
        Debug.Log("Restart called");
        levelFailPanel.SetActive(false);
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        Time.timeScale = 1f;
    }

    void Home()
    {
        SceneManager.LoadScene(mainMenuSceneName);
    }





    // Helper methods to control time scale
    void TimeScaleZero()
    {
        Time.timeScale = 0f;
    }
    void TimeScaleOne()
    {
        Time.timeScale = 1f;
    }
}
