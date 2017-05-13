void surgical_tools shape#(1185)()
{
    var bark_oops = "oops...";
    if (event == DOUBLECLICK)
    {
		UI_close_gumps();
        var target = UI_click_on_item();
        var target_shape = UI_get_item_shape(target[1]);
        var target_frame = UI_get_item_frame(target[1]);
        
        if (target_shape == WISDOM_EYE && target_frame == 1)
        {
            UI_remove_item(target[1]);
            var lense_base = UI_create_new_object(LENSE_PIECE);
            UI_set_item_frame(lense_base, 3);
            UI_update_last_created([target[2], target[3], target[4]]);
            var n = 10;
            script AVATAR
            {
            actor frame STAND;
            say bark_oops;
            wait 10;
            }
            UI_play_sound_effect(95);
            while (n > 0)
            {
                var frame = UI_die_roll(0, 2);
                var ran_num = UI_get_random(4);
                var ran_num1 = UI_get_random(4);
                var orb_piece = UI_create_new_object(LENSE_PIECE);
                UI_set_item_frame(orb_piece, frame);
                if (ran_num1 == 1)
                {
                    UI_update_last_created([target[2] + ran_num, target[3] + ran_num - 2]);
                }
                else if (ran_num1 == 2)
                {
                    UI_update_last_created([target[2] - ran_num + 1, target[3] + ran_num]);
                }
                else if (ran_num1 == 3)
                {
                    UI_update_last_created([target[2] + ran_num - 1, target[3] - ran_num + 2]);
                }
                else if (ran_num1 == 4)
                {
                    UI_update_last_created([target[2] - ran_num + 2, target[3] - ran_num - 1]);
                }

                n = n - 1;
            }
        }
    }
}

