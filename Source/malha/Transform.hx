package malha;
/**
	Transform class
	Contains the position of a gameObject and some functions to move it
	All gameObjects have one embedded
**/

import hxmath.math.Vector2;

class Transform {
	public var position: Vector2; // Local position

	/*
	 * The position of the gameObject after taking into account the parent's transform
	 **/
	private var _computedPosition: Vector2; // Onscreen position that takes into account parent position

	/*
	 * GameObjects can have a parent object - their position/rotation will be relative to the parent's ones
	 **/
	public var parent: Transform;

	public function new () {
		position = new Vector2(0, 0);
	}

	public function computeActualPosition () {
		if (parent != null) {
			_computedPosition = position + parent.position;
		} else {
			_computedPosition = new Vector2(position.x, position.y);
		}
	}
	/*
	 * Returns the object world position, taking into account the parent position
	 * @return position 	A position vector
	 * @todo: Keep this in cache and calculate it only once per frame
	 **/
	public function getActualPosition () : Vector2 {
		return _computedPosition;
	}
}