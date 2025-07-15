using UnityEngine;

public abstract class LevelBase : MonoBehaviour
{
    [Header("Mission Info")]
    public string missionDescription;
    public int totalPointsRequired = 0;
    public Transform carPosRotRef;
    protected int currentPoints = 0;
    
    public GameObject[] objectsToEnable;


    private void OnEnable()
    {
        StartLevel();
        GameStateEvents.UpdateProgressOnStart(currentPoints, totalPointsRequired);
        GameStateEvents.UpdateMissionState(missionDescription);
    }

    public virtual void StartLevel()
    {
        AtLevelStart();
    }

    public virtual void ResetLevel()
    {
        currentPoints = 0;
        StartLevel();
    }

    void AtLevelStart()
    {
        // Enable required objects
        foreach (GameObject obj in objectsToEnable)
        {
            obj.SetActive(true);
        }

        // Reset points
        currentPoints = 0;

        // Find the player car
        GameObject car = GameObject.FindGameObjectWithTag("Player");
        if (car != null && car.activeInHierarchy)
        {
            car.transform.position = carPosRotRef.position;
        }
        else
        {
            Debug.LogWarning("Player car not found or not active in hierarchy.");
        }
    }



}
