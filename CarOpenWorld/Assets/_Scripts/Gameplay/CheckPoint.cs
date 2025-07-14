using System;
using UnityEngine;

public class CheckPoint : MonoBehaviour
{
    public static event Action OnCheckPointReached;

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            OnCheckPointReached?.Invoke();
        }
    }
}
