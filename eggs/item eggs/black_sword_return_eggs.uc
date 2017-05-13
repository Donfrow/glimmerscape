// For returning the Black Sword

//FINAL SUMMONING OF ARTHIS BELOW


void Arthis_Mini_End_2 object#()()
{
	UI_show_npc_face(505, 0);
	say("Arthis lets out what almost sounds like a hiss. @Your proximity to the sword seems to have allowed you to resist its power.@");
	say("@No matter though, all this means is I shall dispose of you the old fashion way.@");
	UI_set_alignment(-394, HOSTILE);
	UI_set_schedule_type(-394, IN_COMBAT);
	UI_set_opponent(-394, AVATAR);
	UI_remove_from_area(DONALS_BP, 0, [1722, 959], [1774, 1005]);
	UI_remove_party_items(1, DONALS_BP, ANY, ANY);
	
	// Create 4 skeletons to fight

    UI_play_sound_effect(42); // explosion sound for skeletons
	
	// Bottom left
	var skeleton = UI_create_new_object(528);
	skeleton->set_alignment(HOSTILE);
	skeleton->set_schedule_type(IN_COMBAT);
	UI_set_opponent(skeleton, PARTY);
	UI_update_last_created([1741, 978, 0]);
	UI_sprite_effect(1, 1741, 978, 0, 0, 0, -1);
	
	// Top left
	var skeleton1 = UI_create_new_object(528);
	skeleton1->set_alignment(HOSTILE);
	skeleton1->set_schedule_type(IN_COMBAT);
	UI_set_opponent(skeleton1, PARTY);
	UI_update_last_created([1741, 968, 0]);
	UI_sprite_effect(1, 1741, 968, 0, 0, 0, -1);

	// Bottom right
	var skeleton2 = UI_create_new_object(528);
	skeleton2->set_alignment(HOSTILE);
	skeleton2->set_schedule_type(IN_COMBAT);
	UI_set_opponent(skeleton2, PARTY);
	UI_update_last_created([1763, 968, 0]);
	UI_sprite_effect(1, 1763, 978, 0, 0, 0, -1);
	
	// Top right
	var skeleton3 = UI_create_new_object(528);
	skeleton3->set_alignment(HOSTILE);
	skeleton3->set_schedule_type(IN_COMBAT);
	UI_set_opponent(skeleton3, PARTY);
	UI_update_last_created([1763, 968, 0]);
	UI_sprite_effect(1, 1763, 968, 0, 0, 0, -1);
	
}

void Give_Arthis_Black_Sword object#()()
{
	UI_create_new_object(806);
	UI_give_last_created(394);
}

void Arthis_Mini_End_1 object#()()
{
	UI_show_npc_face(505, 0);
	say("@With Elena long since dust and the breastplate in my grasp all that I require is my sword back...@");
	say("@I do hope that you enjoyed it while you had it, for you shall be its first victim in my new reign of terror!@");
	var black_sword = UI_find_object([1751, 972, 2], 806, ANY, ANY);
	UI_remove_item(black_sword);
	UI_remove_from_area(806, 0, [1744, 966], [1761, 977]); // black sword
	
	// SET LOCS FOR SPRITES IN NEXT SEQUENCE WHEN HE IS TRYING TO KILL YOU WITH THE SWORD
	targetx = 1748;
	targety = 971;
	targetz = 0;
}

void Change_Arthis_Shape object#()()
{
UI_set_item_shape(-394, 464);

}

void Transform_Arthis()
{
	script -394
	{
		nohalt;
		actor frame SWING_1;
		call Weird_Teleport;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		call Fancy_Explosion;
		call Sound_Explosion;
		call Change_Arthis_Shape;
		actor frame STAND;
		wait 10;
		call Arthis_Mini_End_1;
		actor frame KNEEL;
		wait 1;
		call Give_Arthis_Black_Sword;
		actor frame STAND;
		wait 5;
		say "Die fool";
		actor frame CAST_1;
		wait 1;
		actor frame CAST_2;
		call Lightning_Sound;
		call Red_Lightning;
		wait 3;
		call Spell_Fail;
		call Poof;
		actor frame STAND;
		wait 5;
		call Arthis_Mini_End_2;
		wait 1;
		call UnFreezeAvatar;
		say "Prepare to die!";
		
	}
}

void Arthis_Convo_Final object#()()
{
	UI_show_npc_face(277, 2);
	say("The apparition appears from a ghostly haze. @You have returned with the accursed breastplate. Do you now seek real ultimate power in return?@");
	
	converse(["Yes please", "Of course", "Gimmie!"])
	{
		case "Yes please" (remove):
		say("@So humble yet so ignorant. Have you learned nothing of my ways? Do you truely think I would not simply take what is mine and take what you have brought me?@");
		UI_clear_answers();
		add(["You treacherous scum!"]);
		
		case "Of course" (remove):
		say("@Ha! So naive. I will give you nothing in return for your efforts... except death!@");
		UI_clear_answers();
		add(["You treacherous scum!"]);

		case "Gimmie!" (remove):
		say("@Your lust for power nearly rivals myself but your intelligence is far below that of mine. Would you reward the fool who has done your bidding once you no longer need them?@");
		say("The apparition laughs. @Of course not! And it will be no different for you.@");
		UI_clear_answers();
		add(["You treacherous scum!"]);
		
		case "You treacherous scum!" (remove):
		say("The figure lets loose a boisterous laugh. @You are such a fool. Now I can use the power of the breastplate to release me from this accrused state.@");
		
		// Set loc for the sprites in scripted sequence of him transforming to a human
		targetx = 1751;
		targety = 970;
		targetz = 0;
		
		Transform_Arthis();
	}
	
}

void Summon_Arthis_Final()
{
	UI_play_music(53);
	UI_move_object(-394, [1752, 970, 0]);
	UI_sprite_effect(6, 1751, 969, 0, 0, 0, -1);
	UI_play_sound_effect(51);
	script -394
	{
		nohalt;
		face SOUTH;
		actor frame STAND;
		wait 12;
		call Arthis_Convo_Final;
	}
	script AVATAR
	{
		nohalt;
		call FreezeAvatar;
		face NORTH;
		actor frame STAND;
	}
}


//FIRST SUMMONING OF ARTHIS BELOW


void Arthis_Convo object#()()
{
	var name = UI_get_npc_name(AVATAR);
	UI_show_npc_face(277, 2);
	say("A ghastly apparition appears before you. @Who dares attempt to wield the power of The Black Sword?@");
	AVATAR.say("@It is I, ",  name, ".@");
	UI_show_npc_face(277, 2);
	say("@Why do you disturb my restless slumber?@");
	converse(["The Black Sword"])
	{
		case "The Black Sword" (remove):
		say("@You have returned my greatest item to my posession. You truely are a pathetic individual... but you could be useful.@");
		add(["Useful"]);
		
		case "Useful" (remove):
		say("@The vile Elena haunts me in this realm. The defeat... my defeat... it must be avenged. I curse that holy armor.@");
		add(["Elena", "Holy armor"]);
		
		case "Elena" (remove):
		say("@The paladin Elena has put me into this state. This slattern put an end to my reign upon these lands.@");
		
		case "Holy armor" (remove):
		say("@The armor of Donal Ultor brought defeat upon me. Yet this piece of armor possesses the power to bring me back to this realm. Bring me this armor and I shall reward you greatly.@");
		add(["Reward"]);
		
		case "Reward" (remove):
		say("@Know that those who aid me will be rewarded with wealth and power beyond their wildest dreams. Bring me the armor and you too shall be rewarded.@");
		add(["Where is the armor?"]);
		
		case "Where is the armor?" (remove):
		say("The apparition appears enraged. @Do not asks questions of the great Arthis. Seek out Fortuna in the Northern Forest and recover the breastplate.@");
		say("@Take my weapon and use it upon Fortuna should she not cooperate. Now begone and do not return until you possess the armor!@");
		UI_clear_item_flag(AVATAR, DONT_MOVE);
		gflags[SPOKE_WITH_ARTHIS_1] = true;
		UI_move_object(-394, [1875, 875, 0]);
		break;
	}
}

void Summon_Arthis()
{
	UI_play_music(53);
	UI_move_object(-394, [1752, 970, 0]);
	UI_sprite_effect(6, 1751, 969, 0, 0, 0, -1);
	UI_play_sound_effect(51);
	script -394
	{
		nohalt;
		face SOUTH;
		actor frame STAND;
		wait 12;
		call Arthis_Convo;
	}
	script AVATAR
	{
		nohalt;
		face NORTH;
		actor frame STAND;
	}
}

void Return_Black_Sword object#()()
{
	var loc = get_object_position(item);
	
	var Black_Sword = UI_find_nearby(loc, 806, 1, MASK_NONE);
	
	if(Black_Sword) // Black Sword on the altar
	{
		UI_close_gumps();
		if(gflags[SPOKE_WITH_ARTHIS_1])
		{
			var donals_bp = UI_count_objects(PARTY, DONALS_BP, ANY, ANY);
			if(donals_bp > 0)
			{
				UI_si_path_run_usecode(AVATAR, [1751, 974, 0], SCRIPTED, AVATAR, Summon_Arthis_Final, 0);				
			}
			else
			{
				if(UI_is_dead(-394))
				{
				}
				else
				{
					AVATAR.say("@I require the breastplate.@");
				}
			}
		}
		else
		{
			UI_close_gumps();
			UI_set_item_flag(AVATAR, DONT_MOVE);
			UI_si_path_run_usecode(AVATAR, [1751, 974, 0], SCRIPTED, AVATAR, Summon_Arthis, 0);
		}
	}
}