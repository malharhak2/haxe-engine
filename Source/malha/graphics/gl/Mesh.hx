package malha.graphics.gl;
/*
 * 	OpenGL Mesh class
 *	A class holding the mesh data for a single element
 * 	To be inherited by actual meshes
 **/

import lime.utils.Float32Array;
import lime.graphics.opengl.*;


 class Mesh {
 	private var program:GLProgram;
 	private var buffer:GLBuffer;
 	private var vertexCount: Int;
 	private var bufferContent: Float32Array;

 	public function new (gl: Dynamic, program:GLProgram, buffer:GLBuffer, bufferContent: Float32Array, drawMode, vertexCount: Int) {
 		this.program = program;
 		this.buffer = buffer;
 		this.vertexCount = vertexCount;
 		this.bufferContent = bufferContent;

 		gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
 		gl.bufferData(
 			gl.ARRAY_BUFFER,
 			bufferContent,
 			drawMode);
 	}

 	public function draw (gl: Dynamic) {
 		
 		gl.useProgram(program);

 		var positionLocation = gl.getAttribLocation (program, "a_position");
 		gl.bindBuffer(gl.ARRAY_BUFFER, buffer);

 		gl.enableVertexAttribArray(positionLocation);
 		gl.vertexAttribPointer(positionLocation, 2, gl.FLOAT, false, 0, 0);

 		gl.drawArrays(gl.TRIANGLES, 0, vertexCount);
 	}
 }