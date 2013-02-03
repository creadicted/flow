package
{
	import org.flixel.*;
	import FLOW.screens.*;

	[SWF(width="320", height="500", backgroundColor="#ffffff")]
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame
	{
		/**
		 * Constructor
		 */
		public function Main() {
			super(320, 500, MenuState, 1);
		}
	}
}
