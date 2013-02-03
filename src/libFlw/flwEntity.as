package libFlw
{
	import org.flixel.*;
	
	/**
	 * A moveable object in the game
	 * @author  Cody Sandahl
	 */
	public class flwEntity extends FlxSprite
	{
		private var score:int = 0;
		public var name:String;
		
		/**
		 * Constants
		 */
		public static const RUNSPEED:int = 350;
		public static const SIZE:FlxPoint = new FlxPoint(32, 32); // size in pixels

		
		/**
		 * Constructor
		 * @param	X	X location of the entity
		 * @param	Y	Y location of the entity
		 */
		public function flwEntity(X:Number = 100, Y:Number = 100):void {
			super(X, Y);
			makeGraphic(SIZE.x, SIZE.y, 0xFFFF0000); // use this if you want a generic box graphic by default
			// movement
			maxVelocity = new FlxPoint(RUNSPEED, RUNSPEED);
			drag = new FlxPoint(RUNSPEED * 4, RUNSPEED * 4); // decelerate to a stop within 1/4 of a second
			// animations
		
			createAnimations();
		}
	

		/**
		 * Create the animations for this entity
		 * NOTE: these will be different if your art is different
		 */
		protected function createAnimations():void {
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7,8,9,10], 6, true);
		}

		/**
		 * Update each timestep
		 */
		public override function update():void {
			updateControls();
			updateAnimations();
			super.update();
		}
		
		protected function updateAnimations():void {
			var absX:Number = Math.abs(velocity.x);
			var absY:Number = Math.abs(velocity.y);
			play("idle");
		}
		
		/**
		 * Check keyboard/mouse controls
		 */
		protected function updateControls():void {
			acceleration.x = acceleration.y = 0; // no gravity or drag by default
		}
		
		/**
		 * Move entity left
		 */
		public function moveLeft():void {
			facing = LEFT;
			acceleration.x = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move entity right
		 */
		public function moveRight():void {
			facing = RIGHT;
			acceleration.x = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move entity up
		 */
		public function moveUp():void {
			facing = UP;
			acceleration.y = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		/**
		 * Move playe rdown
		 */
		public function moveDown():void {
			facing = DOWN;
			acceleration.y = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
		}
		
		public function getScore():int {
			return this.score;
		}
		
		public function addScore(points:int):void {
			this.score = this.score + points;
		}
		
		public function decreaseScore(points:int):void {
			this.score = this.score - points;
		}
	}
}
