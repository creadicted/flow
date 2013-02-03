package FLOW
{
	import flash.utils.ByteArray;
	/**
	 * Embeds and imports all assets for the game
	 * @author Konrad Koch
	 * @author Florian Strieg
	 */
	public class Assets
	{
		// particles
		[Embed(source = "../../assets/particles/blodflow2.png")] public static var BLODFLOW2:Class;
		
		// images
		[Embed(source = "../../assets/images/bg.png")] public static var VENEBACKGROUND:Class;		
		
		// sprites
		[Embed(source = "../../assets/sprites/corpuscle.png")] public static var CORPUSCLE:Class;	
		[Embed(source = "../../assets/sprites/corpuscleW.png")] public static var CORPUSCLE2:Class;		
		[Embed(source = "../../assets/sprites/dioxy01.png")] public static var DIOXY1:Class;
		[Embed(source = "../../assets/sprites/dioxy02.png")] public static var DIOXY2:Class;
		[Embed(source = "../../assets/sprites/dioxy03.png")] public static var DIOXY3:Class;
				
		// interface		
		[Embed(source = "../../assets/images/logo.png")] public static var LOGO:Class;
		[Embed(source = "../../assets/images/goal.png")] public static var GOAL:Class;
		[Embed(source = "../../assets/images/contrKeys.png")] public static var CONTRK:Class;
		[Embed(source = "../../assets/images/contrWasd.png")] public static var CONTRW:Class;

		// music
		[Embed(source="../../assets/music/themes.mp3")] static public var ThemeMusic:Class
		[Embed(source="../../assets/music/sounds/bubbles2.mp3")] static public var sdBubbels:Class;
		[Embed(source="../../assets/music/sounds/bubbles.mp3")] static public var sdDIE:Class;

		// level tiles		
		[Embed(source = "../../assets/tiles/lvlTile01.png")] static public var newMapTilesPNG:Class
		
		//maps
		// The maps are loaded inside of the level files to keep everything clean.
	}
}
