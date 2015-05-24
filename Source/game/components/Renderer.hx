package game.components;

import malha.Component;
import malha.Game;
import lime.graphics.RenderContext;
import lime.graphics.opengl.*;
import lime.graphics.Image;
import lime.math.Matrix4;
import lime.utils.Float32Array;
import lime.utils.GLUtils;
import lime.Assets;
import malha.graphics.opengl.*;
import hxmath.math.Vector2;
import lime.math.Vector4;


class Renderer extends Component {

	public var width: Int = 10;
	public var height: Int = 10;
	public var color: Vector4;
	public var pivot: Vector2;
	private var mesh: Rectangle;
	private var meshInstance: MeshInstance;

	public function new (id) {
		super(id);
		width = 10;
		height = 10;
		color = new Vector4(
			Math.random(), Math.random(), Math.random(), Math.random()
		);
		pivot = new Vector2(0.5, 0.5);
	}

	public override function render (context:Dynamic, window: Dynamic, config: Dynamic) {
		super.render(context, window, config);
		var position:Vector2 = gameObject.transform.computedPosition;
		position = position - new Vector2(pivot.x * width, pivot.y * height);
		position.x = position.x * Game.unitSize.x;
		position.y = position.y * Game.unitSize.y;
		
		switch (context) {
			case CANVAS (context):
				context.fillStyle = "blue";
				context.fillRect(position.x, position.y, width, height);

			case OPENGL (gl):
				if (mesh == null) {
					mesh = new Rectangle(gl, width, height, color);
					meshInstance = mesh.instantiate();
				}
				meshInstance.mvMatrix.identity();
				meshInstance.mvMatrix.appendTranslation(position.x, position.y, 0);
				mesh.render(gl, position.x, position.y);
		default:
		}
	}
}