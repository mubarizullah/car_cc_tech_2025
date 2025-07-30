using System.Collections;
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
    public Button btn_MusicOnCheck;
    public Button btn_MusicOffCheck;
    public Button S_Restart;
    public Button S_Home;
    [Space(1f)]
    public Button btn_SteeringCheckBox;
    [Space(1f)]
    public Button btn_LeftRightCheckBox;


    [Space(5)]
    [Header("Others")]
    public GameObject musicGameobject;
    public TimeHandler timeHandler;
    public LevelManager levelManager;
    public string mainMenuSceneName;
    public Sprite checkedOn;
    public Sprite checkedOff;



    Image leftRighCheckBoxImage;
    Image steeringCheckBoxImage;
    Image musicOffCheckBoxImage;
    Image musicOnCheckBoxImage;
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
        btn_MusicOnCheck.onClick.AddListener(OnMusicOn);
        btn_MusicOffCheck.onClick.AddListener(OnMusicOff);
        btn_LeftRightCheckBox.onClick.AddListener(SetControllerToLeftRightButton);
        btn_SteeringCheckBox.onClick.AddListener(SetControllerToSteering);


        leftRighCheckBoxImage = btn_LeftRightCheckBox.GetComponent<Image>();
        steeringCheckBoxImage = btn_SteeringCheckBox.GetComponent<Image>();
        musicOffCheckBoxImage = btn_MusicOffCheck.GetComponent<Image>();
        musicOnCheckBoxImage = btn_MusicOnCheck.GetComponent<Image>();

        CheckPrevCheckBox();
    }

    private void OnDestroy()
    {
        GameStateEvents.OnLevelComplete -= LevelComplete;
        GameStateEvents.OnLevelFail -= LevelFail;
        GameStateEvents.OnSettingOpen -= GameSetting;
    }

    void LevelComplete()
    {
        StartCoroutine(CompleteCoroutine());
    }
    IEnumerator CompleteCoroutine()
    {
        yield return new WaitForSeconds(2);
        if (PlayerManager.Instance)
        {
            PlayerManager.Instance.Add1000Coins();
        }
        InterstitialAdCall.Instance.StartLoading(LevelCompleteWork);
    }
    void LevelCompleteWork()
    {
        levelCompletePanel.SetActive(true);
        timeHandler.PauseTime();
        timeHandler.DontConsiderTimer();
    }
    

    void LevelFail()
    {
        InterstitialAdCall.Instance.StartLoading(LevelFailWork);
    }

    void LevelFailWork()
    {
        levelFailPanel.SetActive(true);
    }
    
    void GameSetting()
    {
        InterstitialAdCall.Instance.StartLoading(GameSettingWork);
    }

    void GameSettingWork()
    {
        timeHandler.PauseTime();
        timeHandler.DontConsiderTimer();
        gameSettingPanel.SetActive(true);
    }
    void GameSettingBack()
    {
        timeHandler.ResumeTime();
        timeHandler.ConsiderTimer();
        gameSettingPanel.SetActive(false);
    }
    void NextLevel()
    {
        levelManager.NextLevel();
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

    void SetControllerToLeftRightButton()
    {
        if (leftRighCheckBoxImage && steeringCheckBoxImage)
        {
            leftRighCheckBoxImage.sprite = checkedOn;
            steeringCheckBoxImage.sprite = checkedOff;
            PlayerPrefs.SetInt(gameObject.name + "controller", 0);
        }
        else
        {
            Debug.LogError("The " + btn_LeftRightCheckBox + " or " + btn_SteeringCheckBox + " does not have image component on the same gameobject");
        }
        RCC_Settings.Instance.mobileController = RCC_Settings.MobileController.TouchScreen;
        Debug.Log("Setting Changed to steering");
    }

    void SetControllerToSteering()
    {
        if (leftRighCheckBoxImage && steeringCheckBoxImage)
        {
            leftRighCheckBoxImage.sprite = checkedOff;
            steeringCheckBoxImage.sprite = checkedOn;
            PlayerPrefs.SetInt(gameObject.name + "controller", 1);
        }
        else
        {
            Debug.LogError("The " + btn_LeftRightCheckBox + " or " + btn_SteeringCheckBox + " does not have image component on the same gameobject");
        }
        RCC_Settings.Instance.mobileController = RCC_Settings.MobileController.SteeringWheel;
        Debug.Log("Setting Changed to TouchScreen");
    }

    void OnMusicOn()
    {
        if (musicOffCheckBoxImage && musicOnCheckBoxImage)
        {
            musicOnCheckBoxImage.sprite = checkedOn;
            musicOffCheckBoxImage.sprite = checkedOff;
            musicGameobject.SetActive(true);
            PlayerPrefs.SetInt(gameObject.name + "music", 0);
        }
        else
        {
            Debug.LogError("The " + btn_MusicOffCheck + " or " + btn_MusicOnCheck + " does not have image component on the same gameobject");
        }
    }

    void OnMusicOff()
    {
        if (musicOffCheckBoxImage && musicOnCheckBoxImage)
        {
            musicOnCheckBoxImage.sprite = checkedOff;
            musicOffCheckBoxImage.sprite = checkedOn;
            musicGameobject.SetActive(false);
            PlayerPrefs.SetInt(gameObject.name + "music", 1);
        }
        else
        {
            Debug.LogError("The " + btn_MusicOffCheck + " or " + btn_MusicOnCheck + " does not have image component on the same gameobject");
        }
    }

    void CheckPrevCheckBox()
    {
        if (PlayerPrefs.GetInt(gameObject.name + "music", 0) == 0)
        {
            musicOnCheckBoxImage.sprite = checkedOn;
            musicOffCheckBoxImage.sprite = checkedOff;
            musicGameobject.SetActive(true);
        }
        else
        {
            musicOnCheckBoxImage.sprite = checkedOff;
            musicOffCheckBoxImage.sprite = checkedOn;
            musicGameobject.SetActive(false);
        }
        
        if (PlayerPrefs.GetInt(gameObject.name + "controller", 0) == 0)
        {
            steeringCheckBoxImage.sprite = checkedOff;
            leftRighCheckBoxImage.sprite = checkedOn;
        }
        else
        {
            steeringCheckBoxImage.sprite = checkedOn;
            leftRighCheckBoxImage.sprite = checkedOff;
        }
    }

}
