package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var player:Player;
	public var guide:FlxSprite;
	public var contadorPowerups:Int = 0;
	public var vidas:FlxText;

	
	override public function create():Void
	{
		super.create();
		
		player = new Player (20, Reg.altoPantalla/2);
		
		//Reg.guideRef = guide;
		guide = new Guia(FlxG.width / 2, FlxG.height / 2);
		guide.velocity.x = Reg.velocidadCamara;
		FlxG.camera.follow(guide);		
		//Reg.xGuia = guide.x;		//player.Paredes(guide.x);
		vidas = new FlxText(20, Reg.altoPantalla - 20, 0, "Vidas: " + Reg.vidas, 16, true);
		vidas.scrollFactor.set(0, 0);
		
		add(guide);
		add(new FlxSprite(0, 0, AssetPaths.starswall__jpg));
		add(vidas);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		//powerups();
		camara();
		paredesNave();
		super.update(elapsed);
	}
	
	/*function powerups() 
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
	}*/
	
	function paredesNave() 
	{
		var scroll = FlxG.camera.scroll;
		
		if (player.x > scroll.x + Reg.anchoPantalla - player.width) 
		{
			player.x = scroll.x + Reg.anchoPantalla - player.width;
		}
		if (player.x < scroll.x) 
		{
			player.x = scroll.x;
		}
		if (player.y > scroll.y + Reg.altoPantalla - player.height) 
		{
			player.y = scroll.y + Reg.altoPantalla - player.height;
		}
		if (player.y < scroll.y) 
		{
			player.y = scroll.y;
		}
	}
	
	function camara()
	{	
		//FlxG.camera.follow(guide);
	}
}