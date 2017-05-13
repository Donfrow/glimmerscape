void gavel_of_fate shape#(1456)()
{

if(event == DOUBLECLICK)
{
	UI_close_gumps();
	var target = UI_click_on_item();
	
	var target_shape = get_item_shape(target[1]);
	var target_loc_x = target[2];
	var target_loc_y = target[3];
	var target_loc_z = target[4];
	
	if(target_shape == GAVEL_OF_FATE && target_loc_x == 359 && target_loc_y == 242)
	{
		UI_set_item_flag(AVATAR, DONT_MOVE);
		UI_si_path_run_usecode(AVATAR, [359, 244], SCRIPTED, AVATAR, End_Game_Sequence,0);
	}
	else
	{
		script AVATAR
		{
			say "Order, order!";
		}
	}
	
}

}

