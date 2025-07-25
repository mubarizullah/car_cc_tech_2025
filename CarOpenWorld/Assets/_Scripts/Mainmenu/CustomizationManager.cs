using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CustomizationManager : MonoBehaviour
{
    public int carNumber;
    CarData[] carData;

    [Space(5)]
    [Header("BodyColorButtons")]
    public List<Button> bodyColorButtons;
    public List<Button> rimsColorButtons;
    public List<Button> wingsColorButtons;


    CarCustomizer carCustomizer;

    void Start()
    {
        carData = CarsDataHolder.Instance.Cars;
        CarSelection.OnCarIndexChanged += UpdateCarNumber;
    }

    private void OnEnable()
    {
        // Assume car is already spawned and CarCustomizer is attached to it
        carCustomizer = FindObjectOfType<CarCustomizer>();

        for (int i = 0; i < bodyColorButtons.Count; i++)
        {
            int index = i; // VERY important: capture correct index inside the loop
            bodyColorButtons[i].onClick.AddListener(() => OnBodyColorSelected(index));
        }
        for (int i = 0; i < rimsColorButtons.Count; i++)
        {
            int index = i; // VERY important: capture correct index inside the loop
            rimsColorButtons[i].onClick.AddListener(() => OnRimColorSelected(index));
        }
        for (int i = 0; i < wingsColorButtons.Count; i++)
        {
            int index = i; // VERY important: capture correct index inside the loop
            wingsColorButtons[i].onClick.AddListener(() => OnWingsColorSelected(index));
        }
    }

    void OnDestroy()
    {
        CarSelection.OnCarIndexChanged -= UpdateCarNumber;
    }

    void UpdateCarNumber(int num)
    {
        carNumber = num;
    }

    void OnBodyColorSelected(int index)
    {
        if (carCustomizer != null)
        {
            carCustomizer.ApplyBodyMaterial(index);
            SfxManager.Instance.PlaySfxSound(SfxManager.Instance.spraySound);
        }
        else
        {
            Debug.LogWarning("CarCustomizer not found.");
        }
    }
    void OnRimColorSelected(int index)
    {
        if (carCustomizer != null)
        {
            carCustomizer.ApplyRimsMaterial(index);
            SfxManager.Instance.PlaySfxSound(SfxManager.Instance.spraySound);
        }
        else
        {
            Debug.LogWarning("CarCustomizer not found.");
        }
    }
    void OnWingsColorSelected(int index)
    {
        if (carCustomizer != null)
        {
            carCustomizer.ApplyWingsMaterial(index);
        }
        else
        {
            Debug.LogWarning("CarCustomizer not found.");
        }
    }
    void OnParts2ColorSelected(int index)
    {
        if (carCustomizer != null)
        {
            carCustomizer.ApplyRimsMaterial(index);
        }
        else
        {
            Debug.LogWarning("CarCustomizer not found.");
        }
    }
}
