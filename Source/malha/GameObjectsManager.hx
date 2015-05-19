package malha;

import malha.utils.GUID;
import malha.GameObject;

class GameObjectsManager {
	private static var _gameObjects: Map<String, GameObject>;

	static function __init__ () {
		_gameObjects = new Map<String, GameObject>();
	}

	public static function createGameObject (gameObject: GameObject) {
		var id: String = GUID.Create();
		_gameObjects.set(id, gameObject);
		return id;
	}

	public static function destroyGameObject (gameObject: GameObject) {
		_gameObjects.remove(gameObject.getId());
		// Todo: Destroy components
	}
}