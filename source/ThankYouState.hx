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

using StringTools;

//You might be wondering, why is there so many imports on this simple code?
//Well, its because the original code is fucked up when ported to psych (It's originaly on that one kade but better engine, i forgot lol) and needs to be changed
//So, i copied the imports from PlayState.hx to make it work

class ThankYouState extends MusicBeatState
{
	var Thx:FlxSprite;
	var Txt:FlxText;
	//var text1:FlxText
	
	override function create() 
	{
		//super.create();
		//text1 = new FlxText(0, 0, 1000, "Thank you for Playing Feline Fiasco <3", 72);
		//text1.screenCenter();
		//add(text1); (Example from feline fiasco (Thx Tucker :D))
		super.create();
		Thx = new FlxSprite().loadGraphic(Paths.image('thank you for playing!')); //Loads the image (duh)
		Thx.screenCenter();
		add(Thx);

		super.create(); //Do i have to create another one? idk tbh
	    Txt = new FlxText(0, 685, 1000, "Press Enter key to view the credits, Press BackSpace to return to the main menu!", 17);
		Txt.screenCenter(X);
		add(Txt);

		FlxG.sound.playMusic(Paths.music('LD_Old'), 1);

		//if (ClientPrefs.streamer)
		//{
		    //FlxG.sound.playMusic(Paths.music('LD_Old'), 1);
		//}
	    //else 
		//{
			//FlxG.sound.playMusic(Paths.music('Mikuwaifu'), 1);
		//}

	}
	
	override function update(elapsed:Float) 
	{
		if (controls.ACCEPT)
			MusicBeatState.switchState(new CreditsState());

		if (controls.BACK)
			MusicBeatState.switchState(new MainMenuState());

		super.update(elapsed);
	}
	
} //THIS TOOK SO LONG, VIKKIE YOU ARE SO LUCKY THAT I AM FREE

//yeah uh, this code will be no longer needed, but i wont delete it (THIS SHIT TOOK SO LONG)