// Eggs for killing Agata the insane and returning the beacon to make the fish spawn again

void egg_agata_convo_tragger object#()()
{

UI_show_npc_face(651);
say("A badly scarred woman looks at you and starts raving. @Blargh Anta Thanatos! Googmaaal!@");

converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("The woman continues to babble incoherently while running towards you.");
	break;
	
	case "Name" (remove):
	say("@Murga Boobooo Agata! Mutcha Pain!@");
	
	case "Job" (remove):
	say("@Burgh Thanatos! Purn Mucho! Ruvage Suffa! Slar Tanatos. Murga Remuge!@");

}

}

// FUNCTIONS FOR EGG TRIGGER CORINAV

void Cornav_Sprite_1 object#()()
{
    UI_sprite_effect(7, 2019, 2184, 0, 0, 0, -1);
}

void Cornav_Sprite_2 object#()()
{
    UI_sprite_effect(54, 2019, 2184, 0, 0, 0, -1);
}

void Cornav_Create_Fish object#()()
{

var fish = UI_create_new_object(509);
fish->set_alignment(FRIENDLY);
fish->set_schedule_type(LOITER);
UI_update_last_created([2011, 2192]);

var fish2 = UI_create_new_object(509);
fish2->set_alignment(FRIENDLY);
fish2->set_schedule_type(LOITER);
UI_update_last_created([2019, 2191]);

var fish3 = UI_create_new_object(509);
fish3->set_alignment(FRIENDLY);
fish3->set_schedule_type(LOITER);
UI_update_last_created([2023, 2184]);

}

void Cornav_Bye_Convo object#()()
{
UI_show_npc_face(650);
say("@My children already return to this spot now that the beacon guides them. Thank you for saving my children.@");
say("@Keep the spear as a token of my appreciation. Know that its target will always be true.@");
gflags[FISH_SPAWN_FIXED] = true;
}

void Remove_Cornav object#()()
{

UI_move_object(-468, [1877, 913]);
UI_clear_item_flag(AVATAR, DONT_MOVE);
UI_sprite_effect(7, 2019, 2184, 0, 0, 0, -1);
UI_play_sound_effect(81);;

}

void Cornav_Encounter_Convo object#()()
{

UI_show_npc_face(650);
say("@I can sense the shattered beacon is once again near where it belongs...@");
converse(["Shattered beacon", "Belongs","Bye"])
{
	
	case "Shattered beacon" (remove):
	say("@With the beacon is shattered the death of the tormented one has allowed me to peer into the cavern once more.@");
	add(["Tormented one"]);
	
	case "Tormented one" (remove):
	say("@The death of the tormented one shall hopefully bring peace to her and once again allow my children to find their way into the cavern.@");
	
	case "Belongs" (remove):
	say("@I can now recreate the beacon and place it where it belongs. My children will once again be able to spawn, to find themselves.@");
	
	case "Bye" (remove):
	say("@I shall now mend the beacon and once again be the guiding light for my children.@");
	UI_remove_party_items(1, SHATTERED_ORB, ANY, ANY);
	UI_set_npc_prop(PARTY, EXPERIENCE, 1000);
	
	script -468
	{
		nohalt;
		actor frame CAST_1;
		wait 2;
		actor frame CAST_2;
		call Cornav_Sprite_1;
		call High_Pitch;
		wait 2;
		actor frame STAND;
		wait 10;
		actor frame CAST_1;
		wait 2;
		actor frame CAST_2;
		call Cornav_Sprite_2;
		call High_Pitch;
		wait 2;
		actor frame STAND;
		wait 10;
		call Cornav_Create_Fish;
		wait 5;
		call Cornav_Bye_Convo;
		wait 1;
		call Remove_Cornav;
		
		
	
	}
	
	break;

}

}

void Cornav_Encounter ()
{

UI_move_object(-468, [2019, 2184]);
UI_sprite_effect(7, 2019, 2184, 0, 0, 0, -1);
UI_play_sound_effect(81);

script -468
{
	nohalt;
	actor frame STAND;
	face EAST;
	say "I sense you have the beacon";
	wait 15;
	call Cornav_Encounter_Convo;

}

}

void egg_trigger_Cornav object#()()
{

var shattered_orb = UI_count_objects(PARTY, SHATTERED_ORB, ANY, ANY);

if(shattered_orb > 0)
{

UI_set_item_flag(AVATAR, DONT_MOVE);
UI_si_path_run_usecode(AVATAR, [2026, 2183], SCRIPTED, AVATAR, Cornav_Encounter, 0);

}

}