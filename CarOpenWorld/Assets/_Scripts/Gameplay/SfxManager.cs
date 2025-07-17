using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SfxManager : MonoBehaviour
{
    public AudioClip spraySound;

    public static SfxManager Instance;

    private void Awake()
    {
        Instance = this;
    }

    public void PlaySfxSound(AudioClip clip,float volume = 1f)
    {
        GameObject gb = new GameObject();
        AudioSource aSource = gb.AddComponent<AudioSource>();
        aSource.clip = clip;
        aSource.volume = volume;
        Destroy(aSource,clip.length);
    }
}
