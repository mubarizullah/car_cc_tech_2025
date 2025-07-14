using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RespwanOnRoad : MonoBehaviour
{
	// Start is called before the first frame update
	public void BtnResetCar()
	{
		
			GameObject.FindGameObjectWithTag("Player").GetComponent<RCC_CarControllerV3>().ResetRobot();
		
	}
}
