package com.example.appautobattlersw.engine.renderengine.models;

import com.example.appautobattlersw.engine.renderengine.ModelTexture;

public class TexturedModel {
    private RawModel rawModel;
    private ModelTexture texture;
    private boolean ifCalling = false;

    public TexturedModel(RawModel model, ModelTexture texture){
        this.rawModel = model;
        this.texture = texture;
    }


    public TexturedModel(RawModel model, ModelTexture texture, boolean ifCalling){
        this.rawModel = model;
        this.texture = texture;
        this.ifCalling = ifCalling;
    }

    public RawModel getRawModel() {
        return rawModel;
    }

    public ModelTexture getTexture() {
        return texture;
    }
    public boolean isIfCalling() {
        return ifCalling;
    }
}
