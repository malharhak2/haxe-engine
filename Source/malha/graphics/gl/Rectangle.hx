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

class Rectangle {
	public static function create (gl:Dynamic, x: Float, y: Float, width: Float, height: Float) {
		var vertexSource = 
			"attribute vec2 a_position;

			void main() {
			  gl_Position = vec4(a_position, 0, 1);
			}";
		
		var fragmentSource = 
			"void main() {
			  gl_FragColor = vec4(0,1,0,1);  // green
			}";

		var program:GLProgram = GLUtils.createProgram(vertexSource, fragmentSource);
		gl.useProgram (program);

		var positionLocation = gl.getAttribLocation (program, "a_position");

		var buffer = gl.createBuffer();
		gl.bindBuffer(gl.ARRAY_BUFFER, buffer);

		width = width * Game.unitSize.x;
		height = height * Game.unitSize.y;

		x = x * Game.unitSize.y;
		y = y * Game.unitSize.y;
		trace(x, y, width, height);
		gl.bufferData(
		    gl.ARRAY_BUFFER, 
		    new Float32Array([
		        x, y, 
		        x + width, y, 
		        x,  y + height, 
		        x,  y + height, 
		        x + width, y, 
		        x + width, y + height]), 
		    gl.STATIC_DRAW);

		gl.enableVertexAttribArray(positionLocation);
		gl.vertexAttribPointer(positionLocation, 2, gl.FLOAT, false, 0, 0);

		// draw
		gl.drawArrays(gl.TRIANGLES, 0, 6);
	}
}