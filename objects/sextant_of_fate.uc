void sextant_of_fate shape#(1451)()
{
var loc = get_object_position(AVATAR);

var x = loc[1];
var y = loc[2];

if(x >= 351 && y >= 314 && x <= 367 && y <= 327)
{
	if(gflags[USED_SEXTANT])
	{
		UI_close_gumps();
		script AVATAR
		{
			say "The path has been shown";
		}
	}
	else
	{
		UI_close_gumps();
		gflags[USED_SEXTANT] = true;
		UI_set_item_flag(AVATAR, DONT_MOVE);
		UI_si_path_run_usecode(AVATAR, [361, 321], SCRIPTED, AVATAR, Sextant_Open_Path, 0);
	}

}
else
{
	UI_close_gumps();
	script AVATAR
	{
		say "It looks like a regular sextant";
	}
}

}
