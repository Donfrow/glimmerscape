void Create_Butter_From_Churn object#()()
{

	UI_remove_party_items(1, MILK_CANISTER, ANY, ANY);
	UI_add_party_items(1, 863, ANY, 2); // Milk can shape

	var loc = get_object_position(AVATAR);
	var butter = UI_create_new_object(377);
	UI_set_item_frame(butter, 377);
	UI_update_last_created([loc[1]-2, loc[2]+1, loc[3]]);
	
	var butter1 = UI_create_new_object(377);
	UI_set_item_frame(butter1, 377);
	UI_update_last_created([loc[1]-1, loc[2]+1, loc[3]]);

	var butter2 = UI_create_new_object(377);
	UI_set_item_frame(butter2, 377);
	UI_update_last_created([loc[1], loc[2]+1, loc[3]]);
	
}

void Churn_Animation_Down object#()()
{
	var loc = get_object_position(AVATAR);
	var churn = UI_find_nearby(loc, 1482, 5, MASK_NONE);
	UI_set_item_frame(churn, 1);
}

void Churn_Animation_Up object#()()
{
	var loc = get_object_position(AVATAR);
	var churn = UI_find_nearby(loc, 1482, 5, MASK_NONE);
	UI_set_item_frame(churn, 0);
}

void Churn_Butter()
{
	script AVATAR
	{
		nohalt;
		call FreezeAvatar;
		face WEST;
		repeat 6
		{
			actor frame KNEEL;
			call Churn_Animation_Down;
			call Light_Thud;
			wait 1;
			actor frame STAND;
			call Churn_Animation_Up;
			wait 1;
		};
		call Create_Butter_From_Churn;
		wait 1;
		call UnFreezeAvatar;

	}
}


void butter_churn shape#(1482) ()
{
    if (event == DOUBLECLICK)
    {
        var milk = UI_count_objects(AVATAR, MILK_CANISTER, ANY, ANY);
		var loc = get_object_position(item);
		if (milk > 0)
		{
			UI_si_path_run_usecode(AVATAR, [loc[1]+1, loc[2], loc[3]], SCRIPTED, AVATAR, Churn_Butter, 0);
		}
		else
		{
			AVATAR.say("@If I had some milk I could make butter.@");
		}
    }
}

