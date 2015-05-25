package malha.graphics.opengl;

import lime.graphics.opengl.*;
import lime.graphics.GLRenderContext;
import lime.utils.GLUtils;
import lime.math.Vector2;
import lime.math.Vector4;
import lime.utils.Float32Array;
import lime.graphics.Image;
import lime.Assets;

class Image extends Mesh {
	public var width: Float = 0;
	public var height: Float = 0;
	public var imagePath:String;

	private var image: Image;
	private var texture: GLTexture;
	private var texture_attribute: Int;
	private var image_uniform: GLUniformLocation;

	private static var vertexSource:String;
	private static var fragmentSource:String;
	private static var image_shader: GLProgram;

	public override function new (gl:GLRenderContext, _width: Float, _height: Float, _imagePath: String) {
		width = _width;
		height = _height;
		imagePath = _imagePath;

		image = Assets.getImage( "assets/" + imagePath);

		var vertex_buffer_content: Float32Array = createVertexPositions();

		super(gl, image_shader, vertex_buffer_content, gl.STATIC_DRAW, 6);

		texture_attribute = gl.getAttribLocation()
	}

	private function createVertexPositions (): Float32Array {
		var demiWidth:Float = width / 2;
		var demiHeight: Float = height / 2;
		var buffer:Float32Array = new Float32Array([
		        -demiWidth, -demiHeight, 0,
		        demiWidth, -demiHeight, 0,
		        -demiWidth,  demiHeight, 0,
		        -demiWidth,  demiHeight, 0,
		        demiWidth, -demiHeight, 0,
		        demiWidth, demiHeight, 0
		 ]);
		return buffer;
	}
	
	private static function init () {
		vertexSource = 
			"attribute vec3 a_position;
			attribute vec2 a_tex_coord;

			varying vec2 v_tex_coord;

			uniform mat4 uMVMatrix;
			uniform mat4 uPMatrix;

			void main(void) {
				v_tex_coord = a_tex_coord;
				gl_Position = uMVMatrix * vec4(a_position, 1);
			}";

		fragmentSource =
			#if !desktop
			"precision mediump float;" +
			#end
			"varying vec2 v_tex_coord;
			uniform sampler2D u_image0;

			void main (void) {
				gl_FragColor = texture2D (u_image0, v_tex_coord);
			}";
		image_shader = GLUtils.createProgram(vertexSource, fragmentSource);
	}
}