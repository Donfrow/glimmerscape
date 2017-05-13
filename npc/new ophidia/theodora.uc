//Theodora, the town bicycle in New Ophidia

void UnFreeze_Avatar_And_Theodora object#()()
{
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	UI_clear_item_flag(AVATAR, NAKED);
	UI_clear_item_flag(-380, DONT_MOVE);
	gflags[HAD_RELATIONS] = true;
}

void Reset_Theodora_Shape object#()()
{
	UI_set_item_shape(-380, 669); // Gwenno shape
	
	targetx = 1219;
	targety = 921;
	targetz = 0;
	
	avatarx = 1222;
	avatary = 920;
	avatarz = 0;
}

void Theodora_Relations3()
{
	UI_set_item_flag(AVATAR, NAKED);
	
	NPC = -380;
	targetx = 1221;
	targety = 920;
	targetz = 1;
	
	avatarx = 1222;
	avatary = 920;
	avatarz = 1;
	
	script AVATAR
	{
		wait 10;
		call Move_Avatar;
		actor frame LIE;
		face WEST;
		wait 7;
		say "Ohh yes";
		wait 4;
		wait 30;
		call Move_Avatar;
		actor frame STAND;
		face SOUTH;
		wait 10;
		say "Err, ahh";
		
	}
	
	script -380
	{
		wait 10;
		say "I cannot wait";
		call Generic_Move_NPC;
		actor frame LIE;
		face WEST;
		wait 2;
		say "Mmmm";
		wait 13;
		say "That was it?";
		wait 10;
		call Reset_Theodora_Shape;
		call Generic_Move_NPC;
		actor frame STAND;
		face SOUTH;
		wait 5;
		say "That was a disappointment";
		call UnFreeze_Avatar_And_Theodora;
		call UnFreeze_All_Party_Members;
	}
}

void Theodora_Relations2()
{
	UI_set_item_shape(-380, 1033);
	UI_set_item_frame_rot(-380, 48);
	UI_si_path_run_usecode(AVATAR,[1222, 920, 0], SCRIPTED, AVATAR, Theodora_Relations3, 0);

}

void Theodora_Relations()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
	UI_set_item_flag(-380, DONT_MOVE); // WOMAN
	UI_si_path_run_usecode(-380,[1219, 921, 0], SCRIPTED, -380, Theodora_Relations2, 0);
}


void Theodora object#(0x57c) ()
	{
	
var bark = "My you look strong";
var bark_intro = "Hail";
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var time = UI_game_hour();

	if(gflags[THEODORA_MEET])
	{
	}
	else
	{
	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "I miss the trapping season");
			else if (n == 2)
				UI_item_say(item, "I cannot wait for trapping season");
			}
		}
	}

if (event == DOUBLECLICK)
{

if(gflags[ACCUSED_THEODORA])
{
bark = "What do you want?";
}
else
{
script AVATAR
{
    actor frame STAND;
    say bark_intro;
    wait 10;
}
    script item
    {
        wait 5;
        say bark;
        wait 8;
        call Theodora, TALK;
    }
    // avatar's script here
    abort;
}
}
else if (event == TALK)
{
    UI_show_npc_face(item);

    UI_add_answer("Name");
    UI_add_answer("Job");
    UI_add_answer("Bye");
	
if(gflags[THEODORA_MEET])
{
	if(gflags[HAD_RELATIONS])
	{
		if(gflags[KILL_THEODORA_EGG])
		{
			UI_add_answer("Mysterious illness");
		}
	}
	else
	{
	UI_add_answer("Meeting");
	}
}

if (UI_get_item_flag(item, MET))
	{
		say("Theodora winks. @I see you cannot stay away from me.@");
		UI_remove_answer("Name");
	}
else
	{
        if(female)
        {
            say("The woman looks at you. @You certainly know how to keep your body voluptuous.@");
        }
        else
        {
            say("The woman looks you up and down. @My, your muscles are certainly rippling.@");
        }


	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
			if(gflags[HAD_RELATIONS])
			{
				say("Theodora eyes you. @Bye.@");
			}
			else
			{
				say("Theodora blows you a kiss as you leave.");
			}
            break;
        }
        else if (response == "Name")
        {
            say("The woman licks her lips. @I am Theodora.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am one of the permanent trappers here in New Ophidia.@");
            UI_remove_answer("Job");
            UI_add_answer("Permanent trapper");
            UI_add_answer("New Ophidia");
        }
        else if (response == "Permanent trapper")
        {
            say("@During the trapping season many trappers come here, but during the off season the main residents are the permanent trappers.@");
            say("The woman runs her finger across her lips. @It can get quite lonely during the off season.@");
            UI_remove_answer("Permanent trapper");
            UI_add_answer("Off season");
            UI_add_answer("Lonely");
        }
        else if (response == "Off season")
        {
            say("@Trapping only happens during certain points in the year so that the beasts can replenish their numbers. If this was not done we could wipe them all out.@");
            UI_remove_answer("Off season");
        }
        else if (response == "Lonely")
        {
			if(gflags[ACCUSED_THEODORA])
			{
				say("@After your performance and accusations you should be glad you are even still allowed to talk to me.@");
				UI_add_answer("Accusations");
			}
			else
			{
				say("A finger caresses your cheek. @Being one of the few females who ever visit this settlement I have the selection of whom I wish to bed.@");
				say("@It is quite buffet during the trapping season but at other times the buffet can be quite... limited.@");
				UI_add_answer("Buffet");
			}
			UI_remove_answer("Lonely");

        }
        else if (response == "Buffet")
        {

			say("Theodora looks into your eyes. @Many men and women stay here during the trapping season who are more than willing to fulfill my hunger.@");
			UI_add_answer("Men and women");
            UI_remove_answer("Buffet");
        }
        else if (response == "Men and women")
        {
            if(female)
            {
                say("A hand caresses your bosom. @Men can be quite fun but only women can satisfy certain hungers.@");
            }
            else
            {
                say("A hand runs across your thigh. @Women can feed my hunger but nothing beats a strong man.@");
            }
            UI_remove_answer("Men and women");
            UI_add_answer("Me");
        }
        else if (response == "Me")
        {
			if(gflags[HAD_RELATIONS])
			{
				say("Theodora's expression quickly changes. @While your body may look exquisite your skills are nothing but a disappointment.@");
			}
			else
			{
            // CODE HERE FOR GETTING STD AND LOWERING INT
			say("@You let off such an aura of desire... it is so strong... so... irresistable.@");
			say("Theodora winks at you. @Meet me at my home between midnight and 3 in the morning if you are interested in seeing how much of an aura you possess.@");
			gflags[THEODORA_MEET] = true;
			}
            UI_remove_answer("Me");
        }
        else if (response == "New Ophidia")
        {
            say("@This settlement is the closest settlement to the ruins of the Ophidian Empire so people naturally call it New Ophidia.@");
            UI_remove_answer("New Ophidia");
        }
		else if (response == "Meeting")
		{
			if(time <= 3)
			{
				say("Theodora looks at you and licks her lips. @I have been waiting for a taste of you since I first set eyes upon you. Come over to my bed.@");
				Theodora_Relations();
				//Freeze_All_Party_Members_NonScript();
				break;
			}
			else
			{
				say("You can tell that the woman cannot wait to be with you. @I desire you so but now is not the time.@");
			}
		
		}
		else if (response == "Mysterious illness")
		{
			say("Theodora glares at you. @I have no idea what you are talking about. Do not accuse me of such things.@");
			gflags[ACCUSED_THEODORA] = true;
			break;
		}
		else if (response == "Accusations")
		{
			say("Theodora scowls. @Do not play dumb with me. You tried to blame your mystery illness on me, even after I had the pity to bed you.@");
			say("@Just speaking about it boils my blood. Leave me alone.@");
			break;
		}
        

    }

}
		
UI_remove_npc_face(item);	
}

