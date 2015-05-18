package malha;
/**
	Component class
	Serves as the base class for all future component.
	Components should inherit from this
	The user code should not create a component by hand. They are created by the ComponentManager
**/

class Component {
	private var _id: String;

	public function new (id) {
		_id = id;
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
}