void Move_Avatar_to_Death object#()()
{
    UI_move_object(AVATAR, [1400, 1108, 0]);
}

void Avatar_Death_Sprite object#()()
{
    UI_sprite_effect(47, 1400, 1108, 0, 0, 0, -1);
}

void deadly_concoction shape#(1394)()
{
if(event == DOUBLECLICK)
{
if(gflags[DEATH_DEAD])
{
	AVATAR.say("@Death is no more. I best not do this.@");
}
else
{
    var target = UI_click_on_item();
    var target_shape = UI_get_item_shape(target[1]);
    if (target_shape == 721 || target_shape == 989) // Avatar shapes
    {
		
		UI_close_gumps();
        UI_save_pos(AVATAR);
		UI_set_item_flag(AVATAR, BLINKER_DISABLED);
		script AVATAR
		{
			nohalt;
			call FreezeAvatar;
			actor frame KNEEL;
			say "Ohhhh";
			wait 1;
			actor frame LIE;
			wait 2;
			call Fade;
			wait 2;
			call Remove_All_Party_Members;
			wait 1;
			call Move_Avatar_to_Death;
			wait 2;
			call UnFade;
			wait 1;
			call UnFreezeAvatar;
			call Avatar_Death_Sprite;
			
		}
		/*
        deadly_concoction_fade(target);
		Freeze_All_Party_Members_NonScript();
		gflags[CONCOCTION_DEATH] = true;
		*/


    }
    else
    {
        AVATAR.say("It is probably best not to be wasting this.");
        var n = UI_die_roll(4, 8);
        var blood = UI_create_new_object(912); // blood and goo
        UI_set_item_frame(blood, n);
        UI_update_last_created([target[2], target[3]]);
    }
}
}
}

