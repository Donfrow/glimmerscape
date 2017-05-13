void egg_shard_or_cube_on object#()()
{
    var lense_shard;
    var cube;
    var loc = get_object_position();
    lense_shard = loc->find_nearby(LENSE_PIECE, 0, MASK_NONE);
    cube = loc->find_nearby(VORTEX_CUBE, 0, MASK_NONE);
    if (lense_shard)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[LENSE_PIECE_ON] = true;
    }
    else if (cube)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[CUBE_ON] = true;
    }


    
    if (gflags[LENSE_PIECE_ON] && gflags[CUBE_ON])
    {
        UI_play_music(65);
        
        script AVATAR
        {
            call FreezeAvatar;
            call Path_Avatar_Up;
            wait 10;
            face WEST;
            frame STAND;
            wait 5;
            call Avatar_Speak_Incantation;
            wait 5;
            call Past_Lightening1;
            wait 1;
            call Past_Fuzz;
            wait 2;
            call Past_Lightening2;
            wait 1;
            call Past_Fuzz1;
            wait 3;
            call Past_Lightening3;
            wait 2;
            call Past_Lightening4;
            wait 4;
            call Past_Explosion;
            wait 10;
            call UnFreezeAvatar;
            // THIS THEN GOES ONTO ODD_MATERIAL.UC TO CONTINUE THE CONSTRUCT ORB PORTION
        }

    }
    
}

void egg_glenlorn_teleport object#()()
{
    if (gflags[GLENLORN_TELEPORT_FLAG])
    {
        script AVATAR
        {
            call FreezeAvatar;
            frame STAND;
            face EAST;
            call Teleport_In_Glenlorn;
            call Glenlorn_Teleport;
            call Freeze_Glenlorn;
            face WEST;
            wait 15;
            call Glenlorn_Convo;
            wait 4;
            call Glenlorn_Teleport;
            wait 1;
            call Remove_Glenlorn;
            call UnFreeze_Glenlorn;
            wait 3;
            call UnFreezeAvatar;
        }
        gflags[GLENLORN_TELEPORT_FLAG] = false;
    }
}
