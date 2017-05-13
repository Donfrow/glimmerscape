void Create_Milk_Can object#()()
{
	var loc = get_object_position(AVATAR);
	UI_create_new_object(MILK_CANISTER);
	UI_update_last_created([loc[1]+1, loc[2], loc[3]]);
}

void Milk_Cow()
{
var loc = get_object_position(AVATAR);
var Cow = UI_find_nearby(loc, 500, 5, MASK_NONE);
UI_set_item_flag(Cow, MILKED);
	script Cow
	{
		nohalt;
		//face WEST;
		wait 5;
		say "Moooooo";
		wait 10;
		call Generic_UnFreeze_Scripted;
	}
	script AVATAR
	{
		nohalt;
		call FreezeAvatar;
		face NORTH;
		actor frame KNEEL;
		wait 10;
		call Create_Milk_Can;
		actor frame STAND;
		call UnFreezeAvatar;
	}
	UI_remove_party_items(1, 863, 0, 2);
}

void Cow shape#(500)()
{
	if (event == PROXIMITY)
	{
		item_say("Moooo");
	}
	else if(event == DOUBLECLICK)
	{
		var milk_can = UI_count_objects(AVATAR, 863, ANY, 2); // Milk can shape
		if (milk_can > 0)
		{
			if(UI_get_item_flag(item, MILKED))
			{
				AVATAR.say("@I have already milked this cow.@");
			}
			else
			{
				UI_close_gumps();
				Generic_Freeze();
				var loc = get_object_position();
				var locx = loc[1];
				var locy = loc[2];
				var locz = loc[3];
				UI_si_path_run_usecode(AVATAR, [locx-1, locy+1, locz], SCRIPTED, AVATAR, Milk_Cow, 0);
				UI_set_path_failure(Generic_UnFreeze, item, SCRIPTED);
			
				script item
				{
					face WEST;
				}
			}
		}
		else
		{
			AVATAR.say("@I need a milk canister if I wish to milk this cow.@");
		}
	}
}