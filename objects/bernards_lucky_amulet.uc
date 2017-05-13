void bernards_lucky_amulet shape#(1486)()
{

	var container;
	var wearers_dex;
	var max_dex;
	var boost_dex;
	var apply_boost;
	var apply_lower;
	var quality;
	var lower_dex;
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
 
			if (!gflags[WEARING_BERNARDS_AMULET])
			{
				wearers_dex = UI_get_npc_prop(container, DEXTERITY);
				max_dex = (30 - wearers_dex);
				if (max_dex > 2)
					max_dex = 2;
 
				boost_dex = UI_set_item_quality(item, max_dex);
				apply_boost = UI_set_npc_prop(container, DEXTERITY, max_dex);
				if (apply_boost)  
					gflags[WEARING_BERNARDS_AMULET] = true;
			}
		}

		if (event == UNREADIED)
		{
			if (gflags[WEARING_BERNARDS_AMULET])
			{
				quality = UI_get_item_quality(item);
				lower_dex = (-1 * quality);
				apply_lower = UI_set_npc_prop(container, DEXTERITY, lower_dex);
				if (apply_lower)
				{
					gflags[WEARING_BERNARDS_AMULET] = false;
					
				}
			}
		}
	}
	else if (event == DOUBLECLICK)
	{
		AVATAR.say("@Perhaps if Bernard had been wearing his amulet he would not have fallen to the witch.@");
	}
	return;

}
