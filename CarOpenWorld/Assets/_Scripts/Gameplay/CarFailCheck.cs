using UnityEngine;

public class CarFailCheck : MonoBehaviour
{
    public float checkDelay = 2f; // Time to wait before triggering fail
    public float dotThreshold = 0.5f; // Dot product threshold for upside/side check

    private float failTimer = 0f;

    void Update()
    {
        Vector3 up = transform.up;
        float dot = Vector3.Dot(up, Vector3.up); // Compare car's up with world up

        // If dot is < 0.5, then car is tilted badly
        if (dot < dotThreshold)
        {
            failTimer += Time.deltaTime;
            if (failTimer >= checkDelay)
            {
                Debug.Log("Car is upside down or on side. Failing level.");
                GameStateEvents.LevelFail(); // Call your fail event
            }
        }
        else
        {
            failTimer = 0f; // Reset timer if car is upright again
        }
    }
}
