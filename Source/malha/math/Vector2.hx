package malha.math;
/**
	Vector2 class
**/

class Vector2 {
	public var x: Int;
	public var y: Int;

	public function new (?x: Int, ?y: Int, ?source: Vector2) {
		if (source == null) {
			this.x = x;
			this.y = y;
		} else {
			this.x = source.x;
			this.y = source.y;
		}
	}

	@:op(A + B)
	public function add (v2:Vector2): Vector2 {
		return new Vector2 (x + v2.x, y + v2.y);
	}

}