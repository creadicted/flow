package libFlw 
{
import org.flixel.*;
	/**
	 * @author Florian Strieg
	 * @author Konrad Koch
	 */
	public class flxFx  extends FlxGroup
	{		
		private var bgEmitter:FlxEmitter;
		private var bgEmParticle:FlxParticle;
		private var bgImgEmitter:FlxEmitter;
		
		public function flxFx() 
		{
			
		}
		
		public function fxCreate
		
		// PARTICLES
			// Small Particles			
			bgEmitter = new FlxEmitter(0, 0, 200);
			bgEmitter.setXSpeed(0 , 10);
			bgEmitter.setYSpeed( 0, -200);
			bgEmitter.width = FlxG.width;
			bgEmitter.height = FlxG.height;
			bgEmitter.bounce = .8;
			bPartGroup.add(bgEmitter);
			for (var i:int = 0; i < bgEmitter.maxSize / 2; i++) {
				// create red particle
				bgEmParticle = new FlxParticle();
				bgEmParticle.makeGraphic(2, 2, 0xFFed1017);
				bgEmParticle.visible = false;
				bgEmitter.add(bgEmParticle);
				// create white particle
				bgEmParticle = new FlxParticle();
				bgEmParticle.makeGraphic(1, 1, 0xFFFFFFFF);
				bgEmParticle.visible = false;
				bgEmitter.add(bgEmParticle);
			}			
			bgEmitter.start(false, 3, .01);
			
			// Image Particles
			bgImgEmitter = new FlxEmitter(0, FlxG.height, 0);
			bgImgEmitter.makeParticles(Assets.BLODFLOW2,200,0,true,0);
			bgImgEmitter.width = FlxG.width;
			bgImgEmitter.setYSpeed(-230,-160);
			bgImgEmitter.setXSpeed();
			bgImgEmitter.setRotation();
			bgImgEmitter.start(false,0,0.1,0);
			bPartGroup.add(bgImgEmitter);
		
	}

}