void Fortuna_Beg object#()()
{
	UI_show_npc_face(55, 0);
	say("Fortuna gasps, obviously in deep pain. @It is obvious to me now that you are meant to retrieve the breastplate so that its pureness can cure your corruption.@");
	say("@Venture through the mirror to take which you seek but beware that your dark, cold heart is not welcomed in such a test of purity.@");
	UI_clear_item_flag(197, DONT_MOVE);
	gflags[ENTER_GOOD_MIRROR] = true;
}

void Black_Sword_Fortuna_Lightening object#()()
{
	var lightening = UI_die_roll(40, 43);
    UI_sprite_effect(lightening, targetx, targety, 0, 0, 0, -1);
	UI_play_sound_effect(71);
}

void Black_Sword_Fortuna()
{
	UI_show_npc_face(55, 0);
	say("Fortuna gasps suddenly. @Your dark heart shall bring me no harm!@");
	script -197
	{
		nohalt;
		call Black_Sword_Fortuna_Lightening;
		wait 1;
		actor frame LIE;
		wait 2;
		say "Argh";
		actor frame KNEEL;
		wait 1;
		actor frame STAND;
		wait 5;
		call Black_Sword_Fortuna_Lightening;
		actor frame LIE;
		wait 2;
		say "Your dark heart shall wither";
		actor frame KNEEL;
		wait 1;
		actor frame STAND;
		wait 5;
		call Black_Sword_Fortuna_Lightening;
		actor frame LIE;
		wait 2;
		say "All that is pure, help me!";
		actor frame KNEEL;
		wait 1;
		actor frame STAND;
		wait 5;
		call Fortuna_Beg;
	}
}

void Flower_For_BS()
{
var flower_type = UI_get_random(3);
if(flower_type == 1)
{
	flower_shape = 999;
	flower_frame = 4;
}
else if (flower_type == 2)
{
	flower_shape = 467;
	flower_frame = 4;
}
else if (flower_type == 3)
{
	flower_shape = 209;
	flower_frame = 3;
}

}

void The_Black_Sword shape#(806)()
{
    if(event == DOUBLECLICK)
    {
	if(gflags[FINISHED_CORRUPT_BAD_TEST]) // IF YOU HAVE THE BLACK SWORD AFTER COMPLETING THE BAD TEST
	{
		AVATAR.say("@Whom would I like to try to use the sword upon?@");
		UI_close_gumps();
		var target = UI_click_on_item();
			
		Flower_For_BS();
		var flower = UI_create_new_object(flower_shape);
		UI_set_item_frame(flower, flower_frame);
		UI_update_last_created([target[2]-2, target[3]-2, target[4]]);

		Flower_For_BS();
		var flower1 = UI_create_new_object(flower_shape);
		UI_set_item_frame(flower1, flower_frame);
		UI_update_last_created([target[2]+1, target[3]+1, target[4]]);
		
		Flower_For_BS();
		var flower2 = UI_create_new_object(flower_shape);
		UI_set_item_frame(flower2, flower_frame);
		UI_update_last_created([target[2]-2, target[3], target[4]]);
		
		UI_earthquake(5);
		
	}
	else
	{
		if(gflags[RECHARGE_BLACK_SWORD])
		{
			var remaining_time = UI_get_timer();
			
			if(remaining_time < 3)
			{
				AVATAR.say("@The sword needs ", 3-remaining_time, " hours to recharge.@");
			}
			else
			{
	        AVATAR.say("@Whom would I like to bring the fiery pain of death upon?@");
	        var target = UI_click_on_item();
	        targetx = target[2];
	        targety = target[3];
	        var npc = target[1];
			var npc_name = UI_get_npc_name(target[1]);
	        
			if(npc_name == "Fortuna")
			{
				if(gflags[SPOKE_WITH_ARTHIS_1])
				{
					if(gflags[ENTER_GOOD_MIRROR] || gflags[FINISHED_CORRUPT_GOOD_TEST])
					{
						script -197
						{
							say "Leave me be! I have given all I can!";
						}
					}
					else
					{
						Black_Sword_Fortuna();
						UI_set_item_flag(-197, DONT_MOVE);
					}
				}
				else
				{
					UI_show_npc_face(1, 5);
					say("The sword vibrates in your hands but appears to do nothing else.");
				}
			}
			else if(npc_name == "Yourself?")
			{
				say("@The sword does not appear to work on this... thing.@");
			}
			else
			{
		        // Kill the target
		        
		        var health = UI_get_npc_prop(npc, HEALTH);
		        
				UI_reduce_health(npc, health-1, 2);
		                
		        script AVATAR
		        {
					call Lightning_Sound;
		            call FreezeAvatar;
		            actor frame CAST_1;
		            call White_Lightning;
		            wait 1;
		            actor frame CAST_2;
		            wait 1;
		            actor frame STAND;
		            call UnFreezeAvatar;
		        }
					black_sword_charges = 1;
					gflags[RECHARGE_BLACK_SWORD] = false;
				}
			}
		}
		else
		{
	        AVATAR.say("@Whom would I like to bring the fiery pain of death upon?@");
	        var target = UI_click_on_item();
	        targetx = target[2];
	        targety = target[3];
	        var npc = target[1];
			var npc_name = UI_get_npc_name(target[1]);
	        
			if(npc_name == "Fortuna")
			{
				if(gflags[SPOKE_WITH_ARTHIS_1])
				{
					if(gflags[ENTER_GOOD_MIRROR] || gflags[FINISHED_CORRUPT_GOOD_TEST])
					{
						script -197
						{
							say "Leave me be! I have given all I can!";
						}
					}
					else
					{
						Black_Sword_Fortuna();
						UI_set_item_flag(-197, DONT_MOVE);
					}
				}
				else
				{
					UI_show_npc_face(1, 5);
					say("The sword vibrates in your hands but appears to do nothing else.");
				}
			}
			else if(npc_name == "Yourself?")
			{
				say("@The sword does not appear to work on this... thing.@");
			}
			else
			{
		        // Kill the target
		        
		        var health = UI_get_npc_prop(npc, HEALTH);
		        
				UI_reduce_health(npc, health-1, 2);
		                
		        script AVATAR
		        {
					call Lightning_Sound;
		            call FreezeAvatar;
		            actor frame CAST_1;
		            call White_Lightning;
		            wait 1;
		            actor frame CAST_2;
		            wait 1;
		            actor frame STAND;
		            call UnFreezeAvatar;
		        }

			black_sword_charges = black_sword_charges +1;		
			if(black_sword_charges > 4)
			{
				gflags[RECHARGE_BLACK_SWORD] = true;
				UI_set_timer();
			}
			}
			
		}
    }
	}
}

