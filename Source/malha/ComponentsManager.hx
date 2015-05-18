package malha;
/**
	Components Manager class
	Statis class that holds all components of the game
**/

import malha.utils.GUID;
import haxe.ds.ObjectMap;

class ComponentsManager {

	private static var _components: ObjectMap<Dynamic, Map<String, Component>>;

	public static function createComponent (componentType:Class<Dynamic>) {
		var id: String = GUID.Create();
		var component: Component = Type.createInstance(componentType, [id]);

		var components_hash = _components.get(componentType);
		components_hash.set(id, component);
		return component;
	}

	public static function removeComponent (componentType:Class<Dynamic>, id:String) {
		var components_hash = _components.get(componentType);

		components_hash.remove(id);
	}
}