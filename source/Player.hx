package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import haxe.Constraints.FlatEnum;

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
		
		Paredes();
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
	
	public function Paredes()	
	{
		/*if (Reg.xGuia-64 < this.width)
			x = Reg.xGuia-64;
		if (x>((Reg.xGuia+64) - this.width)) 
			x = Reg.xGuia+64 - this.width;*/
		if (y<0)
		{
			y = 0;
		}
		if (y>(FlxG.height-this.height)) 
		{
			y = FlxG.height - this.height;
		}
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