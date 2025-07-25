using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class UiManager : MonoBehaviour
{

    ///////////////---MISSION STATEMENT---///////////////

    [Space(5)]
    [Header("--------MISSION STATEMENT--------")]

    [Space(1f)]
    [Header("Panel")]

    [Space(1f)]
    [Header("Buttons")]



    ///////////////---COMPLETE---///////////////


    [Space(5)]
    [Header("--------LEVEL COMPLETE--------")]

    [Space(1f)]
    [Header("Panel")]
    public GameObject levelCompletePanel;

    [Space(1f)]
    [Header("Buttons")]
    public Button nextLevelButton;
    public Button C_Home;



    ///////////////---FAIL---///////////////

    [Space(5)]
    [Header("--------LEVEL FAIL--------")]


    [Space(1f)]
    [Header("Panel")]
    public GameObject levelFailPanel;

    [Space(1f)]
    [Header("Buttons")]
    public Button F_Home;
    public Button F_Restart;


    ///////////////---SETTING---///////////////

    [Space(5)]
    [Header("--------SETTING--------")]

    [Space(1f)]
    [Header("Panel")]
    public GameObject gameSettingPanel;
    [Space(1f)]
    [Header("Buttons")]
    public Button settingButton;
    public Button settingBack;
    public Button musicOn;
    public Button musicOff;
    public Button steeringButtons;
    public Image steeringCheckBox;
    public Button leftRightButton;
    public Image leftRightCheckBox;
    public Button S_Restart;
    public Button S_Home;


    [Space(5)]
    [Header("Others")]
    public GameObject musicGameobject;
    public TimeHandler timeHandler;
    public LevelManager levelManager;
    public string mainMenuSceneName;
    public Sprite checkedOn;
    public Sprite checkedOff;
    public RCC_Settings rccSettings;

    private void Start()
    {
        GameStateEvents.OnLevelComplete += LevelComplete;
        GameStateEvents.OnLevelFail += LevelFail;
        GameStateEvents.OnSettingOpen += GameSetting;



        //BUTTONS ASSIGNMENTS
        //Level Complete
        nextLevelButton.onClick.AddListener(NextLevel);
        C_Home.onClick.AddListener(LoadHomeScene);

        //LevelFail

        F_Home.onClick.AddListener(LoadHomeScene);
        S_Restart.onClick.AddListener(ReloadScene);

        //Setting
        settingButton.onClick.AddListener(GameSetting);
        settingBack.onClick.AddListener(GameSettingBack);
        S_Restart.onClick.AddListener(ReloadScene);
        S_Home.onClick.AddListener(LoadHomeScene);
        musicOn.onClick.AddListener(()=> musicGameobject.SetActive(true));
        musicOff.onClick.AddListener(()=> musicGameobject.SetActive(false));
        leftRightButton.onClick.AddListener(SetSterringToSteering);
        steeringButtons.onClick.AddListener(SetSteeringToLeftRight);

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

    public void ReloadScene()
    {
        gameSettingPanel.SetActive(false);
        levelFailPanel.SetActive(false);
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        Time.timeScale = 1f;
    }

    void LoadHomeScene()
    {
        SceneManager.LoadScene(mainMenuSceneName);
    }

    void SetSterringToSteering()
    {
        steeringCheckBox.sprite = checkedOff;
        leftRightCheckBox.sprite = checkedOn;
        RCC_Settings.Instance.mobileController = RCC_Settings.MobileController.SteeringWheel;
        Debug.Log("Setting Changed to steering");
    }

    void SetSteeringToLeftRight()
    {
        steeringCheckBox.sprite = checkedOn;
        leftRightCheckBox.sprite = checkedOff;
        RCC_Settings.Instance.mobileController = RCC_Settings.MobileController.TouchScreen;
        Debug.Log("Setting Changed to TouchScreen");
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
