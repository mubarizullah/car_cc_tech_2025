using UnityEngine;

public class MusicManager : MonoBehaviour
{
    public static MusicManager instance;

    private void Awake()
    {
        if (instance != null && instance != this)
        {
            Destroy(gameObject); // Prevent duplicates
            return;
        }

        instance = this;
        DontDestroyOnLoad(gameObject); // Keep alive across scenes
        Debug.Log("PersistentSelfDestroyer is now persistent.");
    }

    // Public function to destroy the persistent object
    public void DestroySelf()
    {
        Debug.Log("Destroying PersistentSelfDestroyer.");
        instance = null;
        Destroy(gameObject);
    }
}
