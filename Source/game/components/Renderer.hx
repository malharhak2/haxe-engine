package game.components;

import malha.Component;

class Renderer extends Component {

	public width: Int = 10;
	public height: Int = 10;
	
	public function new (id) {
		super(id);
	}

	public override function update () {
		super.update();
		trace("Renderer update");
	}
}