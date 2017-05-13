void Change_Markus_Schedule_Good()
{

	UI_modify_schedule(-382, 0, LOITER, [1309, 2587]);
	UI_move_object(-382, [1309, 2587, 0]);
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	UnFreezeAvatar_NonScript();

}

void Change_Markus_Schedule object#()()
{
	UI_modify_schedule(-382, 0, LOITER, [1309, 2587]);
	UI_remove_from_party(-382);
	UI_remove_from_area(478, 32, [1903, 1111], [1947, 1147]);
	UI_remove_from_area(478, 48, [1903, 1111], [1947, 1147]);
}

void Markus_Transport_Talk()
{

	
	UI_show_npc_face(545, 0);	
	say("@Stop! I am going to give you this chance to release me of your own volition.@");
	UI_add_answer("You and what army?");
	UI_add_answer("Why?");
	UI_add_answer("Very well. You are free to go");

	targetx = 1309;
	targety = 2587;
	NPC = (-382); // Markus
	
	converse
	{
		if(response == "You and what army?")
		{
			say("@I was hoping it would not come to this...@");
			gflags[BAD_TRANSPORT_RELEASE] = true;
			UI_sprite_effect(6, 1936, 1127, 0, 0, 0, -1);
			UI_sprite_effect(6, 1918, 1135, 0, 0, 0, -1);
			UI_sprite_effect(6, 1939, 1134, 0, 0, 0, -1);
			UI_sprite_effect(6, 1922, 1125, 0, 0, 0, -1);
			
			var goblin1 = UI_create_new_object(478);
			UI_set_item_frame_rot(goblin1, 32);
			UI_update_last_created([1936, 1127, 0]);
			
			var goblin2 = UI_create_new_object(478);
			UI_set_item_frame_rot(goblin2, 48);
			UI_update_last_created([1918, 1135, 0]);	
	
			var goblin3 = UI_create_new_object(478);
			UI_set_item_frame_rot(goblin3, 32);
			UI_update_last_created([1940, 1134, 0]);	
	
			var goblin4 = UI_create_new_object(478);
			UI_set_item_frame_rot(goblin4, 48);
			UI_update_last_created([1922, 1125, 0]);	

			UI_remove_from_party(-382);
			

			
			script -382 // Markus NPC number
			{
				nohalt;
				wait 3;
				face NORTH;
				actor frame STAND;
				wait 2;
				say "I shall not slay you...";
				wait 8;
				actor frame SWING_2;
				wait 2;
				actor frame SWING_3;
				
			}
			
			script AVATAR
			{
				nohalt;
				wait 7;
				say "Ambush!";
				wait 13;
				actor frame LIE;
				wait 2;
				call Fade;
				wait 15;
				call Generic_Move_NPC;
				call Change_Markus_Schedule;
				wait 10;
				call UnFade;
				call UnFreezeAvatar;
			}
		
			break;
		}
		else if (response == "Why?")
		{
			say("@You have treated me far better than the others who were tasked with guarding me while in Dewtopia. It is because of this I am willing to return the favour.@");
			UI_remove_answer("Why?");
		}
		else if (response == "Very well. You are free to go")
		{
			UI_set_item_flag(AVATAR, DONT_MOVE);
			say("@Your deeds show how true of spirit you are. I shall go spend the rest of my days with the goblins of the south.@");
			say("@As you have shown much compassion I encourage you to visit us in the southern mountains.@");
			gflags[GOOD_TRANSPORT_RELEASE] = true;
			UI_remove_from_party(-382);
			UI_si_path_run_usecode(-382, [1929, 1167, 0], SCRIPTED, 382, Change_Markus_Schedule_Good, 0);			
			break;
			
			
			
		}
	}
}





// The text when you are stopped at the gates in Dewtopia to get the prisoner transport
void Thomas_Transport_Talk()
{
	UI_show_npc_face(53, 0);
	UI_clear_item_flag(AVATAR, 16); // Unfreeze Avatar
	say("@Wait! I have a special order for you.@");
	
	UI_add_answer("Order");
	converse
	{
		if (response == "Order")
		{
			say("@We have a prisoner in the basement of the prison who is to be transported to Brentonia for trial.@");
			UI_remove_answer("Order");
			UI_add_answer("Prisoner");
			UI_add_answer("Brentonia");
			UI_add_answer("Basement");
		}
		else if (response == "Prisoner")
		{
			say("@He is accused of giving goblins knowledge of a Brentonian outpost which resulted in the loss of many men.@");
			UI_remove_answer("Prisoner");
		}
		else if (response == "Brentonia")
		{
			say("@One of the other great kingdoms of the lands. We have a prisoner exchange treaty that we must enforce if either kingdoms captures a known fugitive.@");
			UI_remove_answer("Brentonia");
		}
		else if (response == "Basement")
		{
			say("@You can access it through a trap door in the prison in the city. Here is the key to unlock the door that you will encounter.@");
			UI_add_party_items(1, KEY, 30, 0);
			UI_add_answer("Bye");
			UI_remove_answer("Basement");
		}
		else if (response == "Bye")
		{
			say("@I hope you have a safe journey. And I almost forgot, here are the papers you will need for the prisoner transport.@");
			UI_add_party_items(1, GOOD_SCROLL, 94, 2);
			gflags[TRANSPORT_PRISONER] = true;

			break;
		}
	}
}