void Donals_Corrupted_Breastplate_of_Mourning shape#(1483)()
{
    if(event == DOUBLECLICK)
    {
	if(gflags[RECHARGE_DONALS_BP])
		{
			var remaining_time = UI_get_timer();
			
			if(remaining_time < 3)
			{
				AVATAR.say("@The breastplate needs ", 3-remaining_time, " hours to recharge.@");
			}
			else
			{
		        AVATAR.say("@Whom would I like to heal?@");
		        var target = UI_click_on_item();
		        targetx = target[2];
		        targety = target[3];
		        var npc = target[1];
		        
		        // Heal the target
		        
		        var health = UI_get_npc_prop(npc, HEALTH);
		        var str = UI_get_npc_prop(npc, STRENGTH);
				var increase_in_health = str-health;
				var total_health = UI_set_npc_prop(npc, HEALTH, increase_in_health/2);    
		        
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
					donals_bp_charges = 1;
					gflags[RECHARGE_DONALS_BP] = false;
			}
		}
		else
		{
	        AVATAR.say("@Whom would I like to heal?@");
	        var target = UI_click_on_item();
	        targetx = target[2];
	        targety = target[3];
	        var npc = target[1];
	        
	        // Heal the target
	        
	        var health = UI_get_npc_prop(npc, HEALTH);
	        var str = UI_get_npc_prop(npc, STRENGTH);
			var increase_in_health = str-health;
	        var total_health = UI_set_npc_prop(npc, HEALTH, increase_in_health/2);
        
	        
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

			donals_bp_charges = donals_bp_charges +1;		
			if(donals_bp_charges > 4)
			{
				gflags[RECHARGE_DONALS_BP] = true;
				UI_set_timer(5);
			}
		}
	}
}

