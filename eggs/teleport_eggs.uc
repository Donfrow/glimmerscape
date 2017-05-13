void egg_teleport_to_castle_basement object#()() // Teleport to the magelord's castle basement from the room in the past
{
    UI_move_object(PARTY, [2450, 0068, 1, 1]);
    UI_sprite_effect(7, 2450, 0068, 1, 0, 0, 1);
    UI_play_sound_effect(86);
}

void egg_teleport_from_castle_basement object#()() // Teleport from the magelord's castle basement from the room in the past
{
    UI_move_object(PARTY, [1417, 0468, 1, 5]);
    UI_sprite_effect(7, 1417, 0468, 1, 0, 0, 5);
    UI_play_sound_effect(86);
}

void egg_teleport_to_dragon_cave object#()() // for "falling" down the chasm to the dragons cave in the north that is in the ice cavern
{
    UI_move_object(PARTY, [1024, 173, 0]);
}

void egg_enter_demon_realm object#()()
{
	UI_move_object(PARTY, [1776, 2394]);
	UI_set_item_flag(AVATAR, BLINKER_DISABLED);
}

void egg_leave_demon_realm object#()()
{
	UI_move_object(PARTY, [2039, 1368]);
	UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
}

void egg_fate_teleport_to_dead_end object#()()
{
    UI_move_object(PARTY, [725, 248, 0, 2]);
    UI_sprite_effect(7, 725, 248, 0, 0, 0, 5);
    UI_play_sound_effect(86);
	script AVATAR
	{
		face WEST;
	}
}

void egg_teleport_to_past_caverns object#()()
{
	if(gflags[DEATH_DEAD])
	{
		gflags[IN_ICE_STAIRS] = true;
		UI_set_item_flag(AVATAR, BLINKER_DISABLED);
		UI_move_object(PARTY, [1157, 374, 0, 2]);
	}
	else
	{
		var line = "@The stairs down appear to be crumbling. We best not go down as it does not appear we could get back up.@";
		var party = UI_get_party_list();
		var cnt = UI_get_array_size(party);
		var rand;
		if (cnt == 1)
		{
			rand = 1;  // Have only avatar.
			AVATAR.say("@The stairs down appear to be crumbling. I best not go down as I do not think I could get back up.@");
		}
		else
		{
			// Generate a number from 2 to # of party NPCs.
			rand = UI_die_roll(2, cnt);
		var npc = party[rand];
		line = [line];  // Convert to array.
		npc->show_npc_face();
		for (msg in line)
	        npc.say(msg);
		npc.hide();
		}
	}
}

void egg_teleport_orb_destruction object#()()
{
	UI_move_object(AVATAR, [362, 359]);
	UI_play_sound_effect(119);
}

void egg_karnax_basement object#()()
{
UI_move_object(PARTY, [2360, 2072]);
if(UI_is_dead(-207))
{

	if(gflags[MET_ASHELE])
	{
	}
	else
	{
		var corpse_1 = UI_create_new_object(402);
		UI_set_item_frame(corpse_1, 23);
		UI_update_last_created([2377, 2082]);
		
		var corpse_2 = UI_create_new_object(402);
		UI_set_item_frame(corpse_2, 23);
		UI_update_last_created([2392, 2103]);
		
		var corpse_3 = UI_create_new_object(402);
		UI_set_item_frame_rot(corpse_3, 55);
		UI_update_last_created([2390, 2070]);
		
		var corpse_4 = UI_create_new_object(402);
		UI_set_item_frame(corpse_4, 23);
		UI_update_last_created([2392, 2086]);

		var corpse_5 = UI_create_new_object(402);
		UI_set_item_frame_rot(corpse_5, 55);
		UI_update_last_created([2374, 2093]);
		
	}
}
}