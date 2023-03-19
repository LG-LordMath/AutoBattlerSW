package com.example.appautobattlersw.engine.renderengine;

import android.opengl.GLES11;
import android.opengl.GLES20;
import android.renderscript.Matrix4f;
import android.view.Display;

import com.example.appautobattlersw.MainActivity;

import javax.microedition.khronos.opengles.GL11;

public class MasterRenderer
{

    public static final float FOV = 70;
    public static final float NEAR_PLANE = 0.1f;
    public static final float FAR_PLANE = 1000;
    public static final float RED = 0f;
    public static final float GREEN = 0f;
    public static final float BLUE = 0f;




    public  MasterRenderer()
    {
    enableCulling();

    }



    public static void enableCulling()
    {
        GLES11.glEnable(GLES11.GL_CULL_FACE);
        GLES11.glCullFace(GLES11.GL_BACK);
    }
    public static void disableCulling()
    {
        GLES11.glDisable(GLES11.GL_CULL_FACE);

    }
}
