package malha;
/**
	GameObject class
	All elements of the game should be game objects
	Game objects hold a transform, which is their position/rotation
	They also have components, which are single elements of gameplay/logics that you can add to objects.
**/
import haxe.ds.ObjectMap;

class GameObject {
	/*
	 * Contains the position/rotation of the object
	 **/
	public var transform: Transform;
	/*
	 * Unique id - Readable, non-writable
	 **/
	public var id(default, null): String;
	/*
	 * Contain the ids of the components linked to this object
	 **/
	private var _components: ObjectMap<Dynamic, Array<String>>;
	
	/*
	 *		Creates a new empty game object
	 * 		usage: new GameObject();
	 **/
	public function new () {
		_components = new ObjectMap<Dynamic, Array<String>>();
		id = GameObjectsManager.addGameObject(this);
		transform = new Transform();
	}

	/*
	 * 	Destroys the game object
	 * 	Usage: gameObject.destroy();
	 **/
	public function destroy () {
		GameObjectsManager.removeGameObject(this);
	}

	/**
	 * 	Gets the object id
	 * 	@return id The id string
	 */
	public function get_id () {
		return id;
	}
	
	/**
	 * Creates and adds a component to this gameObject
	 * @param componentType 	The class of the component to create
	 */
	public function addComponent(componentType:Class<Dynamic>) {
		var component: Component = ComponentsManager.createComponent(componentType);

		if (_components.get(componentType) == null) {
			var components_array = new Array();
			_components.set(componentType, components_array);

		} else {
			var components_array = _components.get(componentType);
			components_array.push(component.id);
		}
		component.attach (this);
	}

	/*
	 * Gets the first component of a type for this object
	 * If there are multiple components of the same type attached, it will return the first one
	 * See getComponents for getting all the components of a type
	 * @param componentType 	The component class
	 * @return component 		The component found (or null)
	 **/
	public function getComponent (componentType: Class<Dynamic>) {
		var components_array: Array<String> = _components.get(componentType);
		if (components_array != null) {
			return ComponentsManager.getComponent(componentType, components_array[0]);
		} else {
			return null;
		}
	}

	/*
	 * Gets all components of a type for this object
	 * @param componentType 		The component class
	 * @return components_array 	An array containing all components found (can be empty or null)
	 **/
	public function getComponents (componentType: Class<Dynamic>) {
		var components_array: Array<String> = _components.get(componentType);
		if (components_array != null) {
			return ComponentsManager.getComponents(componentType, components_array);
		} else {
			return null;
		}
	}
}