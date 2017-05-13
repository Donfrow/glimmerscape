void Rod_of_Infinite_Thought shape#(1446)()
{

if(event == DOUBLECLICK)
{

	var target = UI_click_on_item();
	var shape = UI_get_item_shape(target[1]);

if(gflags[RECHARGE_WAND])
{
	var remaining_time = UI_get_timer();
	
	if(remaining_time < 3)
	{
		AVATAR.say("@The rod needs ", 3-remaining_time, " hours to recharge.@");
	}
	else
	{
		var max_mana = UI_get_npc_prop(AVATAR, MAX_MANA);
		var current_mana = UI_get_npc_prop(AVATAR, MANA);
		UI_set_npc_prop(AVATAR, MANA, max_mana - current_mana);
		
		var avatar_loc = UI_get_object_position(AVATAR);
		UI_sprite_effect(33, avatar_loc[1]-2, avatar_loc[2]-2, avatar_loc[3], 0, 0, 10);
		UI_play_sound_effect(83);
		rod_charges = 0;
		gflags[RECHARGE_WAND] = false;
	}
}

else
{		
	if(shape == 721 || shape == 989)
	{
		var max_mana = UI_get_npc_prop(AVATAR, MAX_MANA);
		var current_mana = UI_get_npc_prop(AVATAR, MANA);
		UI_set_npc_prop(AVATAR, MANA, max_mana - current_mana);
		
		var avatar_loc = UI_get_object_position(AVATAR);
		UI_sprite_effect(33, avatar_loc[1]-2, avatar_loc[2]-2, avatar_loc[3], 0, 0, 10);
		UI_play_sound_effect(83);
		
		rod_charges = rod_charges +1;		
		if(rod_charges > 2)
		{
			gflags[RECHARGE_WAND] = true;
			UI_set_timer();
		}
	}
}

}




}