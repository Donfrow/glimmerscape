void orb_of_focus shape#(1381)()
{
    if (event == DOUBLECLICK)
    {
        if(gflags[IN_PAST])
        {
        var target = UI_click_on_item();
        var shape = UI_get_item_shape(target[1]);
        var frame = UI_get_item_frame(target[1]);
        var chaos_orb = UI_find_nearby([1382, 484, 2], ORB_OF_CHAOS, 1, MASK_NONE); // it's in the correct area
        var loc = UI_get_object_position(AVATAR);
        
            if(shape == ORB_OF_CHAOS && chaos_orb)
            {
					UI_close_gumps();
                    gflags[DONE_IN_PAST] = true;
                    gflags[IN_PAST] = false;
                    UI_play_music(64);
                    //UI_si_path_run_usecode(AVATAR, [1382, 488, 0], SCRIPTED, AVATAR, Return_To_Present, 1);  // This is failing as it locks up due to the script item being the AVATAR, as a result it cannot be used
                    Return_To_Present();
            }
        }
    }
}

