void Path_Avatar_Up object#()() // Path the avatar to the altar
{
    UI_si_path_run_usecode(AVATAR, [1135, 0672, 0]);
}
void Avatar_Speak_Incantation object#()() // Speak the incantation
{
    AVATAR.say("@Tralunka Dookendadee Moogadeemoosh@");
}

void Past_Lightening1 object#()()
{
    UI_sprite_effect(BLUE_LIGHTNING, 1128, 664, 0, 0, 0, -1);
}

void Past_Lightening2 object#()()
{
    UI_sprite_effect(RED_LIGHTNING, 1128, 680, 0, 0, 0, -1);
}

void Past_Lightening3 object#()()
{
    UI_sprite_effect(RED_LIGHTNING, 1128, 664, 0, 0, 0, -1);
}

void Past_Lightening4 object#()()
{
    UI_sprite_effect(BLUE_LIGHTNING, 1128, 680, 0, 0, 0, -1);
}

void Past_Fuzz object#()()
{
    UI_sprite_effect(12, 1128, 664, 0, 0, 0, -1);
}

void Past_Fuzz1 object#()()
{
    UI_sprite_effect(12, 1128, 680, 0, 0, 0, -1);
}

void Past_Explosion object#()()
{
    // set the flags to false so it doesn't get stick in a loop
    gflags[LENSE_PIECE_ON] = false;
    gflags[CUBE_ON] = false;
    
    UI_sprite_effect(5, 1128, 664, 0, 0, 0, -1);
    UI_sprite_effect(5, 1128, 680, 0, 0, 0, -1);
    UI_play_sound_effect(62);
    // Remove the lense piece during explosion (multiple times to ensure it's removed regardless of frame

    var cube_loc = UI_find_nearby([1128, 664, 2], VORTEX_CUBE, 0, MASK_NONE);
    
    if (cube_loc)
    {
        // Remove the cube from that location
        UI_remove_from_area(VORTEX_CUBE, 0, [1126, 662],[1130, 0666]);
        
        // Add the cubes mass to that location
        var cube_mass = UI_create_new_object(SWIRLING_MASS);
        UI_update_last_created([1129, 665, 2]);
        
        // Remove the lense piece from the other pedastal, regardless of the frame used
        UI_remove_from_area(LENSE_PIECE, 0, [1126, 678],[1130, 0682]);
        UI_remove_from_area(LENSE_PIECE, 1, [1126, 678],[1130, 0682]);
        UI_remove_from_area(LENSE_PIECE, 2, [1126, 678],[1130, 0682]);
        UI_remove_from_area(LENSE_PIECE, 3, [1126, 678],[1130, 0682]);
        
        // Add the lense mass to other pedastal
        var lense_mass = UI_create_new_object(SWIRLING_MASS);
        UI_set_item_frame(lense_mass, 1);
        UI_update_last_created([1129, 681, 2]);
    }
    else
    {
        // Remove the cube from the other pedastal
        UI_remove_from_area(VORTEX_CUBE, 0, [1126, 678],[1130, 0682]);
        
        // Add the cubes mass to the other pedastal
        var cube_mass = UI_create_new_object(SWIRLING_MASS);
        UI_update_last_created([1129, 681, 2]);
        
        // Remove the lense piece from that pedastal, regardless of frame used
        UI_remove_from_area(LENSE_PIECE, 0, [1126, 662],[1130, 0666]);
        UI_remove_from_area(LENSE_PIECE, 1, [1126, 662],[1130, 0666]);
        UI_remove_from_area(LENSE_PIECE, 2, [1126, 662],[1130, 0666]);
        UI_remove_from_area(LENSE_PIECE, 3, [1126, 662],[1130, 0666]);
        
        // Add the lense mass to that pedastal
        var lense_mass = UI_create_new_object(SWIRLING_MASS);
        UI_set_item_frame(lense_mass, 1);
        UI_update_last_created([1129, 665, 2]);
        
        
    }


}


