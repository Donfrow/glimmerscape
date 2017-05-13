void Create_Ground_Carrot object#()()
{
	var loc = get_object_position(AVATAR);
	var carrot = UI_create_new_object(377);
	UI_set_item_frame(carrot, 18);
	UI_update_last_created([loc[1]-1, loc[2], loc[3]]);
	UI_remove_from_area(1402, 0, [loc[1]-1, loc[2]], [loc[1]-1, loc[2]]); // remove carrot top on ground
	
}

void Pick_Carrot()
{
	script AVATAR
	{
		nohalt;
		call FreezeAvatar;
		face WEST;
		actor frame KNEEL;
		wait 2;
		call Hit_Sound;
		call Create_Ground_Carrot;
		actor frame STAND;
		wait 1;
		call UnFreezeAvatar;
		
	}
}

void carrot_top shape#(1402) ()
{
	if(event == DOUBLECLICK)
	{
		var loc = get_object_position(item);
		UI_si_path_run_usecode(AVATAR, [loc[1]+1, loc[2], loc[3]], SCRIPTED, AVATAR, Pick_Carrot, 0);
	}
}