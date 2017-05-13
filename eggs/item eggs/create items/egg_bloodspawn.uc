void egg_bloodspawn object#()()
{
var chance_to_spawn = UI_get_random(100);
var loc = get_object_position(item);


if(chance_to_spawn < 30)
{
}
else 
{

var bloodspawn = UI_create_new_object(842); // reagent
UI_set_item_frame(bloodspawn, 8); // bloodspawn frame

var quantity = UI_get_random(10);

var imp_spawn = UI_get_random(100);

if(imp_spawn <= 40) // Zero imp spawn count
{

	UI_set_item_quantity(bloodspawn, quantity);
	UI_update_last_created(loc);
}
else if (imp_spawn >= 41 && imp_spawn <= 80)
{

	UI_set_item_quantity(bloodspawn, quantity);
	UI_update_last_created(loc);

	var imp_quantity = UI_get_random(5); // Medium imp spawn count
	while (imp_quantity > 0)
	{
		var imp = UI_create_new_object(1103);
		UI_set_alignment(imp, HOSTILE);
		UI_set_schedule_type(imp, IN_COMBAT);
		UI_set_opponent(imp, PARTY);
		UI_update_last_created(loc);
		imp_quantity = imp_quantity - 1;
	}

}

else if (imp_spawn >= 81) // Large imp spawn count
{

	UI_set_item_quantity(bloodspawn, quantity);
	UI_update_last_created(loc);
	
	var imp_quantity = UI_get_random(10);
	
	while (imp_quantity > 0)
	{
		var imp = UI_create_new_object(1103);
		UI_set_alignment(imp, HOSTILE);
		UI_set_schedule_type(imp, IN_COMBAT);
		UI_set_opponent(imp, PARTY);
		UI_update_last_created(loc);
		imp_quantity = imp_quantity - 1;
	}
}




}

}