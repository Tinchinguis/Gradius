package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Tinchinguis
 */
class Player extends FlxSprite 
{
	//public var disparo(get, null):DisparoNave;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.Nave__png, true, 32, 16);
		scale.set(2, 2);
		animation.add("fly", [0, 2], 8, true);
		
		animation.play("fly");
		
		//disparo = new DisparoNave(x,y/2,AssetPaths.disparo__png);
		/*disparo.kill();*/
		//FlxG.state.add(disparo);
		//updateHitbox();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		paredes();
		Disparo();
		velocity.set(Reg.velocidadCamara, 0);
		
		if (FlxG.keys.pressed.RIGHT)
			velocity.x += 180;
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= 180;
		if (FlxG.keys.pressed.DOWN)
			velocity.y += 180;
		if (FlxG.keys.pressed.UP)
			velocity.y -= 180;
	}
	
	function paredes()
	{
		if (x < 0)
			x = 0;
		if (x>(FlxG.width - width)) 
			x = FlxG.width - width;
	}
	
	function Disparo()
	{
		if (FlxG.keys.justPressed.SPACE) 
		{
			var disparo:DisparoNave = new DisparoNave();
			
			disparo.x = this.x + (this.width+ width/3);
			disparo.y = this.y;
			FlxG.state.add(disparo);
			
			/*disparo.reset(x - 2 + width / 2, y + height / 2);
			disparo.velocity.x = (DisparoNave.velocidadDisparo);*/
		}
	}
	
	/*function get_disparo():DisparoNave 
	{
		return disparo;
	}*/
}