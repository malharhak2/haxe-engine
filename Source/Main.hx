package;

import lime.app.Application;
import lime.graphics.RenderContext;

import malha.GameObject;
import game.components.Renderer;
import game.components.Shaky;
import hxmath.math.Vector2;

import malha.ComponentsManager;
import malha.Game;

class Main extends Application {
	
	
	public function new () {
		
		super ();
		
		for (i in 0 ... 100) {
			var gameObject:GameObject = new GameObject();
			gameObject.transform.position = new Vector2(
				Math.random() * 1000 - 500,
				Math.random() * 1000 - 500
			);

			gameObject.addComponent(Renderer);
			gameObject.addComponent(Shaky);
		}

		ComponentsManager.update();
		
		trace ("Hello World");
		
	}
	
	
	public override function render (context:RenderContext):Void {
		if (!Game.initialized) {
			Game.init(config);
			trace(config.width, config.height);
		}
		Game.refreshUnitSize(window.width, window.height);

		ComponentsManager.preUpdate();
		ComponentsManager.update();
		ComponentsManager.postUpdate();

		switch (context) {
			
			case CANVAS (context):
				context.fillStyle = "#BFFF00";
				context.fillRect (0, 0, window.width, window.height);
				ComponentsManager.render(context, window, config);
			
			case DOM (element):
				
				element.style.backgroundColor = "#BFFF00";
			
			case FLASH (sprite):
				
				sprite.graphics.beginFill (0xBFFF00);
				sprite.graphics.drawRect (0, 0, window.width, window.height);
			
			case OPENGL (gl):
				gl.clearColor (0.75, 1, 0, 1);
				gl.clear (gl.COLOR_BUFFER_BIT);
				ComponentsManager.render(context, window, config);
			case CONSOLE (context):
				
				context.clearColor (0.75, 1, 0, 1);
				context.clear ();
			
			default:
			
		}
		
	}
	
	
}