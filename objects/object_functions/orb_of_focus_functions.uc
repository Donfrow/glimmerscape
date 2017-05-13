void Move_Avatar_To_Past_Altar object#()()
{
    UI_si_path_run_usecode(AVATAR, [1382, 488, 0]);
}

void Avatar_Is_Back object#()() // won't script properly when item is AVATAR....
{
    var bark = "I am back!";
	UI_remove_party_items(1, ORB_OF_FOCUS, ANY, ANY);
    script AVATAR
    {
        say bark;
    }
}

void Return_To_Present()
{
	UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
    script item
    {
		nohalt;
        call FreezeAvatar;
        call Move_Avatar_To_Past_Altar;
        wait 5;
        call Avatar_Face_North;
        wait 5;
        call orb_sprite2;
        wait 10;
        call orb_sprite1;
        wait 12;
        call orb_sprite2;
        call orb_sprite3;
        wait 5;
        call Fade2;
        wait 5;
        call orb_sprite3;
        wait 10;
        call orb_sprite3;
        wait 5;
        call Fade4;
        wait 25;
        call orb_sprite1;
        call orb_sprite3;
        call Fade1;
        wait 25;
        call orb_sprite2;
        call orb_sprite3;
        call Fade3;
        wait 15;
        call orb_sprite1;
        wait 5;
        call orb_sprite4;
        wait 1;
        call Avatar_Is_Back;
		call Add_All_Party_Members;
        call UnFreezeAvatar;
    }
}


