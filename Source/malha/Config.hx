package malha;

import hxmath.math.Vector2;

/*
 * Config holds static variables for the game's configuration
 **/
class Config {
	/*
	 * If this variable is true, the engine will calculate the unit size so that one unit = one pixel on screen
	 **/
	public static var usePixelUnit: Bool = true;
	/*
	 * If you don't use pixel perfect unit, you can specify a unit size here
	 **/
	public static var unitSize: Vector2 = new Vector2(1 / 100, 1 / 100);
}