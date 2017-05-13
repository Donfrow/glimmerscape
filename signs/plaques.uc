/*

Plaques signs

*/

void plaquess shape#(820) ()
{

var quality = get_item_quality();

if (event == DOUBLECLICK)
{
	var text;
	if (quality == 0)
	{
		text = "YOUR OFFERING HERE";
	}
	else if (quality == 1)
	{
		text = "TAKE A CHANCE";
	}
	else if (quality == 2)
	{
		say("Hi");
	}
	else if (quality == 3)
	{
		text = "LACKING";
	}
	else if (quality == 4)
	{
		text = "VISION";
	}
	else if (quality == 5)
	{
		text = "WATCH YOUR STEP";
	}
	else if (quality == 6)
	{
		text = "TAKE THE POWER";
	}
	else if (quality == 7)
	{
		text = "RIGHTFULLY HIS";
	}
	else if (quality == 8)
	{
		text = "VISITORS NOT WELCOME";
	}
	else if (quality == 9)
	{
		text = "YOUR OFFERING HERE";
	}
	else if (quality == 10)
	{
		text = "RETURN WHAT IS HIS";
	}
	else if (quality == 11)
	{
		text = "FRIENDLY";
	}
	else if (quality == 12)
	{
		text = "HOSTILE";
	}
	else if (quality == 13)
	{
		text = "NEUTRAL";
	}
	else if (quality == 14)
	{
		text = "STYR THE MIGHTY";
	}
	else if (quality == 15)
	{
		text = "LADY ELENA";
	}
	else if (quality == 16)
	{
		text = "LORD BRENT";
	}
	else if (quality == 17)
	{
		text = "TYRION";
	}
	else if (quality == 18)
	{
		text = "ARTHIS";
	}
	else if (quality == 19)
	{
		text = "EDRIC";
	}
	else if (quality == 20)
	{
		text = "ACCEPT YOUR FATE";
	}
    else
    {
		text = "GENERIC PLAQUE";
    }

		UI_display_runes(46, text);

}

}
