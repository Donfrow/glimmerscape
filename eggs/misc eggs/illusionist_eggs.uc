void Illusionist_Easter_Egg()
{
	gflags[DID_NOT_CHEAT_TO_GET_HERE] = true;
}

void Illusionist_Entrance_1() // Egg in the cave in old dream world castle to take you to old phoenix area
{
	var partyx = 2071;
	var partyy = 1236;
	var partyz = 0;
	Move_Party_NonScript(partyx, partyy, partyz);
	UI_sprite_effect(7, partyx, partyy, 0, 0, 0, -1);
    UI_play_sound_effect(81);
}

void Illusionist_Entrance_2() // entrance in back of lava of old phoenix area that takes you to cheat room on mad mage isle
{
	var partyx = 1963;
	var partyy = 1367;
	var partyz = 0;
	Move_Party_NonScript(partyx, partyy, partyz);
	UI_sprite_effect(7, partyx, partyy, 0, 0, 0, -1);
    UI_play_sound_effect(81);
	script AVATAR
	{
		face EAST;
		wait 4;
		say "By the virtues...";
	}
}

void Illusionist_Entrance_2_Decoy() // teleports to other cave on phoenix isle
{
	var partyx = 2038;
	var partyy = 1221;
	var partyz = 0;
	Move_Party_NonScript(partyx, partyy, partyz);
	UI_sprite_effect(7, partyx, partyy, 0, 0, 0, -1);
    UI_play_sound_effect(81);
}

void Avatar_Lava_Walk_Egg()
{
	script AVATAR
	{
		say "My feet, they burn!";
		wait 10;
		say "Or not";
	}
}

// ENTERING the test
void Illusionist_Test_Entrance_1 object#()() // Moongate egg to enter the mirror room
{
	UI_move_object(AVATAR, [1547, 1015, 0]);
	UI_sprite_effect(7, 1547, 1015, 0, 0, 0, -1);
    UI_play_sound_effect(81);
	script AVATAR
	{
		nohalt;
		face WEST;
		call Remove_All_Party_Members;
	}
}

// EXITING the test
void Illusionist_Test_Exit object#()()
{

    UI_play_sound_effect(81);
	// Return Avatar to the portal entrance
	UI_move_object(AVATAR, [1991, 1315, 0]);
	UI_sprite_effect(7, 1991, 1315, 0, 0, 0, -1);
	script AVATAR
	{
		nohalt;
		face NORTH;
		call Add_All_Party_Members;
	}
}

void Illusionist_Test_Teleport_1 object#()()
{
	var partyx = 1494;
	var partyy = 1062;
	var partyz = 0;
	Move_Party_NonScript(partyx, partyy, partyz);
	UI_sprite_effect(7, partyx, partyy, 0, 0, 0, -1);
}

void Illusionist_Test_Teleport_2 object#()()
{
	var partyx = 1528;
	var partyy = 1096;
	var partyz = 0;
    UI_play_sound_effect(81);
	Move_Party_NonScript(partyx, partyy, partyz);
	UI_sprite_effect(7, partyx, partyy, 0, 0, 0, -1);
}

void Illusionist_Test_Teleport_3 object#()()
{
	var partyx = 1495;
	var partyy = 1091;
	var partyz = 0;
    UI_play_sound_effect(81);
	Move_Party_NonScript(partyx, partyy, partyz);
	UI_sprite_effect(7, partyx, partyy, 0, 0, 0, -1);
}

void Illusionist_Test_Teleport_4 object#()()
{
	var partyx = 1478;
	var partyy = 1094;
	var partyz = 0;
    UI_play_sound_effect(81);
	Move_Party_NonScript(partyx, partyy, partyz);
	UI_sprite_effect(7, partyx, partyy, 0, 0, 0, -1);
}



void Create_Avatar_Statue_Face_North object#()() // Create the avatar statue depending on the avatar selected to face north
{
	var avatar_shape = UI_get_item_shape(AVATAR);
	var loc = get_object_position();
	var avatar_statue = UI_create_new_object(avatar_shape);
	UI_set_item_flag(avatar_statue, SI_TOURNAMENT);
	UI_update_last_created(loc);

}

void Create_Avatar_Statue_Face_South object#()() // Create the avatar statue depending on the avatar selected to face north
{
	var avatar_shape = UI_get_item_shape(AVATAR);
	var loc = get_object_position();
	var avatar_statue = UI_create_new_object(avatar_shape);
	UI_set_item_frame_rot(avatar_statue, 16);
	UI_set_item_flag(avatar_statue, SI_TOURNAMENT);
	UI_update_last_created(loc);
}

void Create_Avatar_Statue_Face_East object#()() // Create the avatar statue depending on the avatar selected to face north
{
	var avatar_shape = UI_get_item_shape(AVATAR);
	var loc = get_object_position();
	var avatar_statue = UI_create_new_object(avatar_shape);
	UI_set_item_frame_rot(avatar_statue, 48);
	UI_set_item_flag(avatar_statue, SI_TOURNAMENT);
	UI_update_last_created(loc);
}

void Create_Avatar_Statue_Face_West object#()() // Create the avatar statue depending on the avatar selected to face north
{
	var avatar_shape = UI_get_item_shape(AVATAR);
	var loc = get_object_position();
	var avatar_statue = UI_create_new_object(avatar_shape);
	UI_set_item_frame_rot(avatar_statue, 32);
	UI_set_item_flag(avatar_statue, SI_TOURNAMENT);
	UI_update_last_created(loc);
}

void Wrong_Wand_Egg object#()()
{
	var loc = get_object_position(AVATAR);
	UI_sprite_effect(27, loc[1], loc[2], loc[3], 0, 0, -1);
	UI_play_sound_effect(42);
	UI_reduce_health(AVATAR, 45, 1); // deal 45 hits of fire damage
}

void Correct_Wand_Egg object#()()
{
	gflags[GOT_WAND] = true;
}

void Illusionist_Test_Damage object#()()
{
	UI_reduce_health(AVATAR, 20, 2); // deal 20 hits of magic damage
	script AVATAR
	{
		say "Youch!";
	}
}

void Illusionist_Test_Statue_Trigger object#()()
{

	// Play sound
	UI_play_sound_effect(48);

	// Remove the status
	
	UI_remove_from_area(854, 23, [1482, 1047], [1506, 1074]);
	UI_remove_from_area(854, 55, [1482, 1047], [1506, 1074]);
	UI_remove_from_area(550, 0, [1482, 1047], [1506, 1074]);
	
	// North facing statues at bottom of room
	var south_statue = UI_create_new_object(550); // suit of armor
	UI_set_item_frame_rot(south_statue, 0);
	south_statue->set_alignment(HOSTILE);
	south_statue->set_schedule_type(IN_COMBAT);
	UI_set_opponent(south_statue, AVATAR);
	UI_sprite_effect(16, 1498, 1068, 0, 0, 0, -1);
	UI_update_last_created([1498, 1068, 0]);
	
	var south_statue2 = UI_create_new_object(550); // suit of armor
	UI_set_item_frame_rot(south_statue2, 0);
	south_statue2->set_alignment(HOSTILE);
	south_statue2->set_schedule_type(IN_COMBAT);
	UI_set_opponent(south_statue2, AVATAR);
	UI_sprite_effect(16, 1493, 1068, 0, 0, 0, -1);
	UI_update_last_created([1493, 1068, 0]);
	
	// East facing statues in left of room
	var east_statue = UI_create_new_object(550); // suit of armor
	UI_set_item_frame_rot(east_statue, 48);
	east_statue->set_alignment(HOSTILE);
	east_statue->set_schedule_type(IN_COMBAT);
	UI_set_opponent(east_statue, AVATAR);
	UI_sprite_effect(16, 1488, 1061, 0, 0, 0, -1);
	UI_update_last_created([1488, 1061, 0]);
	
	var east_statue2 = UI_create_new_object(550); // suit of armor
	UI_set_item_frame_rot(east_statue, 48);
	east_statue2->set_alignment(HOSTILE);
	east_statue2->set_schedule_type(IN_COMBAT);
	UI_set_opponent(east_statue2, AVATAR);
	UI_sprite_effect(16, 1488, 1065, 0, 0, 0, -1);
	UI_update_last_created([1488, 1065, 0]);

	// South facing statues in north of room of room
	var north_statue = UI_create_new_object(550); // suit of armor
	UI_set_item_frame_rot(north_statue, 16);
	north_statue->set_alignment(HOSTILE);
	north_statue->set_schedule_type(IN_COMBAT);
	UI_set_opponent(north_statue, AVATAR);
	UI_sprite_effect(16, 1493, 1057, 0, 0, 0, -1);
	UI_update_last_created([1493, 1057, 0]);
	
	var north_statue2 = UI_create_new_object(550); // suit of armor
	UI_set_item_frame_rot(north_statue, 16);
	north_statue2->set_alignment(HOSTILE);
	north_statue2->set_schedule_type(IN_COMBAT);
	UI_set_opponent(north_statue2, AVATAR);
	UI_sprite_effect(16, 1498, 1057, 0, 0, 0, -1);
	UI_update_last_created([1498, 1057, 0]);
	
}





















