package malha.graphics.gl;

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
import lime.graphics.RenderContext;
import lime.utils.GLUtils;
import hxmath.math.Vector2;
import lime.utils.Float32Array;

class Rectangle extends Mesh {

	public var x:Float 		= 0; 
	public var y:Float 		= 0; 
	public var width:Float 	= 0; 
	public var height:Float = 0; 

	private static var vertexSource:String;
	private static var fragmentSource:String;
	private static var rectangle_shader:GLProgram;

	public override function new (gl:Dynamic) {
		if (rectangle_shader == null) {
			init();
		}
		var buffer = gl.createBuffer();
		var bufferContent:Float32Array = createBuffer();
		super(gl, rectangle_shader, buffer, bufferContent, gl.STATIC_DRAW, 6);
	}

	public function render (gl:Dynamic, _x: Float, _y: Float, _width: Float, _height: Float) {

		x = _x;
		y = _y;
		width = _width;
		height = _height;

		width = width * Game.unitSize.x;
		height = height * Game.unitSize.y;

		x = x * Game.unitSize.y;
		y = y * Game.unitSize.y;

		bufferContent = createBuffer();

		draw(gl);
	}
	private function createBuffer (): Float32Array {
		return new Float32Array([
		        x, y, 
		        x + width, y, 
		        x,  y + height, 
		        x,  y + height, 
		        x + width, y, 
		        x + width, y + height]);
	}

	private static function init () {
		vertexSource =
			"attribute vec2 a_position;

			void main() {
			  gl_Position = vec4(a_position, 0, 1);
			}";
		fragmentSource = 
			"void main() {
			  gl_FragColor = vec4(0,1,0,1);  // green
			}";

		rectangle_shader = GLUtils.createProgram(vertexSource, fragmentSource);
	}
}