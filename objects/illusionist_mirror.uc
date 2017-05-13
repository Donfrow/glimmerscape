void illusionist_mirror shape#(1444)()
{


if(event == DOUBLECLICK)
{

	var frame = get_item_frame();
	if(frame == 4)
	{
		var partyx = 1501;
		var partyy = 1063;
		var partyz = 0;
		Move_Party_NonScript(partyx, partyy, partyz);
	}
	else
	{
		var monster = UI_create_new_object(1170); // ethereal monster shape
		UI_update_last_created([1519, 1014, 0]);
		    	monster->set_alignment(HOSTILE);
		monster->set_schedule_type(IN_COMBAT);
		UI_set_opponent(monster, AVATAR);
	}
}


}
