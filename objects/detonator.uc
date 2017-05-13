void detonator shape#(1429)()
{
    var loc = get_object_position();
    var frame = get_item_frame();
    var has_explosives = UI_count_objects(PARTY, DETONATOR_EXPLOSIVES, ANY, ANY);
    if (event == DOUBLECLICK)
    {
        var debrisnear = UI_find_nearby(loc, 202, 6, MASK_NONE); //202 is debris frame
        if(frame == 5)
        {
            AVATAR.say("It has already been used.");
        }
        else
        {
            if (debrisnear)
            {
                var debris_loc = UI_get_object_position(debrisnear);
                var x_max = debris_loc[1] - 6; // Max distance away detonator can be
                var x_min = debris_loc[1] - 2; // Min distance away detonator must be
                var y_top = debris_loc[2] - 5; // Max distance up detonator can be
                var y_bottom = debris_loc[2] - 1; // Min distance down detonator can be
                
                if(loc[1] >= x_max && loc[1] <= x_min && loc[2] >= y_top && loc[2] <= y_bottom)
                {
                    var detonator_final_loc = get_object_position();
                    
                    // Positions for the scripting
                    
                    detonator_loc_x = detonator_final_loc[1];
                    detonator_loc_y = detonator_final_loc[2];
                    detonator_rocks_x = debris_loc[1];
                    detonator_rocks_y = debris_loc[2];

                    if(frame == 0)
                    {
                        if(has_explosives > 0)
                            {
                                UI_remove_party_items(1, DETONATOR_EXPLOSIVES, ANY, ANY);
                                UI_si_path_run_usecode(AVATAR, [detonator_rocks_x - 5, detonator_loc_y, 0], SCRIPTED, AVATAR, Lay_Wire, 0);
                            }
                        else
                            {
                                AVATAR.say("@I have no explosives to use with the detonator.@");
                            }
                    }
                    else if (frame == 4)
                    {
                        UI_si_path_run_usecode(AVATAR, [detonator_loc_x-9, detonator_loc_y, 0], SCRIPTED, AVATAR, Blow_Up_Debris, 0);
                    }
                }
                //AVATAR.say(loc1[1], " ", loc1[2]);
            }
        }

    }
}


/*   THIS CODE IS FROM THE ORIGINAL SITE SPECIFIC DEBRIS - KEEPING IT INCASE IT IS NEEDED
        {
            if (loc[1] == 2525 && loc[2] == 1784)
            {
                UI_si_path_run_usecode(AVATAR, [2515, 1784, 0], SCRIPTED, AVATAR, Escape_Mountains, 0);

            }
            else if (loc[1] <= 2284 && loc[1] >= 2277 && loc[2] <= 1481 && loc[2] >= 1477 && frame == 0) // Blocked passage in mountains of freedom
            {

                if (has_explosives >= 1)
                {

                    UI_si_path_run_usecode(AVATAR, [2283, loc[2], 0], SCRIPTED, AVATAR, Explode_Mountain_Passage_Freedom, 0);
                }
                else
                {
                    AVATAR.say("@I have no explosives to use with the detonator.@");
                }
            }
            else if (loc[1] <= 2284 && loc[1] >= 2277 && loc[2] <= 1481 && loc[2] >= 1477 && frame == 4) // Blocked passage in mountains of freedom
            {

                    var y_loc = loc[2] + 1;
                    UI_si_path_run_usecode(AVATAR, [2273, y_loc, 0], SCRIPTED, AVATAR, Blow_Up_Passage, 0);

            }
        }
*/
