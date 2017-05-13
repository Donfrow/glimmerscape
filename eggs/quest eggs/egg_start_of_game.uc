void Start_Heart_Sound object#()()
{
	UI_play_sound_effect(66);
}

void Move_Avatar_Out_of_Bed object#()()
{
	UI_move_object(AVATAR, [1034, 1860]);
}



void Catherine_Talk()
{

	UI_show_npc_face(46, 0);
	say("@I am so glad to see you have managed to pull through. I was worried you would not make it.@");
	UI_add_answer("Name");
	UI_add_answer("Job");
	UI_add_answer("Bye");
	converse
	{
        if (response == "Bye")
        {
            say("@Do be careful, wounds have a nasty habit of opening again.@");
			UI_play_music(13);
			UI_clear_item_flag(AVATAR, DONT_MOVE);
			script AVATAR
			{
				nohalt;
				call Move_Avatar_Out_of_Bed;
				actor frame STAND;
				face WEST;
			}
            break;
        }
        else if (response == "Name")
        {
            say("@I did not expect you to remember when I introduced myself originally; you were in quite the stupor. I am Catherine.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I heal those who require such services here in the town of Cotton Cove. Fortunately only yourself and my husband Gerth are the only who have been in need of my services as of late.@");
            UI_remove_answer("Job");
            UI_add_answer("Healer");
            UI_add_answer("Cotton Cove");
            UI_add_answer("Gerth");
        }
        else if (response == "Healer")
        {
            say("@It was I who healed you after your ship was thrust into the rocks during the storm. Your wounds were grave but luckily you have managed to pull through.@");
            UI_remove_answer("Healer");
            UI_add_answer("Ship");
            UI_add_answer("Storm");
        }
        else if (response == "Cotton Cove")
        {
            say("@Cotton Cove is a small town within a cove of the mainland. It is quite a pleasant place to live.@");
            UI_remove_answer("Cotton Cove");
            UI_add_answer("Mainland");
        }
        else if (response == "Mainland")
        {
say("@You must have taken quite the beating during the collision. Desporia has many islands but what everyone refers to as 'the mainland' is the land that spans across nearly the entire world.@");
            UI_remove_answer("Mainland");
            UI_add_answer("World");
        }
        else if (response == "World")
        {
            say("@The world is known as Desporia. I do hope your head has not been too injured.@");
            UI_remove_answer("World");
        }
        else if (response == "What happened?")
        {
            say("@There was a terrible storm and your ship was struck the mountains of the island. You were found gravely injured but alive and brought to me for healing.@");
            UI_remove_answer("What happened?");
            UI_add_answer("Ship");
            UI_add_answer("Storm");
        }
        else if (response == "Ship")
        {
            say("@I do not know why you were sailing while the Nautical Guild has a ban the activity as your cargo and any identifying information aboard your ship was lost in the storm.@");
			say("@Unfortunately you were the only survivor that we found.@");
            if(gflags[LECHUCK_DEAD])
            {
            }
            else
            {
                UI_add_answer("Nautical Guild");
            }
            UI_remove_answer("Ship");
        }
        else if (response == "Storm")
        {
                        say("@It was a terrible storm indeed. Along with your ship several buildings here in Cotton Cove were damaged as well. I do hope that noone else was caught within it.@");
            UI_remove_answer("Storm");
        }
        else if (response == "Nautical Guild")
        {
            say("@The Nautical Guild is the organization that much of the merchant ships of Desporia belong to. Currently due to an increase in pirate activity they have refused to sail.@");
            UI_remove_answer("Nautical Guild");
        }
        else if (response == "Gerth")
        {
                        say("@Gerth is my husband brother to Garth whom also lives here in Cotton Cove. He was recently injured when he fell off the roof of the mayor's house while in the process of repairing it.@");
            UI_remove_answer("Gerth");
        }
	}
}

void Create_Sail_Fire_Lightning_3 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(17, 900, 431, 0, 0, 0, -1);
}

void Create_Sail_Fire_3 object#()()
{
	var fire = UI_create_new_object(825);
	UI_set_item_frame(fire, 4);
	UI_update_last_created([900, 431, 15]);
}

void Create_Sail_Fire_Lightning_2 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(17, 899, 433, 0, 0, 0, -1);
}

void Create_Sail_Fire_2 object#()()
{
	var fire = UI_create_new_object(825);
	UI_set_item_frame(fire, 2);
	UI_update_last_created([899, 433, 15]);
}

void Create_Sail_Fire_Lightning_1 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(17, 897, 429, 0, 0, 0, -1);
}

void Create_Sail_Fire_1 object#()()
{
	var fire = UI_create_new_object(825);
	UI_set_item_frame(fire, 2);
	UI_update_last_created([897, 429, 15]);
}

void Start_Catherine_Move object#()()
{
	script -141
	{
		say "You are awake!";
	}
		UI_play_music(21);
	UI_si_path_run_usecode(-141, [1033, 1863], SCRIPTED, -141, Catherine_Talk, 0);
}

void Move_Avatar_To_Start object#()()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
	UI_move_object(AVATAR, [1037, 1861, 1, 0]);
	script AVATAR
	{
		actor frame LIE;
		face NORTH;
	}
}

void Start_Earthquake object#()()
{
	UI_earthquake(6);
}

void Start_Remove_Mountains object#()()
{
	UI_remove_from_area(1458, 0, [890, 398], [955, 462]);
}

void Start_Create_Mountains_5 object#()()
{
	UI_create_new_object(1458);
	UI_update_last_created([931, 432]);
	UI_create_new_object(1458);
	UI_update_last_created([931, 452]);
}

void Start_Create_Mountains_4 object#()()
{
	UI_create_new_object(1458);
	UI_update_last_created([935, 432]);
	UI_create_new_object(1458);
	UI_update_last_created([935, 452]);
}

void Start_Create_Mountains_3 object#()()
{
	UI_create_new_object(1458);
	UI_update_last_created([939, 432]);
	UI_create_new_object(1458);
	UI_update_last_created([939, 452]);
}

void Start_Create_Mountains_2 object#()()
{
	UI_create_new_object(1458);
	UI_update_last_created([943, 432]);
	UI_create_new_object(1458);
	UI_update_last_created([943, 452]);
}

void Start_Create_Mountains_1 object#()()
{
	UI_create_new_object(1458);
	UI_update_last_created([447, 432]);
	UI_create_new_object(1458);
	UI_update_last_created([447, 452]);
}



void Start_Move_Captain_Overboard object#()()
{
	UI_play_sound_effect(33);
	UI_move_object(-408, [892, 484]);
}

void Start_Captain_Fall_In object#()()
{
	script -408
	{
		actor frame KNEEL;
		wait 3;
		call Start_Earthquake;
		say "I cannot hold on!";
		wait 4;
		call Start_Move_Captain_Overboard;
	}
}

void Start_Captain_Final_Talk()
{
	UI_show_npc_face(645, 0);
	var name = UI_get_npc_name(AVATAR);
	say("@If we cannot bring this together we are both doomed ", name, "! Help me with the sails!@");
}

void Start_Captain_Move object#()()
{
	UI_si_path_run_usecode(-408, [897, 430], SCRIPTED, -408, Start_Captain_Final_Talk, 0);
}

void Start_Captain_Bark_1 object#()()
{
	script -408
	{
		say "Get the lines!";
	}
}

void Start_Lightning_Man_Talk object#()()
{
	script -410
	{
		say "Watch out!";
	}
}

void Start_Lightning_Kill_Man()
{
	var loc = get_object_position(410);
	UI_play_sound_effect(116);
    UI_sprite_effect(17, loc[1], loc[2], 0, 0, 0, -1);	
	script -410
	{
		call Start_Earthquake;
		say "Aaargh";
	}
	UI_kill_npc(-410);
}

void Start_Lightning_Man_Move object#()()
{
	UI_si_path_run_usecode(-410, [890, 431], SCRIPTED, -410, Start_Lightning_Kill_Man, 0);
}

void Start_PreDeath()
{
	script -410
	{
		say "That was a close one!";
	}
}

void Start_Lightning_Man_PreDeath object#()()
{
	UI_si_path_run_usecode(-410, [895, 429], SCRIPTED, -410, Start_PreDeath, 0);
}

void Captain_Mountain_Speach()
{
	script -408
	{
		nohalt;
		face EAST;
		actor frame STAND;
		say "I see mountains!";
		wait 7;
		say "We must regain control!";
	}
}

void Captain_Mountain_Move object#()()
{
	UI_si_path_run_usecode(-408, [904, 431], SCRIPTED, -408, Captain_Mountain_Speach, 0);
}

void Start_Move_Fall_In_Man object#()()
{
	UI_play_sound_effect(33);
	UI_move_object(-409, [888, 484]);
}

void Start_Fall_In_Man_Talk object#()()
{
	script -408
	{
		say "Man overboard!";
	}
	script AVATAR
	{
		wait 3;
		say "Sentri!";
	}
}

void Start_Man_Fall_In object#()()
{
	script -409
	{
		nohalt;
		say "Be careful!";
		wait 7;
		call Start_Earthquake;
		wait 1;
		actor frame KNEEL;
		say "Aieee!";
		wait 1;
		call Start_Move_Fall_In_Man;
		
		
	}
}

void Start_Sailor_Speak object#()()
{
	UI_show_npc_face(645, 0);
	say("@The storm is taking a turn for the worst! You best all hold on tight and try to stay down!@");
}

void Start_Lightning_4 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(17, 895, 438, 0, 0, 0, -1);
}

void Start_Lightning_3 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(17, 875, 431, 0, 0, 0, -1);
}

void Start_Lightning_2 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(17, 909, 434, 0, 0, 0, -1);
}

void Start_Lightning_1 object#()()
{
	UI_play_sound_effect(116);
    UI_sprite_effect(17, 887, 422, 0, 0, 0, -1);
}

void Start_Sailor_Scripting_3()
{
	script -410
	{
		wait 2;
		say "Hold on tight!";
		actor frame STAND;
	}
}

void Start_Sailor_Scripting_2()
{
	script -409
	{
		nohalt;
		wait 1;
		say "Hold the moorings!";
		actor frame STAND;
	}
}

void Start_Sailor_Scripting_1()
{
	script -408
	{
		nohalt;
		say "Secure the cargo!";
		actor frame STAND;
	}
}

void Start_Pathing object#()()
{
	UI_play_music(16);
	UI_si_path_run_usecode(-408, [901, 429, 1], SCRIPTED, -408, Start_Sailor_Scripting_1, 0);
	UI_si_path_run_usecode(-409, [891, 432, 1], SCRIPTED, -409, Start_Sailor_Scripting_2, 0);
	UI_si_path_run_usecode(-410, [886, 431, 1], SCRIPTED, -410, Start_Sailor_Scripting_3, 0);
}

void egg_trigger_start_animation()
{
	UI_set_weather(2);
	script item
	{
		nohalt;
		wait 10;
		call Start_Lightning_3;
		wait 20;
		call Start_Lightning_4;
		wait 20;
		call Start_Sailor_Speak;
		call Start_Pathing;
		wait 5;
		call Start_Lightning_1;
		wait 4;
		call Start_Lightning_2;
		wait 3;
		call Start_Lightning_4;
		call Start_Man_Fall_In;
		wait 10;
		call Start_Fall_In_Man_Talk;
		call Start_Lightning_2;
		wait 8;
		call Start_Captain_Bark_1;
		wait 7;
		call Captain_Mountain_Move;
		wait 5;
		call Start_Lightning_Man_Talk;
		wait 4;
		call Start_Lightning_2;
		wait 4;
		call Start_Earthquake;
		wait 2;
		call Create_Sail_Fire_Lightning_2;
		wait 2;
		call Create_Sail_Fire_2;
		wait 2;
		call Start_Lightning_4;
		wait 5;
		call Start_Lightning_Man_PreDeath;
		call Start_Lightning_3;
		wait 7;
		call Start_Lightning_Man_Move;
		wait 4;
		call Create_Sail_Fire_Lightning_1;
		wait 2;
		call Create_Sail_Fire_1;
		wait 2;
		call Start_Lightning_3;
		call Start_Captain_Move;
		wait 3;
		call Create_Sail_Fire_Lightning_3;
		wait 2;
		call Create_Sail_Fire_3;
		wait 2;
		call Start_Lightning_1;
		wait 4;
		call Start_Earthquake;
		call Start_Captain_Fall_In;
		wait 5;
		call Start_Lightning_2;
		call Start_Create_Mountains_1;
		call Fade;
		wait 1;
		call Start_Heart_Sound;
		call Start_Remove_Mountains;
		call Start_Lightning_4;
		call Start_Create_Mountains_2;
		call UnFade;
		wait 1;
		call Start_Heart_Sound;
		call Fade;
		wait 1;
		call Start_Heart_Sound;
		call Start_Remove_Mountains;
		call Start_Lightning_3;
		call Start_Create_Mountains_3;
		call UnFade;
		wait 1;
		call Start_Heart_Sound;
		call Start_Earthquake;	
		call Fade;
		wait 1;
		call Start_Heart_Sound;
		call Start_Remove_Mountains;
		call Start_Create_Mountains_4;
		call UnFade;
		wait 1;
		call Start_Heart_Sound;
		call Fade;
		call Start_Remove_Mountains;
		call Start_Create_Mountains_5;
		wait 1;
		call Start_Heart_Sound;
		call UnFade;
		wait 1;
		call Start_Heart_Sound;
		call Start_Lightning_1;
		call Fade;
		wait 5;
		call Sound_Explosion;
		call Move_Avatar_To_Start;
		wait 30;
		call UnFade;
		wait 5;
		call Start_Catherine_Move;
	}

}