package com.example.appautobattlersw.engine.shaders;

import android.opengl.GLES20;

public class Shader
{
    private final static String vertcode =
            "attribute vec4 a_pos;"+
            "void main(){" +
            "gl_Position = a_pos;"+
            "}";
    private  final static String fragcode =
            "precision mediump float;"
            + "uniform vec4 u_color;"
            + "void main(){"
            + "gl_FragColor = u_color;"
            +"}";

    private static int program;
    public static int positionhandle;
    public static int colorhandle;


    public static void makeprogram()
    {
        int vertexhandler = loadshader(GLES20.GL_VERTEX_SHADER, vertcode);
        int fragmenthandler = loadshader(GLES20.GL_FRAGMENT_SHADER, fragcode);

        program = GLES20.glCreateProgram();
        GLES20.glAttachShader(program, vertexhandler);
        GLES20.glAttachShader(program, fragmenthandler);
        GLES20.glLinkProgram(program);

        positionhandle = GLES20.glGetAttribLocation(program, "a_pos");
        colorhandle = GLES20.glGetUniformLocation(program, "u_color");
        GLES20.glUseProgram(program);
    }

    private static int loadshader(int typeshader, String shadercode)
    {
        int shader = GLES20.glCreateShader(typeshader);
        GLES20.glShaderSource(shader, shadercode);
        GLES20.glCompileShader(shader);
        return shader;
    }
}
