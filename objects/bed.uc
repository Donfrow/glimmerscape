void Nap_Time()
{
	donals_bp_charge = 0;
	UI_nap_time(item);
}

void Bed_Horizontal shape#(696)()
{
	if(event == DOUBLECLICK)
	{
		var loc = get_object_position(item);
		bed_x = loc[1];
		bed_y = loc[2];
		bed_z = loc[3];
		UI_si_path_run_usecode(AVATAR, [loc[1]+1, loc[2]-1], loc[3], SCRIPTED, AVATAR, Nap_Time, 1);


	}
}

void Bed_Vertical shape#(1011)()
{
	if(event == DOUBLECLICK)
	{
		var loc = get_object_position(item);
		bed_x = loc[1];
		bed_y = loc[2];
		bed_z = loc[3];
		UI_si_path_run_usecode(AVATAR, [loc[1]-1, loc[2]+1], loc[3], SCRIPTED, AVATAR, Nap_Time, 1);
		UI_nap_time(item);
	}
}

