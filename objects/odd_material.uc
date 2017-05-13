

void odd_material shape#(1118)()
{
    var loc = get_object_position();
    
    if (event == DOUBLECLICK)
    {
        var target = UI_click_on_item();
        var target_shape = UI_get_item_shape(target[1]);
        var target_frame = UI_get_item_frame(target[1]);
        
        // If the target is the swirling mass
        if(target_shape == SWIRLING_MASS)
        {
            // Get the targets frame
            if (target_frame == 0) // If it is the cube mass
            {
                // Remove odd metal from ground, if it's there
                UI_remove_from_area(ODD_METAL, 0, [loc[1], loc[2]], [loc[1], loc[2]]);
                // Remove odd metal from inventory, if it's there
                UI_remove_party_items(1, ODD_METAL, ANY, ANY);
                // remove the swirling mass
                UI_remove_from_area(SWIRLING_MASS, 0, [target[2], target[3]], [target[2], target[3]]);
                // add the chaos orb
                UI_create_new_object(ORB_OF_CHAOS);
                UI_update_last_created([target[2]-1, target[3]-1, 2]);
                UI_sprite_effect(GREEN_BUBBLES, target[2], target[3], 0, 0, 0, -1);
                UI_play_sound_effect(29);
                
                gflags[PAST_MADE_CHAOS_ORB] = true;
            }
            else if (target_frame == 1) // If it's the lense mass
            {
                // Remove odd metal from ground, if it's there
                UI_remove_from_area(ODD_METAL, 0, [loc[1], loc[2]], [loc[1], loc[2]]);
                // Remove odd metal from inventory, if it's there
                UI_remove_party_items(1, ODD_METAL, ANY, ANY);
                // remove the swirling mass
                UI_remove_from_area(SWIRLING_MASS, 1, [target[2], target[3]], [target[2], target[3]]);
                // add the chaos orb
                UI_create_new_object(ORB_OF_FOCUS);
                UI_update_last_created([target[2]-1, target[3]-1, 2]);
                UI_sprite_effect(GREEN_BUBBLES, target[2], target[3], 0, 0, 0, -1);
                UI_play_sound_effect(29);
                
                gflags[PAST_MADE_FOCUS_ORB] = true;
            }
        }

        if (gflags[PAST_MADE_CHAOS_ORB] && gflags[PAST_MADE_FOCUS_ORB])
        {
            script AVATAR
            {
                call FreezeAvatar;
                call Path_Avatar_In_Past;
                wait 10;
                call Teleport_In_Travlen;
                call Travlen_Teleport;
                wait 1;
                face NORTH;
                frame STAND;
                wait 15;
                call Travlen_Dialog;
                call Teleport_In_Brenda;
                call Brenda_Teleport;
                wait 1;
                face SOUTH;
                wait 15;
                call Brenda_Dialog;
                wait 2;
                call Brenda_Fail_Cast;
                call Travlen_Fail_Cast;
                wait 15;
                call Brenda_Travlen_Dialog01;
                wait 5;
                call Choose_Who_To_Kill; // The main coding for the cutscene of choosing who to kill and survive is in this function and sub functions found in odd_material_functions

                wait 10;
                
                call UnFreezeAvatar;
            }
        }
        
    }
}
