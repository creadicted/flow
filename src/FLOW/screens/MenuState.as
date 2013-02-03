package FLOW.screens 
{
	import flash.filters.DropShadowFilter;
	import org.flixel.*;
	import FLOW.Assets;
	public class MenuState extends FlxState
	{
		public var tPlayers:FlxText;
		public var blinkTimer:Number;
		
		override public function create():void
		{			
			
			FlxG.mouse.show();
			add(new FlxSprite(100, 80, Assets.LOGO));
			
			var t:FlxText;
			t = new FlxText(0,120,FlxG.width,"This game was created during the GGJ2013");
			t.alignment = "center";
			t.color = 0xFFFFFF;
			add(t);
			
			tPlayers = new FlxText(0,200,FlxG.width,"HOW MANY PLAYERS?");
			tPlayers.alignment = "center";
			tPlayers.color = 0xFFFFFF;
			tPlayers.size = 14
			add(tPlayers);
			
			
			var t1:FlxText;
			t1 = new FlxText(87,245,FlxG.width,"1 Player");
			t1.color = 0xFFFFFF;
			add(t1);
			
			
			var t1:FlxText;
			t1 = new FlxText(87,300,FlxG.width,"Press W");
			t1.color = 0xFFFFFF;
			add(t1);
			
			var t1:FlxText;
			t1 = new FlxText(188,245,FlxG.width,"2 Player");
			t1.color = 0xFFFFFF;
			add(t1);
			
			
			var t2:FlxText;
			t2 = new FlxText(188,300,FlxG.width,"Press S");
			t2.color = 0xFFFFFF;
			add(t2);
			
			var Cop1:FlxSprite = new FlxSprite;
			Cop1.loadGraphic(Assets.CORPUSCLE, true, false, 32, 32)
			this.add(Cop1);	
						
			
			var Cop2:FlxSprite = new FlxSprite;
			Cop2.loadGraphic(Assets.CORPUSCLE2, true, false, 32, 32)
			this.add(Cop2);
			
			var Cop3:FlxSprite = new FlxSprite;
			Cop3.loadGraphic(Assets.CORPUSCLE, true, false, 32, 32)
			this.add(Cop3);	
			
			Cop1.y = Cop2.y = Cop3.y = 260;
			Cop1.x = 90;
			Cop2.x = 180;
			Cop3.x = 200;
			
			blinkTimer = 0;

		}
		
		override public function update():void
		{
			super.update();

			if(FlxG.keys.justPressed("W"))
			{
				FlxG.fade(0xff000000,1,onFade);
				tPlayers.exists = false;
				Registry.iPlayers = 1				
			}
			
			if(FlxG.keys.justPressed("S"))
			{
				FlxG.fade(0xff000000,1,onFade);
				tPlayers.exists = false;	
				Registry.iPlayers = 2;
			}
			
			
			if(tPlayers.exists)
			{
				blinkTimer += FlxG.elapsed;
				if(blinkTimer - int(blinkTimer) < 0.2)
					tPlayers.visible = false;
				else
					tPlayers.visible = true;
			}
		}
		
		public function onFade():void
		{
			FlxG.switchState(new IntroState);
		}
		
		public function MenuState() 
		{
			
		}
		
	}

}