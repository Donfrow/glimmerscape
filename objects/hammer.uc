void hammer shape#(623)()
{
    if (event == DOUBLECLICK)
    {
        UI_close_gumps();
        var weapon_slot = UI_get_readied(AVATAR, WEAPON_HAND);
        var held_weapon = UI_get_item_shape(weapon_slot);
        if(held_weapon == 623)// Hammer Shape
        {
        var click_target = UI_click_on_item();
        var shape = UI_get_item_shape(click_target[1]);



            if(shape == BUCKET_OF_NAILS)
            {

                var target = UI_click_on_item();
                var target_shape = UI_get_item_shape(target[1]);
                if (target_shape == 923 || target_shape == 984) // wood pieces
                {
                    GoToRoof();
                    script AVATAR
                    {
                        wait 5;
                    }
                }
                else
                {
                   AVATAR.say("@Perhaps I should nail something that needs it...@");
                }
            }
			else if (shape == BOOK_STATUE)
			{
				AVATAR.say("@This hammer is far too weak for this material. I should find one of their specialty tools.@");
			}
			else
            {
                AVATAR.say("@Perhaps I should use the hammer with nails?@");
            }
            
        }
        
    }


}

