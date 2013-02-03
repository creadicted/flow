package libFlw
{
	import FLOW.Collectable;
	import FLOW.Player;
	import FLOW.Player2;
	import FLOW.screens.*;
	import FLOW.Assets;
	import org.flixel.*;
	
	/**
	 * The Level Class that is used as a blueprint for all the other levels
	 * @author Konrad Koch
	 * @author Florian Strieg
	 */
	public class flwLevel extends FlxGroup
	{
		/**
		 * Map
		 */
		public var state:FlxState; // state displaying the level
		public var levelSize:FlxPoint; // width and height of level (in pixels)
		public var tileSize:FlxPoint; // default width and height of each tile (in pixels)
		public var numTiles:FlxPoint; // how many tiles are in this level (width and height)
		
		public var backgroundGroup:FlxGroup; // floor (rendered beneath the walls - no collisions)
		public var borderGroup:FlxGroup; // all the map blocks (with collisions)
		public var focus:flwCameraEntity // camera follows this object

		public var status:FlxText;
		public var goal:FlxSprite;
		public var upperBorder:FlxSprite;
		
		protected var bPartGroup:FlxGroup = new FlxGroup;
		
		public var collectableMap:FlxTilemap = new FlxTilemap();
		
		// collectables
		public var bubble:Collectable;		
		public var bubbles:FlxGroup;
		
		/**
		 * Constructor
		 * @param	state		State displaying the level
		 * @param	levelSize	Width and height of level (in pixels)
		 * @param	tileSize	Size of tiles (in pixels)
		 */
		public function flwLevel(state:FlxState, levelSize:FlxPoint, tileSize:FlxPoint):void
		{
			super();
			this.state = state;
			this.levelSize = levelSize;
			this.tileSize = tileSize;
			if (levelSize && tileSize)
			{
				this.numTiles = new FlxPoint(Math.floor(levelSize.x / tileSize.x), Math.floor(levelSize.y / tileSize.y));
			}
			// setup groups
			this.backgroundGroup = new FlxGroup();
			this.borderGroup = new FlxGroup();
			this.bubbles = new FlxGroup();
			// create the leveldd
			this.create();
		}
		
		/**
		 * Create the whole level, including all sprites, maps, blocks, etc
		 */
		public function create():void
		{
			createMap();
			addGroups();
			createCamera();
		}
		
		protected function createMap():void
		{
		
		}
		
		/**
		 * CreateCollectable
		 * @param	x 	Position of Collectable
		 * @param	y 	Position of Collectable
		 * @param	png Image Asset of Collectable
		 */
		protected function createCollectable(x:int, y:int, png:Class):void
		{
			bubble = new Collectable(x, y, png);
			bubbles.add(bubble);
			add(bubble);
		}
		
		/**
		 * Decide the order of the groups. They are rendered in the order they're added, so last added is always on top.
		 */
		protected function addGroups():void
		{
			add(backgroundGroup);
			add(borderGroup);
			add(upperBorder);
			add(bubbles);
		}
		
		/**
		 * Create the default camera for this level
		 */
		protected function createCamera():void
		{
			FlxG.worldBounds = new FlxRect(0, 0, levelSize.x, levelSize.y);
			FlxG.camera.setBounds(0, 0, levelSize.x, levelSize.y, true);
			
			focus = new flwCameraEntity(160, levelSize.y - 100);
			add(focus);
			FlxG.camera.follow(focus, FlxCamera.STYLE_TOPDOWN);
		}
		
		/**
		 * @return focus.y
		 */
		public function getCameraY():Number
		{
			return this.focus.y;
		}
		
		/**
		 * Update each timestep
		 */
		override public function update():void
		{
			super.update();
			// collision with borders
			FlxG.collide(borderGroup, Registry.player1);
			if (Registry.iPlayers == 2)
				FlxG.collide(borderGroup, Registry.player2);
			// collission between players
			if (Registry.iPlayers == 2)
				FlxG.collide(Registry.player1, Registry.player2);
			// sets win situation
			FlxG.overlap(goal, Registry.player1, win);
			if (Registry.iPlayers == 2)
				FlxG.overlap(goal, Registry.player2, win);
			// limits the player movement to the screen
			FlxG.collide(Registry.player1, upperBorder);
			if (Registry.iPlayers == 2)
				FlxG.collide(Registry.player2, upperBorder);
			
			if (Registry.iPlayers == 2)
			{
				// gets coin
				FlxG.overlap(bubbles, Registry.player2, getCoin);
				Registry.gui.penaltyCounter += FlxG.elapsed;
				// sets penalty
				if (!Registry.player2.onScreen() && Registry.gui.penaltyCounter >= 1)
					penalty(Registry.player2);
			}
			// gets coin
			FlxG.overlap(bubbles, Registry.player1, getCoin);
			Registry.gui.penaltyCounter += FlxG.elapsed;
			// sets penalty
			if (!Registry.player1.onScreen() && Registry.gui.penaltyCounter >= 1)
				penalty(Registry.player1);
		}
		
		public function penalty(activePlayer:flwEntity):void
		{
			activePlayer.y = activePlayer.y - 200;
			activePlayer.x = 160;
			while (activePlayer.overlaps(borderGroup))
			{
				activePlayer.y = activePlayer.y - 50;
				activePlayer.x = 160;
			}
			activePlayer.decreaseScore(50);
			Registry.gui.player1Score.text = "Player 1: " + String(Registry.player1.getScore());
			if (Registry.iPlayers == 2)
				Registry.gui.player2Score.text = "Player 2: " + String(Registry.player2.getScore());
			FlxG.play(Assets.sdDIE, 1.0, false, true);
		}
		
		/**
		 * Called whenever the player touches a collectable
		 * @param	collectable		which collectable was touched
		 * @param	activePlayer	by which player
		 */
		public function getCoin(collectable:FlxSprite, activePlayer:FlxSprite):void
		{
			flwEntity(activePlayer).addScore(10);
			Registry.gui.player1Score.text = "Player 1: " + String(Registry.player1.getScore());
			if (Registry.iPlayers == 2)
				Registry.gui.player2Score.text = "Player 2: " + String(Registry.player2.getScore());
			FlxG.play(Assets.sdBubbels, 0.1, false, true);
			collectable.kill();
		}
		
		/**
		 * Parse the collectables
		 * @param	_CSVMap			Define the CSV Map
		 * @param	_aCollectable	
		 * @param	_X
		 * @param	_Y
		 */
		public function parseBubbles(_CSVMap:Class, _aCollectable:Class, _X:int, _Y:int):void
		{
			//	collectableMap.loadMap(new CollectCSV, Assets.DIOXY1, 15, 15);
			collectableMap.loadMap(new _CSVMap, _aCollectable, _X, _Y);
			
			for (var ty:int = 0; ty < collectableMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < collectableMap.widthInTiles; tx++)
				{
					if (collectableMap.getTile(tx, ty) == 1)
					{
						bubbles.add(new Collectable(tx, ty, Assets.DIOXY1));
					}
				}
			}
		
		}
		
		//Called whenever the player touches the exit
		public function win(Exit:FlxSprite, activePlayer:FlxSprite):void
		{
			flwEntity(activePlayer).addScore(50);
			Registry.gui.player1Score.text = "Player 1: " + String(Registry.player1.getScore());
			if (Registry.iPlayers == 2)
				Registry.gui.player2Score.text = "Player 2: " + String(Registry.player2.getScore());
			if (Registry.iPlayers == 2)
			{
				if (Registry.player1.getScore() > Registry.player2.getScore())
					status.text = "Player 1, you won!";
				if (Registry.player1.getScore() < Registry.player2.getScore())
					status.text = "Player 2, you won!";
				if (Registry.player1.getScore() == Registry.player2.getScore())
					status.text = "Draw!";
			}
			if (Registry.iPlayers == 1)
			{
				if (Registry.player1.getScore() > 0)
					status.text = "Not bad!";
				else
					status.text = "You can do better!";
			}
			Registry.player1.kill();
			if (Registry.iPlayers == 2)
				Registry.player1.kill();
			FlxG.fade(0xff000000, 1, onFade);
		}
		
		public function onFade():void
		{
			FlxG.switchState(new EndState);
		}
	}
}
