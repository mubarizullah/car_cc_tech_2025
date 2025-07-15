using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class CarStatsUI : MonoBehaviour
{
    public TMP_Text carNameText;
    public Image carLogo;
    public TMP_Text priceText;
    public TMP_Text powerText;
    public TMP_Text topSpeedText;
    public TMP_Text weightText;
    public TMP_Text brakingText;
    public TMP_Text adsToUnlockText;

    public void UpdateStats(CarData car)
    {
        carNameText.text = car.CarName;
        carLogo.sprite = car.carLogo;
        priceText.text = car.carPrice == 0 ? "Free" : car.carPrice.ToString();
        powerText.text = car.power.ToString();
        topSpeedText.text = car.topSpeed.ToString();
        weightText.text = car.weightInKg.ToString();
        brakingText.text = car.brakingForce.ToString();
        adsToUnlockText.text =  car.adsToUnlock.ToString();
    }
}
