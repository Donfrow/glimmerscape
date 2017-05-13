void Create_Grave_Dirt_1 object#()()
{
	var loc = get_object_position(AVATAR);
	var dirt_1 = UI_create_new_object(415);
	UI_set_item_frame(dirt_1, 20);
	UI_update_last_created([loc[1]+1, loc[2]-3, loc[3]]);
}

void Create_Grave_Dirt_2 object#()()
{
	var loc = get_object_position(AVATAR);
	var dirt_1 = UI_create_new_object(415);
	UI_set_item_frame(dirt_1, 20);
	UI_update_last_created([loc[1]+2, loc[2]+2, loc[3]]);
}

void Create_Grave_Dirt_3 object#()()
{
	var loc = get_object_position(AVATAR);
	var dirt_1 = UI_create_new_object(202);
	UI_set_item_frame(dirt_1, 1);
	UI_update_last_created([loc[1]+1, loc[2]+8, loc[3]]);
	var dirt_2 = UI_create_new_object(415);
	UI_set_item_frame(dirt_2, 20);
	UI_update_last_created([loc[1]+1, loc[2]+6, loc[3]]);
}

void Create_Open_Grave object#()()
{
	var grave = UI_find_nearest(AVATAR, 1466, 5);
	var loc = get_object_position(grave);
	UI_remove_item(grave);
	UI_create_new_object(1468); // undug grave
	UI_update_last_created([loc[1]+1, loc[2]+4, loc[3]]);
	//UI_create_new_object(1467); // coffin lid
	//UI_update_last_created([loc[1]-5, loc[2]-2, loc[3]]);
}

void Dig_Grave()
{
	script AVATAR
	{
		nohalt;
		call FreezeAvatar;
		face WEST;
		wait 2;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		call Hit_Sound;
		actor frame SWING_3;
		call Create_Grave_Dirt_1;
		wait 2;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		call Hit_Sound;
		actor frame SWING_3;
		call Create_Grave_Dirt_2;
		say "phew";
		wait 2;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		call Hit_Sound;
		actor frame SWING_3;
		call Create_Grave_Dirt_3;
		call Create_Open_Grave;
		wait 2;
		actor frame STAND;

		call UnFreezeAvatar;
	}
}