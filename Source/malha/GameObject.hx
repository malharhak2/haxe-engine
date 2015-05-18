package malha;
/**
	GameObject class
	Not instantiated manually
**/
import haxe.ds.ObjectMap;

class GameObject {
	private var _components: ObjectMap<Dynamic, Array<String>>;

	public var transform: Transform;

	public function new () {

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
	}

}