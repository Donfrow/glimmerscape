// These functions are all used in odd_materia.uc

void Path_Avatar_In_Past object#()()
{
    UI_si_path_run_usecode(AVATAR, [1140, 671, 0]);
    gflags[KILL_BRENDA_TRAVLEN_TALK] = true;
}

void Teleport_In_Travlen object#()()
{
    UI_move_object(-228, [1136, 663, 0]);
    
    // face south
    UI_set_item_frame_rot(-228, 16);
    // freeze him so he can't move
    UI_set_item_flag(-228, 16);
    
}

void Travlen_Teleport object#()()
{
    UI_sprite_effect(7, 1136, 662, 0, 0, 0, -1);
    UI_play_sound_effect(81);
}


void Travlen_Dialog object#()()
{
    	UI_show_npc_face(571, 0);
    	say("The creepy man appears before you. @Avatar! I have sensed that you have created objects of unimaginable power. You must give them to me before it is too late!@");

        UI_add_answer("Why?");    	
        UI_add_answer("Too late?");
        
        converse
        {
            if (response == "Why?")
            {
                say("The man seems visibly shaken. @You do not know what you are doing!@");
                UI_remove_answer("Why?");
            }
            else if (response == "Too late?")
            {
                say("The mans voice has tremors within it. @You do not know what you hold! You possess magic which is too strong for a character such as you!@");
                UI_remove_answer("Too late?");
                UI_add_answer("Says you!");
            }
            else if (response == "Says you!")
            {
                say("The man looks as if he is about to unleash his full fury upon you when he becomes startled. @You shall face my... what is this? Brenda! I should have known you had a part in this!@");
                break;
            }
        }
}


void Teleport_In_Brenda object#()()
{
    UI_move_object(-268, [1136, 680, 0]);
    
    // face north
    UI_set_item_frame_rot(-268, 0);

    // freeze him so she can't move
    UI_set_item_flag(-268, 16);

}

void Brenda_Teleport object#()()
{
    UI_sprite_effect(7, 1136, 680, 0, 0, 0, -1);
    UI_play_sound_effect(81);
}

void Brenda_Fail_Cast_Poof object#()()
{
    UI_sprite_effect(9, 1136, 678, 0, 0, 0, -1);
    UI_play_sound_effect(48);
}

void Brenda_Dialog object#()()
{
    UI_show_npc_face(215, 0);
    say("@Travlen! I should have known that you would show up once you felt the binding of power. I shall not let you sway the Avatar!@");
    UI_show_npc_face1(571, 0);
    say("The man laughs. @You are not in a position to speak such forceful words my love.@");
    UI_show_npc_face(215, 0);
    say("@Do not speak such things! My love for you died the day you turned me into the Ophidians! Now speak not and leave lest I have to strike you down!@");
    UI_show_npc_face1(571, 0);
    say("@What is the matter my love? Do not wish the Avatar to know what you did to me and our people?@");
    UI_show_npc_face(215, 0);
    say("@I shall destroy you where you stand!@");
}

void Brenda_Travlen_Dialog01 object#()()
{
    var bark = "Strike him down where he stands!";
    UI_show_npc_face(571, 0);
    say("@It would seem the creation of the orbs has disturbed the magical energies of this area Brenda...@");
    UI_show_npc_face1(215, 0);
    say("@Avatar! You magic from the creation of the artifacts flows through your veins at this time... use it to strike down Travlen!@");
    UI_show_npc_face(571, 0);
    say("@And why would the Avatar want to do such a thing? Do you not want to know what Brenda has done Avatar?@");
    
    UI_add_answer("No");
    UI_add_answer("What did she do?");
    UI_add_answer("I don't know!");
    
    converse
    {
        if (response == "No")
        {
        say("@If you are siding with that witch than strike me down now.@");
        UI_show_npc_face1(215, 0);
        say("@You have made the right decision Avatar. Now unleash the energy to tear apart his entity!@");
        break;
        }
        else if (response == "What did she do?")
        {
            say("@Brenda is the reason that our people are no longer allowed to venture to this shrine. She took my research and corrupted it.@");
            UI_show_npc_face1(215, 0);
            say("@Those are lies Travlen!@");
            UI_clear_answers();
            UI_add_answer("Corrupt it");
            /*
            UI_remove_answer("No");
            UI_remove_answer("I don't know!");
            UI_remove_answer("What did she do?");
            */
        }
        else if (response == "Corrupt it")
        {
            say("@She has been playing you since the beginning. These orbs which you have created are items of such power that our people feared their creation.@");
            say("@It was out of this fear that caused this place to be abandoned and locked up.@");
            UI_show_npc_face1(215, 0);
            say("@Stop spreading your lies Travlen! It is you that caused the situation we are in!@");
            UI_remove_answer("Corrupt it");
            UI_add_answer("What happened?");
        }
        else if (response == "What happened?")
        {
            say("@My studies may have been dangerous but nowhere near as dangerous as her thirst for power. I only learned this after secretly binding our souls as an act of love.@");
            UI_show_npc_face1(215, 0);
            say("@Speak no more of this Travlen!@");
            UI_remove_answer("What happened?");
            UI_add_answer("Love");
        }
        else if (response == "Love")
        {
            say("@Brenda and I used to be lovers, and as an act of devotion I created a spell to bind our souls together in secret.@");
			say("@This was to be my ultimate gift to Brenda. Only after I did this did I truely see into her soul and her true self.@");
            UI_show_npc_face1(215, 0);
            say("@You are a coward Travlen! If you were truely a man you would have seen the greatness of my plan. Instead you were a snivling dog and went crawling to the Ophidian High Council!@");
            UI_remove_answer("Love");
            UI_add_answer("Plan");
        }
        else if (response == "Plan")
        {
            say("@Brenda wished to create these artifacts so that she could overthrow the Ophidians and set herself up as a tyrannical leader. Her heart is as black as night. Her cruelty and thirst for power knows no bounds.@");
            UI_show_npc_face1(215, 0);
            say("@You could have been by my side Travlen! Instead you turned me in like the baby you are.@");
            UI_remove_answer("Plan");
            UI_add_answer("Where do I come into all of this?");
        }
        else if (response == "Where do I come into all of this?")
        {
            say("@The Ophidian High Council made it an offense punishable by death enter this shrine. They sealed it off in order to keep Brenda from fulfilling her plan. Why they did not execute her I do not know.@");
            UI_show_npc_face1(215, 0);
            say("@They are cowards just like you Travlen! Instead of slaying me they merely tried to destroy all my work.@");
            UI_show_npc_face(571, 0);
            say("@They should have put you to death. I would have done it myself but I cannot bring myself to slay my old love. Instead I choose to disobey the order to abandon the cavern.@");
            say("The man pauses. @Our bound allowed me to know if she ever attempted to re-enter the shrine, and her me. The only way to ensure that she did not attempt to complete her work was to guard the shrine myself.@");
            UI_show_npc_face1(215, 0);
            say("@And you still failed in your task, just as you failed at everything else. You did not foresee that I would get someone else to complete my work. Shortsighted as always Travlen.@");
            UI_show_npc_face(571, 0);
            say("@It is true. I knew no Ophidian would ever help her to complete her work so I did not imagine it would be a concern. Yet, here you are Avatar.@");
			say("@I can tell that you are no Ophidian so I know you did not know what you were doing.@");
            say("The man takes a breath. @It is for this reason I did not strike you down the moment you entered into the cavern.@");
            UI_show_npc_face1(215, 0);
            say("@Always the kind soul Travlen. Now that you have failed in your task you have nothing left in this life. I would strike you down but I am unable to. It is up to the Avatar to strike you down.@");
            UI_show_npc_face(571, 0);
            say("A deep sigh comes from the man. @Brenda is correct Avatar. As you have seen, neither of us are able to use our magical abilities at this time. It is up to you to use the red orb to strike one of us down.@");
            say("@It is your choice. I hope that you make the correct one.@");
            UI_show_npc_face1(215, 0);
            script -268
            {
                say bark;
            }
            break;
        }
        else if (response == "I don't know!")
        {
            say("@Ask me what Brenda has done and I shall tell you.@");
            UI_clear_answers();
            UI_add_answer("What did she do?");
            UI_add_answer("No");
        }
    }
}

// AFTERMATH FUNCTIONS - GENERIC ONES REGARDLESS OF WHO PLAYER KILLS

void Move_Objects_In_Past object#()()
{
    if(UI_is_dead(-268)) // Brenda
    {
        UI_move_object(-228, [1119, 461, 0]); // Move Travlen back into the cavern
        UI_clear_item_flag(-228, 16); // Clear the freeze flag on Travlen
        UI_move_object(-268, [1060, 662, 0]); // Move Brenda to the West of the shrine to never be seen again
        UI_add_cont_items(-228, 1, KEY, 29, ANY); // Add key to invis chest to Travlen
        UI_clear_item_flag(-228, 29); // make Travlen killable
    }
    else if (UI_is_dead(-228)) // Travlen
    {

        UI_move_object(-268, [1119, 461, 0]); // Move Brenda to the cavern and modify her schedule
        UI_modify_schedule(-268, 0, LOITER, [1119, 461, 0]);
        UI_move_object(-228, [1060, 662, 0]); // Move Travlen to the West of the shrine to never be seen again
        UI_add_cont_items(-268, 1, KEY, 29, ANY); // Add key to invis chest to Brenda
        UI_clear_item_flag(-268, 29); // make Brenda killable
        UI_clear_item_flag(-268, 16); // Clear the freeze flag on Brenda
    }



    // Remove the orbs from the area
    UI_remove_from_area(ORB_OF_FOCUS, 0, [1128, 664], [1128, 664]);
    UI_remove_from_area(ORB_OF_CHAOS, 0, [1128, 664], [1128, 664]);
    
    UI_remove_from_area(ORB_OF_FOCUS, 0, [1128, 680], [1128, 680]);
    UI_remove_from_area(ORB_OF_CHAOS, 0, [1128, 680], [1128, 680]);
    
    // set the flag so glenlorn can TP in when you hit the egg
    gflags[GLENLORN_TELEPORT_FLAG] = true;
}

void PaletteFade_In_Past object#()()
{
	UI_fade_palette(25, 1, 0); // fade to black
	
    script AVATAR
    {
        nohalt;
        wait 10;
        call Move_Objects_In_Past;
        call Advance_Time_3_Hours;
        wait 15;
        call GenericPaletteUnfade;
        wait 5;
        frame KNEEL;
        wait 1;
        frame STAND;
        wait 3;
        call UnFreezeAvatar;
        
    }
}


void Knock_Out_Avatar object#()()
{

    script AVATAR
    {
        frame LIE;
        call PaletteFade_In_Past;
    }
}



// SERIES OF FUNCTIONS FOR KILLING TRAVLEN AND AFTERMATH

void Kill_Travlen_Sprites01 object#()()
{
        UI_sprite_effect(BLUE_LIGHTNING, 1140, 665, 0, 0, 0, -1);
        UI_sprite_effect(RED_LIGHTNING, 1136, 662, 0, 0, 0, -1);
        UI_play_sound_effect(71);
}
void Kill_Travlen_Sprites02 object#()()
{
        UI_sprite_effect(GREEN_LIGHTNING, 1134, 663, 0, 0, 0, -1);
        UI_play_sound_effect(71);
}

void Kill_Travlen_Sprites03 object#()()
{
        UI_sprite_effect(YELLOW_LIGHTNING, 1136, 664, 0, 0, 0, -1);
        UI_play_sound_effect(71);
}
void Kill_Travlen_Sprites04 object#()()
{
        UI_sprite_effect(8, 1135, 661, 0, 0, 0, -1);
        UI_play_sound_effect(50);
        UI_kill_npc(-228);
		
		// Create Travlen body in the ice area for end game display
		var travlen_body = UI_create_new_object(1314);
		UI_set_item_frame(travlen_body, 22);
		UI_update_last_created([960, 312, 0, 2]);
		
		// Create Brenda body in the ice caves for end game display
		var brenda_body = UI_create_new_object(1314);
		UI_set_item_frame(brenda_body, 23);
		UI_update_last_created([1088, 282, 0, 2]);
		
}

    // Series of things for after Travlen is dead


void Knock_Out_Avatar_Sound object#()()
{
    UI_play_sound_effect(29);
}



void Brenda_End_Convo object#()()
{
    UI_show_npc_face0(215, 0);
    say("@My magical abilities have returned... it would seem that by unleashing the magical energies built up within your body the energies once again flow as they should.@");
    say("@Because of what you have done for me I shall let you live. But the orbs are mine. Farewell Avatar.@");
    script -268
    {
        wait 5;
        frame CAST_1;
        call Knock_Out_Avatar_Sound;
        wait 2;
        frame CAST_2;
        wait 3;
        call Knock_Out_Avatar;

    }
    
}

// SERIES OF FUNCTIONS FOR KILLING BRENDA

void Kill_Brenda_Sprites01 object#()()
{
        UI_sprite_effect(BLUE_LIGHTNING, 1133, 678, 0, 0, 0, -1);
        UI_sprite_effect(RED_LIGHTNING, 1138, 681, 0, 0, 0, -1);
        UI_play_sound_effect(71);
}
void Kill_Brenda_Sprites02 object#()()
{
        UI_sprite_effect(GREEN_LIGHTNING, 1134, 679, 0, 0, 0, -1);
        UI_play_sound_effect(71);
}

void Kill_Brenda_Sprites03 object#()()
{
        UI_sprite_effect(YELLOW_LIGHTNING, 1136, 681, 0, 0, 0, -1);
        UI_play_sound_effect(71);
}
void Kill_Brenda_Sprites04 object#()()
{
        UI_sprite_effect(8, 1135, 678, 0, 0, 0, -1);
        UI_play_sound_effect(50);
        UI_kill_npc(-268);
		
		// Add Brenda body to ice area for end game
		
		var brenda_body = UI_create_new_object(1314);
		UI_set_item_frame(brenda_body, 23);
		UI_update_last_created([960, 329, 0, 2]);

		// Create Travlen body in the ice caves for end game display
		var travlen_body = UI_create_new_object(1314);
		UI_set_item_frame(travlen_body, 22);
		UI_update_last_created([1088, 282, 0, 2]);
		
}

void Travlen_End_Convo object#()()
{
    UI_show_npc_face0(571, 0);
    say("The man stares intently at you. @By unleashing the magical energy which has entered into your body the energies once again return in this area.@");
    say("Silence takes over the moment. @Although you have aided me in preventing Brenda from gaining such artifacts  I cannot in good consciousness leave them in the hands of an unskilled mage such as you.@");
    say("@I will not harm you Avatar, but you must now rest.@");
    script -228
    {
		nohalt;
        wait 5;
        frame CAST_1;
        call Knock_Out_Avatar_Sound;
        wait 2;
        frame CAST_2;
        wait 3;
        call Knock_Out_Avatar;

    }
}

// The two codes for killing Brenda and Travlen

void Kill_Travlen object#()()
{
    var bark = "Nooo...";
    script -228
    {
        nohalt;
        wait 5;
        call Kill_Travlen_Sprites01;
        face SOUTH;
        actor frame KNEEL;
        say bark;
        wait 5;
        call Kill_Travlen_Sprites02;
        wait 5;
        call Kill_Travlen_Sprites03;
        wait 5;      
        call Kill_Travlen_Sprites04;
        wait 15;
        call Brenda_End_Convo;  


    }
}

void Kill_Brenda object#()()
{
    var bark = "Aaargh";
    script -268
    {
		nohalt;
        wait 5;
        call Kill_Brenda_Sprites01;
        face NORTH;
        frame KNEEL;
        say bark;
        wait 5;
        call Kill_Brenda_Sprites02;
        wait 5;
        call Kill_Brenda_Sprites03;
        wait 5;
        call Kill_Brenda_Sprites04;
        wait 15;
        call Travlen_End_Convo;
    }
}

void Choose_Who_To_Kill object#()() // Make Avatar choose who to kill
{
    var target_people = 1;
    while (target_people == 1)
    {
        var target = UI_click_on_item();
        var target_shape = UI_get_item_shape(target[1]);
        
        if (target_shape == 946)
        {
            target_people = 0;
            UI_show_npc_face0(571, 0);
            say("@Avatar, you have chosen poorly...@");
            script AVATAR
            {
				nohalt;
                face EAST;
                actor frame CAST_1;
                wait 2;
                frame CAST_2;
                call Knock_Out_Avatar_Sound;
                wait 1;
                actor frame STAND;
                wait 1;
                call Kill_Travlen;
            }

        }
        else if (target_shape == 392)
        {
            target_people = 0;
            UI_show_npc_face0(215, 0);
            say("@Avatar! You have made a powerful enemy in the next realm this day!@");
            script AVATAR
            {
				nohalt;
                face EAST;
                frame CAST_1;
                wait 2;
                frame CAST_2;
                call Knock_Out_Avatar_Sound;
                wait 1;
                frame STAND;
                wait 1;
                call Kill_Brenda;
            }
        }
        else
        {
            UI_show_npc_face(571, 0);
            say("@You must make a decision Avatar.@");
            
        }
    }


}

void Brenda_Fail_Cast object#()()
{
    var bark = "The energies fail me...";
    script -268
    {
		nohalt;
        actor frame KNEEL;
        wait 2;
        actor frame SWING_1;
        wait 2;
        call Brenda_Fail_Cast_Poof;
        wait 1;
        say bark;
        actor frame STAND;
    }
}

void Travlen_Fail_Cast_Poof object#()()
{
    UI_sprite_effect(9, 1136, 665, 0, 0, 0, -1);
    UI_play_sound_effect(48);
}

void Travlen_Fail_Cast object#()()
{
    var bark = "I shall defend myself witch.";
    script -228
    {
		nohalt;
        say bark;
        face SOUTH;
        actor frame SWING_1;
        wait 2;
        actor frame SWING_2;
        wait 2;
        actor frame SWING_3;
        call Travlen_Fail_Cast_Poof;
        wait 1;
        actor frame STAND;
    }
}

// The end of the entire scripted sequence where Glenlorn teleports in

void Teleport_In_Glenlorn object#()()
{
    UI_move_object(-267, [1126, 671, 0]);
    
    // face east
    UI_set_item_frame_rot(-267, 48);
}

void Glenlorn_Teleport object#()()
{
    UI_sprite_effect(7, 1126, 671, 0, 0, 0, -1);
    UI_play_sound_effect(81);
}

void Remove_Glenlorn object#()()
{
    UI_move_object(-267, [1387, 494, 0]);
}

void Freeze_Glenlorn object#()()
{
    UI_set_item_flag(-267, 16);
}

void UnFreeze_Glenlorn object#()()
{
    UI_clear_item_flag(-267, 16);
}

void Glenlorn_Convo object#()()
{
    gflags[KILL_BRENDA_TRAVLEN_TALK] = false;
    UI_show_npc_face(445, 0);
    say("The cheeky old man from the cave appears before you. @Avatar, know that everything which was to transpire has nearly done so and that you are nearly finished here.@");
    UI_add_answer("Transpire");
    UI_add_answer("Finished");
    
    converse
    {
        if (response == "Transpire")
        {
            say("The man looks at you with a puzzled expression. @I thought that I had made it clear earlier. I am The Seer. I foresaw what was to transpire, and it have done so as I have seen.@");
            UI_remove_answer("Transpire");
            UI_add_answer("Why not warn me?");
        }
        else if (response == "Why not warn me?")
        {
            say("A hearty laugh escapes from the mans mouth. @Things must occur as they would. Besides, would you have believed me if I told you earlier?@");
            UI_remove_answer("Why not warn me?");
        }
        else if (response == "Finished")
        {
            say("@You have created two of the orbs. Now you must recover them so that you may return to your rightful place in the universe so that things may unfold as they must.@");
            say("@Do not fret for I foresee that things will work out as they must.@");
			say("@Oh, and do not fret about focusing the orb as it will not require such a mundane device to function at this time.@");
            break;
        }
        
    }
}


