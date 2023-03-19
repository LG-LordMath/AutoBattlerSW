package com.example.appautobattlersw;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.os.Bundle;
import android.opengl.*;

import com.example.appautobattlersw.engine.renderengine.Renderer;


public class MainActivity extends Activity {

    private GLSurfaceView surface;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        surface = new GLSurfaceView(this);
        surface.setEGLContextClientVersion(2);
        surface.setRenderer(new Renderer());
        setContentView(surface);

    }


    public void onPause() {
        super.onPause();
        surface.onPause();
    }
    public  void onResume() {

        super.onResume();
        surface.onResume();
    }

}