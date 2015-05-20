package game.components;

import malha.Component;

import hxmath.math.Vector2;

class Shaky extends Component {
	public var shakeStrength: Int = 10;

	public function new (id) {
		super(id);
		shakeStrength = 10;
	}

	public override function update () {
		gameObject.transform.position += new Vector2(
			Math.random() * shakeStrength - shakeStrength / 2,
			Math.random() * shakeStrength - shakeStrength / 2);
	}
}