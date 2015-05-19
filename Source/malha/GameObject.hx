package malha;
/**
	GameObject class
	Not instantiated manually
**/
import haxe.ds.ObjectMap;

class GameObject {
	public var transform: Transform;
	
	private var _id: String;
	private var _components: ObjectMap<Dynamic, Array<String>>;
	

	public function new () {
		_components = new ObjectMap<Dynamic, Array<String>>();
		_id = GameObjectsManager.createGameObject(this);
		transform = new Transform();
	}

	public function destroy () {
		GameObjectsManager.destroyGameObject(this);
	}

	public function getId () {
		return _id;
	}
	
	public function addComponent(componentType:Class<Dynamic>) {
		var component: Component = ComponentsManager.createComponent(componentType);

		if (_components.get(componentType) == null) {
			var components_array = new Array();
			_components.set(componentType, components_array);

		} else {
			var components_array = _components.get(componentType);
			components_array.push(component.getId());
		}
		component.attach (this);
	}


}