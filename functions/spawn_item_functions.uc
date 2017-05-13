void Ice_Witch_Create_Blood1 object#()()
{
	var blood = UI_create_new_object(912); // blood shape
	UI_set_item_frame(blood, 2);
	UI_update_last_created([targetx, targety, 0]);	
}

void Ice_Witch_Create_Blood2 object#()()
{
	var blood = UI_create_new_object(912); // blood shape
	UI_set_item_frame(blood, 1);
	UI_update_last_created([targetx-2, targety+1, 0]);	
}

void Ice_Witch_Create_Blood3 object#()()
{
	var blood = UI_create_new_object(912); // blood shape
	UI_set_item_frame(blood, 0);
	UI_update_last_created([targetx+1, targety-2, 0]);	
}

void Create_Blood object#()()
{
	var blood = UI_create_new_object(912); // blood shape
	var n = UI_die_roll(0, 3);
	var loc_offset = UI_die_roll(1, 3);
	UI_set_item_frame(blood, n);
	if(n == 0)
	{
	UI_update_last_created([targetx+loc_offset, targety+loc_offset, 0]);
	}
	else if (n == 1)
	{
	UI_update_last_created([targetx-loc_offset, targety+loc_offset, 0]);
	}
	else if (n == 2)
	{
	UI_update_last_created([targetx+loc_offset, targety-loc_offset, 0]);
	}
	else if (n == 3)
	{
	UI_update_last_created([targetx-loc_offset, targety-loc_offset, 0]);
	}
}
