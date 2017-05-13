void Remove_Orb_From_Avatar object#()()
{
    var focused_orb = UI_count_objects(PARTY, FOCUSED_ORB_PERSUASION, ANY, ANY);
    if (focused_orb > 0)
    {
        UI_remove_party_items(1, FOCUSED_ORB_PERSUASION, ANY, ANY);
        var ground_orb_focused = UI_create_new_object(FOCUSED_ORB_PERSUASION);
        UI_set_item_frame(ground_orb_focused, 1);
		ground_orb_focused->set_item_frame(1);
		//AVATAR.say("Test if usecode works on new code");
        UI_update_last_created([UI_get_object_position(AVATAR)]);
    }

	script AVATAR
	{
		say "The orb...";
	}
}
void Remove_Orb_From_Avatar1 object#()()
{
	// Orb of Focus itself
    UI_remove_party_items(1, ORB_OF_FOCUS, ANY, ANY);
	// The focused orb, any frame
	UI_remove_party_items(1, 1386, ANY, 1);
}

void MoveAvatarToPast object#()()
{
    UI_move_object(AVATAR, [1382, 0486, 0, 2]);
}

void FadeToPast object#()() // teleporting through time
{
	UI_fade_palette(50, 1, 0); // fade to black
	script AVATAR
	{
	   call MoveAvatarToPast;
	   wait 5;
	   call GenericPaletteUnfade;
    }
}

void create_broken_lense object#()()
{
    UI_sprite_effect(1, 1378, 0488, 0, 0, 0, 5);
    UI_remove_party_items(1, LENSE, ANY, ANY);
    
}




void orb_sprite1 object#()() // teleporting through time
{
    UI_sprite_effect(42, 1389, 0485, 0, 0, 0, -1);
    UI_sprite_effect(43, 1381, 0480, 0, 0, 0, -1);
}

void orb_sprite2 object#()() // teleporting through time2
{
    UI_sprite_effect(41, 1383, 0485, 0, 0, 0, -1);
    UI_sprite_effect(12, 1383, 0482, 0, 0, 0, -1);
}

void orb_sprite3 object#()() // teleporting through time3
{
    var loc = UI_get_object_position(AVATAR);
    UI_sprite_effect(12, 1377, 0485, 0, 0, 0, -1);
    UI_sprite_effect(55, loc[1], loc[2], 0, 0, 0, -1);
}
void orb_sprite4 object#()() // teleporting through time 4
{
    var loc = UI_get_object_position(AVATAR);
    UI_sprite_effect(54, loc[1], loc[2], 0, 0, 0, -1);
}

void AvatarStandAtAltar()
{
	script AVATAR
	{
		frame STAND;
		wait 2;
		face NORTH;
	}
}

void MoveAvatarToAltar object#()()
{
    UI_si_path_run_usecode(AVATAR, [1383, 0484, 0], AvatarStandAtAltar, AVATAR, AvatarStandAtAltar, true);
}

void MoveAvatar1 object#()() // Moving the avatar to the different maps for the cut scene
{
    UI_move_object(AVATAR, [1383, 0484, 0, 4]);
}

void MoveAvatar2 object#()()
{
    UI_move_object(AVATAR, [1383, 0484, 0, 1]);
}

void MoveAvatar3 object#()()
{
    UI_move_object(AVATAR, [1383, 0484, 0, 0]);
}

void MoveAvatar4 object#()()
{
    UI_move_object(AVATAR, [1383, 0484, 0, 5]);
}


void Fade1 object#()()  // fade for going through time
{
	UI_fade_palette(50, 1, 0); // fade to black
	script AVATAR
	{
	   call MoveAvatar1;
	   wait 5;
	   call GenericPaletteUnfade;
    }
}

void Fade2 object#()()  // fade for going through time
{
	UI_fade_palette(50, 1, 0); // fade to black
	script AVATAR
	{
	   call MoveAvatar2;
	   wait 5;
	   call GenericPaletteUnfade;
    }
}

void Fade3 object#()()  // fade for going through time
{
	UI_fade_palette(50, 1, 0); // fade to black
	script AVATAR
	{
	   call MoveAvatar3;
	   wait 5;
	   call GenericPaletteUnfade;
    }
}

void Fade4 object#()()  // fade for going through time
{
	UI_fade_palette(50, 1, 0); // fade to black
	script AVATAR
	{
	   call MoveAvatar4;
	   wait 5;
	   call GenericPaletteUnfade;
    }
}











