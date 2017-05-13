void break_statue_debris object#()() // create debris, book and update statue
{
var stone_1 = UI_create_new_object(203);
UI_set_item_frame(stone_1, 8);
UI_update_last_created([2229, 602, 0]);

var stone_2 = UI_create_new_object(203);
UI_set_item_frame(stone_2, 11);
UI_update_last_created([2231, 602, 1]);

var stone_3 = UI_create_new_object(203);
UI_set_item_frame(stone_3, 9);
UI_update_last_created([2231, 604, 1]);

var stone_4 = UI_create_new_object(203);
UI_set_item_frame(stone_4, 16);
UI_update_last_created([2229, 606, 0]);

var stone_5 = UI_create_new_object(203);
UI_set_item_frame(stone_5, 12);
UI_update_last_created([2228, 607, 0]);

var book = UI_create_new_object(642);
UI_set_item_frame(book, 7);
UI_set_item_quality(book, 43);
UI_update_last_created([2229, 604, 0]);

var statue = UI_find_nearby(AVATAR, BOOK_STATUE, 20); // update the statues shape to 'broke'
UI_set_item_frame(statue, 1);

gflags[STATUE_BROKEN] = true;

UI_modify_schedule(-482, 3, 11, [2232, 605]); // set Dryn to loiter in the museum

}

void break_statue_script object#()()
{
	FreezeAvatar_NonScript();
	script AVATAR
	{
		actor frame STAND;
		face WEST;
		wait 1;
		say "Here goes nothing...";
		wait 1;
		repeat 2
		{
			actor frame SWING_1;
			wait 1;
			actor frame SWING_2;
			wait 1;
			actor frame SWING_3;
			call Light_Thud;
			wait 1;
			actor frame SWING_2;
			wait 1;
		};
		actor frame STAND;
		call break_statue_debris;
		say "Phew";
		wait 2;
		call UnFreezeAvatar;
	}
}

void igons_hammer shape#(508)()
{
    if (event == DOUBLECLICK)
    {
        UI_close_gumps();
        var weapon_slot = UI_get_readied(AVATAR, WEAPON_HAND);
        var held_weapon = UI_get_item_shape(weapon_slot);
		
        if(held_weapon == 508)// Igon's Hammer Shape
        {
			var target = UI_click_on_item();
			var shape = UI_get_item_shape(target[1]); // get the shape of the clicked target
			var frame = UI_get_item_frame(target[1]); // get the frame of the clicked target
			var time = UI_game_hour();
			
			if(shape == BOOK_STATUE) //statue with the book in it.
			{
				if(frame == 1)
				{
					AVATAR.say("@I think I have done enough damage already...@");
				}
				else
				{
					if(time >= 1 && time <= 6)
					{
						//AVATAR.say("Firing");
						UI_si_path_run_usecode(AVATAR, [2229, 605, 0], SCRIPTED, AVATAR, break_statue_script, 0);
					}
					else
					{
						AVATAR.say("@I should probably do this at night when noone is around.@");
					}
				}
			}
			
        }
        
    }


}

