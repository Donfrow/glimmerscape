void Murg_Convo()
{

UI_show_npc_face(66, 0);

say("A burly gobin heads toward you, whip in hand. @Another victim comes to me.@");

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("The goblin charges at you.");
	UI_set_alignment(-354, HOSTILE);
	UI_set_schedule_type(-354, IN_COMBAT);
	UI_set_opponent(-354, AVATAR);
	break;
	
	case "Name" (remove):
	say("The goblin laughs. @Prepare to be tortured by Murg.@");
	
	case "Job" (remove):
	say("@To torture and cause suffering to my pets.@");
	add(["Pets"]);
	
	case "Pets" (remove):
	say("@The likes of you are my pets. I do enjoy causing them much suffering. And now that you have come to me I shall make you one of my pets. @");
	say("@Do enjoy the suffering you will endure by my hand for the rest of yours days.@");
	
}
}

void egg_murg_path object#()()
{
if(UI_is_dead(-354))
{
}
else
{
	script -354
	{
		say "A new prisoner!";
	}
	UI_si_path_run_usecode(-354, [751, 1336, 0], SCRIPTED, -354, Murg_Convo, 1);
}
}

void Jurgle_Convo()
{

UI_show_npc_face(66, 0);

say("A kean looking goblin approaches you. @You will make a lovely experiment.@");

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("@Prepare to feel my wrath.@");

	UI_set_alignment(-355, HOSTILE);
	UI_set_schedule_type(-355, IN_COMBAT);
	UI_set_opponent(-355, AVATAR);
	
	break;
	
	case "Name" (remove):
	say("@I am Jurgle, the smartest goblin of them all.@");
	
	case "Job" (remove):
	say("@To take the Liche's teaching and allow it to empower us as much as possible.@");
	add(["The liche is slain"]);
	
	case "The liche is slain" (remove):
	say("@The Liche believed that it was stronger than us but with my improvements and experiments we did not need such a feable being anymore.@");
	say("@All you have done is aided us in slaying him so that we do not have to. But do not think this will make your remaining days any less painful.@");
	
}
}

void egg_jurgle_path object#()()
{
if(UI_is_dead(-355))
{
}
else
{
	script -355
	{
		say "A new main course!";
	}
	UI_si_path_run_usecode(-355, [720, 1338, 0], SCRIPTED, -355, Jurgle_Convo, 1);
}
}

void Glur_Convo()
{

UI_show_npc_face(270, 0);

say("@You are impressive to have made it this far but you will not make it farther.@");

converse(["Name", "Job", "Bye", "Liche"])
{
	case "Bye" (remove):
	say("@You shall be slain by the greatest goblin of them all.@");

	UI_set_alignment(-353, HOSTILE);
	UI_set_schedule_type(-353, IN_COMBAT);
	UI_set_opponent(-353, AVATAR);
	
	break;
	
	case "Name" (remove):
	say("@You are in the presence of Glur, King of the Goblins.@");
	
	case "Job" (remove):
	say("@To take my kind to greatness at the expense of yours.@");
	
	case "Liche" (remove):
	say("@Indeed the Liche of the southern mountains did aid us. My minions that creature feasted upon in exchange were a small price to pay for the knowledge we gained.@");
	say("The goblin king laughs. @Soon we will no longer need the Liche and we shall feast on it as it has feasted upon us.@");
	add(["The liche is slain"]);
	
	case "The liche is slain" (remove):
	say("@If the Liche has been slain you has saved us much work. Unfortunately for you your suffering will not be any less painful.@");	
	add(["Over my dead body!"]);
	
	case "Over my dead body!" (remove):
	say("The goblin laughs. @That is the idea.@");
	
}
}

void egg_glur_path object#()()
{
if(UI_is_dead(-353))
{
}
else
{
	script -353
	{
		say "A new main course!";
	}
	UI_si_path_run_usecode(-353, [720, 1450, 0], SCRIPTED, -353, Glur_Convo, 1);
}
}

void Manspider_Convo()
{

UI_show_npc_face(610, 0);

say("@Prepare to meet your doom.@");

if (gflags[MAN_SPIDER_HAS_ORB])
{
add(["Orb of Transfiguration"]);
}

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("@You will feed me nicely.@");
	
	UI_set_alignment((-52), HOSTILE);
	UI_set_schedule_type((-52), IN_COMBAT);
	UI_set_opponent((-52), PARTY);
	
	break;
	
	case "Name" (remove):
	say("The creature seems confused by the question. @My next meal is my job.@");
	
	case "Job" (remove):
	say("@I serve the goblins, just as you will serve me as a meal.@");
	
	case "Orb of Transfiguration" (remove):
	say("@The orb, the orb! You will not get the orb!@");

	UI_set_alignment((-52), HOSTILE);
	UI_set_schedule_type((-52), IN_COMBAT);
	UI_set_opponent((-52), PARTY);
	
	break;
}
}

void egg_manspider_path object#()()
{
if(UI_is_dead(-52))
{
}
else
{
	script -52
	{
		say "Hissss";
	}
	UI_si_path_run_usecode((-52), [612, 1405, 0], SCRIPTED, (-52), Manspider_Convo, 1);
}
}

void egg_gruplinort_convo object#()()
{
UI_show_npc_face(654, 0);
say("A brutish goblin with a hint of intelligence approaches you. @You fail against might of Gruplinort!@");
converse(["Name", "Job", "Bye"])
{
	
	case "Bye" (remove):
	say("@You die now!@");
	
	UI_set_alignment(-35, HOSTILE);
	UI_set_schedule_type(-35, IN_COMBAT);
	UI_set_opponent(-35, PARTY);
	
	break;
	
	case "Name" (remove):
	say("A smug looks appears on the goblins vicious face. @Gruplinort! Last name you hear! Gruplinort!@");
	
	case "Job" (remove):
	say("@I assault human scum! I lead way for goblin to destroy human lands! You will die!@");

}

}