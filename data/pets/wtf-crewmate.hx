import funkin.game.shaders.RGBPalette;

var COLORS:Array<FlxColor> = [
    FlxColor.RED,
    FlxColor.ORANGE,
    FlxColor.YELLOW,
    FlxColor.LIME,
    FlxColor.BLUE,
    FlxColor.PURPLE,
    FlxColor.MAGENTA
];

var palette:RGBPalette;

var changeOnBeat:Bool = false;

function onCreatePost()
{
    palette = new RGBPalette();
    
    palette.r = pickRandomColor();
    palette.g = FlxColor.WHITE;
    
    parent.shader = palette.shader;

    // 5% chance to do a cool rainbow effect
    // 10% chance to change colors every beat
    if (FlxG.random.bool(5))
        rainbow();
    else if (FlxG.random.bool(10))
        changeOnBeat = true;
}

function onBeatHit()
{
    if (game.curBeat % parent.danceEveryNumBeats != 0 || !changeOnBeat) return;

    palette.r = pickRandomColor();
}

function rainbow()
{
    FlxTween.color(null, 2, palette.r, pickRandomColor(), {
        onUpdate: tween -> palette.r = tween.color,
        onComplete: _ -> rainbow()
    });
}

function pickRandomColor():FlxColor
{
    var color:FlxColor = COLORS[Std.random(COLORS.length)];

    if (palette.r == color) return pickRandomColor();

    return color;
}