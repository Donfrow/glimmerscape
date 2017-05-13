void Smuggler_Egg object#()()
{

if(gflags[SMUGGLERS_DEAD])
{
}
else
{
var smuggler_count = UI_die_roll(1, 3);

while (smuggler_count>0)
{

	var smuggler;
	var n = UI_die_roll(1, 4);
	var loc = get_object_position();
	var loc_offsetx = UI_die_roll(1, 3);
	var loc_offsety = UI_die_roll(1, 3);
	
	if(n == 1)
	{
		smuggler = UI_create_new_object(1317); // fellowship member
	}
	else if (n == 2)
	{
		smuggler = UI_create_new_object(451); // blue robe man
	}
	else if (n == 3)
	{
		smuggler = UI_create_new_object(1193); // poor woman
	}
	else if (n == 4)
	{
		smuggler = UI_create_new_object(816); // figher
	}

	smuggler->set_alignment(HOSTILE);
	smuggler->set_alignment(HOSTILE);
	smuggler->set_schedule_type(IN_COMBAT);
	UI_set_opponent(smuggler, PARTY);
	UI_update_last_created([loc[1] - loc_offsetx, loc[2] + loc_offsety, 0]);
	
	var equipment = UI_die_roll(1, 3);
	var gold_count = UI_die_roll(14, 45);
	
	var gold = UI_create_new_object(SHAPE_GOLD);
	UI_set_item_quantity(gold, gold_count);
	UI_give_last_created(smuggler);
	
	if (equipment == 1)
	{
		var sword = UI_create_new_object(599); // sword
		UI_give_last_created(smuggler);
	}
	else if (equipment == 2)
	{
		var morning_star = UI_create_new_object(596); // morning star
		UI_give_last_created(smuggler);
	}
	else if (equipment == 3)
	{
		var dagger = UI_create_new_object(594); // dagger
		UI_give_last_created(smuggler);
	}
	smuggler_count = smuggler_count - 1;
}
}
}



















