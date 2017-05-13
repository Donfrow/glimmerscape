void Rain_Barrel shape#(1437)()
{

if(event == DOUBLECLICK)
{

var loc = get_object_position();

var loc_x = loc[1];
var loc_y = loc[2];
var loc_z = loc[3];

var frame = UI_get_item_frame(item);

	if(frame == 0)
	{
		if(loc_x == 1617 && loc_y == 546)
		{
			var key = UI_create_new_object(641);
			UI_set_item_frame(key, 9);
			UI_set_item_quality(key, 36);
			UI_update_last_created([1617, 548, 0]);
			script AVATAR
			{
				say "A key!";
			}
		}
		UI_set_item_frame(item, 1);
		UI_play_sound_effect(53);
		UI_move_object(item, [loc_x, loc_y+3, loc_z]);

	}
	else if (frame == 1)
	{
		UI_remove_item(item);
		var barrel = UI_create_new_object(819);
		UI_set_item_frame(barrel, 1);
		UI_update_last_created([loc_x, loc_y-3, loc_z+1]);
		var water_puddle = UI_create_new_object(1463); 
		UI_update_last_created([loc_x, loc_y, loc_z]);
	}
}

}