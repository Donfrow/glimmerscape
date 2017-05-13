void All_In_Place01 ()
{

if (gflags[ALL_IN_PLACE])
{
    if (gflags[STOP_ORB_FLAGS])
    {
    }
    else
    {

    UI_show_npc_face(329, 0);
    say("@I will now repeat the words of power to bring the magical energy we require to construct the orb.@");
    say("Oompa Loompa Doobadee Doo");
    UI_sprite_effect(LIGHTNING, 2351, 1416, 0, 0, 0, 15);
    UI_sprite_effect(LIGHTNING, 2360, 1408, 0, 0, 0, 10);
    say("@It is time to reconstruct the orb! Take the hammer to the Orb of Focus and crack it to unleash the energy!@");
    }
    
gflags[STOP_ORB_FLAGS] = true;
}

}


void Zorphos_Bubbles object#()()
{
    UI_sprite_effect(7, 2360, 1409, 0, 0, 0, -1);
    UI_play_sound_effect(81);
    UI_set_item_flag(-27, 16); // Freeze Zorphos
    UI_set_item_frame_rot(-27, 16);
}

void Zorphos_Convo object#()()
{
    UI_show_npc_face(329, 0);
    say("@Well done! The creation can be soon! Start the process by using the flux capacitor on the Orb of Focus.@");
	// Go to the objects/flux_capacitor_functions.uc
}

void Check_If_All_On()
{

var bark = "Charge the orb!";

if(gflags[SOUL_ORB_IN_PLACE] && gflags[CHAOS_ORB_IN_PLACE] && gflags[TRANSFIG_ORB_IN_PLACE] && gflags[PERSUASION_ORB_IN_PLACE] && gflags[FOCUS_ORB_IN_PLACE])
{
    gflags[ORBS_IN_PLACE] = true;
    UI_move_object(-27, [2360, 1409, 0]);
	UI_set_item_flag(-27, DONT_MOVE);
    UI_play_music(65);
    
    script -27 // Zorphos NPC number
    {
		nohalt;
        face SOUTH;
        frame STAND;
        call Zorphos_Bubbles;
		call Teleport_In_Sound;
        wait 15;
        call Zorphos_Convo;
        say bark;
    }
}

}
