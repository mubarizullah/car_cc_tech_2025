using UnityEngine;

public class FallDetector : MonoBehaviour
{
    public GameObject objectToEnable; // Assign the object you want to enable (e.g., warning UI or respawn zone)
    public float fallThreshold = -5f; // Y position below which falling is confirmed

    private Rigidbody rb;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        if (objectToEnable != null)
            objectToEnable.SetActive(false); // Ensure it's disabled at the start
    }

    void Update()
    {
        if (rb.velocity.y < 0 && transform.position.y <= fallThreshold)
        {
            if (objectToEnable != null)
                objectToEnable.SetActive(true);
        }
    }
}
