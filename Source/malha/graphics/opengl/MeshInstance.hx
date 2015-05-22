package malha.graphics.opengl;

import lime.graphics.GLRenderContext;
import lime.graphics.opengl.*;
import lime.math.Matrix4;

class MeshInstance {
	public var mvMatrix: Matrix4;

	public function new () {
		mvMatrix = new Matrix4();
	}
	public function loadMatrix (gl: GLRenderContext, projectionMatrix: GLUniformLocation, modelMatrix: GLUniformLocation) {
		Graphics.setMatrixUniforms(gl, mvMatrix, projectionMatrix, modelMatrix);
	}
}