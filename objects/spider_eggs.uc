void spider_eggs shape#(1349)()
{

if(event == DOUBLECLICK)
{

var n = UI_die_roll(1, 2);

if(n == 1)
{
script AVATAR
{
	say "Die vile arachnid spawn!";
}
}
else
{
script AVATAR
{
	say "Die you damn dirty spiders!";
}
}

var loc = get_object_position();
var egg_x = loc[1];
var egg_y = loc[2];
var egg_z = loc[3];

UI_remove_item(item);

var blood_1 = UI_create_new_object(912);
UI_set_item_frame(blood_1, 7);
UI_update_last_created(loc);

var blood_2 = UI_create_new_object(912);
UI_set_item_frame(blood_2, 5);
var random_egg_spot = UI_die_roll(1, 3);
if(random_egg_spot == 1)
{
	UI_update_last_created([egg_x-1, egg_y+1, egg_z]);
}
else if (random_egg_spot == 2)
{
	UI_update_last_created([egg_x+1, egg_y+1, egg_z]);	
}
else if (random_egg_spot == 3)
{
	UI_update_last_created([egg_x+2, egg_y+1, egg_z]);	
}
var blood_3 = UI_create_new_object(912);
UI_set_item_frame(blood_3, 6);
UI_update_last_created([egg_x+1, egg_y, egg_z]);

var blood_4 = UI_create_new_object(912);
UI_set_item_frame(blood_4, 7);
UI_update_last_created([egg_x-1, egg_y, egg_z]);

var blood_5 = UI_create_new_object(912);
UI_set_item_frame(blood_5, 5);
UI_update_last_created([egg_x, egg_y-1, egg_z]);
UI_play_sound_effect(36);
}

}

