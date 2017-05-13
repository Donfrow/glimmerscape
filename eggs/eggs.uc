void egg_learn_of_depths object#()() // egg at the staircase infront of locked door to learn of the depths
{
	script AVATAR
	{
		say "This must be The Depths";
		wait 5;
		say "I should see from whom";
		wait 5;
		say "I can get a key";
	}
	gflags[LEARN_OF_DEPTHS] = true;
}

void egg_dyson_fled object#()()
{
	if(gflags[DYSON_GUILTY1])
	{
		if(gflags[DYSON_ESCAPE])
		{
			AVATAR.say("@It would appear Dyson caught wind of his impending arrest and fled.@");
		}
		else
		{
			gflags[DYSON_ESCAPE] = true;
		}
	}
}

void egg_zao_pan_sit object#()()
{
	UI_set_item_frame(-460, 26);
	UI_move_object(-460, [520, 2027, 0]);
}

void egg_book_about_orb object#()()
{
if (gflags[SPAWN_ORB_BOOK])
	{
	var obj = UI_create_new_object(642);
	obj->set_item_quality(11);
	obj->set_item_frame(13);
	UI_update_last_created(get_object_position());
	}
}


void egg_see_manspider object#()()
{

AVATAR.say();
say("@It seems this area has recently been attacked. Yet, it does not look like the work of goblins.@");



}

void egg_spawn_key_to_darkmonks object#()() // spawns a key to get into dark monks sanctuary
{
if (gflags[SEE_MONKS_ABOUT_ORB])
	{
	var obj = UI_create_new_object(641); 
	obj->set_item_quality(197);
	obj->set_item_frame(29);
	UI_update_last_created(get_object_position());
	}
}



void egg_solusek_mining_company_door object#()() // Keeps the avatar out unless you have business going in
{


if (gflags[FLANWALD_BOUNTY])
	{
	}
else
	{
	
	//182.say("poo");
	//say("I have no business going in here and would prefer to keep my life at this time.");
	//UI_path_run_usecode([107, 859, 0], 0,0,0);
	UI_set_item_flag(AVATAR, DONT_MOVE);
	UI_si_path_run_usecode(AVATAR, [0x107, 0x859, 0], SCRIPTED, AVATAR, UnFreezeAvatar_NonScript, 0);  //107, 859, 0
	script AVATAR
	{
		say "I have no business being in there";
	}
	}

}


void egg_ArtemisSay object#()()
{

script (-304)
{
	say "This does not seem correct...";
}

}

void Kill_Artemis object#()()
{
UI_kill_npc(-304);
}

void Move_Artemis object#()()
{
UI_move_object((-304), [1826, 866]);
}

void Sev_Kill_Artemis object#()()
{
	script (-84)
	{
		face WEST;
		say "Die Artemis!";
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		call Kill_Artemis;
		wait 1;
		call Move_Artemis;
	}
	script (-304)
	{
		face EAST;
		say "Die beast!";
	}
}

void egg_SevSlayArtemis object#()()
{

var avatar_name = UI_get_npc_name(AVATAR);

if (inParty(-304))
	{
	UI_show_npc_face0(310,0);
	say("@You have done well by bringing Artemis Batbane to me. Artemis, we meet at least.@");
	UI_show_npc_face1(1, 0);
	say("@What is this treachery?@");
	UI_show_npc_face0(310,0);
	say("@My dear Artemis. Far too long you have slain my kind for your own gain. Now, your fellow human has brought you before me for his own gain. Quite fitting really.@");
	UI_show_npc_face1(1, 0);
	say("@", avatar_name, " you are a blight upon the land and after I am done slaying this beast I shall slay you!@");	
	UI_remove_from_party(-304);
	UI_si_path_run_usecode(-84, [2837, 2693, 0], SCRIPTED, -84, Sev_Kill_Artemis, 1); // Severilious
	UI_si_path_run_usecode(-304, [2830, 2693, 0], SCRIPTED, -84, Sev_Kill_Artemis, 1); // Art emis
	gflags[SEV_KILLED_ART] = true;
	
	}

}


void egg_SetSevtoNice object#()()
{

if (UI_is_dead(-304))
	{
	UI_set_schedule_type(-84, LOITER); // if Artemis is dead set him to loiter again
	}

}

void egg_bains_in_party object#()()
{
// One of these MUST be triggered on exit for the blinker to work again, otherwise it's disabled until the next time a flag clears it as part of the game.
// There should be no way for the avatar to get away unless teleported.
    if (inParty(-47))
    {
        UI_show_npc_face(168, 0);
        say("@Well, you have lead me away from the goblin camp. I thank you for your help... but now I must slay you so that you do not try to collect the bounty that is surely on my head...@");
        UI_set_opponent((-47), AVATAR);
        UI_set_schedule_type((-47), IN_COMBAT);
		// March 16, 2017 - This set alignment is not working, no matter the format, ie UI_set_alignment(-47, HOSTILE) or UI_set_alignment((-47, HOSTILE)), or even using 2 as the value. Not sure why :(
		//(-47)->set_alignment(HOSTILE);
        UI_remove_from_party((-47));
        gflags[KILLED_BAINS] = true;
		gflags[BAINS_IN_PARTY] = false;
		UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
    }
	else if (UI_is_dead(-47))
	{
		UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
	}
}

void egg_dyson_comment object#()()
{
    if(gflags[DYSON_GUILTY1])
    {
        if (gflags[STOP_DYSON_EGG])
        {
        }
        else
        {
        AVATAR.say("@It would appear that Dyson has caught wind of his impending arrest and fled...@");
        gflags[DYSON_ESCAPE] = true;
        gflags[STOP_DYSON_EGG] = true;

        }
    }
}

void egg_golden_statue_comment object#()()
{
	AVATAR.say("@It seems there are some of the golden statues Jones was speaking of down here. I wonder if I could get one topside.@");
}

void egg_spawn_terminator_instructions object#()()
{
    if (gflags[DYSON_GUILTY1])
    {
        var obj = UI_create_new_object(GOOD_SCROLL);
        obj->set_item_quality(70);
        obj->set_item_frame(0);
        UI_update_last_created(get_object_position());
    }
}

void egg_create_molten_cloak object#()()
{
    if (gflags[GAVE_MOLTEN_CLOAK])
    {
        var obj = UI_create_new_object(MOLTEN_CLOAK);
        UI_update_last_created(get_object_position());
    }
}

void egg_create_shield object#()()
{
    if (gflags[SOLD_SHIELD])
    {
        var obj = UI_create_new_object(490);
        obj->set_item_frame(32);
        UI_update_last_created(get_object_position());
    }
}

void egg_set_get_lechuck_key object#()()
{
    AVATAR.say("@Methinks I need to find a pirate willing to pass on his key to this door to gain entrance.@");
    gflags[GET_KEY_FROM_DEADEYE] = true;
}



void egg_flux_capacitor_on object#()()
{
var flux_capacitor;
var loc = get_object_position();
flux_capacitor = loc->find_nearby(FLUX_CAPACITOR, 0, MASK_NONE);
}

void egg_testing object#()()
{
/*      THIS IS THE NON_WORKING VERSION
var soul_orb;
var loc = UI_get_object_position();
soul_orb = loc->find_nearby(1378, 0, MASK_NONE);

    if (soul_orb)
    {
        AVATAR.say("Poo");
    }
    else
    {
        UI_sprite_effect(40, 2354, 1422, 0, 0, 0, -1);
    }

 */

}

void egg_teleport_test object#()()
{
    var loc = get_object_position();
    var avatar_near = loc->find_nearby(AVATAR, 0, MASK_NONE);
    if (avatar_near)
    {
        UI_move_object(PARTY, [0937, 1799, 0]);
        AVATAR.say("Getting that avatar is near");
    }
    else
    {
        AVATAR.say("Poo");
    }
}


void egg_collapse object#()()
{
    if(gflags[DEBRIS_FELL])
    {
    }
    else
    {
        UI_earthquake(25);
        var debris = UI_create_new_object(202); // debris
        UI_update_last_created([230, 2596]);
        
        var hole = UI_create_new_object(1398); // the hole in the dirt
        UI_update_last_created([223,2591]);
        var ladder_top = UI_create_new_object(1399); // ladder top
        UI_update_last_created([213, 2585]);
        gflags[DEBRIS_FELL] = true;
    }
        

}

void egg_exeter_hole object#()()
{
    if(gflags[DEBRIS_FELL])
    {
        UI_move_object(PARTY, [1959, 1030, 0]);
    }
}

void egg_leave_cotton_cove object#()()
{
    if(gflags[PAID_DEBT])
    {
    }
    else
    {
		UI_set_item_flag(AVATAR, DONT_MOVE);
   	    UI_show_npc_face(627);
   	    say("@You may not pass until you pay your 150 gold debt.@");
        UI_si_path_run_usecode(AVATAR, [1072, 1848, 0], SCRIPTED, AVATAR, UnFreezeAvatar_NonScript, 0);
    }
}

void egg_karma_set_value object#()()
{
    karma = 500;
}

void egg_karma_evil_test object#()()
{
    var loc = get_object_position();
    var pouch = loc->find_nearby(BEGGAR_POUCH, 0, MASK_NONE); // beggar pouches
    var pinecone = loc->find_nearby(264, 0, MASK_NONE); // pinecones
    
    if(pouch)
    {
        beggar_pouch = beggar_pouch + 1;
		UI_play_sound_effect(102);
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_remove_from_area(BEGGAR_POUCH, 0, [loc[1], loc[2]], [loc[1], loc[2]]);
        if (beggar_pouch == 4)
        {
            var key = UI_create_new_object(641); // create key
            UI_set_item_quality(key, 8);
            UI_update_last_created([loc[1], loc[2], loc[3]]);
        }
    }

}

void egg_karma_evil_test1 object#()()
{
	
    var loc = get_object_position();
    UI_sprite_effect(7, loc[1], loc[2], 0, 0, 0, -1);
    var monk = UI_create_new_object(179); // monk shape
    UI_set_item_frame_rot(monk, 32);
    UI_update_last_created([loc[1], loc[2], loc[3]]);
    UI_show_npc_face(209);
    if (karma < 5000)
    {
        say("@You have proven yourself to be worthy of an artifact which will help to enable your deepest desires.@");
        say("@Continue on to claim your reward.@");
        var key = UI_create_new_object(641); // create key
        UI_set_item_quality(key, 9);
        UI_update_last_created([loc[1], loc[2], loc[3]]);
        

    }
    else
    {
        say("@You have failed your task. You have given into empathy and pity. You are weak! You are not worthy to wield what lays beyond.@");
    }
     UI_remove_from_area(179, 32, [loc[1]-5, loc[2]-5], [loc[1]+5, loc[2]+5]); // remove monk shape
	 UI_play_sound_effect(81);
}

void egg_karma_good_test1 object#()()
{
    var loc = get_object_position();
    UI_sprite_effect(7, loc[1], loc[2], 0, 0, 0, -1);
    var woman = UI_create_new_object(274); // green woman shape
    UI_set_item_frame_rot(woman, 0);
    UI_update_last_created([loc[1], loc[2], loc[3]]);
    UI_show_npc_face(55);
    if (karma > 5000)
    {
        say("@You have proven yourself to be caring and pure. You have sought to understand the entire picture before proceeding with your blade.@");
        say("@Continue on to claim your reward.@");

        var key = UI_create_new_object(641); // create key
        UI_set_item_quality(key, 17);
        UI_update_last_created([loc[1], loc[2], loc[3]]);


    }
    else
    {
        say("@You have failed your task. You have given into bloodlust and revenge. You are not worthy to wear what lays here.@");
    }
     UI_remove_from_area(274, 0, [loc[1]-5, loc[2]-5], [loc[1]+5, loc[2]+5]); // remove woman shape
	 UI_play_sound_effect(81);
}

void egg_take_gold object#()()
{
    UI_show_npc_face(209);
    say("@Yes, yes. Take what you desire. I knew you could not resist.@");
    karma = karma - 200;
}

void egg_remove_vox_debris object#()()
{
    if(gflags[LEARN_OF_VOX])
    {
        UI_remove_from_area(202, 8, [1182, 507], [1202, 522]);
    }
}

void egg_bandit_cart object#()()
{
	UI_play_music(1);
	script AVATAR
	{
		say "This looks like a bandit ambush";
	}
}

void egg_learn_of_sentri_flag object#()()
{
	gflags[LEARN_OF_SENTRI] = true;
}

void remove_goblin_debris object#()()
{
	if(gflags[GOBLIN_BASE])
	{
		UI_remove_from_area(202, 0, [0x26a, 0x60a], [0x285, 0x61d]);
	}

}