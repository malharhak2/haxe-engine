package malha;

import hxmath.math.Vector2;

/*
 * The game class holds runtime game variable that need to be accessible in various part of the app
 **/
class Game {
	public static var initialized: Bool = false;

	/*
	 * HTML5 window context
	 **/
	public static var config: Dynamic;

	/*
	 * Screen width and height in pixels
	 **/
	public static var screenWidth: Int;
	public static var screenHeight: Int;

	/*
	 * The game unit size, which is used to project elements to the screen
	 **/
	public static var unitSize(default, null): Vector2;

	public static function get_unitSize() {
		return unitSize;
	}
	/*
	 * Called at the application start to initialize some dynamic variables
	 * @param 	_config 	Not sure what this is yet, passed by Lime
	 **/
	public static function init(_config:Dynamic) {
		trace("GAME INIT");
		config = _config;
		initialized = true;
	}

	public static function refreshUnitSize (width: Int, height: Int) {
		screenWidth = width;
		screenHeight = height;

		// Sets the unitSize depending on if we use pixel units or not
		if (Config.usePixelUnit) {
			unitSize = new Vector2(1 / screenWidth, 1 / screenHeight);
		} else {
			unitSize = Config.unitSize;
		}
	}
	
}