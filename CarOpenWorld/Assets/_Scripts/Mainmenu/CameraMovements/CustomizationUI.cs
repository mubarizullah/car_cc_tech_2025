using UnityEngine.UI;
using UnityEngine;

public class CustomizationUI : MonoBehaviour
{
    [Header("Camera")]
    public CameraMovement cameraFocus;

    [Space(5)]
    [Header("Camera View Points")]
    public Transform tireTarget;
    public Transform bodyTarget;
    public Transform wingTarget;
    public Transform hoodTarget;

    [Space(5)]
    [Header("Parts Buttons")]
    public Button tyreFocus;
    public Button hoodFocus;
    public Button bodyFocus;
    public Button wingFocus;

    [Space(5)]
    [Header("Color Buttons Bundles")]
    public GameObject bodyColorButtons;
    public GameObject rimColorButtons;
    public GameObject wingColorButtons;
    public GameObject hoodColorButtons;

    private void OnEnable()
    {
        cameraFocus.SetFocusTarget(bodyTarget);
        bodyColorButtons.SetActive(true);
        rimColorButtons.SetActive(false);
        wingColorButtons.SetActive(false);
        hoodColorButtons.SetActive(false);
    }


    private void Start()
    {
        tyreFocus.onClick.AddListener(FocusOnRims);
        hoodFocus.onClick.AddListener(FocusOnHood);
        bodyFocus.onClick.AddListener(FocusOnBody);
        wingFocus.onClick.AddListener(FocusOnWings);
    }

    public void FocusOnRims()
    {
        cameraFocus.SetFocusTarget(tireTarget);
        DisableAllColorGroups();
        rimColorButtons.SetActive(true);
    }

    public void FocusOnBody()
    {
        cameraFocus.SetFocusTarget(bodyTarget);
        DisableAllColorGroups();
        bodyColorButtons.SetActive(true);
    }
    
    public void FocusOnWings()
    {
        cameraFocus.SetFocusTarget(wingTarget);
        DisableAllColorGroups();
        wingColorButtons.SetActive(true);
    }
    
    public void FocusOnHood()
    {
        cameraFocus.SetFocusTarget(hoodTarget);
        DisableAllColorGroups();
        hoodColorButtons.SetActive(true);
    }

    void DisableAllColorGroups()
    {
        bodyColorButtons.SetActive(false);
        rimColorButtons.SetActive(false);
        wingColorButtons.SetActive(false);
        hoodColorButtons.SetActive(false);
    }
}
