void Beings_Of_Fire_Convo()
{
UI_push_answers();
converse(["Fire elemental", "Fire dragon", "Phoenix", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@But of course.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Fire elemental" (remove):
	say("A small flame falls from one of her eyes. @The fire elementals are pure fire, their very lifeblood is the flames.@");
	say("@Sadly, Azechal's actions have twisted them into mindless creatures of destruction you have seen in your travels.@");
	say("@I have no doubt I can undue the damage Azechal has done. It is simply a question of time.@");

	case "Fire dragon" (remove):
	say("@Fire dragons are not creatures of pure flame but they require the flames to live. Flames not only sustain them, but it also gives them strength.@");
	say("@The only time you will ever see a fire dragon away from the flames willingly is when they know their time to pass on from this realm has come.@");
	
	case "Phoenix" (remove):
	say("A big smile appears. @Such lovely creatures. A phoenix is a bird of fire, one of my very first children.@");
	say("@They are so pure that the only way they can perish is when the flames around them die out. As long as the flames continue to burn, so will the lifeblood of a phoenix.@");
}
}

void Queen_Fire_Convo()
{
UI_show_npc_face(655);
say("A woman with flame in her eyes approaches you.");
converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("She nods at you as you depart.");
	UI_modify_schedule(-470, 0, LAB, [1720, 2454]);
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	break;
	
	case "Name" (remove):
	say("She brushes her hand through her hair. @I am of course Kiliki, the true master of fire.@");
	say("@Though I speak to you through the use of an Avatar.@");
	add(["Avatar"]);
	
	case "Avatar" (remove):
	say("@My true self would destroy this realm the moment I step foot in it. To prevent this I use an Avatar to project myself in your realm.@");
	
	case "Job" (remove):
	say("A cackling laugh comes from the woman. @My simple friend. I am the Avatar of Fire. I am the one who controls the burning passion of fire.@");
	say("@Sadly, my job now is to undue the damage done to the very flames of this world.@");
	add(["Controls", "Fire", "Undue damage"]);

	case "Controls" (remove):
	say("@I am the one who breathes fire into this world. I am the one whom creates the beings of fire. Though I am sad to say I had a lapse in judgement when I looked to aid Azechal.@");
	add(["Beings of fire", "Azechal"]);
	
	case "Beings of fire" (remove):
	say("@Of what would you like to know?@");
	Beings_Of_Fire_Convo();
	
	case "Azechal" (remove):
	say("The womans eyes appear to turn into flames. @Azechal sought to know the ways of flames. He tried so hard yet never accomplished a thing so I took it upon myself to aid the poor man.@");
	say("@This was an enormous mistake on my part.@");
	add(["Mistake"]);
	
	case "Mistake" (remove):
	say("@It would seem Azechal knew more about controlling the flames than it appeared. He was merely playing the part of a bumbling fool so that I would come before him.@");
	say("@When I came before him he used his magical knowledge to imprison me within the confines of the Plane of Fire.@");
	add(["Imprison", "Plane of Fire"]);
	
	case "Imprison" (remove):
	say("@When I came before Azechal he used his magic to capture me. While I was his prisoner he stole much of my knowledge of fire.@");
	say("@I managed to escape back to the Plane of Fire before he had aquired all of my knowledge.@");
	say("@Unfortunately after I escaped he used the knowledge he had stolen to seal the gateway I use to travel between the realms. That is until you extinguished his very life.@");
	add(["Knowledge", "Gateway"]);
	
	case "Knowledge" (remove):
	say("@Although he did not manage to steal all of my knowledge of fire, Azechal did steal enough to corrupt the purest creatures of flames, the fire elementals.@");
	say("@Luckily, for the both of us, he failed to do much else while in possession of the knowledge of fire.@");
	add(["Fire elementals"]);
	
	case "Fire elementals" (remove):
	say("A small flame falls from one of her eyes. @The fire elementals are pure fire, their very lifeblood is the flames.@");
	say("@Sadly, Azechal actions have twisted them into mindless creatures of destruction you have seen in your travels.@");
	say("@I have no doubt I can undue the damage Azechal has done. It is simply a question of time.@");
	
	case "Gateway" (remove):
	say("@I use a gateway between my home, the Plane of Fire, and the realms in which fire burns. It is this gateway Azechal sealed, preventing me from sending my Avatar to the different realms.@");
	add(["Realms"]);
	
	case "Realms" (remove):
	say("@As the ruler of the Plane of Fire I cannot travel to this realm in my true form, and you cannot travel to mine in your form. I use Avatars so that I may exist in your realm.@");
	say("@It is what you speak to at this time.@");
	say("She ponders for a moment. @The flames whisper to me that you are aware of such things... there is something about you I cannot quite grasp.@");
	add(["What about me?"]);
	
	case "What about me?" (remove):
	say("@I cannot say what it is about you for I do not even understand myself. Yet I feel you too have a connection to the planes, a connection that only an Avatar would possess.@");
	add(["Connection"]);
	
	case "Connection" (remove):
	say("@Every Avatar has an intrinsic connection with the planes, with the strongest connection being that of their home plane. I feel you have such a connection, yet it is different from any connection I have ever sensed.@");
	say("@I do not understand what it is about you but something about you is strange... strange even for those of us who traverse the planes.@");
	
	case "Plane of Fire" (remove):
	say("@There are many planes of existence. While this plane may be the one you exist in it is not the one I exist in. I exist in the Plane of Fire.@");

	case "Fire" (remove):
	say("@The element you know as fire is my child. Each time you light a candle a new life is created. Each time a candle burns out a life is extinguished.@");
	say("@Such is the nature of fire.@");
	add(["New life", "Extinguished"]);
	
	case "New life" (remove):
	say("The woman stares at you coldly. @Although it may not seem like a life to you, I can assure you that each flame is a lifeforce in and of itself.@");
	
	case "Extinguished" (remove):
	say("@Everytime a flame becomes extinguished a life is lost. As the mother of fire I feel each time one of my children flicker out and disappear.@");
	say("@Yet this is the way of my children and they have lived their life, and served their purpose.@");
	
	case "Undue damage" (remove):
	say("A fiery rage seems to fill the woman. @I must undue the damage done to my children the fire elementals.@");
}

}

void Move_Queen_of_Fire object#()()
{
UI_move_object(-470, [1718, 2454]);
}

void Path_Queen_of_Fire object#()()
{
var avatar_loc = UI_get_object_position(AVATAR);
UI_si_path_run_usecode(-470, [avatar_loc[1], avatar_loc[2]-1], SCRIPTED, -470, Queen_Fire_Convo, 1);
}

void Summon_Queen_of_Fire object#()()
{
targetx = 1718;
targety = 2454;

script AVATAR
{
	nohalt;
	call Blue_Teleport_Ring;
	call Teleport_In_Sound;
	call Move_Queen_of_Fire;
	wait 10;
	call Path_Queen_of_Fire;

}

}

void Kill_Lord_Of_Flame object#()()
{
	UI_kill_npc(-387);
}


void helm_of_ice shape#(1069)()
{
if(event == DOUBLECLICK)
{
	if(gflags[ZAO_PAN_FINAL_TEST_CONT])
	{
		var target = UI_click_on_item();
		var object = target[1];
		var name = UI_get_npc_name(target[1]);
		if(name == "Lord of Flame")
		{
			UI_close_gumps();
			script -387
			{
				nohalt;
				actor frame STAND;
				call FreezeAvatar;
				wait 2;
				say "You dare bring this to me?";
				wait 10;
				say "You shall feel my wrath";
				actor frame CAST_1;
				wait 2;
				actor frame CAST_2;
				wait 2;
				actor frame CAST_1;
				call Spell_Fail;
				wait 2;
				say "The flames, they grow cold!";
				wait 10;
				say "No, stop it, aaargh!";
				wait 5;
				actor frame KNEEL;
				wait 2;
				actor frame LIE;
				wait 2;
				call Hit_Sound;
				call Kill_Lord_Of_Flame;
				wait 10;
				call Summon_Queen_of_Fire; // Scripting continues in this
			}
		}
	}
	else
	{
		AVATAR.say("@It is so cold...@");
	}
}
}

