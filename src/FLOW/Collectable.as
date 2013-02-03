package FLOW 
{
	import org.flixel.*;
	
	/**
	 * A collectable object in the game
	 * @author Florian Strieg
	 * @author Konrad Koch
	 */
	public class Collectable extends FlxSprite
	{		
		/**
		* Creates Collectables
		* @param X 			Position
		* @param Y 			Position
		* @param PNG 		Image Asset
		* @param bAnimate	defines if animated, default = false	
		* @param lenght		lengh of the sprite
		*/
		public function Collectable(X:Number, Y:Number, PNG:Class):void {
			super(X * 16, Y * 16, PNG);
		}
		
		/**
		 * Update each timestep
		 */
		public override function update():void {
			super.update();
		}
		
	}
}