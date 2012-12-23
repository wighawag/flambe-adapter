package com.wighawag.asset.renderer.flambe;
import flambe.display.DrawingContext;
import flambe.platform.flash.FlashTexture;
import com.wighawag.asset.renderer.Renderer;
import com.wighawag.asset.spritesheet.TextureAtlas;

class FlambeStage3DRenderer extends flambe.platform.flash.Stage3DRenderer, implements Renderer<DrawingContext, FlashTexture>{
    public function new() {
        super();
    }

    public function lock() : DrawingContext{
        super.willRender();
	    _drawCtx.save();
	    return _drawCtx;
    }

    public function unlock() : Void{
	    _drawCtx.restore();
        super.didRender();
    }

    public function uploadTextures(textures : Array<FlashTexture>) : Void{
        for (texture in textures){
            uploadTexture(texture);
        }
    }

    public function unloadTextures(textures : Array<FlashTexture>) : Void{
        // TODO
    }
}
