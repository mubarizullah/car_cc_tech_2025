using UnityEngine;
using UnityEngine.UI;

public class InappHandler : MonoBehaviour
{
    [Space(5)]
    [Header("Buttons")]
    public Button unlockAllCars_1;
    public Button unlockAllCars_2;
    public Button addMoreCoins;
    public Button backInappCars;
    public Button backInappCoins;
    [Space(5)]
    [Header("Buttons")]
    public GameObject unlockAllCarsPanel;
    public GameObject moreMoneyPanel;
    [Space(5)]
    [Header("Refrence")]
    public CarSelection carSelection;


    private void Start()
    {
        unlockAllCars_1.onClick.AddListener(OnUnlockCarsInappClicked);
        unlockAllCars_2.onClick.AddListener(OnUnlockCarsInappClicked);
        addMoreCoins.onClick.AddListener(OnMoreMoneyInappClicked);
        backInappCars.onClick.AddListener(PanelsBack);
        backInappCoins.onClick.AddListener(PanelsBack);

    }
    void OnUnlockCarsInappClicked()
    {
        //carSelection.DestroyCurrentCar();
        moreMoneyPanel.SetActive(false);
        unlockAllCarsPanel.SetActive(true);
    } 
    void OnMoreMoneyInappClicked()
    {
        //carSelection.DestroyCurrentCar();
        unlockAllCarsPanel.SetActive(false);
        moreMoneyPanel.SetActive(true);
    }
    void PanelsBack()
    {
        carSelection.SpawnCar();
        moreMoneyPanel.SetActive(false);
        unlockAllCarsPanel.SetActive(false);
    }
    
}
