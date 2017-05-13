void Jones_Statue_Break_Admittance()
{
UI_push_answers();
converse(["Admit to knocking them down", "Say nothing"])
{
	case "Admit to knocking them down" (remove):
	say("You sheepishly admit to Jones that it was you who knocked down the statues. @At least you are willing to admit your mistakes. Many others would not do such a thing.@");
	say("@I appreciate you letting me know what happened. It is for this reason I asked you not to touch anything, but alas, it is too late now.@");
	say("Jones shrugs. @Who knows, perhaps one day in my future expeditions I will find another one.@");
	karma = karma + 200;
	gflags[BROKE_STATUES_GOOD] = true;
	KarmaGoodSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Say nothing" (remove):
	gflags[BROKE_STATUES_BAD] = true;
	karma = karma - 300;
	KarmaBadSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;
}
	
}

void Jones_Statue_Convo()
{
	UI_show_npc_face(509);
	say("@I have calmed Buckles down. Did you find anything interesting down here?@");
	converse(["Golden statues", "Glass items"])
	{
		case "Glass items" (remove):
		say("@These seem to be similiar to the ones I have found up above though they appear to be in much better shape.@");
		
		case "Golden statues" (remove):
		say("Jones looks at the broken statues. @I was hoping that I would find one that was still standing down here but it looks like even the confines of this basement were not enough protection against the ravages of time.@");
		Jones_Statue_Break_Admittance();
		UI_modify_schedule(-446, 2, LOITER, [1167, 1203]);
		break;
		
	}
}

void Path_Jones object#()()
{
	UI_si_path_run_usecode(-446, [1164, 1208, 0], SCRIPTED, -446, Jones_Statue_Convo, 0);
}

void Move_Jones_Down object#()()
{
	script -446
	{
		say "Find anything?";
	}
	UI_move_object(-446, [1175, 1208]);
}

void North_Statue_Break object#()()
{
	UI_remove_from_area(GOLDEN_STATUE, 0, [1154, 1207], [1154, 1207]);
	var corpse = UI_create_new_object(1314);
	UI_set_item_frame(corpse, 26);
	UI_update_last_created([1159, 1208, 0]);
}
void South_Statue_Break object#()()
{
	UI_remove_from_area(GOLDEN_STATUE, 0, [1153, 1210], [1153, 1210]);
	var corpse = UI_create_new_object(1314);
	UI_set_item_frame(corpse, 26);
	UI_update_last_created([1158, 1212, 0]);
}

void Statue_Break object#()()
{
	UI_earthquake(5);
	var loc = get_object_position(AVATAR);
	if(loc[1] == 1153) // south statue
	{
		script AVATAR
		{
			nohalt;
			call South_Statue_Break;
			wait 4;
			call North_Statue_Break;
			wait 2;
			say "Oops...";
			wait 2;
			call Move_Jones_Down;
			wait 1;
			call Path_Jones;
			call UnFreezeAvatar;
		}
	}
	else if (loc[1] == 1154) // North statue
	{
		script AVATAR
		{
			nohalt;
			call North_Statue_Break;
			wait 4;
			call South_Statue_Break;
			wait 2;
			say "Oops...";
			wait 2;
			call Move_Jones_Down;
			wait 1;
			call Path_Jones;
			call UnFreezeAvatar;
		}
	}
}

void Knock_Down_Statue()
{
	script AVATAR
	{
		nohalt;
		face SOUTH;
		actor frame USE;
		wait 2;
		call Statue_Break;
		actor frame STAND;
		
	}
}

void golden_statue shape#(1480)()
{
if(event == DOUBLECLICK)
{
	var loc = get_object_position();
	UI_set_item_flag(AVATAR, DONT_MOVE);
	UI_si_path_run_usecode(AVATAR, [loc[1], loc[2]-2, 0], SCRIPTED, AVATAR, Knock_Down_Statue, 0);
}
}
