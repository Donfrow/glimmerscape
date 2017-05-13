void Create_Picked_Grapes object#()()
{

var grapes = UI_create_new_object(377);
UI_set_item_frame(grapes, 19);
UI_set_item_quantity(grapes, 1); // not currently working
UI_update_last_created([grape_x+1, grape_y-1, grape_z]);

}


void pick_grapes()

{
	script AVATAR
	
	repeat 2
		
	{
		{	
			face WEST;
			actor frame USE;
			actor frame SWING_1;
			actor frame SWING_3;
			actor frame USE;
			actor frame STAND;
			sfx 111;
			call Create_Picked_Grapes;
		}
	};

}


void grape_vine shape#(685)()
{

if (event == DOUBLECLICK)
{
			var loc = UI_get_object_position(item);
			
			grape_x = loc[1];
			grape_y = loc[2];
			grape_z = loc[3];
			
			UI_si_path_run_usecode(AVATAR, [grape_x+1, grape_y-2, grape_z], SCRIPTED, AVATAR, pick_grapes, 0);
			
			//var offsetx = [0, -1, 1];
            //var offsety = [1, 1, 1];
			
            //gotoObject(grape_vine, offsetx, offsety, 0, pick_grapes, grape_vine, SCRIPTED);
}

}

