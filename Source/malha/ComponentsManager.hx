package malha;
/**
	Components Manager class
	Singleton class that holds all components of the game
	Should not be used manually - Is used by component and game objects
**/

import malha.utils.GUID;
import haxe.ds.ObjectMap;
import lime.graphics.RenderContext;
import malha.GameObjectsManager;

class ComponentsManager {

	// Holds all the game's components
	// There is one map per component type, indexed by unique IDs
	private static var _components: ObjectMap<Dynamic, Map<String, Component>>;

	// Initializer for the static class at program start
	static function __init__ () {
		_components = new ObjectMap<Dynamic, Map<String, Component>>();
	}

	/*
	 *  	Creates a new component
	 *  	Usage: ComponentsManager.createComponent(MyComponentClass); 
	 *		@param componentType The component class
	 * 		@return component The component instance
	 **/
	public static function createComponent (componentType:Class<Dynamic>) {
		var id: String = GUID.Create(); // Unique ID for the component
		var component: Component = Type.createInstance(componentType, [id]);

		if (_components.get(componentType) == null) {
			trace('No components yet of type ', componentType);
			_components.set(componentType, new Map<String, Component>());
		}
		var components_hash = _components.get(componentType);
		components_hash.set(id, component);
		return component;
	}

	/*
	 *		Gets all components of a type for a list of ids
	 *		Usage: ComponentsManager.getComponents(MyComponentClass, myComponentIds);
	 *		@param 	componentType 	The component class
	 * 		@param 	ids 			A list of component ids
	 *		@return components 		An array of components found (might be empty or null)
	 **/
	public static function getComponents (componentType:Class<Dynamic>, ids: Array<String>): Array<Component> {
		var components_hash = _components.get(componentType);
		if (components_hash == null) {
			return null;
		} else {
			var result = new Array<Component>();
			for (id in ids) {
				if (components_hash.get(id) != null) {
					result.push(components_hash.get(id));
				}
			}
			return result;
		}
	}

	/*
	 * 		Gets a component
	 *		Usage: ComponentsManager.getComponent(MyComponentClass, myId);
	 *		@param 	componentType 	The component class
	 *		@param 	id 				The component id
	 *		@return component 		The component found or null
	 **/
	public static function getComponent (componentType:Class<Dynamic>, id:String): Component {
		var components_hash = _components.get(componentType);
		if (components_hash == null) {
			return null;
		} else {
			return components_hash.get(id);
		}
	}

	/*
	 * 		Removes a component
	 *		Usage: ComponentsManager.removeComponent(MyComponentClass, myId);
	 *		@param componentType 	The component class
	 *		@param id 				The component id
	 * 		@return true if component has been successfully removed
	 **/
	public static function removeComponent (componentType:Class<Dynamic>, id:String): Bool {
		var components_hash = _components.get(componentType);
		if (components_hash == null) {
			return false;
		} else {
			return components_hash.remove(id);
		}
	}

	/*
	 * 		function called each frame by the engine, before any update function
	 * 		Calls the same function for each component in the game
	 **/
	public static function preUpdate () {
		for (gameObject in GameObjectsManager._gameObjects) {
			 gameObject.transform.computeActualPosition();
		}
		for (components_hash in _components.iterator()) {
			for (component in components_hash.iterator()) {
				component.preUpdate();
			}
		}
	}

	/*
	 * 		function called each frame by the engine, before any physics operations
	 * 		Calls the same function for each component in the game
	 *		Most of the game's update code should reside in here
	 **/
	public static function update () {
		for (components_hash in _components.iterator()) {
			for (component in components_hash.iterator()) {
				component.update();
			}
		}
	}
	
	/*
	 * 		function called each frame by the engine, after all physics operations and update
	 * 		Calls the same function for each component in the game
	 * 		Should be called if you need some stuff done after everything
	 **/
	public static function postUpdate () {
		for (components_hash in _components.iterator()) {
			for (component in components_hash.iterator()) {
				component.postUpdate();
			}
		}	
	}

	/*
	 * 		function called each frame by the engine, after everything else, to draw on the screen
	 * 		Calls the same function for each component in the game
	 * 		Components that have a special render logic should override this
	 *		@param context The rendering context (openGL, canvas...)
	 **/
	public static function render (context: Dynamic, window: Dynamic, config: Dynamic) {
		for (components_hash in _components.iterator()) {
			for (component in components_hash.iterator()) {
				component.render(context, window, config);
			}
		}	
	}

}