package com.wighawag.asset.renderer.flambe;

import flambe.display.DrawingContext;
import flambe.platform.flash.FlashTexture;
import com.wighawag.asset.renderer.Renderer;
import com.wighawag.asset.spritesheet.TextureAtlas;

class FlambeBitmapRenderer extends flambe.platform.flash.BitmapRenderer, implements Renderer<DrawingContext, FlashTexture>{
    public function new() {
        super();
    }

    public function lock() : DrawingContext{
        return super.willRender();
    }

    public function unlock() : Void{
        super.didRender();
    }


    public function uploadTextures(textures : Array<FlashTexture>) : Void{

    }

    public function unloadTextures(textures : Array<FlashTexture>) : Void{
		// TODO
    }
}
