package FLOW 
{
	import libFlw.*;
	import org.flixel.*;
	/**
	 * Player-controlled entity
	 * @author Cody Sandahl
	 */
	public class Player extends flwEntity
	{
		public function Player(X:Number=100, Y:Number=100):void {
			super(X, Y);
			this.name = "Player 1";
			loadGraphic(
				Assets.CORPUSCLE,
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
			if (FlxG.keys.pressed("A"))
				movement.x -= 1;
			if (FlxG.keys.pressed("D"))
				movement.x += 1;
			if (FlxG.keys.pressed("W"))
				movement.y -= 1;
			if (FlxG.keys.pressed("S"))
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
