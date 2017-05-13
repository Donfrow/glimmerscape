void focusedorb shape#(1386) ()
{

if (event == DOUBLECLICK)
{
        var frame = get_item_frame();
        AVATAR.say("@Do I wish to use the orb, or remove the lens?@");
        UI_add_answer("Remove Lens");
        UI_add_answer("Use Orb");
    converse
    {


        if (response == "Remove Lens")
        {
            if (frame == 0) // Focused Orb of Persuasion
            {
			UI_remove_item(item);
            var loc = UI_get_object_position(AVATAR);
            var orb = UI_create_new_object(ORB_OF_PERSUASION);
            UI_update_last_created(loc);
	        var lens = UI_create_new_object(LENS);
            UI_update_last_created(loc);
			break;
            }
            else if (frame == 1)  // Focused Orb of Focus
            {
			UI_remove_item(item);
            var loc = UI_get_object_position(AVATAR);
            var orb = UI_create_new_object(ORB_OF_FOCUS);
            UI_update_last_created(loc);
	        var lens = UI_create_new_object(LENS);
            UI_update_last_created(loc);
			break;
            }
        }
        else if (response == "Use Orb")
        {
            if (frame == 0) // Focus Orb of Persuasion
            {
            var target = UI_click_on_item();
            var target1 = UI_get_item_shape(target[1]);

            var npc = UI_get_npc_number(target[1]);

            if (target1 == AKAKOTHEN_SHAPE)      // Akakothen
                {
                    AVATAR.say("@Perhaps I should try speaking to him now.@");
                    gflags[ORB_ON_AK] = true;
                }
            else if (npc == -251)           // Royal mint lady
                {
                AVATAR.say("It's bank lady");
                }
            break;
            }
            
            
            else if (frame == 1) // Focused Orb of Focus
            {

                var target = UI_click_on_item();
                var target1 = UI_get_item_shape(target[1]);
                var chaos_orb = UI_find_nearby([1383, 481, 2], ORB_OF_CHAOS, 1, MASK_NONE);
                var loc = get_object_position(AVATAR);
                
                // Big portion for making avatar disappear in time
                if (target1 == ORB_OF_CHAOS && chaos_orb)
                {
                    gflags[IN_PAST] = true;
                    if(gflags[DONE_IN_PAST]) // set upon returning to the future so you cannot go back again
                    {
                        UI_sprite_effect(9, loc[1], loc[2], loc[3], 0, 0, -1);
                        UI_play_sound_effect(48);
                    }
                    else
                    {

                    
                        if (gflags[GO_TO_PAST])    // IN MID-TERE PAST AND GOING TO BIG PAST WHERE OPHIDIANS LIVE
                        {
							UI_set_item_flag(AVATAR, BLINKER_DISABLED);
							if(gflags[LEARNED_WORDS]) // Lets you go further in past if you know the words of Power from Archibus
							{
								UI_play_music(64);
								script item
								{

									call FreezeAvatar;
									call Remove_Orb_From_Avatar1;
									call MoveAvatarToAltar;
									wait 15;
									//call FreezeAvatar;
									call orb_sprite2;
									wait 10;
									
									call orb_sprite1;
									wait 12;
									call orb_sprite2;
									call orb_sprite3;
									wait 5;
									//call MoveAvatar1;
									call Fade2;
									wait 5;
									call orb_sprite3;
									wait 10;
									//call MoveAvatar2;
									call Fade1;
									wait 15;
									call orb_sprite2;
									wait 5;
									call orb_sprite3;
									wait 5;
									//call MoveAvatar4;
									call Fade4;
									wait 25;
									call orb_sprite1;
									call orb_sprite3;
									//call MoveAvatar3;
									call Fade1;
									wait 25;
									call orb_sprite2;
									call orb_sprite3;
									call Fade3;
									wait 15;
									call orb_sprite1;
									wait 5;
									call orb_sprite3;
									wait 10;
									call FadeToPast; // fades avatar to the cave in the past
									wait 5;
									call Teleport_Sound02;
									call orb_sprite4;
									say "By the virtues...";
									call UnFreezeAvatar;
								}
								
							}
							else
							{
								AVATAR.say("@I feel as if I am missing something here.@");
							}
						}
						else// GOING TO THE MID-TIER PAST TO REVIEW THE NOTEBOOK ON HOW TO USE THE RING
						
						{
							UI_play_music(64);
							gflags[GO_TO_PAST] = true;
							script item
							{
								call FreezeAvatar;
								call Remove_All_Party_Members;
								call MoveAvatarToAltar;
								wait 15;
								//frame STAND;
								wait 2;
								//face NORTH;
								call Remove_Orb_From_Avatar;
								//say "The orb...";
								call orb_sprite1;
								wait 10;
								call orb_sprite2;
								wait 12;
								call orb_sprite3;
								wait 5;
								//call MoveAvatar1;
								call Fade1;
								wait 5;
								call orb_sprite3;
								wait 10;
								//call MoveAvatar2;
								call Fade2;
								wait 15;
								call orb_sprite2;
								wait 5;
								call orb_sprite3;
								wait 5;
								//call MoveAvatar4;
								call Fade3;
								wait 25;
								call orb_sprite1;
								//call MoveAvatar3;
								call Fade4;
								wait 5;
								call create_broken_lense;
								call orb_sprite4;
								call Teleport_Sound02;
								call UnFreezeAvatar;
                        }						
						}
					}
				}
				break;
			}
		}
	}
	}
}


















/* REDOING THIS ENTIRE CODED PORTION             
                    script item
                        {
                        call FreezeAvatar;
                        call Remove_Orb_From_Avatar1;
                        call MoveAvatarToAltar;
                        wait 15;
                        //call FreezeAvatar;
                        call orb_sprite2;
                        wait 10;
                        call orb_sprite1;
                        wait 12;
                        call orb_sprite2;
                        call orb_sprite3;
                        wait 5;
                        //call MoveAvatar1;
                        call Fade2;
                        wait 5;
                        call orb_sprite3;
                        wait 10;
                        //call MoveAvatar2;
                        call Fade1;
                        wait 15;
                        call orb_sprite2;
                        wait 5;
                        call orb_sprite3;
                        wait 5;
                        //call MoveAvatar4;
                        call Fade4;
                        wait 25;
                        call orb_sprite1;
                        call orb_sprite3;
                        //call MoveAvatar3;
                        call Fade1;
                        wait 25;
                        call orb_sprite2;
                        call orb_sprite3;
                        call Fade3;
                        wait 15;
                        call orb_sprite1;
                        wait 5;
                        call orb_sprite3;
                        wait 10;
                        call FadeToPast; // fades avatar to the cave in the past
                        wait 5;
                        call orb_sprite4;
                        say "By the virtues...";
                        call UnFreezeAvatar;
                        }
                    }
						else
						{
							AVATAR.say("@I feel there is something I am missing here.@");
						}
                    }
                    
                    else // GOING TO THE MID-TIER PAST TO REVIEW THE NOTEBOOK ON HOW TO USE THE RING
                    {
						if(gflags[GO_TO_PAST])
						{
                    script item
                        {
                        call FreezeAvatar;
                        call MoveAvatarToAltar;
                        wait 15;
                        frame STAND;
                        call Remove_Orb_From_Avatar;
                        say "The orb...";
                        call orb_sprite1;
                        wait 10;
                        call orb_sprite2;
                        wait 12;
                        call orb_sprite3;
                        wait 5;
                        //call MoveAvatar1;
                        call Fade1;
                        wait 5;
                        call orb_sprite3;
                        wait 10;
                        //call MoveAvatar2;
                        call Fade2;
                        wait 15;
                        call orb_sprite2;
                        wait 5;
                        call orb_sprite3;
                        wait 5;
                        //call MoveAvatar4;
                        call Fade3;
                        wait 25;
                        call orb_sprite1;
                        //call MoveAvatar3;
                        call Fade4;
                        wait 5;
                        call create_broken_lense;
                        call orb_sprite4;
                        call UnFreezeAvatar;
                        
                        }
                        }
                    }
                    }
                }
                
                
                break;
            }
            
            
            
            
        }
    }
}



}
*/
