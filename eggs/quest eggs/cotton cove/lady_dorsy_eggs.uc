void Old_Lady_Dorsy_Cat_Key object#()()
{
	UI_show_npc_face(541);
	say("Old Lady Dorsy rises from her bed and then glares at you. @Thank you for alerting me to this scoundrels actions Flickers. I will be taking back what you have taken now.@");
	UI_remove_party_items(1, 641, 186, 19); // remove key if not on keyring
	UI_remove_from_keyring(186); // remove from keyring if there
	
	// Create the key on the nightstand
	var key = UI_create_new_object(641);
	UI_set_item_frame(key, 19);
	UI_set_item_quality(key, 186);
	UI_update_last_created([1225, 1617, 2]);
}

void egg_check_for_key object#()() // If Lady Dorsy is around do not let Avatar leave with the key
{
if(gflags[GOT_KEY_OUT])
{
}
else
{
	var has_key = UI_count_objects(PARTY, 641, 186, 19);
	var key_on_keyring = UI_is_on_keyring(186);

	var schedule = UI_get_schedule_type(-457);

	if(has_key > 0 || key_on_keyring)
	{

		if(schedule == LOITER || schedule == EAT) // she is in the house eating or loitering
		{
			UI_show_npc_face(541);
			say("@Excuse me, but I believe you took a key of mine. I will be taking that back now.@");
			UI_remove_party_items(1, 641, 186, 19); // remove key if not on keyring
			UI_remove_from_keyring(186); // remove from keyring if there

			// Create the key on the nightstand
			var key = UI_create_new_object(641);
			UI_set_item_frame(key, 19);
			UI_set_item_quality(key, 186);
			UI_update_last_created([1225, 1617, 2]);
			
			script AVATAR
			{
				nohalt;
				say "I'm really not a bad person...";
			}
		}
		else if(schedule == SLEEP)
		{
			script -458
			{
				nohalt;
				say "Reeeeooooooow! Hissss!";
				wait 10;
				call Old_Lady_Dorsy_Cat_Key;
			}
			script AVATAR
			{
				nohalt;
				wait 12;
				say "I'm really not a bad person...";
			}
		}
		else
		{
			script -458
			{
				nohalt;
				say "Reeeeooooooow! Hissss!";
				wait 5;
			}
			script AVATAR
			{
				nohalt;
				wait 5;
				say "Quiet you!";
			}
			gflags[GOT_KEY_OUT] = true;
		}

	}

}

}



// EGGS BELOW FOR KILLING OLD LADY DORSY IN THE BASEMENT TORTURE ROOM

void Dorsy_Kill()
{
	UI_show_npc_face(541);
	say("Old Lady Dorsy appears before you and becomes enraged at the cat following her. @Flickers! How could you let this creep get out of my house with the key?!@");
	say("Suddenly, she turns to you and begins to scream as her body contorts. @You will not escape here alive! You will die at my hands!@");
	
	var loc = get_object_position(457);
	
    UI_sprite_effect(12, loc[1], loc[2], 0, 0, 0, -1);
	
	UI_set_item_shape(-457, 446); // ugly old woman shape for Dorsy
	
	UI_set_schedule_type(-457, IN_COMBAT);
	UI_set_schedule_type(-458, IN_COMBAT);
	
	UI_set_alignment(-457, HOSTILE);
	UI_set_alignment(-458, HOSTILE);
	
	UI_set_opponent(-457, AVATAR);
	UI_set_opponent(-458, AVATAR);
	
	UI_clear_item_flag(-457, SI_TOURNAMENT);
	UI_clear_item_flag(-458, SI_TOURNAMENT);
	
}

void Summon_Dorsy_Cat object#()()
{
	UI_move_object(-458, [2164, 2082]);
}


void Summon_Dorsy()
{

if(gflags[RACKMAN_DEAD])
{
if(gflags[HELP_ANNALYN])
{
if(UI_is_dead(-457))
{
}
else
{
	UI_move_object(-457, [2164, 2082]);
	UI_si_path_run_usecode(-457, [2163, 2087, 0], SCRIPTED, -457, Dorsy_Kill, 1);
	script item
	{
		wait 3;
		call Summon_Dorsy_Cat;
		actor frame STAND;
		
	}
	script -457
	{
		actor frame STAND;
		face WEST;
	}
}
}
}
}

void egg_dorsy_dead object#()()
{
if(UI_is_dead(-457) && UI_is_dead(-458))
{
//gflags[DEFEATED_ANNALYN_WITCH] = true;
}

}



































