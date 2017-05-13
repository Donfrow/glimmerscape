void stockade_man shape#(1435)()
{
//var avatar_near = UI_find_nearby_avatar(1435);
//var shape_check = UI_get_item_shape(avatar_near);

var frame = get_item_frame();

if(event == DOUBLECLICK)
{

	if(gflags[TRANSPORT_PRISONER] && frame == 0)
	{
		UI_set_item_flag(AVATAR, 16);
		stockade_man_look();
		UI_si_path_run_usecode(AVATAR, [1673, 980, 0], SCRIPTED, AVATAR, Free_Dewtopian_Stockade_Man, 1);
	}
	
}

}
