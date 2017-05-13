void Artifacts_In_Test shape#(209)()
{
	if(event == DOUBLECLICK)
	{
		var frame = UI_get_item_frame(item);
		if(frame == 4)
		{
			AVATAR.say("@It appears to be a regular chain but its touch brings chills to my spine.@");
		}
	}
}

void Glumpleton_Escape_Convo object#()()
{
UI_show_npc_face(515, 0);
say("An shaggy looking man beams a smile at you. @Thank you for helping me out! I feared I would be trapped there for eternity.@");
	
converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("@I hope you find what you are looking for.@");
	UI_clear_item_flag(-455, DONT_MOVE);
	UI_modify_schedule(-455, 0, LOITER, [646, 2685]);
	gflags[RESCUED_TRAPPED_MAN] = true;
	break;
		
	case "Name" (remove):
	say("@My apologies, I must have been in such a rush to thank you I forgot to introduce myself. I am Glumpleton.@");
	UI_set_item_flag(-455, MET);
	
	case "Job" (remove):
	say("@Until you freed me I was afraid my job was to spend eternity asking others to help me out. I never expected to ever get out of their honestly.@");
	add(["Freed", "Help"]);
	
	case "Freed" (remove):
	say("@While I may never be truely free of this place at least I am free of the chasm which I thought would be where I would spend eternity.@");
	add(["Eternity"]);
	
	case "Eternity" (remove):
	say("@I entered this... place... out of greed. I have had much time to think of the mistakes I have made but I know that I am being punished for my greed.@");
	say("@While I may have realized why I am here I am also smart enough to realize that once you enter this place you can never leave if you are not worthy.@");
	add(["Worthy"]);
	
	case "Worthy" (remove):
	say("@Only those who are deemed worthy to complete the test will ever escape. I am not one of them.@");
	
	case "Help" (remove):
	say("@This land is not a place to find help from others. You will only find those who care for themselves in this place. But you seem to be an anamoly.@");
	add(["Anomaly"]);
	
	case "Anomaly" (remove):
	say("@It seems that this place, this land, has changed into something different, almost as if it has become warped by a presence not expected to be here.@");
	say("The man stares at you. @As you are one who choose to help instead of pursue their own selfish desires I can only assume you are that anomaly.@");
	
}

}

void Bad_Test_Stand_Up_Avatar object#()()
{
	script AVATAR
	{
		nohalt;
		actor frame STAND;
		face WEST;
	}
}

void Move_Trapped_Man object#()()
{
	UI_move_object(-455, [643, 2662, 0]);
	script -455
	{
		nohalt;
		face SOUTH;
		actor frame KNEEL;
		wait 2;
		actor frame STAND;
		call Bad_Test_Stand_Up_Avatar;
		face EAST;
		wait 2;
		call Glumpleton_Escape_Convo;
		call UnFreezeAvatar;	
		
	}
}

void Free_Trapped_Man()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
	script AVATAR
	{
		nohalt;
		face NORTH;
		actor frame KNEEL;
		say "I will help you out";
		wait 10;
		call Move_Trapped_Man; // SCRIPT CONTINUES IN THIS FUNCTION
		
	}
}

void Rope_In_Test shape#(649)()
{
	if(event == DOUBLECLICK)
	{
		UI_close_gumps();
		var frame = UI_get_item_frame(item);
		if(frame == 13)
		{
			var target = UI_click_on_item();
			var loc_x = target[2];
			var loc_y = target[3];
			
			if(loc_x >= 636 && loc_x <= 654 && loc_y >= 2656 && loc_y <= 2662) // LOCS FOR THE GROUND WHERE THE MAN IS TRYING TO GET OUT
			{
				UI_si_path_run_usecode(AVATAR, [645, 2662, 0], SCRIPTED, AVATAR, Free_Trapped_Man, 0);
				
			}
			
		}
	}
	
}
