using System;
using System.Collections;
using System.Collections.Generic;
using Siccity.GLTFUtility;
using UnityEngine;

public class RuntimeImporter : MonoBehaviour
{
    private string filepath;
    public string Filepath { get => filepath; set => filepath = value; }
    float startLoad;
    void Start()
    {
        ImportGLTFAsync();
    }
    public void ImportGLTFAsync() 
    {
        startLoad = Time.time;
        Importer.LoadFromFileAsync(Filepath, new ImportSettings(), OnFinishAsync, onProgress);
    }
    private void onProgress(float progress)
    {
        Debug.LogFormat("Loading {0}: {1}",filepath,progress);
    }
    private void OnFinishAsync(GameObject result, AnimationClip[] animations)
    {
        Debug.LogFormat("Finished importing: {0} in {1}s",result.name,Time.time-startLoad);
        result.transform.SetParent(gameObject.transform,false);
    }
    public void Delete()
    {
        Destroy(gameObject);
    }
}
