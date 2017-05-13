void white_dragonscale_cloak shape#(1440)()
{

	var container;
	var wearers_mana;
	var max_mana;
	var boost_mana;
	var apply_boost;
	var apply_lower;
	var quality;
	var lower_mana;
	var lower_health;
	var wearers_health;
	var delta;

	if ((event == READIED) || (event == UNREADIED))
	{
		container = UI_get_container(item);
 
		if ((container != 0) && (!UI_is_npc(container)))
			container = UI_get_container(container);

		if (container == 0)
		{
			UI_flash_mouse(0);
			return;
		}
 
		if (event == READIED)
		{
 
			if (!gflags[WEARING_DRAGONSCALE_CLOAK])
			{
				wearers_mana = UI_get_npc_prop(container, MANA);
				max_mana = (30 - wearers_mana);
				if (max_mana > 2)
					max_mana = 2;
 
				boost_mana = UI_set_item_quality(item, max_mana);
				apply_boost = UI_set_npc_prop(container, MANA, max_mana);
				if (apply_boost)  
					gflags[WEARING_DRAGONSCALE_CLOAK] = true;
			}
		}

		if (event == UNREADIED)
		{
			if (gflags[WEARING_DRAGONSCALE_CLOAK])
			{
				quality = UI_get_item_quality(item);
				lower_mana = (-1 * quality);
				apply_lower = UI_set_npc_prop(container, MANA, lower_mana);
				if (apply_lower)
				{
					gflags[WEARING_DRAGONSCALE_CLOAK] = false;
					
				}
			}
		}
	}
	return;

}



/**
	if(event == READIED)
	{
		var current_max_mana = UI_get_npc_prop(AVATAR, MAX_MANA);
		if(current_max_mana == 30)
		{
			gflags[MANA30] = true;
		}
		else if (current_max_mana == 29)
		{
			gflags[MANA29] = true;
		}
		UI_set_npc_prop(AVATAR, MAX_MANA, 2);


	}
	else if (event == UNREADIED)
	{
		if(gflags[MANA30])
		{
			gflags[MANA30] = false;
		}
		else if (gflags[MANA29])
		{
			gflags[MANA29] = false;
			UI_set_npc_prop(AVATAR, MAX_MANA, -1);
		}
		else
		{
		UI_set_npc_prop(AVATAR, MAX_MANA, -2);
		}
	
	}
	
}
**/