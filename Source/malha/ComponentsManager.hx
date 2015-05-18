package malha;
/**
	Components Manager class
	Singleton class that holds all components of the game
**/

import malha.utils.GUID;
import haxe.ds.ObjectMap;

class ComponentsManager {

	private static var _components: ObjectMap<Dynamic, Map<String, Component>>;

	static function __init__ () {
		_components = new ObjectMap<Dynamic, Map<String, Component>>();
	}

	public static function createComponent (componentType:Class<Dynamic>) {
		var id: String = GUID.Create();
		var component: Component = Type.createInstance(componentType, [id]);

		trace('No components yet of type ', componentType);
		if (_components.get(componentType) == null) {
			_components.set(componentType, new Map<String, Component>());
		}
		var components_hash = _components.get(componentType);
		components_hash.set(id, component);
		return component;
	}

	public static function removeComponent (componentType:Class<Dynamic>, id:String) {
		var components_hash = _components.get(componentType);

		components_hash.remove(id);
	}

	public static function preUpdate () {
		for (components_hash in _components.iterator()) {
			for (component in components_hash.iterator()) {
				component.preUpdate();
			}
		}
	}

	public static function update () {
		for (components_hash in _components.iterator()) {
			for (component in components_hash.iterator()) {
				component.update();
			}
		}
	}
	
	public static function postUpdate () {
		for (components_hash in _components.iterator()) {
			for (component in components_hash.iterator()) {
				component.postUpdate();
			}
		}	
	}
}