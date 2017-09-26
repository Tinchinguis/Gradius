package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var player:Player;
	private var guide:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		player = new Player (200, 200);
		
		guide = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		guide.makeGraphic(1, 1, 0x00000000);
		guide.velocity.x = Reg.velocidadCamara;
		FlxG.camera.follow(guide);
		
		add(guide);
		add(new FlxSprite(0, 0, AssetPaths.starswall__jpg));
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}