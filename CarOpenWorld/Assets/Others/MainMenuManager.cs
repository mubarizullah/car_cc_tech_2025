using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
public class MainMenuManager : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject ModesTraffic;
    public GameObject ModesWithOutTraffic;
    public GameObject ModesCheckPoint;
    public GameObject[] Prices;
    public GameObject[] Cars;
    
    void Start()
    {
       
        PlayersCar(PlayerPrefs.GetInt("Cars"));
      //  Coins.text = PlayerPrefs.GetInt("PlayerCoins").ToString();
       // CoinsM.text = PlayerPrefs.GetInt("PlayerCoins").ToString();
       // CoinsL.text = PlayerPrefs.GetInt("PlayerCoins").ToString();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void ModeTraffic()
    {
        SceneManager.LoadScene(1);
    }
    public void WithOutModeTraffic()
    {
        SceneManager.LoadScene(2);
    }
    public void CheckpointMode()
    {
        SceneManager.LoadScene(3);
    }

    public void PlayersCar(int snp)
    {
        for (int i = 0; i < Cars.Length; i++)
        {
            Cars[i].SetActive(false);
        }

        Cars[snp].SetActive(true);
        //assign coins
        //Coins.text = PlayerPrefs.GetInt("PlayerCoins").ToString();
        //CoinsM.text = PlayerPrefs.GetInt("PlayerCoins").ToString();
       // CoinsL.text = PlayerPrefs.GetInt("PlayerCoins").ToString();
    }
}
