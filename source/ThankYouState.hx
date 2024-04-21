package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class ThankYouState extends MusicBeatState
{
	var thx:FlxSprite;
	var txt:FlxText;
	
	override function create() 
	{
		super.create();

		thx = new FlxSprite().loadGraphic(Paths.image('funkay')); //Loads the image (duh)
		thx.setGraphicSize(Std.int(FlxG.width));
		thx.screenCenter();
		add(thx);

	    txt = new FlxText(0, 685, 1000, "Press Enter to view the credits | Press Backspace to return to the main menu!", 17);
		txt.alignment = FlxTextAlign.CENTER;
		txt.screenCenter(X);
		add(txt);
	}
	
	override function update(elapsed:Float) 
	{
		if (controls.ACCEPT){
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
			MusicBeatState.switchState(new CreditsState());
		}

		if (controls.BACK)
			MusicBeatState.switchState(new MainMenuState());

		super.update(elapsed);
	}
	
} 
//THIS TOOK SO LONG, VIKKIE YOU ARE SO LUCKY THAT I AM FREE

//yeah uh, this code will be no longer needed, but i wont delete it (THIS SHIT TOOK SO LONG)

// hello my dear, i also cleaned this up a bit LMFAOOO - bunny