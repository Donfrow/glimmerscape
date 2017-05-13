void dice_of_fate shape#(1454)()
{

var loc = get_object_position(AVATAR);

var x = loc[1];
var y = loc[2];

if(event == DOUBLECLICK)
{

	if(x >= 347 && y >= 254 && x <= 372 && y <= 276)
	{
		gflags[DICE_ROLLED] = true;
		script AVATAR
		{
			say "It rolled a 2";
		}
	}
	else
	{
		script AVATAR
		{
			say "It is a set of dice";
		}
	}

}

}

