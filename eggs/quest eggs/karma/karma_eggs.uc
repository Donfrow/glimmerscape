// EGGS IN CORRUPTED BAD TEST (IE YOU ARE GOOD) THAT ARE NO USED IN THE END ROOM

void egg_call_for_help object#()()
{

if(event == 0)
{
	if(gflags[RESCUED_TRAPPED_MAN])
	{
	}
	else
	{
		UI_item_say(item, "I need help getting out...");
	}
}

if(gflags[RESCUED_TRAPPED_MAN])
{
}
else
{

	var n = UI_get_random(5);
	if(n == 1)
	{
		script item
		{
			say "Anyone? Help me...";
		}
	}
	else if (n == 2)
	{
		script item
		{
			say "Help... I am trapped...";
		}
	}
	else if (n >= 3)
	{
		script item
		{
			say "Please... toss me a rope...";
		}
	}
	}
}



// THIS GROUP OF FUNCTIONS RELATED TO BEING IN THE CORRUPTED BAD TEST

void Remove_Avatar_From_Bad_Mirror_Good object#()()
{
	UI_move_object(AVATAR, [1960, 883, 0, 0]);
	var has_sword = UI_count_objects(PARTY, 806, ANY, ANY);
	if(has_sword > 0)
	{
	}
	else
	{
		UI_add_party_items(1, 806, ANY, ANY);
	}
}

void egg_remove_sword_allowed()
{
	var sword = UI_find_nearest(item, 806, 45);
	var avatar_mirror_dead = UI_is_dead(-453);
	if(avatar_mirror_dead)
	{
		UI_close_gumps();
		UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
		gflags[FINISHED_CORRUPT_BAD_TEST] = true;
		UI_set_item_flag(AVATAR, DONT_MOVE);
		script AVATAR
		{
			nohalt;
			call Fade;
			wait 4;
			actor frame STAND;
			face SOUTH;
			call Remove_Avatar_From_Bad_Mirror_Good;
			wait 4;
			call Add_All_Party_Members;
			call UnFade;
			wait 3;
			call UnFreezeAvatar;
		}
		gflags[IN_BAD_TEST] = false;
	}
}

void Fake_Avatar_Bad_Initial_Convo_Door object#()()
{
var female = UI_get_npc_prop(AVATAR, 10);

if(female)
{
	UI_show_npc_face(0, 2);
}
else
{
	UI_show_npc_face(0, 3);
}

say("@Do you still think you are worthy? You make even me laugh!@");

}

void Move_Fake_Avatar_Bad_Test_Door object#()()
{
	if(UI_is_dead(-453))
	{
	}
	else
	{
		UI_move_object(-453, [817, 2568, 0]);
		targetx = 817;
		targety = 2568;
	}
}

void egg_taunt_at_door object#()()
{

script -453
{
	nohalt;
	face EAST;
	call Move_Fake_Avatar_Bad_Test_Door;
	call Purple_Bubbles_Target;
	call Bubbly_Sound;
	say "He he he...";
	wait 14;
	call Fake_Avatar_Bad_Initial_Convo_Door;
}
	
}



void Fake_Avatar_Bad_Initial_Convo object#()()
{
var female = UI_get_npc_prop(AVATAR, 10);

if(female)
{
	UI_show_npc_face(0, 2);
}
else
{
	UI_show_npc_face(0, 3);
}

say("@You think you are different but I know better...@");

converse(["Who?", "What?"])
{
	case "Who?" (remove):
	say("@You of course.@");
	
	case "What?" (remove):
	say("@Did you really think you could simply take that which you are not worthy of?@");
	add(["Worthy"]);
	
	case "Worthy" (remove):
	say("@You are not worthy to take such an artifact yet you think you can simply waltz in and take it? You should know better than that!@");
	add(["Artifact"]);
	
	case "Artifact" (remove):
	say("@You think you are different yet you come here to take what you want for your little quest. You are no different than any of the others you pretentious sod.@");
	add(["Others"]);
	
	case "Others" (remove):
	say("@Do you think you are the first? Ha ha ha! You are nothing but another number in the many who are unworthy for what lies beyond.@");
	add(["What lies beyond"]);
	
	case "What lies beyond" (remove):
	say("@Go take a look... oh wait. You will never get it!@");
	break;
}

}

void Move_Fake_Avatar_Bad_Test object#()()
{
	UI_move_object(-453, [823, 2601, 0]);
	targetx = 823;
	targety = 2601;
}

void Egg_Fake_Black_Sword object#()()
{
	var black_sword1 = UI_find_object(-359, 806, ANY, ANY);
	var black_sword2 = UI_find_object(PARTY, 806, ANY, ANY);
	
	UI_remove_item(black_sword1);
	UI_remove_item(black_sword2);
	UI_remove_party_items(1, 806, ANY, ANY);
	
	UI_sprite_effect(9, 821, 2603, 1, 0, 0, -1);
	UI_play_sound_effect(80);
	
	UI_create_new_object(806);
	UI_update_last_created([804, 2566, 2]);
	
	script -453
	{
		nohalt;
		face SOUTH;
		call Move_Fake_Avatar_Bad_Test;
		call Purple_Bubbles_Target;
		call Bubbly_Sound;
		wait 10;
		call Fake_Avatar_Bad_Initial_Convo;
		
	}
	
}

// ALL BELOW FUNCTIONS RELATED TO BEING EVIL IN THE CORRUPTED GOOD TEST

void Remove_Avatar_From_Good_Mirror_Bad object#()()
{
	UI_move_object(AVATAR, [707, 1655, 0, 0]);
	var has_bp = UI_count_objects(PARTY, DONALS_BP, ANY, ANY);
	if(has_bp > 0)
	{
	}
	else
	{
		UI_add_party_items(1, DONALS_BP, ANY, ANY);
	}
}

void Remove_BP_Allowed object#()()
{
	var bp = UI_find_nearest(item, DONALS_BP, 45);
	var avatar_mirror_dead = UI_is_dead(-450);
	if(avatar_mirror_dead)
	{
		UI_close_gumps();
		UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
		gflags[FINISHED_CORRUPT_GOOD_TEST] = true;
		UI_set_item_flag(AVATAR, DONT_MOVE);
		script AVATAR
		{
			nohalt;
			call Fade;
			wait 4;
			actor frame STAND;
			face SOUTH;
			call Remove_Avatar_From_Good_Mirror_Bad;
			wait 4;
			call Add_All_Party_Members;
			call UnFade;
			wait 3;
			call UnFreezeAvatar;
		}
		gflags[IN_GOOD_TEST] = false;
	}
	else
	{
		UI_close_gumps();
		UI_remove_item(bp);
		UI_remove_party_items(1, DONALS_BP, ANY, ANY);
		UI_create_new_object(DONALS_BP);
		UI_update_last_created([848, 1247, 2]);
		UI_play_sound_effect(3);
	}
}

void Evil_Avatar_Convo object#()()
{
var female = UI_get_npc_prop(AVATAR, 10);

if(female)
{
	UI_show_npc_face(0, 2);
}
else
{
	UI_show_npc_face(0, 3);
}

var name = UI_get_npc_name(AVATAR);

say("@He he he...@");
converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("@Have at you!@");
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	UI_clear_item_flag(-450, DONT_MOVE);

	UI_set_alignment(-450, HOSTILE);
	UI_set_schedule_type(-450, IN_COMBAT);
	UI_set_opponent(-450, AVATAR);
	
	break;
	
	case "Name" (remove):
	say("@My name is ", name, "of course. How could you not know such a thing? Oh right. You are quite the fool.@");
	
	case "Job" (remove):
	say("@What is my job? To be twisted, corrupt, and care only for myself of course. But you know this already for you are already living your job.@");
	add(["Twisted", "Corrupt", "Myself"]);
	
	case "Twisted" (remove):
	say("@Is it not such a wonderful thing to do whatever one pleases? Is it not swell to go about doing whatever mean thing our little heart sees fit?@");
	add(["Our heart"]);
	
	case "Our heart" (remove):
	say("@Buhaha, are you so daft that you cannot see we are one?@");
	
	case "Corrupt" (remove):
	say("@What better way to achieve ones own ends when one cares not for the way such a thing is to be done? It makes things so much simpler.@");
	
	case "Myself" (remove):
	say("@Ourself. For we are one. I care only for me. You are only for you. Yet we are the same. Therefore you care only for me. Buhaha@");
	add(["Huh?"]);
	
	case "Huh?" (remove):
	say("The being lets out a horrid laugh. @I am you which you have brought upon yourself. Is it not so enjoyable caring only for oneself?@");
	add(["Oneself"]);
	
	case "Oneself" (remove):
	say("@Caring only for me!@");
}

}

void Spawn_Evil_Avatar ()
{
	var female = UI_get_npc_prop(AVATAR, 10);
	if(female)
	{
		UI_set_item_shape(-450, 1025);
	}
	
	UI_set_item_flag(-450, DONT_MOVE);
	
	targetx = 850;
	targety = 1246;
	UI_move_object(-450, [850, 1247]);
	script -450
	{
		nohalt;
		actor frame STAND;
		face EAST;
		call Popping;
		call Weird_Teleport;
		wait 2;
		say "He he he...";
		wait 8;
		call Evil_Avatar_Convo;
	}
	script AVATAR
	{
		nohalt;
		actor frame STAND;
		face WEST;
	}
}

void Move_Evil_Avatar()
{
	UI_move_object(-450, [850, 1247]);
}

void egg_spawn_evil_avatar_path object#()()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
	UI_si_path_run_usecode(AVATAR, [856, 1247, 0], SCRIPTED, AVATAR, Spawn_Evil_Avatar, 0);
}