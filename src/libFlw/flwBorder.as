package libFlw
{
	import org.flixel.*;
	public class flwBorder extends FlxSprite
	{
		/**
		 * Constants
		 */
		public var level:flwLevel
		
		/**
		 * flwBorder
		 * @param	y 		startposition of the border
		 * @param	width	
		 * @param 	height	
		 */
		public function flwBorder(y:Number, width:Number, height:Number):void {
			super(0, y - 410);
			makeGraphic(width, height, 0x00FFFF00); 
		}

		/**
		 * Update each timestep
		 */
		public override function update():void {
			super.update();
			this.y = Registry.map.getCameraY()-225;
		}
		
	}
}
