using UnityEngine;

public abstract class LevelBase : MonoBehaviour
{
    [Header("Mission Info")]
    public string missionDescription;
    public int totalPointsRequired = 0;
    public Transform carPosRotRef;
    protected int currentPoints = 0;
    
    public GameObject[] objectsToEnable;
    public GameObject[] objectsToDisable;


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
        if (objectsToEnable != null)
        {
            
            foreach (GameObject obj in objectsToEnable)
            {
                obj.SetActive(true);
            }
        }

        // Disable required objects
        if (objectsToDisable != null)
        {
            foreach (GameObject obj in objectsToDisable)
            {
                obj.SetActive(false);
            }
        }
       
        

        // Reset points
        currentPoints = 0;

        // Find the player car
        GameObject car = GameObject.FindGameObjectWithTag("Player");
        if (car != null && car.activeInHierarchy)
        {
            car.SetActive(false);
            car.transform.position = carPosRotRef.position;
            Debug.Log(car.name + " Position updated");
            car.SetActive(true);
        }
        else
        {
            Debug.LogWarning("Player car not found or not active in hierarchy.");
        }
    }

    [ContextMenu("Update Car Position")]
    public void UpdateCarPosition()
    {
        GameObject car = GameObject.FindGameObjectWithTag("Player");
        if (car != null && car.activeInHierarchy)
        {
            car.SetActive(false);
            car.transform.position = carPosRotRef.position;
            Debug.Log(car.name + " Position updated");
            car.SetActive(true);
        }
        else
        {
            Debug.LogWarning("Player car not found or not active in hierarchy.");
        }
    }
    

}
