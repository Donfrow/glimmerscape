void large_lense shape#(1158)()
{
    //var frame = UI_get_item_frame(large_lense);
    var frame = item->get_item_frame();
    if(event == DOUBLECLICK)
    {
        if (frame == 0 && gflags[IN_PAST])
        {
            var target = UI_click_on_item();
            var target_shape = UI_get_item_shape(target[1]);
            var chaos_orb = UI_find_nearby([1383, 481, 2], ORB_OF_CHAOS, 1, MASK_NONE); // it's in the correct area
            {
                if(target_shape == ORB_OF_CHAOS && chaos_orb)
                {
                    UI_play_music(64);
                    script item
                        {
                        call FreezeAvatar;
                        call MoveAvatarToAltar;
                        wait 15;
                        call Avatar_Face_North;
                        wait 3;
                        //call FreezeAvatar;
                        call orb_sprite1;
                        wait 10;
                        call orb_sprite2;
                        wait 12;
                        call orb_sprite3;
                        wait 5;
                        //call MoveAvatar1;
                        call Fade1;
                        wait 5;
                        call orb_sprite3;
                        wait 10;
                        //call MoveAvatar2;
                        call Fade2;
                        wait 15;
                        call orb_sprite2;
                        wait 5;
                        call orb_sprite3;
                        wait 5;
                        //call MoveAvatar4;
                        call Fade3;
                        wait 25;
                        call orb_sprite1;
                        //call MoveAvatar3;
                        call FadeToPast;
                        wait 5;
                        //call create_broken_lense;
                        call orb_sprite4;
                        call UnFreezeAvatar;

                        }
                }
            }
        }
    }
}
