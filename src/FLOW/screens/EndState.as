package FLOW.screens 
{
	import flash.filters.DropShadowFilter;
	import org.flixel.*;
	import FLOW.Assets;
	public class EndState  extends FlxState
	{
		public var tPlayers:FlxText;
		
		override public function create():void
		{			
			add(new FlxSprite(100, 80, Assets.LOGO));
			
			var t:FlxText;
			t = new FlxText(0,120,FlxG.width,"This game was created during the GGJ2013");
			t.alignment = "center";
			t.color = 0xFFFFFF;
			add(t);
			
			t = new FlxText(0,200,FlxG.width,"Konrad Koch, Florian Strieg, Tony Schulz, Mesut Kaya");
			t.alignment = "center";
			t.color = 0xFFFFFF;
			add(t);
			
			
			var t1:FlxText;
			t1 = new FlxText(0,410,FlxG.width,"Press SPACE to start");
			t1.alignment = "center";
			t1.size = 12;
			t1.color = 0xFFFFFF;
			add(t1);
		}
		
		override public function update():void
		{
			super.update();
			if(FlxG.keys.justPressed("SPACE"))
			{
				FlxG.mouse.hide();
				FlxG.fade(0xff000000,1,onFade);	
			}
		}
						
		public function onFade():void
		{
			FlxG.switchState(new MenuState());
		}
		
		public function EndState()
		{
		}
	}

}