// NOTE - THE FUNCTIONS FOR THIS FLOW FROM HERE -> FLUX_CAPACITOR_FUNCTIONS.UC -> HAMMER_TIME_FUNCTIONS.UC WHERE THEY END WITH THE SCRIPTED SEQUENCE (in hammer_time_functions.uc)

void Check_Ring_Equipped() // Check to ensure the ring is being worn
{

	// Check if the ring is being worn
	var ring_left = UI_is_readied(AVATAR, 7, RING, 0);
	var ring_right = UI_is_readied(AVATAR, 6, RING, 0);
	
	if(ring_left || ring_right)
	{
	}
	else
	{
		AVATAR.say("I best start over while wearing the ring.");
        gflags[SOUL_ORB_IN_PLACE1] = false;
        gflags[CHAOS_ORB_IN_PLACE1] = false;
        gflags[TRANSFIG_ORB_IN_PLACE1] = false;
        gflags[PERSUASION_ORB_IN_PLACE1] = false;
        gflags[FOCUS_ORB_IN_PLACE1] = false;
	}

}

void Check_All_In_Place()
{

	if(gflags[SOUL_ORB_IN_PLACE1] && gflags[CHAOS_ORB_IN_PLACE1] && gflags[TRANSFIG_ORB_IN_PLACE1] && gflags[PERSUASION_ORB_IN_PLACE1] && gflags[FOCUS_ORB_IN_PLACE1])
	{
		gflags[ORBS_IN_PLACE] = false; // Set to false just incase I forgot to set it false earlier on
		gflags[ORBS_IN_PLACE1] = true;
		script AVATAR
		{
			say "I must now charge the orb of focus...";
		}
	}
	
}

void egg_orbs_in_place_final object#()()
{

var loc = get_object_position();
var focus_orb = loc->find_nearby(ORB_OF_FOCUS, 0, MASK_NONE);
var soul_orb = loc->find_nearby(ORB_OF_SOULS, 0, MASK_NONE);
var chaos_orb = loc->find_nearby(ORB_OF_CHAOS, 0, MASK_NONE);
var transfig_orb = loc->find_nearby(ORB_OF_TRANSFIGURATION, 0, MASK_NONE);
var persuasion_orb = loc->find_nearby(ORB_OF_PERSUASION, 0, MASK_NONE);

if(gflags[FINAL_ORB_CONSTRUCTION])
{
if(gflags[DEATH_DEAD]) // Kill the eggs if the orb of Infinity is constructed
{
}
else
{
    if(soul_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[SOUL_ORB_IN_PLACE1] = true;
        Check_All_In_Place();
        Check_Ring_Equipped();

    }
    else if (chaos_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[CHAOS_ORB_IN_PLACE1] = true;
		Check_All_In_Place();
		Check_Ring_Equipped();
    }
    else if (transfig_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[TRANSFIG_ORB_IN_PLACE1] = true;
		Check_All_In_Place();
		Check_Ring_Equipped();
    }
    else if (persuasion_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[PERSUASION_ORB_IN_PLACE1] = true;
		Check_All_In_Place();
		Check_Ring_Equipped();
    }
    else if (focus_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[FOCUS_ORB_IN_PLACE1] = true;
        Check_All_In_Place();
        Check_Ring_Equipped();

    }
    else
    {
        UI_play_sound_effect(82);
        AVATAR.say("@It would seem I need to start over.@");
        gflags[SOUL_ORB_IN_PLACE1] = false;
        gflags[CHAOS_ORB_IN_PLACE1] = false;
        gflags[TRANSFIG_ORB_IN_PLACE1] = false;
        gflags[PERSUASION_ORB_IN_PLACE1] = false;
        gflags[FOCUS_ORB_IN_PLACE1] = false;
        gflags[ORBS_IN_PLACE1] = false;
        gflags[FLUX_USED_FINAL] = false; // set to false in the event an orb is removed after using the flux capacitor
    }
    
        //Check_If_All_On();
}    
}

}
