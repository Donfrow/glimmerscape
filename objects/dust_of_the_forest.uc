void orb_of_the_forest shape#(1512)()
{

if(event == DOUBLECLICK)
{
	UI_close_gumps();
	var target = UI_click_on_item();
	var name = UI_get_npc_name(target[1]);
	if(name == "Lord Bedimwood")
	{

		gflags[ORB_USED_ON_BEDIMWOOD] = true;
		
		UI_show_npc_face(663, 0);
		say("The mans face distorts as you unleash the forest upon him. @What is this magic that you unleash upon me? You will die for your insolence.@");
		converse(["I made a mistake, pity me!", "Now you will die!"])
		{
			case "I made a mistake, pity me!" (remove):
			say("@You are a fool! I was content to let you live as long as you did not bother me, now you will join the many others who have dared to challenge me.@");
			break;
			
			case "Now you will die!" (remove):
			say("A twisted laugh echoes throughout the forest. @That is not the first time I have heard such brave words from such small people nor will it be the last.@");
			break;
		}
		
		script (-475)
		{
			actor frame KNEEL;
			say "Now you die";
			wait 2;
			actor frame STAND;
		}
		
		//create the guardians
		var fighter1 = UI_create_new_object(565);
		UI_set_npc_prop(fighter1, STRENGTH, 20);
		UI_set_npc_prop(fighter1, HEALTH, 20);
		UI_set_alignment(fighter1, HOSTILE);
		UI_set_schedule_type(fighter1, IN_COMBAT);
		UI_set_opponent(fighter1, AVATAR);
		UI_update_last_created([target[2]-2, target[3], target[4]]);
		UI_sprite_effect(47, target[2]-2, target[3], 0, 0, 0, -1);
		
		var fighter2 = UI_create_new_object(565);
		UI_set_npc_prop(fighter2, STRENGTH, 20);
		UI_set_npc_prop(fighter2, HEALTH, 20);
		UI_set_alignment(fighter2, HOSTILE);
		UI_set_schedule_type(fighter2, IN_COMBAT);
		UI_set_opponent(fighter2, AVATAR);
		UI_update_last_created([target[2]+2, target[3], target[4]]);
		UI_sprite_effect(47, target[2]+2, target[3], 0, 0, 0, -1);
		
		UI_play_sound_effect(87);
		
		// Do spell effects
		UI_sprite_effect(21, target[2], target[3], 0, 0, 0, -1);
		UI_play_sound_effect(29);
		
		
		// Set health
		UI_set_npc_prop(-475, STRENGTH, 45);
		UI_set_npc_prop(-475, HEALTH, 45);
		
		// Set targets
		UI_set_alignment(-475, HOSTILE);
		UI_set_schedule_type(-475, IN_COMBAT);
		UI_set_opponent(-475, AVATAR);
		
		//Do not make him killable, otherwise you will never get exp on his death.
		// The tournament flag will be cleared in his DEATH item, but only if gflag ORB_USED_ON_BEDIMWOOD is set, this should prevent farming this exp
		//UI_clear_item_flag(-475, SI_TOURNAMENT);
		
		//Change his shape
		UI_set_item_shape(-475, 528);
		
	}
	else if(name == "corrupt spirit")
	{
		UI_sprite_effect(21, target[2], target[3], 0, 0, 0, -1);
		UI_play_sound_effect(29);
		UI_modify_schedule(target[1], 0, LOITER, [1457, 1177]);
		gflags[FREED_FOREST_SPIRIT] = true;
		karma = karma + 25;
		KarmaGoodSprites();
		script target[1]
		{
			say "Free...";
		}
	}
	else
	{
		RandomPartySay("@Do not waste it!@");
	}
}

}
