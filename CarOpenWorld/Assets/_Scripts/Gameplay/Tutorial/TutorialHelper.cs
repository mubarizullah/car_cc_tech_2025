using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class TutorialHelper : MonoBehaviour
{
    public Button tutorialButton;
    public GameObject fadeScreen;
    public bool isLastTutorial;

    private void Start()
    {
        tutorialButton.onClick.AddListener(OnAnywhereTouch);
    }

    void OnAnywhereTouch()
    {
        if (isLastTutorial)
        {
            PlayerPrefs.SetInt("Tutorial", 1);
            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
            return;
        }
        StartCoroutine(FadeWaitCoroutine());
    }

    IEnumerator FadeWaitCoroutine()
    {
        yield return new WaitForSeconds(1f);
        fadeScreen.SetActive(true);
    }
}
