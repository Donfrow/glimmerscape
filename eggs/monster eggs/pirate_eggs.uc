void Pirate_Egg object#()()
{

var pirate_count = UI_die_roll(1, 3);

while (pirate_count>0)
{

	var pirate;
	var n = UI_die_roll(1, 3);
	var loc = get_object_position();
	var loc_offsetx = UI_die_roll(1, 3);
	var loc_offsety = UI_die_roll(1, 3);
	
	if(n == 1)
	{
		pirate = UI_create_new_object(458); // pirate
	}
	else if (n == 2)
	{
		pirate = UI_create_new_object(457); // gypsy
	}
	else if (n == 3)
	{
		pirate = UI_create_new_object(1297); // gypsy woman
	}


	pirate->set_alignment(HOSTILE);
	pirate->set_alignment(HOSTILE);
	pirate->set_schedule_type(IN_COMBAT);
	UI_set_opponent(pirate, PARTY);
	UI_update_last_created([loc[1] - loc_offsetx, loc[2] + loc_offsety, 0]);
	
	var equipment = UI_die_roll(1, 2);
	var gold_count = UI_die_roll(14, 45);
	
	var gold = UI_create_new_object(SHAPE_GOLD);
	UI_set_item_quantity(gold, gold_count);
	UI_give_last_created(pirate);
	
	if (equipment == 1)
	{
		var sword = UI_create_new_object(599); // sword
		UI_give_last_created(pirate);
		var shirt = UI_create_new_object(1297);
		UI_give_last_created(pirate);
		var equipment_1 = UI_die_roll(0, 3);
		var pants = UI_create_new_object(1192);
		UI_set_item_frame(pants, equipment_1);
		UI_give_last_created(pirate);

	}
	else if (equipment == 2)
	{
		var dagger = UI_create_new_object(594); // dagger
		UI_give_last_created(pirate);
		var equipment_1 = UI_die_roll(0, 3);
		var pants = UI_create_new_object(1192);
		UI_set_item_frame(pants, equipment_1);
		UI_give_last_created(pirate);
	}

	pirate_count = pirate_count - 1;
}
}



















