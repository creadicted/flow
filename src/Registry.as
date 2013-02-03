package  
{
	/**
	 * @author Konrad Koch
	 * @author Florian Strieg
	 * "one to rule them all" - Container for overall game variables
	 */

	import libFlw.*;
    import org.flixel.*;	
	import FLOW.*;
	
	public class Registry 
	{
		public static var iPlayers:int;			// saves the ammount of players
		
	    public static var stage:FlxState;		// the active game stage
		public static var player1:Player;		// the currently selected first player
		public static var player2:Player2;		// the currently selected second player
		public static var map:flwLevel;			// the currently selected map
		public static var gui:flwInterface;
				
		/**
		 * Constructor
		 */
		public function Registry():void
		{
			
		}
		
		public static function erase():void
		{
			iPlayers = null;			
			player1 = null;
			player2 = null;
			map = null;
			gui = null;
		}
	}
}