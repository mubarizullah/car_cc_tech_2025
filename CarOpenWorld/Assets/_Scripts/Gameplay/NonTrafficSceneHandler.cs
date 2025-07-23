using UnityEngine;

public class NonTrafficSceneHandler : MonoBehaviour
{

    [Space(5)]
    [Header("At Tutorial")]
    public GameObject[] gObjToEnable;
    public GameObject[] gObjToDisable;
    [Space(5)]
    [Header("At Tutorial")]
    public GameObject[] gObectsjToEnable;
    public GameObject[] gObjectsToDisable;

    bool tutorial;

    private void Start()
    {

        if (PlayerPrefs.GetInt("Tutorial") == 0)
        {
            Debug.Log("Its Tutorial");
            tutorial = true;
        }
        else
        {
            Debug.Log("Its a Game");
            tutorial = false;
        }
        DoWork();
    }



    void DoWork()
    {
        if (tutorial)
        {
            SetActivation(gObjToEnable, true);
            SetActivation(gObjToDisable, false);
        }
        else
        {
            SetActivation(gObectsjToEnable, true);
            SetActivation(gObjectsToDisable, false);
        }
    }

    void SetActivation(GameObject[] gb, bool cond)
    {
        foreach (var item in gb)
        {
            item.SetActive(cond);
        }
    }


}
