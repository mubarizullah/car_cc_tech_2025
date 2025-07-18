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
    public GameObject tyreFocusSelector;
    public Button hoodFocus;
    public GameObject hoodFocusSelector;
    public Button bodyFocus;
    public GameObject bodyFocusSelector;
    public Button wingFocus;
    public GameObject wingFocusSelector;

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
        bodyFocusSelector.SetActive(true);
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
        DisableAllSelectors();
        tyreFocusSelector.SetActive(true);
    }

    public void FocusOnBody()
    {
        cameraFocus.SetFocusTarget(bodyTarget);
        DisableAllColorGroups();
        bodyColorButtons.SetActive(true);
        DisableAllSelectors();
        bodyFocusSelector.SetActive(true);
    }
    
    public void FocusOnWings()
    {
        cameraFocus.SetFocusTarget(wingTarget);
        DisableAllColorGroups();
        wingColorButtons.SetActive(true);
        DisableAllSelectors();
        wingFocusSelector.SetActive(true);
    }
    
    public void FocusOnHood()
    {
        cameraFocus.SetFocusTarget(hoodTarget);
        DisableAllColorGroups();
        hoodColorButtons.SetActive(true);
        DisableAllSelectors();
        hoodFocusSelector.SetActive(true);
    }

    void DisableAllColorGroups()
    {
        bodyColorButtons.SetActive(false);
        rimColorButtons.SetActive(false);
        wingColorButtons.SetActive(false);
        hoodColorButtons.SetActive(false);
    }

    void DisableAllSelectors()
    {
        tyreFocusSelector.SetActive(false);
        bodyFocusSelector.SetActive(false);
        wingFocusSelector.SetActive(false);
        hoodFocusSelector.SetActive(false);
    }
}
