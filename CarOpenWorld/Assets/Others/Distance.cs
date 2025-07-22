using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Distance : MonoBehaviour
{
    // Start is called before the first frame update
    private Vector3 _lastposition;
    private float _totaldistance;
    public Text text; 
    void Start()
    {
        _lastposition = transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        float distance = Vector3.Distance(_lastposition, transform.position);
        _totaldistance += distance;
        _lastposition = transform.position;
        text.text = _totaldistance.ToString("");

        print(_totaldistance);
    }
}
