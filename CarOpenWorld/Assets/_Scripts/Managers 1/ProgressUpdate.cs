using UnityEngine;
using UnityEngine.UI;

public class ProgressUpdate : MonoBehaviour
{
    public GameObject progressUpdateUi;
    public Text currentPoints;
    public Text totalPoints;

    int currentPointsLocal;

    private void Start()
    {
        GameStateEvents.OnLevelStartPoints += UpdateVisualOnStart;
        GameStateEvents.OnCheckPointReached += IncrementProgress;
    }

    private void OnDestroy()
    {
        GameStateEvents.OnLevelStartPoints -= UpdateVisualOnStart;
        GameStateEvents.OnCheckPointReached -= IncrementProgress;
    }

    void IncrementProgress()
    {
        currentPointsLocal++;
        currentPoints.text = currentPointsLocal.ToString();
    }

    void UpdateVisualOnStart(int currentP, int totalP)
    {
        progressUpdateUi.SetActive(true);
        currentPoints.text = currentP.ToString();
        currentPointsLocal = currentP;
        totalPoints.text = totalP.ToString();
    }
}
