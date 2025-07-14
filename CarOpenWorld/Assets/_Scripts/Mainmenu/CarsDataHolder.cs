using UnityEngine;

public class CarsDataHolder : MonoBehaviour
{
    public static CarsDataHolder Instance { get; private set; }

    public CarData[] Cars;

    void Awake()
    {
        // Ensure there's only one instance
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
        }
        else
        {
            Instance = this;
            DontDestroyOnLoad(gameObject); // Optional: keeps it across scenes
        }
    }
}
