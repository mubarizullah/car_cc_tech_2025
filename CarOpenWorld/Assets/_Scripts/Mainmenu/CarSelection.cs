using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CarSelection : MonoBehaviour
{
    [Header("Class Refrences")]
    public CarStatsUI carStatsUI;

    [Space(5)]
    [Header("Cars Data")]
    CarData[] allCars;

    [Space(5)]
    [Header("Buttons")]
    public Button leftButton;
    public Button rightButton;
    public Button playButtonVisuals;
    public Button buyButtonVisuals;
    public Button rewardWatchButton;
    public Button backInappPanelForMoreCoins;
    public Button customizationButton;
    public Button exitButton;

    [Space(5)]
    [Header("Refrences")]
    public Transform carSpawnPoint;
    public GameObject lockVisual;
    public GameObject carPriceVisuals;
    public GameObject inappPanelForMoreCoins;
    public GameObject garagePanel;
    public GameObject levelPanel;
    public GameObject carSelectionUI;
    public GameObject customizationnUI;

    public int currentCarIndex = 0;

    public static event System.Action<int> OnCarIndexChanged;


    private GameObject currentCar;

    private Dictionary<string, int> adWatchCounts = new();


    void Start()
    {
        allCars = CarsDataHolder.Instance.Cars;

        leftButton.onClick.AddListener(OnLeftClick);
        rightButton.onClick.AddListener(OnRightClick);
        playButtonVisuals.onClick.AddListener(OnPlayButtonClicked);
        buyButtonVisuals.onClick.AddListener(OnBuyButtonClicked);
        backInappPanelForMoreCoins.onClick.AddListener(BackFromInapp);
        rewardWatchButton.onClick.AddListener(OnRewardAdWatched);
        customizationButton.onClick.AddListener(OnCustomization);
        exitButton.onClick.AddListener(OnExit);
        SpawnCar();
    }

    void OnLeftClick()
    {
        currentCarIndex--;
        if (currentCarIndex < 0) currentCarIndex = allCars.Length - 1;
        SpawnCar();
        OnCarIndexChanged?.Invoke(currentCarIndex);
    }

    void OnRightClick()
    {
        currentCarIndex++;
        if (currentCarIndex >= allCars.Length) currentCarIndex = 0;
        SpawnCar();
        OnCarIndexChanged?.Invoke(currentCarIndex);
    }


    public void SpawnCar()
    {
        if (currentCar != null)
            Destroy(currentCar);

        currentCar = Instantiate(allCars[currentCarIndex].carPrefab, carSpawnPoint.position, carSpawnPoint.rotation);
        Update_UI();
    }

    void Update_UI()
    {

        carStatsUI.UpdateStats(allCars[currentCarIndex]);
        CarData car = allCars[currentCarIndex];

        // Check if the car is unlocked by default or by player progress
        bool isUnlocked = car.preUnlocked || PlayerData.Instance.IsCarUnlocked(car.CarName);

        if (isUnlocked)
        {
            lockVisual.SetActive(false);
            playButtonVisuals.gameObject.SetActive(true);
            carPriceVisuals.SetActive(false);
            rewardWatchButton.gameObject.SetActive(false);
        }
        else
        {
            lockVisual.SetActive(true);
            playButtonVisuals.gameObject.SetActive(false);
            carPriceVisuals.SetActive(true);
            rewardWatchButton.gameObject.SetActive(true);
        }

        if (!car.preUnlocked && !isUnlocked)
        {
            buyButtonVisuals.gameObject.SetActive(true);
        }
        else
        {
            buyButtonVisuals.gameObject.SetActive(false);
        }
    }
    //ON PLAY BUTTON CLICKED
    void OnPlayButtonClicked()
    {
        // Save selected car index
        PlayerPrefs.SetInt(PlayerPrefsKeys.SelectedCarIndex, currentCarIndex);
        PlayerPrefs.Save();

        if (PlayerManager.Instance)
        {
            PlayerManager.Instance.selectedCarIndex = currentCarIndex;
        }
        
        garagePanel.SetActive(false);
        DestroyCurrentCar();
        levelPanel.SetActive(true);

        // You could also log or trigger other logic here
        Debug.Log("Selected Car Index Saved: " + currentCarIndex);
    }


    //ON BUY BUTTON CLICKED
    void OnBuyButtonClicked()
    {
        CarData car = allCars[currentCarIndex];
        if (car.carPrice <= PlayerManager.Instance.totalCoins)
        {
            PlayerData.Instance.UnlockCar(car.CarName);
        }
        else
        {
            //inapp panel for having more coins
            inappPanelForMoreCoins.SetActive(true);
            DestroyCurrentCar();
        }
    }


    //ON REWARD AD BUTTON CLICKED
    public void OnRewardAdWatched()
    {
        CarData car = allCars[currentCarIndex];
        string carName = car.CarName;

        if (!adWatchCounts.ContainsKey(carName))
        {
            adWatchCounts[carName] = 0;
        }

        adWatchCounts[carName]++;
        int adsWatched = adWatchCounts[carName];

        Debug.Log($"Ads watched for {carName}: {adsWatched}/{car.adsToUnlock}");

        if (adsWatched >= car.adsToUnlock)
        {
            PlayerData.Instance.UnlockCar(carName);
        }

        Update_UI();
    }


    void OnCustomization()
    {
        carSelectionUI.SetActive(false);
        customizationnUI.SetActive(true);
    }


    public void DestroyCurrentCar()
    {
        if (currentCar != null)
        {
            Destroy(currentCar);
        }
        else
        {
            Debug.LogError("Car is present so it can't be destroyed");
        }
    }

    void BackFromInapp()
    {
        inappPanelForMoreCoins.SetActive(false);
        SpawnCar();
    }

    void OnExit()
    {
        Application.Quit();
    }

}
