void You_Freeze object#()()
{
// blank face
UI_show_npc_face(648);
say("You feel your body freeze in place as a wave of cold rushes over you.");
UI_set_item_flag(-140, DONT_MOVE);
UI_set_item_flag(AVATAR, DONT_MOVE);
// This usecode is in functions\encounter functions\lady_vox_encounter_functions.uc
UI_si_path_run_usecode((-140), [744, 186, 0], SCRIPTED, AVATAR, Lady_Vox_Talk_To_Avatar, 0);
}

/*

void path_vox object#()()

    script AVATAR
    {
		nohalt;
		call You_Freeze;
        face SOUTH;
        actor frame STAND;
		wait 5;
		//call Lady_Vox_Talk_To_Avatar;
		
    }
}
*/