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

class ReslutState extends MusicBeatState
{
	var text123:FlxText;
	var text123_2:FlxText;
	var normaltext:FlxText;
	var normaltext2:FlxText;
	var normaltext3:FlxText;
	//scores
	public static var scoreVar:Int = 0;
	public static var missesVar:Int = 0;
	public static var ratingVar:String = '';
	//var text1:FlxText
	
	override function create() 
	{
		//super.create();
		//text1 = new FlxText(0, 0, 1000, "Thank you for Playing Feline Fiasco <3", 72);
		//text1.screenCenter();
		//add(text1); (Example from feline fiasco (Thx Tucker :D))

		super.create();
		text123 = new FlxText(50, 200, 500, "Score test: ", 72);
		text123.text = Std.string(scoreVar);
		add(text123);

		text123_2 = new FlxText(50, 200 + 200, 500, "Misses test: ", 72);
		text123_2.text = Std.string(missesVar);
		add(text123_2);

		var text123_2:FlxText = new FlxText(50, 200 + 400, 500, "Rating test: ", 72);
		text123_2.text = ratingVar;
		add(text123_2);
        
		//Normal texts
		super.create();
		normaltext = new FlxText(50, 100, 500, 'SCORE', 72);
		add(normaltext);

		normaltext2 = new FlxText(50, 300, 500, 'MISSES', 72);
		add(normaltext2);

		normaltext3 = new FlxText(50, 500, 500, 'RATING', 72);
		add(normaltext3);

		FlxG.sound.playMusic(Paths.music('freakyMenu'), 1);

	}
	
	override function update(elapsed:Float) 
	{
		if (controls.ACCEPT)
			MusicBeatState.switchState(new MainMenuState());

		super.update(elapsed);
	}
	
}