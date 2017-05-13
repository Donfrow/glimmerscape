trap_door shape#(1395)()      // opens and closes the trap door shape in conjunction with trap_door_open
{
    var loc = get_object_position();
    var state = get_item_frame();
    var ux = loc[1] -5;
    var uy = loc[2] -5;
    var lx = loc[1] +5;
    var ly = loc[2] +5;
    UI_remove_from_area(TRAP_DOOR, 0, [ux, uy], [lx, ly]);
    UI_create_new_object2(TRAP_DOOR1,[loc[1]-4, loc[2]]);
    UI_play_sound_effect(24);

}

void trap_door_locked shape#(1476)()
{
	script AVATAR
	{
		say "It appears to be locked";
	}
}

void trap_door_key shape#(1477)()
{
	if(event == DOUBLECLICK)
	{
		var target = UI_click_on_item();
		var target_shape == UI_get_item_shape(target[1]);
		if(target_shape == 1476)
		{
			UI_set_item_shape(target[1], 1395);
			script item
			{
				say "click";
			}
		}
	}
}
