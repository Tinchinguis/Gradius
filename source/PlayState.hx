package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var player:Player;
	public var guide:FlxSprite;
	public var contadorPowerups:int;

	
	override public function create():Void
	{
		super.create();
		
		player = new Player (200, 200);
		
		//Reg.guideRef = guide;
		//guide = new Guia(FlxG.width / 2, FlxG.height / 2);
		guide.velocity.x = Reg.velocidadCamara;
		FlxG.camera.follow(guide);		
		//Reg.xGuia = guide.x;		//player.Paredes(guide.x);
		
		add(guide);
		add(new FlxSprite(0, 0, AssetPaths.starswall__jpg));
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		powerups();
		camara();
		paredesNave();
		super.update(elapsed);
	}
	
	function powerups() 
	{
		switch (contadorPowerups) 
		{
			case 0:
			case 1:
				player.velocity.x=
			case 2:
				
			case 3:
			case 4:
			case 5:
			
			default:
				
		}
	}
	
	function paredesNave() 
	{
		/*if (player.x < FlxG.width-FlxG.width) 
		{
			player.x = 0;
		}
		/*if (player.x > guide.width) 
		{
			player.x = guide.width + guide.width/2;
		}*/
		if (player.y<0)
		{
			player.y = 0;
		}
		if (player.y>(FlxG.height-player.height)) 
		{
			player.y = FlxG.height - player.height;
		}
		
		/*if (player.x < Reg.guideRef.width - FlxG.width / 2)
		player.x = Reg.guideRef.width- FlxG.width / 2;
		else if (player.x > Reg.guideRef.width + FlxG.width / 2 - Reg.guideRef.width)
		player.x = Reg.guideRef.width + FlxG.width / 2 - Reg.guideRef.width;*/
	}
	
	function camara() 
	{
		FlxG.camera.follow(guide);

	}
}