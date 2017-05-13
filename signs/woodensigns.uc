/*

Wooden signs

*/

void signs shape#(379) ()
{


var quality = get_item_quality();

if (event == DOUBLECLICK)
{

var text;

	if (quality == 0)
	{
	
		text = "THIS IS A TEST";
	
	}
	else if (quality == 1)
	{
		text = "COTTON COVE";
    }
    else if (quality == 2)
    {
		text = "DEWTOPIA";
    }
    else if (quality == 4)
    {
		text = "LOGGER'S STUMP";
    }
    else if (quality == 5)
    {
		text = "BRENTONIA";
    }
    else if (quality == 6)
    {
		text = "NOXIOUS SWAMP";
    }
    else if (quality == 7)
    {
		text = "GELVIN'S MEATS";
    }
    else if (quality == 8)
    {
		text = "DANGER";
    }
    else if (quality == 9)
    {
		text = "MY LIFE";
    }
	else if (quality == 10)
	{
		text = "DANGER";
	}
	else if (quality == 11)
	{
		text = "STORAGE";
	}
	else if (quality == 12)
	{
		text = "STOCK";
	}
	else if (quality == 13)
	{
		text = "BLASTING";
	}
	else if (quality == 14)
	{
		text = "WATCH YOUR STEP";
	}
	else if (quality == 15)
	{
		text = "QUIET PLEASE";
	}
	else if (quality == 16)
	{
		text = "DELVERE FARM";
	}
	else if (quality == 17)
	{
		text = "NORTHERN FOREST";
	}
	else if (quality == 18)
	{
		text = "GREED AND LUST";
	}
	else if (quality == 19)
	{
		text = "LIVES HERE";
	}
    else
    {
		text = "GENERIC WOODEN SIGN";
    }
UI_display_runes(44,text);
}

}
