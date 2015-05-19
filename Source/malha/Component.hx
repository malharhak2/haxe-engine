package malha;
/**
	Component class
	Serves as the base class for all future component.
	Components should inherit from this
	The user code should not create a component by hand. They are created by the ComponentManager
**/
import lime.graphics.RenderContext;

class Component {
	private var _id: String;
	public var gameObject: GameObject;

	public function new (id) {
		_id = id;
	}

	public function attach (gameObject: GameObject) {
		this.gameObject = gameObject;
	}

	public function destroy () {
		ComponentsManager.removeComponent(Type.getClass(this), _id);
	}

	public function getId ():String {
		return _id;
	}

	public function preUpdate () {

	}

	public function update () {

	}

	public function postUpdate () {

	}

	public function render (context:Dynamic, window: Dynamic, config: Dynamic) {

	}
}