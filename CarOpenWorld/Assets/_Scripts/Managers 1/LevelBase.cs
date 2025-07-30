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
        GameStateEvents.UpdateProgressOnStart(currentPoints, totalPointsRequired);
        GameStateEvents.UpdateMissionState(missionDescription);
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

            // Set position
            car.transform.position = carPosRotRef.position;

            // Set Y rotation (while keeping X and Z the same)
            Vector3 currentRotation = car.transform.eulerAngles;
            currentRotation.y = carPosRotRef.eulerAngles.y;
            car.transform.eulerAngles = currentRotation;

            Debug.Log(car.name + " Position and Y-Rotation updated");

            car.SetActive(true);
        }
        else
        {
            Debug.LogWarning("Player car not found or not active in hierarchy.");
        }
        Invoke(nameof(Progress), 1f);
    }

    void Progress()
    {
        GameStateEvents.UpdateProgressOnStart(currentPoints, totalPointsRequired);
    }

    [ContextMenu("Update Car Position")]
    public void UpdateCarPosition()
    {
        GameObject car = GameObject.FindGameObjectWithTag("Player");
        if (car != null && car.activeInHierarchy)
        {
            car.SetActive(false);

            // Set position
            car.transform.position = carPosRotRef.position;

            // Set Y rotation (while keeping X and Z the same)
            Vector3 currentRotation = car.transform.eulerAngles;
            currentRotation.y = carPosRotRef.eulerAngles.y;
            car.transform.eulerAngles = currentRotation;

            Debug.Log(car.name + " Position and Y-Rotation updated");

            car.SetActive(true);
        }
        else
        {
            Debug.LogWarning("Player car not found or not active in hierarchy.");
        }

    }


}
