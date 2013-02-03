package FLOW.level
{
	import mx.core.FlexSprite;
	import FLOW.Assets;
	import FLOW.Player;
	import FLOW.Player2;
	import FLOW.Collectable;
	import org.flixel.*;
	import libFlw.*;
	
	public class flwLvl1 extends flwLevel
	{
		// Custom Map Parameters:
		[Embed(source="../../../map/flwLevel1_Collision.csv",mimeType="application/octet-stream")]
		public static var CollisionCSV:Class;
		[Embed(source="../../../map/flwLevel1_Collectables.csv",mimeType="application/octet-stream")]
		public static var CollectCSV:Class;
		
		public static var LEVEL_SIZE:FlxPoint = new FlxPoint(320, 24000); // level size (in pixels)
		public static var BLOCK_SIZE:FlxPoint = new FlxPoint(32, 32); // block size (in pixels)		
		
		/**
		 * Vars
		 */
		private var bgEmitter:FlxEmitter;
		private var bgEmParticle:FlxParticle;
		private var bgImgEmitter:FlxEmitter;
		
		/**
		 * Constructor
		 * @param	state		State displaying the level
		 * @param	levelSize	Width and height of level (in pixels)
		 * @param	blockSize	Default width and height of each tile (in pixels)
		 */
		public function flwLvl1(state:FlxState):void
		{
			super(state, LEVEL_SIZE, BLOCK_SIZE);
		}
		
		/**
		 * Create the map (walls, decals, etc)
		 */
		override protected function createMap():void
		{
			// Load Collision Map:
			var tiles:FlxTilemap;
			tiles = new FlxTilemap();
			tiles.loadMap(new CollisionCSV, Assets.newMapTilesPNG, tileSize.x, tileSize.y);
			borderGroup.add(tiles);
			// Load Collectable
			parseBubbles(CollectCSV, Assets.DIOXY1, 15, 15);
			add(new FlxSprite(0, 0, Assets.GOAL));
			// objects
			createObjects();
			// sets background for the level
			var bgImage:FlxSprite = new FlxSprite(0, 0, Assets.VENEBACKGROUND);
			bgImage.scrollFactor.y = 0;
			bgImage.scrollFactor.x = 0;
			add(bgImage);			
			FlxG.playMusic(Assets.ThemeMusic, 0.35);
		}
		
		/**
		 * Add all the objects, obstacles, etc to the level
		 */
		protected function createObjects():void
		{
			// GOAL ZONE
			goal = new FlxSprite(0, 100);
			goal.makeGraphic(320, 32, 0x00ffff00);
			
			// BORDER
			upperBorder = new flwBorder(LEVEL_SIZE.y - 100, LEVEL_SIZE.x, tileSize.y);
			upperBorder.immovable = true;
			
			// PARTICLES
			// Small Particles			
			bgEmitter = new FlxEmitter(0, 0, 200);
			bgEmitter.setXSpeed(0, 10);
			bgEmitter.setYSpeed(0, -200);
			bgEmitter.width = FlxG.width;
			bgEmitter.height = FlxG.height;
			bgEmitter.bounce = .8;
			bPartGroup.add(bgEmitter);
			for (var i:int = 0; i < bgEmitter.maxSize / 2; i++)
			{
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
			bgImgEmitter.makeParticles(Assets.BLODFLOW2, 200, 0, true, 0);
			bgImgEmitter.width = FlxG.width;
			bgImgEmitter.setYSpeed(-230, -160);
			bgImgEmitter.setXSpeed();
			bgImgEmitter.setRotation();
			bgImgEmitter.start(false, 0, 0.1, 0);
			bPartGroup.add(bgImgEmitter);
		}
		
		/**
		 * Decide the order of the groups. They are rendered in the order they're added, so last added is always on top.
		 */
		override protected function addGroups():void
		{
			add(bPartGroup) // particles
			add(borderGroup); // collission	
			add(goal);
			add(upperBorder);
			add(bubbles);
		}
		
		/**
		 * Update each timestep
		 */
		override public function update():void
		{
			super.update();
			bgEmitter.y = focus.y - 200;
			bgImgEmitter.y = focus.y - 200;
		}
	}

}