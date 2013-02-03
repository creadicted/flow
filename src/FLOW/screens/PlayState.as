package FLOW.screens
{
	import FLOW.Player;
	import FLOW.Player2;
	import libFlw.*;
	import FLOW.level.*;
	import org.flixel.*;

	/**
	 * State to Play the Game
	 * @author Cody Sandahl
	 */
	public class PlayState extends FlxState
	{
		public function PlayState() {
			
		}
		
		/**
		 * Create state
		 */
		override public function create():void {
			FlxG.mouse.hide();
			FlxG.framerate = 60;
			
			// adds map			
			Registry.map = new flwLvl1(this);
			this.add(Registry.map);
			// creates players
			Registry.player1 = new Player(160, Registry.map.levelSize.y - 100);
			this.add(Registry.player1);			
			if (Registry.iPlayers == 2) 
			{
				Registry.player2 = new Player2(120, Registry.map.levelSize.y - 100)
				this.add(Registry.player2);
			}		
			// adds interface
			Registry.gui = new flwInterface;
			this.add(Registry.gui);
		}
	}
}
