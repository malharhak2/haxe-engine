package malha.graphics.opengl;

import lime.graphics.opengl.*;
import lime.math.Matrix4;
import lime.graphics.GLRenderContext;

class Graphics {
	public static var glContext: Dynamic;
	private static var pMatrix: Matrix4;

	public static function init (_gl: Dynamic) {
		glContext = _gl;
	}

	public static function setProjection (width: Int, height: Int) {
		pMatrix = Matrix4.createOrtho (0, width, height, 0, -1000, 1000);
	}
	public static function setMatrixUniforms (gl: GLRenderContext, mvMatrix: Matrix4, projectionUniform: GLUniformLocation, modelUniform: GLUniformLocation) {
		if (gl != null) {
			gl.uniformMatrix4fv(projectionUniform, false, pMatrix);
			gl.uniformMatrix4fv(modelUniform, false, mvMatrix);
		}
	}
}