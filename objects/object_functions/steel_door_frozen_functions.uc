void Remove_Frozen_Steel_Door object#()()
{

	UI_remove_from_area(FROZEN_DOOR, 0, [1153, 375], [1153, 375]);
	var steel_door = UI_create_new_object(376);
	UI_set_item_frame(steel_door, 12);
	UI_update_last_created([1153, 375, 0]);

}

void Melt_Steel_Door_Ice()
{
	script AVATAR
	{
		nohalt;
		face WEST;
		actor frame 35;
		wait 10;
		call Remove_Frozen_Steel_Door;
		wait 2;
		actor frame STAND;
		say "That did it";
		call UnFreezeAvatar;
	}
}


