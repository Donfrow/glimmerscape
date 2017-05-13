void Space_Smoke_1 object#()()
{
    UI_sprite_effect(6, 360, 317 , 0, 0, 0, -1);
}
void Space_Smoke_2 object#()()
{
    UI_sprite_effect(6, 360, 311 , 0, 0, 0, -1);
}
void Space_Smoke_3 object#()()
{
    UI_sprite_effect(6, 360, 305 , 0, 0, 0, -1);
}

void Update_Space_Tile_1 object#()()
{
	UI_remove_from_area(1455, 0, [367, 319], [367, 319]);
	var tile = UI_create_new_object(1455);
	UI_set_item_frame(tile, 1);
	UI_update_last_created([367, 319]);
}

void Update_Space_Tile_2 object#()()
{
	UI_remove_from_area(1455, 1, [367, 319], [367, 319]);
	var tile = UI_create_new_object(1455);
	UI_set_item_frame(tile, 2);
	UI_update_last_created([367, 319]);
}

void Remove_Space_Tile object#()()
{
	UI_remove_from_area(1455, 2, [367, 319], [367, 319]);
}
void Remove_Space_Tile_1 object#()()
{
	UI_remove_from_area(1455, 0, [367, 303], [367, 303]);
}

void Remove_Sextant_Door object#()()
{
	UI_remove_from_area(432, 4, [362, 320], [362, 320]);
}

void Sextant_Open_Path()
{
	UI_play_music(53);
	script AVATAR
	{
		nohalt;
		face NORTH;
		actor frame STAND;
		call Space_Smoke_1;
		call Update_Space_Tile_1;
		wait 5;
		call Space_Smoke_2;
		call Update_Space_Tile_2;
		wait 5;		
		call Space_Smoke_3;
		call Remove_Space_Tile;
		wait 5;
		call Remove_Space_Tile_1;
		call UnFreezeAvatar;
	}
}