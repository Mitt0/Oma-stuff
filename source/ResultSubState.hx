package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxSubState;
import Section.SwagSection;
import Song.SwagSong;
import flixel.text.FlxText;
import Conductor.Rating;

//You might be wondering, why is there so many imports on this simple code?
//Well, its because the original code is fucked up when ported to psych (It's originaly from forever engine) and needs to be changed
//So, i copied the imports from PlayState.hx to make it work

//Thank electro and me for making this cool thing

// Thank you zero but i'll take it from here HAHAHAHHAHAHA - bunny

class ResultSubState extends MusicBeatSubstate
{
	var score:FlxText;  //score text
	var misses:FlxText; //misses text
	var rank:FlxText; //rating text
	var bleh:FlxText; //continue text

	//scores
	public static var scoreVar:Int = 0;
	public static var missesVar:Int = 0;
	public static var ratingVar:String = '';

	var mikumywaifu:FlxSprite;

	public function new(x:Float, y:Float)
	{
		super();

		mikumywaifu = new FlxSprite().loadGraphic(Paths.image('menuBGMagenta'));
		mikumywaifu.screenCenter();
		add(mikumywaifu);

		score = new FlxText(50, 100, 500, 'SCORE:\n' + Std.string(scoreVar), 72);
		score.setFormat(Paths.font('catr.ttf'), 72);
		add(score);

		misses = new FlxText(50, 300, 500, 'MISSES:\n' + Std.string(missesVar), 72);
		misses.setFormat(Paths.font('catr.ttf'), 72);
		add(misses);

		rank = new FlxText(50, 500, 500, 'RATING:\n' + ratingVar, 72);
		rank.setFormat(Paths.font('catr.ttf'), 72);
		add(rank);

		bleh = new FlxText(800, 630, 500, '<- Restart (RESET)\n(ENTER) Continue ->', 36);
		bleh.setFormat(Paths.font('catr.ttf'), 36);
		add(bleh);

		FlxG.sound.playMusic(Paths.music('breakfast'), 0);
		FlxG.sound.music.fadeIn(5, 0, 0.7);

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
	}
	
	override function update(elapsed:Float) 
	{
		if (controls.ACCEPT){
			MusicBeatState.switchState(new MainMenuState());
			FlxG.sound.playMusic(Paths.music('freakyMenu'), 1);
		}
		
		if (controls.RESET)
			LoadingState.loadAndSwitchState(new PlayState());

		super.update(elapsed);
	}
	
}