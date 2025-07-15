using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class NameInputUI : MonoBehaviour
{
    public InputField nameInputField; // Assign in inspector
    public Button submitButton;       // Assign in inspector
    public float timeToLoadMainmenu;
    public GameObject loadingPanel;   // Assign in inspector

    void Start()
    {
        submitButton.onClick.AddListener(OnSubmit);
    }

    void OnSubmit()
    {
        string inputName = nameInputField.text.Trim();
        if (!string.IsNullOrEmpty(inputName))
        {
            // Save to PlayerPrefs
            PlayerPrefs.SetString("PlayerName", inputName);
            PlayerPrefs.Save();

            // Set it to PlayerManager
            PlayerManager.Instance.playerName = inputName;

            // Destroy input UI after input
            gameObject.SetActive(false);
        }
        else
        {
            Debug.LogWarning("Name cannot be empty!");
        }

        loadingPanel.SetActive(true);
        Invoke(nameof(LoadScene), timeToLoadMainmenu);
    }

    void LoadScene()
    {
        SceneManager.LoadScene(1);
    }
}
