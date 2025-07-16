using System;
using System.Data.Common;
using UnityEngine;
using UnityEngine.UI;


public class TimeHandler : MonoBehaviour
{
    public static TimeHandler Instance;

    [Space(5)]
    [Header("INAPP")]

    public float[] timerForGames;

    public GameObject timerUIGameobject;
    public Text timeText;
    public float timer;
    float maxTimer;
    bool canStart;
    bool canConsiderTimer;
    bool isPaused;
    public Image timeFiller;

    bool canFailAppear;

    public Button btnMissionStatemetnStart;

    public static event Action OnTimerComplete;

    int timerNumber;

    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        canStart = true;
        btnMissionStatemetnStart.onClick.AddListener(() => UpdateTimerOnLevelStart());
    }

    void UpdateTimerOnLevelStart()
    {
        timerUIGameobject.SetActive(true);

        SetTimerForLevel();             // Setup maxTimer first
        timer = maxTimer;              // Set timer from maxTimer
        timeFiller.fillAmount = 1f;    // Use percentage (0-1)

        ResumeTime();
        stopChecking = false;          // Reset fail state
        canFailAppear = false;         // Reset fail flag
        canStart = true;
        canConsiderTimer = true;
    }


    bool stopChecking;

    private void Update()
    {
        if (canConsiderTimer)
        {
            if (!canStart)
                return;

            if (!isPaused)
            {
                if (timer > 0f)
                {
                    timer -= Time.deltaTime;

                    // 🔁 Update fill amount (0 to 1)
                    timeFiller.fillAmount = timer / maxTimer;
                }

                if (timer <= 0f && !stopChecking)
                {
                    timer = 0f;
                    timeFiller.fillAmount = 0f;
                    canFailAppear = true;



                    if (canFailAppear)
                    {
                        Debug.Log("Fail");
                        GameStateEvents.LevelFail();
                        canFailAppear = false;
                        stopChecking = true;
                        Debug.Log("Fail can't appear");
                    }

                }
            }
        }


        // Update time text
        int totalSeconds = Mathf.CeilToInt(timer);
        int minutes = totalSeconds / 60;
        int seconds = totalSeconds % 60;
        timeText.text = string.Format("{0:00}:{1:00}", minutes, seconds);

    }
    void SetTimerForLevel()
    {
        maxTimer = timerForGames[0];
    }

    [ContextMenu("Pause Time")]
    public void PauseTime()
    {
        isPaused = true;
    }
    [ContextMenu("Resume Time")]
    public void ResumeTime()
    {
        isPaused = false;
    }

    public void ConsiderTimer()
    {
        canConsiderTimer = true;
    }

    public void DontConsiderTimer()
    {
        canConsiderTimer = false;
    }

}
