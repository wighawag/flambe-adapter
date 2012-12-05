package com.wighawag.asset.renderer;

import com.wighawag.asset.renderer.flambe.FlambeStage3DRenderer;
import nme.display.BitmapData;
import com.wighawag.asset.spritesheet.TextureAtlas;
import com.wighawag.asset.load.Batch;
import com.wighawag.asset.spritesheet.Sprite;
import flambe.display.DrawingContext;
import flambe.platform.flash.FlashTexture;

class FlambeSpriteRenderer  implements Renderer<NMEDrawingContext, TextureAtlas>{

    private var context : FlambeTextureAtlasDrawingContext;
    private var flambeRenderer : Renderer<DrawingContext, FlashTexture>;

    public function new(flambeRenderer : Renderer<DrawingContext, FlashTexture>) {
        context = new FlambeTextureAtlasDrawingContext();
        this.flambeRenderer = flambeRenderer;
    }

    public function uploadTextures(textures :Array<TextureAtlas>): Void{

        var texturesMap : Hash<FlashTexture> = new Hash();
        for (texture in textures){
            var bitmapAsset = texture.bitmapAsset;
            if (!texturesMap.exists(bitmapAsset.id)){
                var flashTexture = new FlashTexture(bitmapAsset.bitmapData);

                texturesMap.set(bitmapAsset.id, flashTexture);
            }
        }

        if (Std.is(flambeRenderer, FlambeStage3DRenderer)){
            var stage3DRenderer : FlambeStage3DRenderer = cast(flambeRenderer);
            for (flashTexture in texturesMap){
                stage3DRenderer.uploadTexture(flashTexture);
            }
        }

        context.setUploadedTextures(texturesMap);
    }

    public function unloadTextures(textures : Array<TextureAtlas>) : Void{
        // TODO
    }

    private var flambeContext : DrawingContext;
    // TODO implement lock mechanism
    public function lock():NMEDrawingContext {
        flambeContext = flambeRenderer.lock();
        context.setFlambeContext(flambeContext);
        flambeContext.save();
        return context;
    }

    public function unlock():Void {
        flambeContext.restore();
        flambeContext = null;
        flambeRenderer.unlock();
    }

}
