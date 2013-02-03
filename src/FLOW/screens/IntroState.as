package FLOW.screens 
{
	import flash.filters.DropShadowFilter;
	import org.flixel.*;
	import FLOW.Assets;
	public class IntroState  extends FlxState
	{
		public function IntroState() {
			
		}
		
		override public function create():void
		{					
			add(new FlxSprite(100, 80, Assets.LOGO));
			
			var orb:FlxSprite = new FlxSprite;
			orb.loadGraphic(Assets.DIOXY1, true, false, 16, 16)
			this.add(orb);
			orb.x = 100;
			var torb:FlxText;
			torb = new FlxText(130,0,FlxG.width,"Collect orbs to win");
			torb.color = 0xFFFFFF;
			add(torb);
			
			var tMute:FlxText;
			tMute = new FlxText(130,0,FlxG.width,"Press M to mute the music");
			tMute.color = 0xFFFFFF;
			add(tMute);
			
			if (Registry.iPlayers >= 1) {			
				add(new FlxSprite(55, 160, Assets.CONTRW));
				var whitCop:FlxSprite = new FlxSprite;
				whitCop.loadGraphic(Assets.CORPUSCLE, true, false, 32, 32)
				this.add(whitCop);
				whitCop.x = 200;
				whitCop.y = 200;
				
				var t1:FlxText;
				t1 = new FlxText(203,185,FlxG.width,"Moby");
				t1.color = 0xFFFFFF;
				add(t1);
				
				orb.y = 280;
				tMute.y = 300;
				torb.y = 280;
				
			}
			
			if (Registry.iPlayers >= 2) {
				add(new FlxSprite(55, 270, Assets.CONTRK));
				var redCop:FlxSprite = new FlxSprite;
				redCop.loadGraphic(Assets.CORPUSCLE2, true, false, 32, 32)
				this.add(redCop);
				redCop.x = 200;
				redCop.y = 300;			
				
				var t1:FlxText;
				t1 = new FlxText(200,285,FlxG.width,"Frank");
				t1.color = 0xFFFFFF;
				add(t1);
				
				orb.y = 380;
				tMute.y = 400;
				torb.y = 380;
			}
			
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
			FlxG.switchState(new PlayState());
		}
		
	}

}