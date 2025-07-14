using System;
using UnityEngine;

[Serializable]
public class CarData
{
    public string CarName;
    public Sprite carLogo;
    public bool preUnlocked;
    public GameObject carPrefab;           // The visual prefab of the car
    public int carPrice;                   // The price in game currency
    public int adsToUnlock;                // How many reward ads needed to unlock
    public float power;                    // Acceleration or engine power (e.g., in HP or arbitrary units)
    public float topSpeed;                 // Top speed in km/h or in-game units
    public float weightInKg;               // Car's weight
    public float brakingForce;             // Braking power (higher means better brakes)
    
}
