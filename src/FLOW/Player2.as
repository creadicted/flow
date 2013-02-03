package FLOW 
{
	import libFlw.*;
	import org.flixel.*;
	/**
	 * Player-controlled entity
	 * @author Cody Sandahl
	 */
	public class Player2 extends flwEntity
	{
		public static const NAME:String = "Player 2";
		public function Player2(X:Number=100, Y:Number=100):void {
			super(X, Y);
			this.name = "Player 2";
			loadGraphic(
				Assets.CORPUSCLE2,
				true,
				false,
				flwEntity.SIZE.x,
				flwEntity.SIZE.y
			);
		}
		
		/**
		 * Check for user input to control this entity
		 */
		override protected function updateControls():void {
			super.updateControls();
			var movement:FlxPoint = new FlxPoint();
			if (FlxG.keys.pressed("LEFT"))
				movement.x -= 1;
			if (FlxG.keys.pressed("RIGHT"))
				movement.x += 1;
			if (FlxG.keys.pressed("UP"))
				movement.y -= 1;
			if (FlxG.keys.pressed("DOWN"))
				movement.y += 1;
				
			// check final movement direction
			if (movement.x < 0)
				moveLeft();
			else if (movement.x > 0)
				moveRight();
			if (movement.y < 0)
				moveUp();
			else if (movement.y > 0)
				moveDown();
		}
	}
}
