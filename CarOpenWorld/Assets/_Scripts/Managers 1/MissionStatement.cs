using UnityEngine;
using UnityEngine.UI;

public class MissionStatement : MonoBehaviour
{
    public Text missionText;
    public Button startButton;
    public GameObject missionStatementUi;
    private void Start()
    {
        startButton.onClick.AddListener(OnStartPressed);
        GameStateEvents.OnMissionStartStatement += ShowMissionStatement;
    }

    private void OnDestroy()
    {
        GameStateEvents.OnMissionStartStatement -= ShowMissionStatement;
    }

    void ShowMissionStatement(string text)
    {
        missionStatementUi.SetActive(true);
        missionText.text = text;
    }

    void OnStartPressed()
    {
        missionStatementUi.SetActive(false);
    }
}
