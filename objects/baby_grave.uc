void Remove_Nearby_Dirt object#()()
{
	UI_remove_from_area(202, 1, [2223, 2682], [2234, 2690]);
	UI_remove_from_area(1473, 0, [2232, 2683], [2231, 2685]);
	var buried_grave = UI_create_new_object(1474);
	UI_update_last_created([2232, 2683, 0]);
	// Remove baby shape from inventory
	UI_remove_party_items(1, 1475, ANY, ANY);
	karma = karma + 750;
	KarmaGoodSprites();
}

void Air_Baby_1 object#()()
{
	UI_create_new_object(1475);
	UI_update_last_created([2194, 2680, 0]);
}
void Air_Baby_2 object#()()
{
	UI_remove_from_area(1475, 0, [2194, 2680, 0], [2194, 2680]);
	var dead_baby = UI_create_new_object(1475);
	UI_set_item_frame_rot(dead_baby, 32);
	UI_update_last_created([2186, 2680, 0]);
}

void Air_Baby_3 object#()()
{
	UI_remove_from_area(1475, 32, [2186, 2680, 0], [2186, 2680]);
	UI_create_new_object(1475);
	UI_update_last_created([2180, 2680, 0]);
	// Remove baby shape from inventory
	UI_remove_party_items(1, 1475, ANY, ANY);
}

void Air_Baby_4 object#()()
{
	UI_remove_from_area(1475, 0, [2180, 2680, 0], [2180, 2680]);
	UI_play_sound_effect(103);
	gflags[HANNAH_BURIED_BAD] = true;
	KarmaBadSprites();
}


void Toss_Baby_Into_Water()
{
	script AVATAR
	{
		nohalt;
		face WEST;
		actor frame STAND;
		wait 1;
		say "In ya go...";
		wait 2;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		call Air_Baby_1;
		wait 1;
		actor frame STAND;
		call Air_Baby_2;
		wait 1;
		call Air_Baby_3;
		wait 1;
		call Air_Baby_4;
		wait 3;
		call UnFreezeAvatar;
		
	}
}

void Baby_Create_Grave_Dirt_1 object#()()
{
	var loc = get_object_position(AVATAR);
	var dirt_1 = UI_create_new_object(415);
	UI_set_item_frame(dirt_1, 20);
	UI_update_last_created([loc[1]+1, loc[2]-3, loc[3]]);
}

void Baby_Create_Grave_Dirt_2 object#()()
{
	var loc = get_object_position(AVATAR);
	var dirt_1 = UI_create_new_object(415);
	UI_set_item_frame(dirt_1, 20);
	UI_update_last_created([loc[1]+2, loc[2]+2, loc[3]]);
}

void Baby_Create_Grave_Dirt_3 object#()()
{
	var loc = get_object_position(AVATAR);
	var dirt_1 = UI_create_new_object(202);
	UI_set_item_frame(dirt_1, 1);
	UI_update_last_created([loc[1]+1, loc[2]+8, loc[3]]);
	var dirt_2 = UI_create_new_object(415);
	UI_set_item_frame(dirt_2, 20);
	UI_update_last_created([loc[1]+1, loc[2]+6, loc[3]]);
}

void Baby_Dug_Grave object#()()
{
	var grave = UI_find_nearest(AVATAR, 1472, 5);
	var loc = get_object_position(grave);
	UI_remove_item(grave);
	UI_create_new_object(1473); // baby grave hole
	UI_update_last_created([2232, 2683, 0]);

}




void Baby_Dig_Grave()
{
	script AVATAR
	{
		nohalt;
		call FreezeAvatar;
		face WEST;
		wait 2;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		call Hit_Sound;
		actor frame SWING_3;
		call Create_Grave_Dirt_1;
		wait 2;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		call Hit_Sound;
		actor frame SWING_3;
		call Create_Grave_Dirt_2;
		say "phew";
		wait 2;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		call Hit_Sound;
		actor frame SWING_3;
		call Create_Grave_Dirt_3;
		call Baby_Dug_Grave;
		wait 2;
		actor frame STAND;

		call UnFreezeAvatar;
	}
}





void baby_grave shape#(1472)()
{
if(event == DOUBLECLICK)
{
	var loc = get_object_position();
	var equipped = UI_get_readied(AVATAR, 1); // Get object reference for hand
	var shovel = UI_get_item_shape(equipped);
	var has_baby = UI_count_objects(PARTY, 1475, ANY, ANY);
	if(shovel == 625) // Has the shovel equipped
	{
		if(gflags[BURY_HANNAH] && has_baby > 0)
		{
			gflags[HANNAH_BURIED] = true;
			AVATAR.say("You think for a moment. @You know... I could save myself the trouble digging a grave if I just tossed the baby into the water...@");
			RandomPartySay("@Avatar!@");
			AVATAR.say("@Do I wish to proceed the lazy way?@");
			UI_remove_item(item);
			converse(["Yes", "No"])
			{
				case "Yes" (remove):
				AVATAR.say("@Lee will never be the wiser...@");
				UI_set_item_flag(AVATAR, DONT_MOVE);
				UI_play_music(22);
				UI_si_path_run_usecode(AVATAR,[2201, 2680, 0], SCRIPTED, AVATAR, Toss_Baby_Into_Water, 0);
				karma = karma - 1000;
				break;
				
				case "No" (remove):
				AVATAR.say("@I suppose that would be a cruel thing to do to Lee.@");
				gflags[HANNAH_BURIED_GOOD] = true;
				UI_set_item_flag(AVATAR, DONT_MOVE);
				UI_si_path_run_usecode(AVATAR,[2229, 2680, 0],SCRIPTED,  AVATAR, Baby_Dig_Grave, 0);
				break;
			}
		}
		else
		{
			AVATAR.say("@I cannot bury the child here.@");
		}
		}
		//UI_si_path_run_usecode(AVATAR,[2229, 2680, loc[3]], SCRIPTED, AVATAR, Baby_Dig_Grave, 0);
	}
}

void dug_baby_grave shape#(1473)()
{
	if(event == DOUBLECLICK)
	{
		var baby = UI_count_objects(PARTY, 1475, ANY, ANY);
		if (baby > 0)
		{
			script AVATAR
			{
				nohalt;
				call FreezeAvatar;
				face NORTH;
				actor frame KNEEL;
				say "Goodbye little one.";
				wait 5;
				actor frame STAND;
				wait 2;
				actor frame SWING_1;
				wait 2;
				actor frame SWING_2;
				wait 2;
				call Hit_Sound;
				actor frame SWING_3;
				call Create_Grave_Dirt_1;
				wait 2;
				actor frame SWING_1;
				wait 2;
				actor frame SWING_2;
				wait 2;
				call Hit_Sound;
				call Remove_Nearby_Dirt;		
				actor frame SWING_3;	
				wait 2;
				actor frame STAND;
				call UnFreezeAvatar;	
			}
		}
		else
		{
			AVATAR.say("@I must need to still possess the dear child before I can lay it to rest.@");
		}
	}
}

