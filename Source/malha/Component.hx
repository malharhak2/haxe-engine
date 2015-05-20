package malha;
/**
	Component class
	Serves as the base class for all future component.
	Components are reusable elements of gameplay/logic that can be embedded in gameObjects

	User-created Components should inherit from this class
	The user code should not create a component by hand. They are created by the ComponentManager

	To create a component, create a new class (usually in the components folder) -
	ex: class Renderer extends Component {
	
	}

	Then to add a component to an object:
	gameObject.addComponent(Renderer);
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