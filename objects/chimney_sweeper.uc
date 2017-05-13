void Chimney_Clean_Smoke object#()()
{
UI_sprite_effect(6, chimney_x-8, chimney_y-7, 0, 0, 0, -1);
}

void Chimney_Clean object#()()
{

	UI_remove_from_area(982, 3, [chimney_x-5, chimney_y-5], [chimney_x+5, chimney_y+5]);
	
	var clean_chimney = UI_create_new_object(982);
	UI_set_item_frame(clean_chimney, 0);  // appropriate tile for that roof shape
	UI_update_last_created([chimney_x, chimney_y, chimney_z]);	

	gflags[CHIMNEY_CLEANED] = true;

}

void clean_chimney()
{

script AVATAR
{
	call FreezeAvatar;
	face NORTH;
	actor frame USE;
	sfx 111;
	actor frame SWING_1;
	call Chimney_Clean_Smoke;
	
	actor frame SWING_3;
	actor frame USE;
	actor frame SWING_1;
	actor frame SWING_3;
	actor frame USE;
	actor frame SWING_3;
	actor frame USE;
	actor frame SWING_1;
	actor frame SWING_3;
	actor frame USE;
	
	call Chimney_Clean;
	actor frame STAND;
	call UnFreezeAvatar;
}
}

void chimney_sweeper shape#(1403)()
{
    if (event == DOUBLECLICK)
    {
        var target = UI_click_on_item();
		
        var shape = UI_get_item_shape(target[1]);
        var frame = UI_get_item_frame(target[1]);
			
			if (shape == 982 && frame == 3)
			{
			
				chimney_x = target[2];
				chimney_y = target[3];
				chimney_z = target[4];
			
				UI_close_gumps();
				UI_si_path_run_usecode(AVATAR, [chimney_x-3, chimney_y+1, chimney_z], SCRIPTED, item, clean_chimney, 0);

				
			}
    }
}

