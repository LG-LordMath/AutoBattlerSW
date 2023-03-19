package com.example.appautobattlersw.engine.renderengine;

import android.opengl.*;

import com.example.appautobattlersw.engine.shaders.Shader;
import com.example.appautobattlersw.engine.shapes.Square;
import com.example.appautobattlersw.engine.shapes.Triangle;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

public class Renderer implements  GLSurfaceView.Renderer

{


    private FloatBuffer vertbuffer;

    @Override
    public void onSurfaceCreated(GL10 gl10, EGLConfig eglConfig) {
        Shader.makeprogram();
        GLES20.glEnableVertexAttribArray(Shader.positionhandle);
        float[] verts =
        {
                0.0f, 0.0f, 1.0f,
                0.0f, 1.0f, 0.0f,
                1.0f, 1.0f, 0.0f,
        };
    vertbuffer = makefloatbuffer(verts);


    }




    @Override
    public void onSurfaceChanged(GL10 gl10, int width, int height)
    {
        GLES20.glViewport(0,0, width, height);
    }

    @Override
    public void onDrawFrame(GL10 gl10)
    {
        GLES20.glClearColor(1.0f, 1.0f , 1.0f, 1.0f);
        GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT | GLES20.GL_DEPTH_BUFFER_BIT);
        GLES20.glUniform4f(Shader.colorhandle, 1.0f, 0.0f, 0.0f, 1.0f);
        GLES20.glVertexAttribPointer(Shader.positionhandle, 3, GLES20.GL_FLOAT, false, 0, vertbuffer);
        GLES20.glDrawArrays(GLES20.GL_TRIANGLES, 0,  3);

    }

    public  FloatBuffer makefloatbuffer(float[] verts)
    {
        FloatBuffer floatbuff = ByteBuffer.allocateDirect(verts.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        floatbuff.put(verts).position();
        return  floatbuff;
    }

}
