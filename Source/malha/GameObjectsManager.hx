package malha;

import malha.utils.GUID;
import malha.GameObject;

/*
 * 		The GameObjectsManager holds all GameObjects of the game
 *		It contains functions for creating/destroying/getting objects
 **/
class GameObjectsManager {
	/*
	 * 		All gameObjects mapped by their IDs
	 **/
	private static var _gameObjects: Map<String, GameObject>;


	/*
	 * 		Adds a gameObject to the list of gameObjects, and returns the newly created id
	 * 		@param gameObject   	The object to add
	 *		@return id 				The object id
	 * 		Usage: The GameObject constructor takes care of doing that (DO NOT CALL MANUALLY)
	 **/
	public static function addGameObject (gameObject: GameObject) {
		var id: String = GUID.Create();
		_gameObjects.set(id, gameObject);
		return id;
	}

	/*
	 * 		Removes a gameObject from the list
	 * 		@param gameObject 		The object to remove
	 *		Usage: The GameObject Destroy takes care of doing that (DO NOT CALL MANUALLY)
	 **/
	public static function removeGameObject (gameObject: GameObject) {
		_gameObjects.remove(gameObject.id);
		// Todo: Destroy components
	}

	/*
	 * 	Static initializer for the _gameObjects list
	 **/
	static function __init__ () {
		_gameObjects = new Map<String, GameObject>();
	}
}