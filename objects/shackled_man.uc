void Remove_Nakentep_Moongate_Sprite object#()()
{
    UI_sprite_effect(55, 2278, 2643, 0, 0, 0, -1);
}

void UnFreeze_Nakentep object#()()
{
	UI_clear_item_flag((-431), DONT_MOVE);
}

void Remove_Nakentep_Moongate object#()()
{
	var moongate = UI_find_nearby([2280, 2643, 0], 1179, 5, MASK_NONE); // unstable moongate
	UI_remove_item(moongate);
	
	// SET THE TOWN TO NO MORE INVASION
	gflags[HENSALL_FREED] = true;
	UI_modify_schedule((-435), 0, LOITER, [2430, 2762]); // move Lee
	UI_modify_schedule((-436), 0, LOITER, [2265, 2793]); // move Ophelia
	UI_modify_schedule((-433), 0, LOITER, [2317, 2711]); // move Ophelia	
}

void Nakentep_Close_Gate_Script()
{
	script -431
	{
		nohalt;
		face NORTH;
		say "Nakumnoodlamoosh!";
		wait 1;
		actor frame KNEEL;
		wait 1;
		call Remove_Nakentep_Moongate_Sprite;
		actor frame STAND;
		wait 1;
		actor frame CAST_1;
		wait 1;
		call High_Squeel;
		actor frame CAST_2;
		call Remove_Nakentep_Moongate;
		wait 1;
		actor frame STAND;
		wait 3;
		say "It is done";
		call UnFreeze_Nakentep;
		call UnFreezeAvatar;
		
		
	}
}

void Nakentep_Close_Gate()
{
	UI_set_item_flag((-431), DONT_MOVE);
	UI_si_path_run_usecode((-431), [2279, 2646, 0], SCRIPTED, (-431), Nakentep_Close_Gate_Script, 0);
	UI_si_path_run_usecode(AVATAR, [2270, 2647, 0], SCRIPTED, AVATAR, Null);
	
}

void Nakentep_Convo object#()()
{
UI_show_npc_face(573, 0);
say("@Thank you for saving me!@");
converse(["Name", "What happened?"])
{
	
	case "Name" (remove):
	say("@I am Nakentep but now is not the time for pleasantries.@");
	(-431)->set_item_flag(MET);
	
	case "What happened?" (remove):
	say("The old man cringes. @I had been working on a way for opening gateways to other realms when my servant turned on me and began destroying the town.@");
	say("@But now is not the time for talk. Now that I am free I can close the gateway the creatures are using to enter our realm.@");
	Nakentep_Close_Gate();
	UI_modify_schedule((-431), 0, LOITER, [2274, 26480]);
	break;
	
	/*
	case "Servant" (remove):
	say("@During one of my first successful experiments I opened a gateway and a red skinned brute appeared in my home. It seemed aggressive but I used my magic to tame the beast.@");
	say("@I thought my magic would allow me to take the creature so that it could preform menial labour tasks while I continued my work. It worked for some time until I managed to open another gateway.@");
	say("@As soon as the gateway opened my servant became so aggressive that it was almost as if my magic was nullified by whatever was on the other side.@");
	say("@Before I could even cast a spell my servant had knocked me unconcious. When I awoke I was shackled to the wall and the gateway remained open, with otherworldly beasts pouring out into Hensall.@");
	add(["Close the gate"]);
	*/

}

}

void Remove_Nakentep object#()()
{
	var nakentep = UI_find_nearby([2258, 2649, 0], 1465, 5, MASK_NONE);
	//UI_set_item_frame(nakentep, 1);
	UI_remove_item(nakentep);
	UI_move_object(-431, [2258, 2647, 0]); // move nakentep
	script -431
	{
		say "Thank you!";
	}
}

void Free_Nakentep()
{
	//AVATAR.say("Pii1");
	script AVATAR
	{
		nohalt;
		actor frame STAND;
		face WEST;
		wait 1;
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
		actor frame STAND;
		call Remove_Nakentep;
		wait 3;
		call Nakentep_Convo;
	}
	

}

void shackled_man shape#(1465)()
{

if(event == DOUBLECLICK)
{
	var frame = UI_get_item_frame(item);
	if(frame == 0)
	{
		//AVATAR.say("Poo");
		UI_set_item_flag(AVATAR, DONT_MOVE);
		UI_si_path_run_usecode(AVATAR, [2260, 2647, 0], SCRIPTED, AVATAR, Free_Nakentep, 0);
	}
}

}
