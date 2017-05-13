void Cure_Pained_Unicorn_Convo object#()()
{
	UI_show_npc_face(558, 0);
	say("With a brilliant flash the madness in the unicorn appears to subside.");
	gflags[CURED_PAINED_UNICORN] = true;
	UI_clear_item_flag(-452, DONT_MOVE);
	UI_set_schedule_type(-452, LOITER);
	UI_set_alignment(-452, FRIENDLY);
	UI_set_npc_name(-452, "Healed Unicorn");
	
}

void Cure_Pained_Unicorn()
{
	var loc = UI_get_object_position(452);
	targetx = loc[1];
	targety = loc[2];
	targetz = loc[3];
	
	UI_set_item_flag(-452, DONT_MOVE);
		
	script -452
	{
		nohalt;
		call Holy_Cure;
		call High_Squeel;
		wait 15;
		call Cure_Pained_Unicorn_Convo;
	}
}

void Vidiovis_Beg object#()()
{
	UI_show_npc_face(209, 0);
	say("Vidiovis scowls at you. @Your quest to force 'purity' on others is no different than what I seek for myself yet you consider yourself better than I.@");
	say("He takes a moment and catches his breath. @Let us end this charade. Enter the mirror if you so desire but do not expect me to aid you in any other way. Now leave me be!@");
	UI_clear_item_flag(-9, DONT_MOVE);
	gflags[ENTER_BAD_MIRROR] = true;
}

void Donals_BP_Vediovis_Bubbles object#()()
{
    UI_sprite_effect(51, targetx, targety, 0, 0, 0, -1);
	UI_play_sound_effect(29); // High squeel
}

void Donals_BP_Vediovis()
{

UI_show_npc_face(209, 0);

say("Vediovis clutches at his chest. @You act as if you are pure yet you force your will upon others!@");
UI_set_item_flag(-9, DONT_MOVE);

script -9
	{
		nohalt;
		actor frame KNEEL;
		call Donals_BP_Vediovis_Bubbles;
		wait 5;
		actor frame STAND;
		say "You are no different than I!";
		wait 10;
		actor frame KNEEL;
		call Donals_BP_Vediovis_Bubbles;
		wait 5;
		actor frame STAND;
		wait 10;
		call Donals_BP_Vediovis_Bubbles;
		actor frame KNEEL;
		wait 3;
		actor frame LIE;
		wait 3;
		actor frame KNEEL;
		wait 1;
		actor frame STAND;
		wait 8;
		call Vidiovis_Beg;

	}

}


void Donals_Breastplate_of_Mourning shape#(419)()
{
    if(event == DOUBLECLICK)
    {
	
	//IF YOU ARE EVIL
	if(gflags[SPOKE_WITH_ARTHIS_1])
	{
		UI_close_gumps();
		UI_earthquake(5);
		script AVATAR
		{
			say "It does not seem to work.";
		}
	}
	else // IF YOU ARE GOOD
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

				var npc_name = UI_get_npc_name(target[1]);
				
				if(npc_name == "Vediovis")
				{
					if(gflags[SPOKE_WITH_DONAL_1])
					{
						if(gflags[ENTER_BAD_MIRROR] || gflags[FINISHED_CORRUPT_BAD_TEST])
						{
							script -9
							{
								say "I have told you all I can. Leave me be.";
							}
						}
						else
						{
							Donals_BP_Vediovis();
							UI_set_item_flag(-9, DONT_MOVE);
						}
					}

				}
				else if (npc_name == "Pained Unicorn")
				{
					Cure_Pained_Unicorn();
				}
				else
				{
		        // Heal the target
		        
			        var health = UI_get_npc_prop(npc, HEALTH);
			        var str = UI_get_npc_prop(npc, STRENGTH);
			        var total_health = UI_set_npc_prop(npc, HEALTH, str-health);
			        
			        // Cure any magical or poisoned effects of target
			        
			        UI_clear_item_flag(npc, CURSED);
			        UI_clear_item_flag(npc, PARALYZED);
			        UI_clear_item_flag(npc, PARALYSED);
			        UI_clear_item_flag(npc, POISONED);
			        
			        
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
			}	}
		}
		else
		{
	        AVATAR.say("@Whom would I like to heal?@");
	        var target = UI_click_on_item();
	        targetx = target[2];
	        targety = target[3];
	        var npc = target[1];

			var npc_name = UI_get_npc_name(target[1]);
		
			if(npc_name == "Vediovis")
			{
				if(gflags[SPOKE_WITH_DONAL_1])
				{
					if(gflags[ENTER_BAD_MIRROR] || gflags[FINISHED_CORRUPT_BAD_TEST])
					{
						script -9
						{
							say "I have told you all I can. Leave me be.";
						}
					}
					else
					{
						Donals_BP_Vediovis();
						UI_set_item_flag(-9, DONT_MOVE);
					}
				}
			}
			else if (npc_name == "Pained Unicorn")
			{
				Cure_Pained_Unicorn();			
			}
			else
			{
		        // Heal the target
		        
		        var health = UI_get_npc_prop(npc, HEALTH);
		        var str = UI_get_npc_prop(npc, STRENGTH);
		        var total_health = UI_set_npc_prop(npc, HEALTH, str-health);
		        
		        // Cure any magical or poisoned effects of target
		        
		        UI_clear_item_flag(npc, CURSED);
		        UI_clear_item_flag(npc, PARALYZED);
		        UI_clear_item_flag(npc, PARALYSED);
		        UI_clear_item_flag(npc, POISONED);
		        
		        
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
					UI_set_timer();
			
				}
		}
		}
    }
	}
}

