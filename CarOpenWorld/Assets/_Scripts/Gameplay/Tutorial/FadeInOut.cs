using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FadeInOut : MonoBehaviour
{
    public float timeToSwitchScreens = 1.5f;
    public GameObject objectToDisable;
    public GameObject objectToEnable;
    public float timeToDisableThisPanel=3f;

    private void OnEnable()
    {
        Invoke(nameof(Switch), timeToSwitchScreens);
        Invoke(nameof(DisableThisGameobject), timeToDisableThisPanel);
    }

    void Switch()
    {
        objectToDisable.SetActive(false);
        objectToEnable.SetActive(true);
    }

    void DisableThisGameobject()
    {
        gameObject.SetActive(false);    
    }

}
