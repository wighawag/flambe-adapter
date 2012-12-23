package com.wighawag.asset.renderer.flambe;

import flambe.display.DrawingContext;
import flambe.platform.flash.FlashTexture;
import com.wighawag.asset.renderer.Renderer;
import com.wighawag.asset.spritesheet.TextureAtlas;

class FlambeBitmapRenderer extends flambe.platform.flash.BitmapRenderer, implements Renderer<DrawingContext, FlashTexture>{

	private var fillColor : Int;

    public function new(?fillColor : Int = -1) {
        super();
	    this.fillColor = fillColor;
    }

    public function lock() : DrawingContext{
        super.willRender();
	    _drawCtx.save();
	    if(fillColor > -1){
		    _drawCtx.fillRect(fillColor, 0,0, _screen.width, _screen.height);
	    }
	    return _drawCtx;
    }

    public function unlock() : Void{
	    _drawCtx.restore();
        super.didRender();
    }


    public function uploadTextures(textures : Array<FlashTexture>) : Void{

    }

    public function unloadTextures(textures : Array<FlashTexture>) : Void{
		// TODO
    }
}
