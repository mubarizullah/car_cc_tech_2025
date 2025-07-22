using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class CarStatsUI : MonoBehaviour
{
    public Text carNameText;
    public Image carLogo;
    public Text priceText;
    public Text powerText;
    public Text topSpeedText;
    public Text weightText;
    public Text brakingText;
    public Text adsToUnlockText;

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
