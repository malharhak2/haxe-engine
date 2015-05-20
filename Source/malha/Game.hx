package malha;

import hxmath.math.Vector2;

class Game {
	public static var window: Dynamic;
	public static var config: Dynamic;

	public static var screenWidth: Int;
	public static var screenHeight: Int;

	public static var unitSize: Vector2;

	public static function init(_window: Dynamic, _config:Dynamic) {
		window = _window;
		config = _config;
		screenWidth = window.width;
		screenHeight = window.height;

		if (Config.usePixelUnit) {
			unitSize = new Vector2(1 / screenWidth, 1 / screenHeight);
		} else {
			unitSize = Config.unitSize;
		}
	}
	
}