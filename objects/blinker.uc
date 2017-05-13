void blinker shape#(1419)()
{
var loc = UI_get_object_position(AVATAR);
var combat = UI_in_combat();
    
if(event == DOUBLECLICK)
{

var blinker_disabled = UI_get_item_flag(AVATAR, BLINKER_DISABLED);

// PREVENT IT FROM WORKING IN THE KARMA TESTS, OR IN THE PAST, OR AT FATE AT THE END, OR WHEN TRAPPED IN ICE STAIRS
        
	if(blinker_disabled)
	//if(gflags[IN_PAST] || gflags[KARMA_TEST_GOOD] || gflags[KARMA_TEST_EVIL] || gflags[AT_FATE] || gflags[IN_ICE_STAIRS] || gflags[CONCOCTION_DEATH] || gflags[IN_GOOD_TEST] || gflags[IN_BAD_TEST] || blinker_disabled)
    {

			var bark = "It does not appear to function.";
			UI_play_sound_effect(48);
			UI_sprite_effect(POOF, loc[1], loc[2], 0, 0, 0, -1);
			UI_close_gumps();    
			script AVATAR
			{
				say bark;
			}

    }
    else if (combat) // In combat
    {
        AVATAR.say("@I cannot use this now!@");
    }   
    else
    {
		AVATAR.say("@Where shall I go?@");
        UI_add_answer("Nowhere");
		UI_add_answer("Cotton Cove");
        
        // ADD DIFFERENT PLACES AFTER EGGS HAVE BEEN HATCHED
        
        if(gflags[VISITED_DEATHSQUALL])
        {
            UI_add_answer("DeathSquall Island");
        }

        if(gflags[VISITED_CASTLE])
        {
            UI_add_answer("Akakothen's Castle");
        }
        
        if(gflags[VISITED_DEWTOPIA])
        {
            UI_add_answer("Dewtopia");
        }
        
        if(gflags[VISITED_BRENTONIA])
        {
            UI_add_answer("Brentonia");
        }
		if(gflags[VISITED_SOLUSEK])
		{
			UI_add_answer("Solusek Island");
		}
        if(gflags[VISITED_KINTORE])
		{
			UI_add_answer("Kintore");
		}
		if(gflags[VISITED_MEDINA])
		{
			UI_add_answer("Medina");
		}
		if(gflags[VISITED_CAMBRAY])
		{
			UI_add_answer("Cambray");
		}
		if(gflags[VISITED_ROSENDALE])
		{
			UI_add_answer("Rosendale");
		}
		if(gflags[VISITED_NEW_OPHIDIA])
		{
			UI_add_answer("New Ophidia");			
		}
		if(gflags[VISITED_NORTHERN_FOREST])
		{
			UI_add_answer("Northern Forest");
		}
		if(gflags[VISITED_HENSALL])
		{
			UI_add_answer("Hensall");			
		}
		if(gflags[VISITED_GOBLIN_CAMP])
		{
			UI_add_answer("Goblin Camp");			
		}
        if(gflags[BLINKER_BOUND])
        {
            UI_add_answer("Unbind");
            UI_add_answer("Bind spot");
        }
        else
        {
            UI_add_answer("Bind");
        }
            
        converse
        {
            if (response == "DeathSquall Island")
            {
				blinker_x = 2488;
				blinker_y = 1868;
				Blinker_Teleport_Party();
				break;
            }
            else if (response == "Nowhere")
            {
                break;
            }
            else if (response == "Akakothen's Castle")
            {
				blinker_x = 2486;
				blinker_y = 50;
				Blinker_Teleport_Party();
				break;
            }
			else if (response == "Northern Forest")
			{
				blinker_x = 1321;
				blinker_y = 1356;
				Blinker_Teleport_Party();
				break;				
			}
            else if (response == "Cotton Cove")
            {
				blinker_x = 1191;
				blinker_y = 1848;
				Blinker_Teleport_Party();
				break;
            }
            else if (response == "Dewtopia")
            {
				blinker_x = 1608;
				blinker_y = 1735;
				Blinker_Teleport_Party();
				break;
            }
            else if (response == "Goblin Camp")
            {
				blinker_x = 569;
				blinker_y = 1176;
				Blinker_Teleport_Party();
				break;
            }

            else if (response == "Brentonia")
            {
				if(inParty(-382))
				{
					UI_close_gumps();
					script AVATAR
					{
						call FreezeAvatar;
						wait 3;
						actor frame KNEEL;
						call Spell_Fail;
						wait 5;
						actor frame STAND;
						say "It does not seem to be working.";
						wait 2;
						call UnFreezeAvatar;
						
					}
				}
				else
				{
					blinker_x = 1927;
					blinker_y = 1100;
					Blinker_Teleport_Party();
					break;
				}
            }
			else if (response == "Solusek Island")
			{
				blinker_x = 295;
				blinker_y = 2171;
				Blinker_Teleport_Party();
				break;
			}
			else if (response == "Kintore")
			{
				blinker_x = 2149;
				blinker_y = 2342;
				Blinker_Teleport_Party();
				break;
			}
			else if (response == "Medina")
			{
				blinker_x = 2871;
				blinker_y = 910;
				Blinker_Teleport_Party();
				break;				
			}
 			else if (response == "Cambray")
			{
				blinker_x = 2936;
				blinker_y = 280;
				Blinker_Teleport_Party();
				break;				
			}
 			else if (response == "Rosendale")
			{
				blinker_x = 2213;
				blinker_y = 584;
				Blinker_Teleport_Party();
				break;				
			}
 			else if (response == "New Ophidia")
			{
				blinker_x = 1241;
				blinker_y = 904;
				Blinker_Teleport_Party();
				break;				
			}
 			else if (response == "Hensall")
			{
				blinker_x = 2410;
				blinker_y = 2764;
				Blinker_Teleport_Party();
				break;				
			}     					
            // BINDING IF'S HERE
            else if (response == "Bind spot")
            {
                script AVATAR
                {
                    call FreezeAvatar;
                    wait 3;
                    actor frame KNEEL;
                    call Teleport_Sound01;
                    wait 3;
                    call Fade_To_Bind_Spot;
                    wait 10;
                    actor frame STAND;
                    call UnFreezeAvatar;
                }
                break;
            }
            else if (response == "Bind")
            {
                avatar_bind_x = loc[1];
                avatar_bind_y = loc[2];
				avatar_bind_z = loc[3];
                script AVATAR
                {
                    call FreezeAvatar;
                    wait 3;
                    actor frame KNEEL;
                    call High_Squeel;
                    wait 3;
                    actor frame STAND;
                    call UnFreezeAvatar;
                }
                gflags[BLINKER_BOUND] = true;
                break;
            }
            else if (response == "Unbind")
            {
                avatar_bind_x = loc[1];
                avatar_bind_y = loc[2];
                avatar_bind_z = loc[3];
				
                script AVATAR
                {
                    call FreezeAvatar;
                    wait 3;
                    actor frame KNEEL;
                    call Popping_Fire01;
                    call Unbind_Beads;
                    wait 5;
                    actor frame STAND;
                    call UnFreezeAvatar;
                }
                gflags[BLINKER_BOUND] = false;
                break;
            }
            
        }

            
        }
    }
}
