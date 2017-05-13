void steel_door_frozen shape#(1449)()
{
var loc = get_object_position();
var torchReadied = UI_is_readied(AVATAR, 1, 701, ANY); // Torch in the weapon hand
var torchReadiedShieldHand = UI_is_readied(AVATAR, 0, 701, ANY); // Torch in the shield hand
var torchedReadiedEverburning = UI_is_readied(AVATAR, 1, 1489, ANY); // Everburning torch in the weapon hand
var torchedReadiedEverburningShieldHand =UI_is_readied(AVATAR, 0, 1489, ANY); // Everburning torch in the shield hand

	if(event == DOUBLECLICK)
	{
		if(torchReadied || torchReadiedShieldHand || torchedReadiedEverburning || torchedReadiedEverburningShieldHand) // Check if torch is in hand
		{
			UI_close_gumps();
			UI_set_item_flag(AVATAR, DONT_MOVE); 
			UI_si_path_run_usecode(AVATAR, [loc[1]+3, loc[2]-3, loc[3]], SCRIPTED, AVATAR, Melt_Steel_Door_Ice, 0);
		}
		else
		{
			script AVATAR
			{
				say "The door is frozen shut";
			}
		}
	}

}
