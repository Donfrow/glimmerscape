void Move_Mordlon_Jail()
{

UI_move_object(-485, [2243, 694]);
UI_clear_item_flag(-485, DONT_MOVE);
UI_modify_schedule(-485, 0, SLEEP, [2243, 694]);
UI_modify_schedule(-485, 3, LOITER, [2243, 694]);
UI_modify_schedule(-485, 4, LOITER, [2263, 695]);
UI_modify_schedule(-485, 5, LOITER, [2243, 694]);
}

void Thug_Decision()
{

var name = UI_get_npc_name(AVATAR);

UI_push_answers();
converse(["Over my dead body!", "Take all the gold but please do not hurt me!"])
{

	case "Over my dead body!" (remove):
	say("@Looks like we got us a fiesty one. Lets introduce this one to a world of pain. Go get him Mordlon.@");
	UI_show_npc_face0(648);
	say("As the dimwitted Mordlon approaches you clench your hand into a fist, releasing it upon his face the moment he steps into range.");
	UI_set_item_flag(-485, DONT_MOVE);
	UI_si_path_run_usecode(-485, [2279, 0699], SCRIPTED, -485, Move_Mordlon_Jail, 0);
	
	script -483
	{
		nohalt;
		say "You coward Mordlon!";
	}
	
	UI_set_alignment(-483, HOSTILE);
	UI_set_alignment(-484, HOSTILE);
	
	UI_set_schedule_type(-483, IN_COMBAT);
	UI_set_schedule_type(-484, IN_COMBAT);
	
	UI_set_opponent(-483, PARTY);
	UI_set_opponent(-484, PARTY);
	gflags[THUGS_ENGAGED] = true;
	break;
	
	case "Take all the gold but please do not hurt me!" (remove):
	RandomPartySay("You can tell your companion is confused by your eagerness to avoid conflict. @I cannot believe you are giving into these thugs so easily!@");
	say("The girl directs you to give the dimwitted boy Mordlon all your gold which you happily comply with, her eyes gleaming as she sees the amount you have. @It looks like this one has lots of gold!@");
	var gold_count = UI_count_objects(PARTY, SHAPE_GOLD, ANY, ANY);
	UI_remove_party_items(gold_count, SHAPE_GOLD, ANY, ANY);
	
	//Actions if you are alone or with party
    var party = UI_get_party_list();
	var cnt = UI_get_array_size(party);
    var rand;
    if (cnt == 1)
	{
		say("As she counts the gold she looks at you and grins. @Did you really think this would save you from a world of pain? You are so naive. We are still going to beat you up.@");
		UI_show_npc_face0(648);
		say("As the girl laughs you clench your hand into a fist, unleashing it upon the face of Mordlon before you even realize what you are doing.");

	}
    else
	{
		RandomPartySay("@This is absurd! I cannot stand idly by and let this happen.@");
		UI_show_npc_face0(648);
		say("Suddenly your companion pulls back their arm and lets loose a forceful punch straight into Mordlon's face.");
	}
	
	UI_show_npc_face0(333);
	say("The girl looks shocked at the raging fury that has been unleashed. @You are going to pay for that!@");
	UI_set_item_flag(-485, DONT_MOVE);
	UI_si_path_run_usecode(-485, [2279, 0699], SCRIPTED, -485, Move_Mordlon_Jail, 0); //Flee Mordlon
	
	UI_modify_schedule(-485, 0, SLEEP, [2243, 694]);
	UI_modify_schedule(-485, 3, LOITER, [2243, 694]);
	UI_modify_schedule(-485, 4, LOITER, [2263, 695]);
	UI_modify_schedule(-485, 5, LOITER, [2243, 694]);
	
	UI_set_alignment(-483, HOSTILE);
	UI_set_alignment(-484, HOSTILE);
	
	UI_set_schedule_type(-483, IN_COMBAT);
	UI_set_schedule_type(-484, IN_COMBAT);
	
	UI_set_opponent(-483, PARTY);
	UI_set_opponent(-484, PARTY);
	gflags[THUGS_ENGAGED] = true;
	break;

}


}

void Thug_Convo()
{

	UI_show_npc_face(333);
	say("@Well well well, if it is not the new meat that has been wandering around town. I heard this stranger here has been asking questions about us.@");
	UI_show_npc_face1(369, 0);
	say("@Sure is Jor. I bet this stranger has lots of gold coins for us.@");
	converse(["What is this?"])
	{
		case "Bye" (remove):
		say("@I think it is about time we bring this stranger a world of pain boys.@");

		UI_set_alignment(-485, HOSTILE);
		

		UI_set_schedule_type(-485, IN_COMBAT);
		
		case "What is this?" (remove):
		say("The girl cackles. @What are you, some kind of moron? This is a robbery. Now give us all your gold or you will be in a world of pain.@");
		UI_show_npc_face1(339, 0);
		say("The teen lets out a dimwitted laugh. @Hehehe, some kind of moron.@");
		add(["Moron", "Robbery", "Gold"]);
		
		case "Moron" (remove):
		say("@It looks like we have us a parrot here boys. I think this may be a rather fun beating.@");
		UI_show_npc_face1(369, 0);	
		say("@A real whoopin'!@");
		add(["Beating"]);
		
		case "Beating" (remove):
		say("@I think you best just hope I decide to take some pity on you for being so damn slow stranger.@");
		say("She looks at you and thinks for a moment. @Nah, you are going to get a real beating. You are going to make Marsh look like a walk in the park.@");
		UI_show_npc_face1(339, 0);
		say("@Hehehe. I like parks.@");
		
		case "Robbery" (remove):
		say("@You certainly are not very worldly if your first robbery is going to come from us here in Rosendale. Boy, are you in for a rude awakening, isn't that right boys?@");
		UI_show_npc_face1(369, 0);	
		say("@I bet this one has lots of gold.@");
		UI_show_npc_face1(339, 0);
		say("@I like gold.@");
		
		case "Gold" (remove):
		say("@Boys, we sure have a dumb one here and that is just the way I like them. Such easy pickings when they are as bright as a rock.@");
		say("@Enough chatter. Are you going to hand over all your gold or are you going to make this difficult?@");
		Thug_Decision();
		script -485
		{
			nohalt;
			say "I want my mommy!";
		}
		UnFreezeAvatar_NonScript();
		break;
	}

}

void Thug_Encounter_Trigger()
{
	script AVATAR
	{
		nohalt;
		face SOUTH;
		actor frame STAND;
	}
	
	script -484
	{
		wait 9;
		say "Hehehe";
	}
	
	script -483
	{
		wait 8;
		say "Lookie here boys";
	}
	
	UI_si_path_run_usecode(-483, [2278, 651], SCRIPTED, -483, Thug_Convo, 0); // Path Jorletta
	UI_si_path_run_usecode(-484, [2275, 651], SCRIPTED, -484, Null, 0); // Path Jorletta
	UI_si_path_run_usecode(-485, [2283, 651], SCRIPTED, -485, Null, 0); // Path Jorletta
}

void egg_trigger_thugs object#()()
{

var time = UI_game_hour();
var jorletta_dead = UI_is_dead(-483);
var garvis_dead = UI_is_dead(-484);

if(jorletta_dead && garvis_dead || 	gflags[THUGS_ENGAGED]) // if dead do nothing or if the fight has already begun
{
}
else
{
	if(time >= 2 && time <= 4) // Thugs are still alive and the hour is between 2 and 4 AM
	{
		if(gflags[CAPTURE_ROSENDALE_THUGS]) // Thugs are alive, time is between 2 and 4 AM, and you are on the quest to capture the thugs
		{
			FreezeAvatar_NonScript();
			UI_si_path_run_usecode(AVATAR, [2278, 643], SCRIPTED, AVATAR, Thug_Encounter_Trigger, 0);
			UI_move_object(-483, [2278, 673, 0]); // Move Jorletta
			UI_move_object(-484, [2275, 675, 0]); // Move Garvis		
			UI_move_object(-485, [2283, 675, 0]); // Move Mordlan				
		}
	}
}



}