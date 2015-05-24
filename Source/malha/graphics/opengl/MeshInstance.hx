package malha.graphics.opengl;

import lime.graphics.GLRenderContext;
import lime.graphics.opengl.*;
import lime.math.Matrix4;

class MeshInstance {
	public var mvMatrix: Matrix4;
	private var meshInstances: Array<MeshInstance>;

	public function new (_meshInstances:Array <MeshInstance>) {
		mvMatrix = new Matrix4();
		meshInstances = _meshInstances;
	}

	public function destroy () {
		meshInstances.splice(meshInstances.indexOf(this), 1);
	}
	
	public function loadMatrix (gl: GLRenderContext, projectionMatrix: GLUniformLocation, modelMatrix: GLUniformLocation) {
		Graphics.setMatrixUniforms(gl, mvMatrix, projectionMatrix, modelMatrix);
	}
}