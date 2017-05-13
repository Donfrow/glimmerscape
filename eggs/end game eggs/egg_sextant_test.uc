Sextant_Use_Blank()
{
	UI_clear_item_flag(AVATAR, DONT_MOVE);
}

void egg_sextant_cannot_continue object#()()
{
if(gflags[SLIPPERS_PATHING_ON])
{
}
else
{
	if(gflags[USED_SEXTANT])
	{
	}
	else
	{
		script AVATAR
		{
			say "I am not jumping into that void...";
		}
		UI_set_item_flag(AVATAR, DONT_MOVE);
		UI_si_path_run_usecode(AVATAR, [360, 327], SCRIPTED, AVATAR, Sextant_Use_Blank,0);
	}
}
}
