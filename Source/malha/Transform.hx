package malha;
/**
	Transform class
	Contains the position of a gameObject and some functions to move it
	All gameObjects have one
**/

import hxmath.math.Vector2;

class Transform {
	public var position: Vector2; // Local position
	private var _computedPosition: Vector2; // Onscreen position that takes into account parent position

	public var parent: Transform;

	public function new () {
		position = new Vector2(0, 0);
	}
	public function getActualPosition () : Vector2 {
		if (parent != null) {
			_computedPosition = position + parent.position;
			return _computedPosition;
		} else {
			return position;
		}
	}
}