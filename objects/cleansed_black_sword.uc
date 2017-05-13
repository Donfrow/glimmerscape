void Cleansed_Black_Sword shape#(1271)()
{
    if(event == DOUBLECLICK)
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
		        AVATAR.say("@Whom would I like to use the sword upon?@");
		        var target = UI_click_on_item();
		        targetx = target[2];
		        targety = target[3];
		        var npc = target[1];
		        
				// Put the target to sleep

				UI_set_item_flag(npc, ASLEEP);
				script npc
				{
					nohalt;
					actor frame LIE;
				}
		        
		        UI_play_sound_effect(76);
		        script AVATAR
		        {
		            call FreezeAvatar;
		            actor frame CAST_1;
		            call Purple_Bubbles_Target;
		            wait 1;
		            actor frame CAST_2;
		            wait 1;
		            actor frame STAND;
		            call UnFreezeAvatar;
		        }
					black_sword_charge = 1;
					gflags[RECHARGE_BLACK_SWORD] = false;
			}
		}
		else
		{
		    AVATAR.say("@Whom would I like to use the sword upon?@");
	        var target = UI_click_on_item();
	        targetx = target[2];
	        targety = target[3];
	        var npc = target[1];
	        
			// Put the target to sleep		
			UI_set_item_flag(npc, ASLEEP);
        
			script npc
			{
				nohalt;
				actor frame LIE;
			}
				
	        UI_play_sound_effect(76);
	        script AVATAR
	        {
	            call FreezeAvatar;
	            actor frame CAST_1;
	            call Purple_Bubbles_Target;
	            wait 1;
	            actor frame CAST_2;
	            wait 1;
	            actor frame STAND;
	            call UnFreezeAvatar;
	        }

			black_sword_charge = black_sword_charge + 1;	
			if(black_sword_charge > 4)
			{
				gflags[RECHARGE_BLACK_SWORD] = true;
				UI_set_timer(5);
			}
		}
	}
}

