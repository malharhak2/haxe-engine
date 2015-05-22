package malha.graphics.opengl;
/*
 * 	OpenGL Mesh class
 *	A class holding the mesh data for a single element
 * 	To be inherited by actual meshes
 **/

import lime.utils.Float32Array;
import lime.graphics.opengl.*;
import lime.math.Matrix4;
import lime.graphics.GLRenderContext;

class Mesh {
 	private var program:GLProgram;

 	private var vertex_buffer: GLBuffer;
 	private var vertex_count: Int;
 	private var vertex_position_attribute: GLUniformLocation;

 	private var color_buffer: GLBuffer;
 	private var vertex_color_attribute: GLUniformLocation;

 	private var projectionMatrixUniform:GLUniformLocation;
 	private var modelMatrixUniform:GLUniformLocation;

 	private var meshInstances:Array<MeshInstance>;

 	public function new (gl: GLRenderContext, program:GLProgram, vertex_buffer_content: Float32Array, color_buffer_content: Float32Array, drawMode, vertexCount: Int) {
 		this.program = program;
 		vertex_buffer = gl.createBuffer();
 		color_buffer = gl.createBuffer();

 		gl.bindBuffer(gl.ARRAY_BUFFER, vertex_buffer);
 		gl.bufferData(
 			gl.ARRAY_BUFFER,
 			vertex_buffer_content,
 			drawMode);

 		gl.bindBuffer(gl.ARRAY_BUFFER, color_buffer);
 		gl.bufferData(
 			gl.ARRAY_BUFFER,
 			color_buffer_content,
 			drawMode);

 		this.vertexCount = vertexCount;

		vertex_position_attribute = gl.getAttribLocation (program, "a_position");
		vertex_color_attribute = gl.getAttribLocation(program, "a_color");

 		projectionMatrixUniform = gl.getUniformLocation(program, "uPMatrix");
 		modelMatrixUniform = gl.getUniformLocation(program, "uMVMatrix");

 		gl.enableVertexAttribArray(vertex_position_attribute);
 		gl.enableVertexAttribArray(vertex_color_attribute);

 	}
 	public function instantiate () {
 		var instance:MeshInstance = new MeshInstance(meshInstances);
 		meshInstances.push(instance);
 		return instance;
 	}

 	public function pre_draw (gl: GLRenderContext) {
 		
 		gl.useProgram(program);
 		gl.bindBuffer(gl.ARRAY_BUFFER, vertex_buffer);
 		gl.vertexAttribPointer(vertex_position_attribute, 3, gl.FLOAT, false, 0, 0);

 		gl.bindBuffer(gl.ARRAY_BUFFER, color_buffer);
 		gl.vertexAttribPointer(vertex_color_attribute, 4, gl.FLOAT, false, 0, 0);

 	}
 	public function post_draw (gl: GLRenderContext) {

 		for (i in 0 ... meshInstances.length) {
 			meshInstances[i].loadMatrix(gl, projectionMatrixUniform, modelMatrixUniform);
	 		gl.drawArrays(gl.TRIANGLES, 0, vertexCount);
 		}
 	}
 }