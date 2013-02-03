package libFlw
{
	import org.flixel.*;
	public class flwCameraEntity extends FlxSprite
	{
		/**
		 * Constants
		 */
		public static const RUNSPEED:int = 250;
		public static const SIZE:FlxPoint = new FlxPoint(32, 32); // size in pixels

		
		/**
		 * Constructor
		 * @param	X	X location of the entity
		 * @param	Y	Y location of the entity
		 */
		public function flwCameraEntity(X:Number = 100, Y:Number = 100):void {
			super(X, Y);
			makeGraphic(SIZE.x, SIZE.y, 0x00FF0000); // use this if you want a generic box graphic by default
			// movement
			maxVelocity = new FlxPoint(RUNSPEED, RUNSPEED);
			drag = new FlxPoint(RUNSPEED * 4, RUNSPEED * 4); // decelerate to a stop within 1/4 of a second
			// animations
			acceleration.y = -RUNSPEED * 4;
		}

		/**
		 * Update each timestep
		 */
		public override function update():void {
			super.update();
		}
		
	}
}
