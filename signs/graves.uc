/*

Tombstone text

*/

void graves shape#(1308) ()
{

var quality = get_item_quality();

if (event == DOUBLECLICK)
{
	var loc = get_object_position();
	if (loc[1] == 2236 && loc[2] == 2675)
	{
		script AVATAR
		{
			say "Here lies Jillian";
			wait 6;
			say "Mother of Hannah, wife of Lee";
		}
	}
    else
    {
		script AVATAR
		{
			say "I have never heard of this person";
		}
    }


}

}
