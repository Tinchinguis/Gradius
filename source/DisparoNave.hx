package;

import flash.desktop.ClipboardFormats;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Tinchinguis
 */
class DisparoNave extends FlxSprite 
{
	static public var velocidadDisparo:Float = 400;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.disparo__png);
		scale.set(0.75 , 0.75);
		velocity.x = 500;
		/*makeGraphic(10,10,FlxColor.WHITE);*/
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}