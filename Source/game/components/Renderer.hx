package game.components;

import malha.Component;

import lime.graphics.RenderContext;
import lime.graphics.opengl.*;
import lime.graphics.Image;
import lime.math.Matrix4;
import lime.utils.Float32Array;
import lime.utils.GLUtils;
import lime.Assets;
import malha.graphics.gl.*;
import hxmath.math.Vector2;

class Renderer extends Component {

	public var width: Int = 10;
	public var height: Int = 10;
	public var pivot: Vector2;

	private var buffer:GLBuffer;
	private var matrixUniform:GLUniformLocation;
	private var program:GLProgram;
	private var texture:GLTexture;
	private var textureAttribute:Int;
	private var vertexAttribute:Int;

	public function new (id) {
		super(id);
		width = 10;
		height = 10;
		pivot = new Vector2(0.5, 0.5);
	}

	public override function render (context:Dynamic, window: Dynamic, config: Dynamic) {
		super.render(context, window, config);
		var position:Vector2 = gameObject.transform.getActualPosition();
		trace(pivot, position);
		position = position - new Vector2(pivot.x * width, pivot.y * height);

		switch (context) {
			case CANVAS (context):
				context.fillStyle = "blue";
				trace(position);
				context.fillRect(position.x, position.y, width, height);

			case OPENGL (gl):
				Rectangle.create(gl, position.x, position.y, width, height);
		default:
		}
	}
}