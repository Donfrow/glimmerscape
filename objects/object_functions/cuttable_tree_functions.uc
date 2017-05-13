void Tree_Fall()
{
            script item
            {
                wait 35;
                repeat 5

                {
                    next frame;
                };
            }
}


void Cut_Down_Tree()
{
    script item
    {
        call FreezeAvatar;
        face WEST;
        wait 2;
        
        repeat 2
        {
        actor frame STAND;
        wait 1;
        actor frame SWING_2H_1;
        wait 1;
        actor frame SWING_2H_2;
        wait 1;
        actor frame SWING_2H_3;
        };
        wait 1;
        actor frame STAND;
        wait 20;
        call UnFreezeAvatar;
    }
}

void Tree_Chunk_1 object#()()
{
	var tree_chunk = UI_create_new_object(1442);
	UI_update_last_created([tree_x, tree_y-8, tree_z]);
}
void Tree_Chunk_2 object#()()
{
	var tree_chunk = UI_create_new_object(1442);
	UI_set_item_frame(tree_chunk, 1);
	UI_update_last_created([tree_x, tree_y-6, tree_z]);
}

void Tree_Chunk_3 object#()()
{
	var tree_chunk = UI_create_new_object(1442);
	UI_set_item_frame(tree_chunk, 2);
	UI_update_last_created([tree_x, tree_y-4, tree_z]);
}
void Tree_Chunk_4 object#()()
{
	var tree_chunk = UI_create_new_object(1442);
	UI_set_item_frame(tree_chunk, 3);
	UI_update_last_created([tree_x-2, tree_y-2, tree_z]);

}

// This section here is to put in the same script sequence as the frame cycles for the tree, it does not appear to work as nicely
void Tree_Chunks object#()()
{
	if(tree_cut == 0)
	{
		var tree_chunk = UI_create_new_object(1442);
		UI_update_last_created([tree_x, tree_y-8, tree_z]);
		tree_cut = 1;
	}
	else if (tree_cut == 1)
	{
		var tree_chunk = UI_create_new_object(1442);
		UI_set_item_frame(tree_chunk, 1);
		UI_update_last_created([tree_x, tree_y-6, tree_z]);
		tree_cut = 2;
	}
	else if (tree_cut == 2)
	{
	var tree_chunk = UI_create_new_object(1442);
	UI_set_item_frame(tree_chunk, 2);
	UI_update_last_created([tree_x, tree_y-4, tree_z]);
	tree_cut = 3;
	}
	else if (tree_cut == 3)
	{
	var tree_chunk = UI_create_new_object(1442);
	UI_set_item_frame(tree_chunk, 3);
	UI_update_last_created([tree_x-2, tree_y-2, tree_z]);
	tree_cut = 0;
	}
	
	
}

void Chopping_Tree object#()()
{

	var cutting_tree = UI_find_nearest(AVATAR, 1441, 10);
	script cutting_tree
	{
		wait 12;
        repeat 4

        {
			next frame;
			//call Tree_Chunks; // This does not appear to work as nicely as calling each individually inthe avatar script sequence
			wait 6;
		};
	}
}

void Chop_Up_Tree()
{
	// Get the loc of the original fallen tree
	var loc = UI_get_object_position(AVATAR);
	//var fallen_tree1 = UI_find_nearby([loc[1], loc[2], loc[3]], 1425, 10, MASK_NONE);
	var fallen_tree1 = UI_find_nearest(AVATAR, 1425, 10);
	var tree_loc = UI_get_object_position(fallen_tree1);
	
	// create the new fallen tree

	var fallen_tree = UI_create_new_object(1441);
	//var cutting_tree = UI_find_nearest(AVATAR, 1441, 10);
	UI_update_last_created([tree_loc[1], tree_loc[2], tree_loc[3]]);
	UI_remove_from_area(1425, 5, [tree_loc[1], tree_loc[2]], [tree_loc[1], tree_loc[2]]);
	
	// set the global variables for the fallen tree
	
	tree_x = tree_loc[1];
	tree_y = tree_loc[2];
	tree_z = tree_loc[3];
	
	script AVATAR
	{
		call Chopping_Tree;
		call FreezeAvatar;
        face WEST;
        wait 2;
        
			actor frame STAND;
			wait 1;
			actor frame SWING_2H_1;
			wait 1;
			actor frame SWING_2H_2;
			wait 1;
			actor frame SWING_2H_3;
			call Tree_Chunk_1;
			
			wait 1;
			actor frame SWING_2H_1;
			wait 1;
			actor frame SWING_2H_2;
			wait 1;
			actor frame SWING_2H_3;
			call Tree_Chunk_2;
			
			wait 1;
			actor frame SWING_2H_1;
			wait 1;
			actor frame SWING_2H_2;
			wait 1;
			actor frame SWING_2H_3;
			call Tree_Chunk_3;

			wait 1;
			actor frame SWING_2H_1;
			wait 1;
			actor frame SWING_2H_2;
			wait 1;
			actor frame SWING_2H_3;
			call Tree_Chunk_4;
		
        wait 1;
        actor frame STAND;
        wait 10;
        call UnFreezeAvatar;

	}
	

	
}
