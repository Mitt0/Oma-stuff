package;

import flixel.graphics.FlxGraphic;
#if desktop
import Discord.DiscordClient;
#end
import Section.SwagSection;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.Lib;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.BitmapFilter;
import openfl.utils.Assets as OpenFlAssets;
import editors.ChartingState;
import editors.CharacterEditorState;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKey;
import Note.EventNote;
import openfl.events.KeyboardEvent;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.util.FlxSave;
import flixel.animation.FlxAnimationController;
import animateatlas.AtlasFrameMaker;
import Achievements;
import StageData;
import FunkinLua;
import DialogueBoxPsych;
import Conductor.Rating;

#if !flash 
import flixel.addons.display.FlxRuntimeShader;
import openfl.filters.ShaderFilter;
#end

#if sys
import sys.FileSystem;
import sys.io.File;
#end

#if VIDEOS_ALLOWED
import vlc.MP4Handler;
#end

using StringTools;

//You might be wondering, why is there so many imports on this simple code?
//Well, its because the original code is fucked up when ported to psych (It's originaly from forever engine) and needs to be changed
//So, i copied the imports from PlayState.hx to make it work

//Thank electro and me for making this cool thing

class ReslutState extends MusicBeatState
{
	var text123:FlxText;
	var text123_2:FlxText;
	var text123_3:FlxText;
	var normaltext:FlxText;  //score text
	var normaltext2:FlxText; //misses text
	var normaltext3:FlxText; //rating text
	var normaltext4:FlxText; //continue text
	var normaltext5:FlxText; //reset text
	//scores
	public static var scoreVar:Int = 0;
	public static var missesVar:Int = 0;
	public static var ratingVar:String = '';
	//var text1:FlxText //just example so i can remind myself
	//image
	var mikumywaifu:FlxSprite;

	override function create() 
	{
		//super.create();
		//text1 = new FlxText(0, 0, 1000, "Thank you for Playing Feline Fiasco <3", 72);
		//text1.screenCenter();
		//add(text1); (Example from feline fiasco (Thx Tucker :D))

		//I love how i created this with the Thank you for playing screen originally from the oma mod lmao

		super.create(); //image
		mikumywaifu = new FlxSprite().loadGraphic(Paths.image('result'));
		mikumywaifu.screenCenter();
		add(mikumywaifu);

		super.create(); //scores
		text123 = new FlxText(50, 200, 500, "Score test: ", 72);
		text123.setFormat("assets/fonts/cp_and_trans.ttf", 72); //Adds font
		text123.text = Std.string(scoreVar);
		add(text123);

		text123_2 = new FlxText(50, 200 + 200, 500, "Misses test: ", 72); //Misses
		text123_2.setFormat("assets/fonts/cp_and_trans.ttf", 72);
		text123_2.text = Std.string(missesVar);
		add(text123_2);

		text123_3 = new FlxText(50, 200 + 400, 1250, "Rating test: ", 72); //Rating
		text123_3.setFormat('assets/fonts/cp_and_trans.ttf', 72);
		text123_3.text = ratingVar;
		add(text123_3);

		//Normal texts
		super.create();
		normaltext = new FlxText(50, 100, 500, 'SCORE:', 72);
		normaltext.setFormat('assets/fonts/cp_and_trans.ttf', 72);
		add(normaltext);

		normaltext2 = new FlxText(50, 300, 500, 'MISSES:', 72);
		normaltext2.setFormat('assets/fonts/cp_and_trans.ttf', 72);
		add(normaltext2);

		normaltext3 = new FlxText(50, 500, 500, 'RATING:', 72);
		normaltext3.setFormat('assets/fonts/cp_and_trans.ttf', 72);
		add(normaltext3);

		normaltext4 = new FlxText(800, 650, 500, '(ENTER) Continue ->', 36);
		normaltext4.setFormat('assets/fonts/cp_and_trans.ttf', 36);
		add(normaltext4);

		normaltext5 = new FlxText(800, 600, 500, '<- Restart (RESET)', 36);
		normaltext5.setFormat('assets/fonts/cp_and_trans.ttf', 36);
		add(normaltext5);

        //music
		FlxG.sound.playMusic(Paths.music('freakyMenu'), 1);

	}
	
	override function update(elapsed:Float) 
	{
		if (controls.ACCEPT)
			MusicBeatState.switchState(new MainMenuState());
		
		if (controls.RESET)
			LoadingState.loadAndSwitchState(new PlayState());

		super.update(elapsed);
	}
	
}