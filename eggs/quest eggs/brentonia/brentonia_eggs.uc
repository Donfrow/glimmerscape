void Avatar_Brentonia_Decision()
{
UI_push_answers();

UI_show_npc_face0(499, 0);
say("@Do you not see why we did what we did? Do you not see it is for the greater good? Will you join us in slaying Lord Brent and his circle?@");
UI_show_npc_face1(465, 0);
say("@Think of the power and riches you would gain by joining us!@");

converse(["Join", "No way!"])
{

	case "Join" (remove):
	UI_show_npc_face0(465, 0);
	say("@You answer too quickly! A decision made in such haste is a sure sign that you will no doubt turn on us if it is convenient for you.@");
	UI_show_npc_face1(499, 0);
	say("@I concur... we have no choice but to dispatch you as well.@");
	karma = karma - 500;
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "No way!" (remove):
	UI_show_npc_face0(499, 0);
	say("@Oh for the days when I had such ideals as you. I am sorry, but we cannot let you out of here alive.@");
	UI_show_npc_face0(465, 0);
	say("@Too bad for you!@");
	karma = karma + 500;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}
}

void Jordell_Convo object#()()
{
var name = UI_get_npc_name(AVATAR);
var female = UI_is_pc_female();

var sex_say;

if(female)
{
	sex_say = "she";
}
else
{
	sex_say = "he";
}


UI_show_npc_face(465, 0);
say("Jordell walks down the steps and begins to speak without even noticing you are in the room. @We have a problem Vortas. Someone by the name of ", name, " is snooping around.@");
say("@I think that this trouble maker may be onto our plan to take over Brentonia.@");
UI_show_npc_face1(499, 0);
say("@You are too late Jordell. It seems this fool has already made it down here and now you have revealed our plan from your own lips.@");
UI_show_npc_face(465, 0);
say("Jordell looks at you. @You just have to get into everything do you not? Our plan was going so perfect too!@");

converse(["Plan"])
{
	case "Bye" (remove):
	UI_show_npc_face0(465, 0);
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	UI_set_schedule_type(-417, IN_COMBAT);
	UI_modify_schedule(-417, 2, [924, 1063]);
	UI_modify_schedule(-417, 6, [924, 1063]);
	UI_modify_schedule(-417, 7, [924, 1063]);
	UI_set_alignment(-417, 2);
	UI_set_opponent(-190, PARTY);	
	UI_set_opponent(-417, PARTY);
	break;
	
	case "Plan" (remove):
	UI_show_npc_face0(465, 0);
	say("It is clear Jordell cannot resist blathering out her brilliant plan. @Vortas has faked his own death and the ineptitude of the circle to retrieve his body would be its undoing.@");
	UI_show_npc_face1(499, 0);
	say("Vortas looks at Jordell. @You simply cannot resist explaining our brilliant plan to a stranger, can you?@");
	UI_show_npc_face0(465, 0);
	say("@",name, " knows enough now, perhaps ", sex_say, " could be a valuable addition to the plot. After all, ", sex_say, " could throw Moniak off the trail.@");
	UI_show_npc_face1(499, 0);
	say("@Perhaps...@");
	add(["Details"]);
	
	case "Details" (remove):
	UI_show_npc_face1(499, 0);
	say("@Brentonia is a fair city but it is being run down through the poor leadership of Lord Brent and the rest of the circle. It needs good rulers. Rulers who can get the job done.@");	
	UI_show_npc_face0(465, 0);
	say("@That is why we must dispatch with the other members of the circle. They cannot even see the problem!@");
	add(["Circle", "Dispatch"]);
	
	case "Circle" (remove):
	UI_show_npc_face1(499, 0);
	say("@They are fair people but they cannot be trusted to make decisions on how to govern such a city. They have not even sent out a patrol to recover my 'body' yet!@");
	add(["Why fake your death?"]);
	
	case "Why fake your death?" (remove):
	UI_show_npc_face0(465, 0);
	say("@So I could go out on my own and rescue him after disobeying the circle. We would have no chance to take over if the populace still had faith in them.@");

	case "Dispatch" (remove):
	UI_show_npc_face1(499, 0);
	say("Vortas sights. @I truely wish I did not have to slay Tonidra and Ernesta but it had to be done.@");
	UI_show_npc_face0(465, 0);
	say("@I am not sad they are gone!@");
	Avatar_Brentonia_Decision();
	add(["Bye"]);
}


}

void Path_Jordell object#()()
{
	//UI_si_path_run_usecode(-417, [928, 1065, 0], Jordell_Convo, -417, Jordell_Convo, 0);
	UI_si_path_run_usecode(-417, [922, 1069, 0], SCRIPTED, -417, Jordell_Convo, 1); // 
}

void Move_Jordell object#()()
{
	//UI_move_object(-417, [933, 1072, 0]);
	UI_move_object(-417, [928, 1072, 0]);
}


void Jordell_Encounter()
{

	script -417
	{

		nohalt;
		call Move_Jordell;
		actor frame STAND;
		face NORTH;
		wait 1;
		say "We have a problem...";
		wait 5;
		call Jordell_Convo;
		//call Path_Jordell;
		
	}

}

void Vortas_Encounter_Convo()
{

UI_show_npc_face(499, 0);
say("@What in the world? What is going on here? Who are you?@");

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("@You saw nothing! Now be on your way!@");
	gflags[PREVENT_RETRIGGER_BRENTONIANTRAITORS] = true;
	Jordell_Encounter();
	break;	
	
	case "Name" (remove):
	say("The man balks. @How can you not know who I am? I am Vortas!@");
	add(["I thought you were dead"]);
	
	case "Job" (remove):
	say("@I think the bigger questions is what are you doing down here.@");
	
	case "I thought you were dead" (remove):
	say("@That is none of your concern.@");	
}	
}

void Move_Vortas object#()()
{
	UI_move_object(-190, [918, 1049]);
	UI_set_schedule_type(-190, IN_COMBAT);
}

void Path_Vortas object#()()
{
	UI_si_path_run_usecode(-190, [923, 1059, 0], SCRIPTED, -190, Vortas_Encounter_Convo, 1);
}

void Path_Avatar_Brentonia object#()()
{
	UI_si_path_run_usecode(AVATAR, [933, 1062, 0], SCRIPTED, AVATAR, 0);
}


void egg_brentonian_traitors object#()()
{

var vortas_dead = UI_is_dead(-190);
var jordell_dead = UI_is_dead(-417);

if(gflags[BRENTONIA_SAVED])
{
}
else
{

	if(gflags[CONFIRM_SUSPICIONS_BRENTONIA])
	{
		if(vortas_dead && jordell_dead)
		{
			gflags[BRENTONIA_TRAITORS_DEAD] = true;
		}
		// If you're in combat the dead check will retrigger, so need a flag to prevent this and also double check if they are dead.
		else if (gflags[PREVENT_RETRIGGER_BRENTONIANTRAITORS])
		{
			if(vortas_dead && jordell_dead)
			{
				gflags[BRENTONIA_TRAITORS_DEAD] = true;
			}		
		}
		else
		{
			UI_move_object(-190, [918, 1049]);
			script item
			{
				nohalt;
				call Move_Vortas;
				call FreezeAvatar;
				wait 2;
				call Path_Avatar_Brentonia;
				
				wait 4;
				call Path_Vortas;
			}
		}
	}
}	
}
/*
void egg_dive object#()()
{

		UI_set_item_shape(AVATAR, 1504);

}
*/