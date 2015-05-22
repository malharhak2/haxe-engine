package malha.graphics.opengl;

/*
 *	OpenGL Rectangle class
 *	A static class holding a rectangle function for renderers
 *	Usage: Rendering.create (gl, x, y, width, height)
 *	@param gl 		The OpenGL rendering context
 * 	@param x		The X position
 *	@param y		The Y position
 * 	@param width	The width of the rectangle
 * 	@param height	The height of the rectangle
 *	@todo Temporary code for testing renderers
 **/
import lime.graphics.opengl.*;
import lime.graphics.GLRenderContext;
import lime.utils.GLUtils;
import hxmath.math.Vector2;
import lime.math.Vector4;
import lime.utils.Float32Array;

class Rectangle extends Mesh {

	public var width:Float 	= 0; 
	public var height:Float = 0; 

	public var color:Vector4;
	private var colorAttribute: GLUniformLocation;

	private static var vertexSource:String;
	private static var fragmentSource:String;
	private static var rectangle_shader:GLProgram;

	public override function new (gl:GLRenderContext, _width: Float, _height: Float, _color:Vector4) {
		if (rectangle_shader == null) {
			init();
		}
		width = _width * Game.unitSize.x;
		height = _height * Game.unitSize.y;
		color = _color;
		
		var vertex_buffer_content: Float32Array = createVertexPositions()
		var vertex_color_content: Float32Array = createColorValues();

		super(gl, rectangle_shader, buffer, vertex_buffer_content, color_buffer_content, gl.STATIC_DRAW, 6);
	}

	public function render (gl:GLRenderContext, _x: Float, _y: Float) {

		pre_draw(gl);

		post_draw(gl);
	}
	private function createVertexPositions (): Float32Array {
		var demiWidth:Float = width / 2;
		var demiHeight: Float = height / 2;
		var buffer:Float32Array = new Float32Array([
		        -demiWidth, -demiHeight, 0
		        demiWidth, -demiHeight, 0
		        -demiWidth,  demiHeight, 0
		        -demiWidth,  demiHeight, 0
		        demiWidth, -demiHeight, 0
		        demiWidth, demiHeight, 0
		 ]);
		return buffer;
	}
	private function createColorValues (): Float32Array {
		var demiWidth:Float = width / 2;
		var demiHeight: Float = height / 2;
		var buffer:Float32Array = new Float32Array([
		        1, 1, 1, 0,
		        1, 1, 1, 0,
		        1, 1, 1, 0,
		        1, 1, 1, 0,
		        1, 1, 1, 0,
		        1, 1, 1, 0
		 ]);
		return buffer;
	}

	private static function init () {
		vertexSource =
			"attribute vec3 a_position;
			attribute vec4 a_color
			uniform mat4 uMVMatrix;
			uniform mat4 uPMatrix;

			void main() {
			  gl_Position = uMVMatrix * vec4(a_position, 1);
			  v_color = a_color;
			}";
		fragmentSource = 
			"precision mediump float;

			varying vec4 v_color;

			void main() {
			  gl_FragColor = v_color;  // green
			}";

		rectangle_shader = GLUtils.createProgram(vertexSource, fragmentSource);
	}
}