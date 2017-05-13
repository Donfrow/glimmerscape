void grave shape#(1466)()
{
if(event == DOUBLECLICK)
{
	var loc = get_object_position();
	var equipped = UI_get_readied(AVATAR, 1); // Get object reference for hand
	var shovel = UI_get_item_shape(equipped);
	
	if(shovel == 625) // Has the shovel equipped
	{
		UI_si_path_run_usecode(AVATAR,[loc[1]-1, loc[2]-4, loc[3]], SCRIPTED, AVATAR, Dig_Grave, 0);
	}
}

}

void grave_undug shape#(1468)()
{
if(event == DOUBLECLICK)
{
	var loc = get_object_position();
	var x = loc[1];
	var y = loc[2];
	UI_remove_item(item);

	if(x == 1639 && y == 1830) // Dewtopia graves
	{

		if(gflags[DUG_GRAVE_1])
		{
		}
		else
		{
			var open_grave = UI_create_new_object(1469); // opened grave
			UI_update_last_created(loc);	
			var jewels = UI_create_new_object(937); // jewelly
			UI_set_item_frame(jewels, 1);
			UI_give_last_created(open_grave);
			gflags[DUG_GRAVE_1] = true;
		}
	}
	else if (x == 1630 && y == 1844) // Dewtopia graves
	{
		if(gflags[DUG_GRAVE_2])
		{
		}
		else
		{
			var open_grave = UI_create_new_object(1469); // opened grave
			UI_update_last_created(loc);	
			UI_create_new_object(666); // magic armor
			UI_give_last_created(open_grave);
			UI_create_new_object(663); // magic sheild
			UI_give_last_created(open_grave);			
			UI_create_new_object(383); // magic helm
			UI_give_last_created(open_grave);
			UI_create_new_object(547); // magic sword
			UI_give_last_created(open_grave);
			gflags[DUG_GRAVE_2] = true;
		}	
	}
	else if (x == 1619 && y == 1830) // Dewtopia graves
	{
		if(gflags[DUG_GRAVE_3])
		{
		}
		else
		{
			var open_grave = UI_create_new_object(1470); // empty grave
			UI_update_last_created(loc);	
			var undead = UI_create_new_object(373);
			UI_set_alignment(undead, HOSTILE);
			UI_set_schedule_type(undead, IN_COMBAT);
			UI_update_last_created(loc);
			var coin = UI_create_new_object(SHAPE_GOLD);
			UI_set_item_quantity(coin, 58);
			UI_give_last_created(undead);
			script undead
			{
				say "Unngh";
			}
			script AVATAR
			{
				say "Look out!";
			}
			gflags[DUG_GRAVE_3] = true;
		}	
	}
	else if (x == 2364 && y == 1706) // Deathscorn graves
	{
		if(gflags[DUG_GRAVE_4])
		{
		}
		else
		{
			var open_grave = UI_create_new_object(1469); // opened grave
			UI_update_last_created(loc);	
			UI_create_new_object(760); // gem
			UI_give_last_created(open_grave);
			UI_create_new_object(760); // gem
			UI_give_last_created(open_grave);
			UI_create_new_object(937); // jewellery
			UI_give_last_created(open_grave);
			gflags[DUG_GRAVE_4] = true;
		}	
	}
	else if (x == 2394 && y == 1692) // Deathscorn graves
	{
		if(gflags[DUG_GRAVE_5])
		{
		}
		else
		{
			var open_grave = UI_create_new_object(1469); // opened grave
			UI_update_last_created(loc);	
			var ring = UI_create_new_object(296); // ring
			UI_set_item_frame(ring, 1);
			UI_give_last_created(open_grave);
			gflags[DUG_GRAVE_5] = true;
		}	
	}
	else if (x == 2394 && y == 1706) // Deathscorn graves
	{
		if(gflags[DUG_GRAVE_6])
		{
		}
		else
		{
			var open_grave = UI_create_new_object(1469); // opened grave
			UI_update_last_created(loc);	
			var ring = UI_create_new_object(836); // antique armor
			UI_give_last_created(open_grave);
			gflags[DUG_GRAVE_6] = true;
		}	
	}
	else if (x == 2239 && y == 2685) // Jillian grave in Hensall
	{
		if(gflags[DUG_GRAVE_7])
		{
		}
		else
		{
			var open_grave = UI_create_new_object(1469); // opened grave
			UI_update_last_created(loc);	
			var ring = UI_create_new_object(836); // antique armor
			UI_give_last_created(open_grave);
			gflags[DUG_GRAVE_7] = true;
		}	
	}
	else
	{
		var open_grave = UI_create_new_object(1469); // opened grave
		UI_update_last_created(loc);	
	}

	UI_create_new_object(1467); // coffin lid
	UI_update_last_created([loc[1]-5, loc[2]-2, loc[3]]);
	UI_play_sound_effect(126);
	
}
}

void grave_lid shape#(1467)()
{
if(event == DOUBLECLICK)
{
	UI_play_sound_effect(126);
	var grave = UI_find_nearest(AVATAR, 1469, 5);
	var loc = get_object_position(grave);
	UI_remove_item(item);
	//UI_remove_item(grave);
	UI_create_new_object(1468);
	UI_update_last_created([loc[1]+5, loc[2]+2, loc[3]]);
	
}
}

