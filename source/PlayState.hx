package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;


class PlayState extends FlxState
{
	private var player:Player;
	public var guide:FlxSprite;
	public var contadorPowerups:Int = 0;
	public var vidas:FlxText;
	public var grupoEnemigo1:FlxTypedGroup<Enemigo1> = new FlxTypedGroup<Enemigo1>();
	public var grupoEnemigo2:FlxTypedGroup<Enemigo2> = new FlxTypedGroup<Enemigo2>();
	public var grupoEnemigo3:FlxTypedGroup<Enemigo3> = new FlxTypedGroup<Enemigo3>();
	public var balasEnemigas:FlxTypedGroup<DisparoEnemigos> = new FlxTypedGroup<DisparoEnemigos>();
	public var loader:FlxOgmoLoader;
	public var tilemap:FlxTilemap;
	
	
	override public function create():Void
	{
		super.create();
		FlxG.worldBounds.set(0, 0, 13000, 240);
		
		player = new Player (20, Reg.altoPantalla / 4);
		player.scale.set(1, 1);
		player.updateHitbox();
		
		
		grupoEnemigo1 = new FlxTypedGroup<Enemigo1>();
		grupoEnemigo2 = new FlxTypedGroup<Enemigo2>();
		grupoEnemigo3 = new FlxTypedGroup<Enemigo3>();
		
		balasEnemigas = new FlxTypedGroup<DisparoEnemigos>();
		add(balasEnemigas);
		
		
		//Reg.guideRef = guide;
		guide = new Guia(FlxG.width / 2, FlxG.height / 2);
		guide.velocity.x = Reg.velocidadCamara;
		FlxG.camera.follow(guide);		
		//Reg.xGuia = guide.x;		//player.Paredes(guide.x);
		vidas = new FlxText(20, Reg.altoPantalla - 20, 0, "Vidas: " + Reg.vidas, 16, true);
		vidas.scrollFactor.set(0, 0);
		loader = new FlxOgmoLoader(AssetPaths.LevelTest__oel);
		
		loader.loadEntities(entityCreator,"Enemy");
		tilemap = loader.loadTilemap(AssetPaths.xd__png, 16, 16, "Tileset");		
		
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.NONE);
		tilemap.setTileProperties(2,FlxObject.ANY);
		tilemap.setTileProperties(3, FlxObject.ANY);
		tilemap.setTileProperties(4, FlxObject.ANY);
		tilemap.setTileProperties(5, FlxObject.ANY);
		tilemap.setTileProperties(6, FlxObject.ANY);
		tilemap.setTileProperties(7, FlxObject.ANY);
		tilemap.setTileProperties(8, FlxObject.NONE);
		tilemap.setTileProperties(9, FlxObject.NONE);
		tilemap.setTileProperties(10, FlxObject.ANY);
		tilemap.setTileProperties(11, FlxObject.ANY);
		tilemap.setTileProperties(12, FlxObject.NONE);
		tilemap.setTileProperties(13, FlxObject.NONE);
		tilemap.setTileProperties(14, FlxObject.NONE);
		tilemap.setTileProperties(15, FlxObject.NONE);
		tilemap.setTileProperties(16, FlxObject.ANY);
		tilemap.setTileProperties(17, FlxObject.ANY);
		tilemap.setTileProperties(18, FlxObject.NONE);
		tilemap.setTileProperties(19, FlxObject.NONE);
		tilemap.setTileProperties(20, FlxObject.ANY);
		tilemap.setTileProperties(21, FlxObject.ANY);
		
		add(guide);
		add(new FlxSprite(0, 0, AssetPaths.starswall__jpg));
		add(tilemap);
		add(grupoEnemigo1);
		add(grupoEnemigo2);
		add(grupoEnemigo3);
		add(vidas);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		//powerups();
		camara();
		paredesNave();
		colisionMapa();
		FlxG.collide(tilemap,player);
		super.update(elapsed);
	}
	
	function colisionMapa() 
	{
		if (FlxG.collide(tilemap,player)) 
		{
			player.kill();
		}
	}
	
	function entityCreator(entityName:String, entityData:Xml)
	{
		
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		switch (entityName) 
		{
			case "Enemigo1":
			var enemigo1: Enemigo1 = new Enemigo1(x,y,AssetPaths.Enemigo1__png);	
			grupoEnemigo1.add(enemigo1);	
		}
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