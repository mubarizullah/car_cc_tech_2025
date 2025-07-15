using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;
using System.Collections;

public class LoadingScreenManager : MonoBehaviour
{
    public Image filler;
    public TextMeshProUGUI percentText;
    int sceneIndex;

    private void Start()
    {
        LevelHandler.OnModeClicked += SetSceneIndex;
    }
    private void OnDestroy()
    {
        LevelHandler.OnModeClicked -= SetSceneIndex;
    }

    void SetSceneIndex(int n)
    {
        sceneIndex = n;
        StartCoroutine(DelayAndStartLoading(sceneIndex));
    }



    IEnumerator DelayAndStartLoading(int sceneIndex)
    {
        // Allow UI to render first
        yield return null;

        // Now begin loading
        yield return StartCoroutine(LoadSceneAsync());
    }

    IEnumerator LoadSceneAsync()
    {
        AsyncOperation operation = SceneManager.LoadSceneAsync(sceneIndex);
        operation.allowSceneActivation = false;

        while (!operation.isDone)
        {
            float progress = Mathf.Clamp01(operation.progress / 0.9f);
            filler.fillAmount = progress;
            percentText.text = Mathf.RoundToInt(progress * 100f) + "%";

            if (operation.progress >= 0.9f)
            {
                yield return new WaitForSeconds(0.2f); // Optional small delay
                operation.allowSceneActivation = true;
            }

            yield return null;
        }
    }

    
}
