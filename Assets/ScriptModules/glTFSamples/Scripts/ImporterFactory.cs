using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class GltfSample{
    public string filePath;
    public float scale = 1;
}

public class ImporterFactory : MonoBehaviour
{
    public string rootPath;
    [Space(10)]
    public List<string> gltfTypes;
    [Space(10)]
    public List<GltfSample> gltfFiles;
    [Space(10)]
    public RuntimeImporter importerPrefab;
    List<RuntimeImporter> importers = new List<RuntimeImporter>();
    public float buttonWidth = 250;
    public float buttonHeight = 70;
    public float yGap = 5;
    GltfSample selectedAsset;
    GameObject currentGo;
    Vector2 scrollPos;

    void OnGUI() {
        float barWidth = Screen.width * 0.025f;
        GUI.skin.verticalScrollbar.fixedWidth = barWidth;
        GUI.skin.verticalScrollbarThumb.fixedWidth = barWidth;

        if(selectedAsset==null) {
            BeginScrollView(gltfFiles.Count,barWidth);
            TextureGUI(barWidth);
        } else {
            BeginScrollView(gltfTypes.Count,barWidth);
            GltfGUI(barWidth);
        }
        GUI.EndScrollView();
    }
    void BeginScrollView(int count, float barWidth) {
        scrollPos = GUI.BeginScrollView(
            new Rect(Screen.width-buttonWidth,0,buttonWidth,Screen.height),
            scrollPos,
            new Rect(0,0,buttonWidth-barWidth, (buttonHeight+yGap) * count)
        );
    }
    void TextureGUI(float barWidth) {
        float y = yGap;
        foreach(var f in gltfFiles) {
            if( GUI.Button( new Rect(0,y,buttonWidth-barWidth,buttonHeight),f.filePath)) {
                selectedAsset = f;
                scrollPos = Vector2.zero;
            }
            y += buttonHeight + yGap;
        }
    }
    void GltfGUI(float barWidth) {
        float y = yGap;
        if( GUI.Button( new Rect(0,y,buttonWidth-barWidth,buttonHeight),"choose different asset")) {
            scrollPos = Vector2.zero;
            selectedAsset = null;
        }
        y += buttonHeight + yGap;

        GUI.color = new Color(.5f,.5f,1);

        float aWidth = (buttonWidth-barWidth)/2;

        foreach(var type in gltfTypes) {
            if( GUI.Button( new Rect(0,y,buttonWidth-barWidth,buttonHeight),type)) {
                LoadAsset(selectedAsset.filePath+"/"+type);
            }
            y += buttonHeight + yGap;
        }
        GUI.color = new Color(1f,0,0);
        if( GUI.Button( new Rect(0,y,buttonWidth-barWidth,buttonHeight),"Pruge")) {
            Purge();
        }
    }
    public void LoadAsset(string path)
    {
        Debug.Log("Loading gltf @"+path);
        RuntimeImporter importer = Instantiate(importerPrefab);
        importer.Filepath = Application.streamingAssetsPath+"/"+rootPath+"/"+path;
        importer.gameObject.transform.parent = transform.parent;
        importer.gameObject.transform.localScale = Vector3.one*selectedAsset.scale;
        var sphereCollider = importer.gameObject.AddComponent<SphereCollider>();
        sphereCollider.radius = 1/selectedAsset.scale * 0.12f;
        importer.gameObject.AddComponent<TouchRotate>();
        importers.Add(importer);
    }
    public void Purge()
    {
        importers.ForEach((x) => Destroy(x.gameObject));
        importers.Clear();
    }
}
