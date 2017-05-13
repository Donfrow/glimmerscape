// THE MAJORITY OF THE FUNCTIONS FOR THIS ARE IN functions/cambray_destruction_egg_functions. The start (Town_Talking) is at the bottom, and it goes up in sequence

/*

THE FUNCTIONS WHICH ARE CALLED IN SEQUENCE TO INITIATE THE ENTIRE SCENE ARE:

egg_teleport_freeze_cambray
functions/cambray_destruction_egg_functions -> Town_Talking
functions/cambray_destruction_egg_functions -> path_morrison_away
functions/cambray_destruction_egg_functions -> Xander_Break_Door_Path
functions/cambray_destruction_egg_functions -> Xander_Door_Break
functions/cambray_destruction_egg_functions -> Path_Xander_Into_House
functions/cambray_destruction_egg_functions -> Path_Xander_Out
functions/cambray_destruction_egg_functions -> Path_Hydra_And_Tressa
functions/cambray_destruction_egg_functions -> Tressa_convo
functions/cambray_destruction_egg_functions -> Hydra_Kill_Spree_Cont

Functions are in at this point that don't work so it skips right to functions/cambray_destruction/End_Hydra_encounter1

*/

void egg_teleport_freeze_cambray_citizens object#()()
{
if(gflags[HYDRA_HYSTERIA_KILL_EGG])
{
}
else
{
    if(gflags[HYDRA_HYSTERIA])
    {

        UI_set_item_flag(-360, 16); // freeze Morrison
        UI_set_item_flag(-361, 16); // freeze Olivia
        UI_set_item_flag(-362, 16); // freeze Beck
        UI_set_item_flag(-367, 16); // freeze Venessa
        UI_set_item_flag(-368, 16); // freeze Xander
        UI_set_item_flag(-369, 16); // freeze Tobale
        UI_set_item_flag(-370, 16); // freeze Jasper
        UI_set_item_flag(-371, 16); // freeze Loretta
        UI_set_item_flag(-372, 16); // freeze Foucault

        UI_set_item_flag(-94, 16); // freeze Hydra
        UI_set_item_flag(-366, 16); // freeze Tressa
		
        UI_set_item_flag(AVATAR, 16); // freeze AVATAR

        UI_move_object(-360, [2833, 248, 0]); // Morrison
        UI_move_object(-361, [2834, 240, 0]); // Olivia
        UI_move_object(-362, [2850, 251, 0]); // Beck
        UI_move_object(-367, [2837, 252, 0]); // Venessa
        UI_move_object(-368, [2837, 247, 0]); // Xander
        UI_move_object(-369, [2849, 242, 0]); // Tobale
        UI_move_object(-370, [2842, 258, 0]); // Jasper
        UI_move_object(-371, [2838, 259, 0]); // Loretta
        UI_move_object(-372, [2827, 246, 0]); // Foucault
        
        UI_remove_from_area(433, 0, [2828, 244], [2833, 251]); // closed door
        UI_remove_from_area(270, 1, [2828, 244], [2833, 251]); // open door
        
        var locked_door = UI_create_new_object(376);
        UI_set_item_frame(locked_door, 2);
        UI_update_last_created([2831, 249, 0]);

        script -360
        {
            actor frame STAND;
            face WEST;
        }

        script -361
        {
            actor frame STAND;
            face SOUTH;
        }
        
        script -362
        {
            actor frame STAND;
            face WEST;
        }
        
        script -367
        {
            actor frame STAND;
            face WEST;
        }
        
        script -368
        {
            actor frame STAND;
            face WEST;
        }
        
        script -369
        {
            actor frame STAND;
            face WEST;
        }
        
        script -370
        {
            actor frame STAND;
            face NORTH;
        }
        
        script -371
        {
            actor frame STAND;
            face NORTH;
        }
        
        script -372
        {
            actor frame STAND;
            face WEST;
        }
        
        UI_si_path_run_usecode(AVATAR, [2845, 239, 0], SCRIPTED, AVATAR, Town_Talking, 0);
    }
}
}

