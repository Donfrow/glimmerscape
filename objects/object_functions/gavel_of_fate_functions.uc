void End_Game_Talk object#()()
{
	AVATAR.say("You have reached the end of this mod. Thank you for playing and a big thanks to everyone who helped me with questions, fixes and such along the way. I hope you enjoyed playing.");
	AVATAR.say("You will need to manually quit. After this text nothing more will occur.");
	//AVATAR.say("Well, this is the end. I don't know how to fade to any sort of end screen. Thanks for playing.");
}

void End_Hide_Avatar object#()()
{
	UI_set_item_flag(AVATAR, DONT_RENDER);
}

void End_Path_Avatar_Function()
{
	script AVATAR
	{
		actor frame STAND;
		face SOUTH;
	}
}

void End_Path_Avatar object#()()
{
	UI_si_path_run_usecode(AVATAR, [360, 248], SCRIPTED, AVATAR, End_Path_Avatar_Function, 0);
}

void End_Create_Void object#()()
{
	UI_create_new_object(1457);
	UI_update_last_created([361, 249]);
}

void NPC_Bark_5 object#()()
{
	script -407
	{
		say "We surrender";
	}
}

void NPC_Bark_4 object#()()
{
	script -406
	{
		say "Stop the bloodshed!";
	}
}

void NPC_Bark_3 object#()()
{
	script -405
	{
		say "We must retreat!";
	}
}

void NPC_Bark_2 object#()()
{
	script -404
	{
		say "The magic is too strong!";
	}
}

void NPC_Bark_1 object#()()
{
	script -403
	{
		say "It's too powerful!";
	}
}

void Teleport_Out_Entity_Final object#()()
{
	UI_move_object(-398, [359, 192]);
    UI_sprite_effect(7, 359, 249, 0, 0, 0, -1);
    UI_play_sound_effect(81);

}

void Fate_Final_Convo object#()()
{
	UI_show_npc_face(644, 0);
	say("The entity suddenly appears before you. @I am once again whole. No more am I shattered into pieces. I am once again free.@");
	say("The entity cackles. @I shall now continue on with my destiny. Thank you, Avatar... enjoy your last moments before you are sent into the vastness of eternity where the very fabric of your being shall be ripped apart.@");
	script -398
	{
		nohalt;
		wait 3;
		say "Buhaha";

	}
}

void Teleport_In_Entity_Final object#()()
{
	UI_move_object(-398, [359, 249]);
    UI_sprite_effect(7, 359, 249, 0, 0, 0, -1);
    UI_play_sound_effect(81);
	UI_set_item_flag(398, DONT_MOVE);
	script -398
	{
		actor frame STAND;
		face NORTH;
	}
}



void End_Game_Lightning_1 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(17, 355, 238, 0, 0, 0, -1); // top left
	UI_sprite_effect(40, 355, 244, 0, 0, 0, -1); // bottom left
    UI_sprite_effect(41, 362, 238, 0, 0, 0, -1); // top right
    UI_sprite_effect(42, 362, 244, 0, 0, 0, -1); // bottom right
}

void End_Game_Lightning_2 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(43, 359, 242, 0, 0, 0, -1);
}

void End_Game_Lightning_3 object#()()
{

}

void End_Game_Flashing_1 object#()()
{
	UI_play_sound_effect(50);
    UI_sprite_effect(12, 364, 250, 0, 0, 0, -1);
}

void End_Game_Flashing_2 object#()()
{
	UI_play_sound_effect(50);
    UI_sprite_effect(12, 346, 235, 0, 0, 0, -1);
}

void End_Game_Flashing_3 object#()()
{
	UI_play_sound_effect(50);
    UI_sprite_effect(12, 374, 256, 0, 0, 0, -1);
}

void End_Game_Flashing_4 object#()()
{
	UI_play_sound_effect(50);
    UI_sprite_effect(12, 355, 247, 0, 0, 0, -1);
}

void End_Game_Flashing_5 object#()()
{
	UI_play_sound_effect(50);
    UI_sprite_effect(12, 346, 253, 0, 0, 0, -1);
}

void End_Game_Flashing_6 object#()()
{
	UI_play_sound_effect(50);
    UI_sprite_effect(12, 359, 235, 0, 0, 0, -1);
}

void End_Game_Flashing_7 object#()()
{
	UI_play_sound_effect(50);
    UI_sprite_effect(12, 372, 240, 0, 0, 0, -1);
}

void End_Game_Blue_Circle object#()()
{
	UI_play_sound_effect(91);
    UI_sprite_effect(47, 357, 241, 0, 0, 0, -1);
}

void End_Game_Remove_Orb object#()()
{
	UI_remove_from_area(ORB_OF_INFINITY, 0, [359, 242], [359, 242]);
	UI_create_new_object(SPENT_ORB);
	UI_update_last_created([359, 242, 2]);
}

void End_Game_Sequence()
{
	UI_play_music(65);
	script AVATAR
	{
		nohalt;
		face NORTH;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		actor frame SWING_3;
		call Break_Sound;
		wait 2;
		actor frame STAND;
		call Generic_Earthquake;
		wait 4;
		call End_Game_Lightning_1;
		wait 4;
		call End_Game_Lightning_2;
		wait 1;
		call End_Game_Flashing_1;
		call End_Game_Flashing_5;
		wait 2;
		call End_Game_Flashing_2;
		call End_Game_Flashing_3;
		wait 3;
		call End_Game_Flashing_4;
		call End_Game_Flashing_1;
		call End_Game_Flashing_7;
		wait 2;
		call End_Game_Flashing_6;
		call End_Game_Flashing_2;
		wait 3;
		call End_Game_Blue_Circle;
		wait 8;
		call End_Game_Remove_Orb;
		wait 8;
		call Teleport_In_Entity_Final;
		face SOUTH;
		wait 14;
		call Fate_Final_Convo;
		wait 8;
		say "Wait...";
		call End_Path_Avatar;
		wait 2;
		call Teleport_Out_Entity_Final;
		wait 2;
		call NPC_Bark_1;
		wait 1;
		call NPC_Bark_2;
		wait 3;
		call NPC_Bark_3;
		wait 3;
		call NPC_Bark_4;		
		wait 2;
		call NPC_Bark_5;
		wait 4;
		call Generic_Earthquake;
		wait 5;
		call End_Create_Void;
		actor frame LIE;
		face WEST;
		wait 1;
		face NORTH;
		wait 1;
		face EAST;
		wait 1;

		face SOUTH;
		wait 1;
		face WEST;
		wait 1;
		face NORTH;
		wait 1;
		face EAST;
		wait 1;
		face SOUTH;
		call End_Hide_Avatar;
		wait 10;
		call End_Game_Talk;
	}

}
