package libFlw 
{
	/**
	 * @author Florian Strieg
	 * @author Konrad Koch
	 */
	import org.flixel.*;
	public class flwInterface extends FlxGroup
	{
		/*
		 * Objects
		 */
		// TEXT
		public var player1Score:FlxText;
		public var player2Score:FlxText;
		public var instructions:FlxText;
		public var penaltyCounter:Number = 0;
		public var status:FlxText;
		
		// GROUPS
		public var guiGroup:FlxGroup = new FlxGroup;
		
		// BUTTONS
		
		private var bMusic:Boolean = true;
		public function flwInterface() 
		{		
			add(guiGroup);
			init();
		}
		
		public function init():void 
		{
			var instructions:FlxText = new FlxText(0, 0, Registry.map.levelSize.x, "Use ARROW keys to move");
			instructions.alignment = "center";
			
			instructions.scrollFactor.y = instructions.scrollFactor.x = 0;
			
			status = new FlxText(50, 50, Registry.map.levelSize.x);
			status.alignment = "center";
			
			status.scrollFactor.y = status.scrollFactor.x = 0;
			player1Score = new FlxText(35, 10, Registry.map.levelSize.x, "Player 1: " + String(Registry.player1.getScore()));
			player1Score.alignment = "left";
			
			player1Score.scrollFactor.y = player1Score.scrollFactor.x = 0;
			
			if(Registry.iPlayers == 2){
				player2Score = new FlxText(35, 20,Registry.map.levelSize.x, "Player 2: " + String(Registry.player2.getScore()));
				player2Score.alignment = "left";
				
				player2Score.scrollFactor.y = player2Score.scrollFactor.x = 0;
				
				guiGroup.add(player2Score);
			}
			
			guiGroup.add(player1Score);
			guiGroup.add(status);
			guiGroup.add(instructions);		
		}
		
		override public function update():void
		{		
			if(FlxG.keys.justPressed("M"))
			{
				if (bMusic == true) 
				{
					FlxG.music.fadeOut(0.3, true); 
					bMusic = false; 
				}
				else {
					FlxG.music.fadeIn(0.3); 
					bMusic = true;
					}			
			}
		}
		
	}

}