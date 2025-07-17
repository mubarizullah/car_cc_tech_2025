using UnityEngine;

public class HIddenProgress : MonoBehaviour
{
    public GameObject nextGameObject;    // The next GameObject to activate


    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            if (nextGameObject != null)
                nextGameObject.SetActive(true);
            gameObject.SetActive(false);
        }
    }
}
