void headband_of_zao_pan shape#(1453)()
{

	var container;
	var wearers_dex;
	var wearers_combat;
	var max_dex;
	var max_combat;
	var boost_dex;
	var boost_combat;
	var apply_boost_dex;
	var apply_boost_combat;
	var apply_lower_dex;
	var apply_lower_combat;
	var quality;
	var lower_dex;
	var lower_combat;
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
 
			if (!gflags[WEARING_ZAOPAN_HEADBAND])
			{
				wearers_dex = UI_get_npc_prop(container, DEXTERITY);
				max_dex = (30 - wearers_dex);
				if (max_dex > 1)
					max_dex = 1;
					
				wearers_combat = UI_get_npc_prop(container, COMBAT);
				max_combat = (30 - wearers_combat);
				if (max_combat > 1)
					max_combat = 1;				
 
				boost_dex = UI_set_item_quality(item, max_dex);
				apply_boost_dex = UI_set_npc_prop(container, DEXTERITY, max_dex);
				apply_boost_combat = UI_set_npc_prop(container, COMBAT, max_combat);
				if (apply_boost_dex && apply_boost_combat)  
					gflags[WEARING_ZAOPAN_HEADBAND] = true;
			}
		}

		if (event == UNREADIED)
		{
			if (gflags[WEARING_ZAOPAN_HEADBAND])
			{
				quality = UI_get_item_quality(item);
				lower_dex = (-1 * quality);
				lower_combat = (-1 * quality);
				apply_lower_dex = UI_set_npc_prop(container, DEXTERITY, lower_dex);
				apply_lower_combat = UI_set_npc_prop(container, COMBAT, lower_combat);
				if (apply_lower_dex && apply_lower_combat)
				{
					gflags[WEARING_ZAOPAN_HEADBAND] = false;
					
				}
			}
		}
	}
	else if (event == DOUBLECLICK)
	{
		AVATAR.say("@This headband indicates that I have completed the first of Zao Pan's tests.@");
	}
	return;



}
/**
	if(event == READIED)
	{
		var current_max_dex = UI_get_npc_prop(AVATAR, DEXTERITY);
		var current_max_combat = UI_get_npc_prop(AVATAR, COMBAT);
		
		if(current_max_dex == 30)
		{
			gflags[HEADBAND_DEX30] = true;
		}
	
		if(current_max_combat == 30)
		{
			gflags[HEADBAND_COMBAT30] = true;
		}
	
		UI_set_npc_prop(AVATAR, DEXTERITY, 1);
		UI_set_npc_prop(AVATAR, COMBAT, 1);


	}
	else if (event == UNREADIED)
	{
		if(gflags[HEADBAND_DEX30])
		{
			var current_max_dex = UI_get_npc_prop(AVATAR, DEXTERITY);
			UI_set_npc_prop(AVATAR, DEXTERITY, -2);
			gflags[HEADBAND_DEX30] = false;
		}
		else
		{
		UI_set_npc_prop(AVATAR, DEXTERITY, -1);
		}
		if(gflags[HEADBAND_COMBAT30])
		{
			var current_max_combat = UI_get_npc_prop(AVATAR, COMBAT);
			UI_set_npc_prop(AVATAR, COMBAT, -1);
			gflags[HEADBAND_COMBAT30] = false;
		}
		else
		{
		UI_set_npc_prop(AVATAR, COMBAT, -1);
		}
		
	}
	else if (event == DOUBLECLICK)
	{
		AVATAR.say("@This headband indicates that I have completed the first of Zao Pan's tests.@");
	}

	
}
**/