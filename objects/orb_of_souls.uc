void Remove_High_Priest object#()() // Remove priest from area and place in coffin
{
var coffin = UI_find_nearest(AVATAR, 1498, 8);
UI_set_item_frame(coffin, 2);
UI_move_object(-88, [1883, 915, 0]);
UI_play_sound_effect(126);

}

void Close_High_Priest_Coffin object#()()
{
var coffin = UI_find_nearest(AVATAR, 1498, 8);
UI_set_item_frame(coffin, 0);
}

void Mummy_Give_Name()
{
UI_push_answers();
converse(["I demand your name", "Say nothing"])
{

	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "I demand your name" (remove):
	say("He stares at you for a few moments, as if judging you. @You are not one of us. You are not an Ophidian. You have no idea who I am.@");
	remove(["Say nothing"]);
	add(["Hence why I ask"]);
	
	case "Hence why I ask" (remove):
	say("The mummy looks around the room with a sad expression as he sees the debris and rubble. @It... it has been so long. Is this how the tomb of Bakenkhons was meant to be?@");
	UI_set_item_flag(-88, MET);
	UI_clear_answers();
	UI_pop_answers();
	break;	
	
}

}

void High_Priest_Convo object#()()
{

UI_show_npc_face(267);
say("A well kept corpse stands before you. As it begins to speak dust shoots out its mouth. @Who... what...?@");

if(UI_get_item_flag(-88, MET))
{
}
else
{
add(["Name"]);
}

converse(["Job", "Bye"])
{
	case "Bye" (remove):
	say("The mummy looks at you before returning to the coffin and speaks one last time. @Your transgressions are... noted.@");
	
	script -88
	{
		nohalt;
		face WEST;
		wait 2;
		actor frame KNEEL;
		wait 3;
		call Remove_High_Priest;
		wait 3;
		call Close_High_Priest_Coffin;
		wait 4;
		call UnFreezeAvatar;
		
	}
	break;
	
	case "Name" (remove):
	say("@Who? What? How can one not know... how long has it been? Far too long...@");
	Mummy_Give_Name();
	
	case "Job" (remove):
	say("He tilts his head slightly as he stares at you. @I am... was... a High Priest of the Ophidians. What has become of us? Oh the pain.@");
	add(["High Priest", "Ophidians", "Become"]);
	
	case "High Priest" (remove):
	say("@I am... was... the spiritual leader of my people. One of many great men whom was bestowed the honour. Yet... it seems... it seems it was all for naught.@");
	
	case "Become" (remove):
	say("@Our great tombs, the home of the finest Ophidians, are in shambles. This should not be. No, the empire must not have survived the dark days.@");
	add(["Dark days"]);
	
	case "Dark days" (remove):
	say("@Much confusion and chaos in the those days. So much bloodshed. So much fighting. Yet... I was given a proper burial... surely something remains of the empire?@");
	add(["Burial"]);
	
	case "Burial" (remove):
	say("@This tomb... my tomb... so much effort has been put into it. Surely if the empire did not survive those dark days I would not have this tomb?@");
	say("Suddenly the creature looks terrified as he again notices the condition of the tomb. @Yet if the empire still lives it would not be in the condition it is in...@");
	
	case "Ophidians" (remove):
	say("@A great empire... a great people. My great people... how could it collapse? How...@");
	RandomPartySay("@It is difficult to imagine what the Ophidian empire was like when this man was still alive when today we see nothing but ruins and rubble.@");
	//if (gflags[HAS_ALL_ORBS])
	//{
		add(["Where is Akakothen"]);
	//}
	
	case "Where is Akakothen" (remove):
    say("@Akakothen the MageLord? Was he the last ruler of my people? He must have weakened the empire... weakened it to collapse.@");
	add(["Collapse", "Where does he lie"]);
	
	case "Collapse" (remove):
	say("@So much fighting and bloodshed. Why could the empire not recover after his death? He must... he must have weakend the empire so.@");

	case "Where does he lie" (remove):
	say("@Much confusion in those chaotic days... proper burial rites were not preformed on the MageLord. I do not know what became of him. Oh I have failed in my duties.@");
	say("The creature stares at you blankly for a few moments. @Perhaps... perhaps one of his servants knows of his resting place... so loyal they all were...@");
	add(["Servants"]);

	case "Servants" (remove):
	say("@Many servents of Akakothen. Many died in the fighting. Many buried in rubble never to be found.@");
	say("The mummy seems to cough out dust. @I... I sense one roams these tombs... seek him out...@");
	gflags[TALK_TO_SERVANT] = true;

}

}

void Set_Empty_Coffin object#()()
{
var coffin = UI_find_nearest(AVATAR, 1498, 8);
UI_set_item_frame(coffin, 1);
UI_move_object(-88, [711, 2607, 1]);
UI_play_sound_effect(126);
UI_play_music(55);
}

void Awaken_High_Priest()
{
	targetx = 707;
	targety = 2605;
	
	UI_play_sound_effect(4);
	script -88
	{
		nohalt;
		call Death_Vortex;
		call High_Squeel;
		wait 10;
		call Set_Empty_Coffin;
		face EAST;
		actor frame KNEEL;
		say "uungh";
		wait 5;
		actor frame STAND;
		wait 10;
		call High_Priest_Convo;
		
		
	}
}

void orb_of_souls shape#(1378)()
{
    if (event == DOUBLECLICK)
    {
        var target = UI_click_on_item();
        var shape = UI_get_item_shape(target[1]);
        var frame = UI_get_item_frame(target[1]);
		
		var name = UI_get_npc_name(shape);
		
        if (shape == 1389 && frame == 1 && gflags[RESTORED_SOUL_ORB])
        {

            UI_clear_item_flag(-159, 29); // turn off tournament mode
            UI_play_music(64);
            UI_move_object(-159, [2246, 1318, 0]); // move morgrhim to the altar
            UI_set_item_frame_rot(-159, 12);
            UI_set_item_flag(-159, 16);
            
            script item
            {
            call teleport_circle;
            wait 15;
            call morghrim_death_convo;
            wait 1;
            call morghrim_death;
            
            }

        }
		else if (shape == 1498)
		{
			var frame = UI_get_item_frame(target[1]);
			UI_close_gumps();
			if(frame == 2)
			{
				if(UI_is_dest_reachable(AVATAR, [716, 2606])) // Can Avatar reach the area infront of the coffin
				{
					UI_set_item_flag(AVATAR, DONT_MOVE);
					UI_si_path_run_usecode(AVATAR, [716, 2607], SCRIPTED, AVATAR, Awaken_High_Priest, 0); // Sequence to awaken the high priest
				}
				else
				{
				}
			}
		}

        else
        {
            UI_sprite_effect(9, target[2], target[3], 0, 0, 0, -1);
        }
    }
}

