using UnityEngine;

public class CarCustomizer : MonoBehaviour
{
    public Renderer carBodyRenderer;
    public Renderer[] rimRenderers;

    public Material[] bodyMaterials;
    public Material[] rimMaterials;

    public int bodyMaterialIndex = 0; // The slot on the car body renderer to change
    public int rimMaterialIndex = 0;  // The slot on the rim renderer to change

    [Header("Unique Identifier")]
    public string carID = "Car1"; // This must be unique per car (e.g. "Car1", "Car2", etc.)

    private string BodyMatKey => carID + "_LastBodyMaterialIndex";
    private string RimMatKey => carID + "_LastRimMaterialIndex";

    private void Start()
    {
        // Load saved selections, fallback to index 0 if not found
        int savedBodyMaterialIndex = PlayerPrefs.GetInt(BodyMatKey, 0);
        int savedRimMaterialIndex = PlayerPrefs.GetInt(RimMatKey, 0);

        ApplyBodyMaterial(savedBodyMaterialIndex);
        ApplyRimsMaterial(savedRimMaterialIndex);
    }

    public void ApplyBodyMaterial(int materialIndex)
    {
        if (carBodyRenderer == null || bodyMaterials == null || bodyMaterials.Length == 0)
        {
            Debug.LogWarning("Body renderer or body materials not assigned.");
            return;
        }

        if (materialIndex < 0 || materialIndex >= bodyMaterials.Length)
        {
            Debug.LogWarning($"Invalid body material index: {materialIndex}");
            return;
        }

        Material[] mats = carBodyRenderer.materials;

        if (bodyMaterialIndex >= 0 && bodyMaterialIndex < mats.Length)
        {
            mats[bodyMaterialIndex] = bodyMaterials[materialIndex];
            carBodyRenderer.materials = mats;

            // Save selection
            PlayerPrefs.SetInt(BodyMatKey, materialIndex);
        }
        else
        {
            Debug.LogWarning($"Body material slot index {bodyMaterialIndex} is out of range.");
        }
    }

    public void ApplyRimsMaterial(int materialIndex)
    {
        if (rimRenderers == null || rimRenderers.Length == 0 || rimMaterials == null || rimMaterials.Length == 0)
        {
            Debug.LogWarning("Rim renderers or rim materials not assigned.");
            return;
        }

        if (materialIndex < 0 || materialIndex >= rimMaterials.Length)
        {
            Debug.LogWarning($"Invalid rim material index: {materialIndex}");
            return;
        }

        foreach (var rim in rimRenderers)
        {
            Material[] rimMats = rim.materials;

            if (rimMaterialIndex >= 0 && rimMaterialIndex < rimMats.Length)
            {
                rimMats[rimMaterialIndex] = rimMaterials[materialIndex];
                rim.materials = rimMats;
            }
            else
            {
                Debug.LogWarning($"Rim material slot index {rimMaterialIndex} is out of range.");
            }
        }

        // Save selection
        PlayerPrefs.SetInt(RimMatKey, materialIndex);
    }
}
