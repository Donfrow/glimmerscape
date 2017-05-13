void war_test object#()()
{

var loc = get_object_position();

var dewtopia_fighter = UI_create_new_object(464);
UI_set_alignment(dewtopia_fighter, FRIENDLY);
UI_set_schedule_type(dewtopia_fighter, IN_COMBAT);
UI_update_last_created(loc);

}

void war_test2 object#()()
{

var loc = get_object_position();

var brentonia_fighter = UI_create_new_object(565);
UI_set_alignment(brentonia_fighter, HOSTILE);
UI_set_schedule_type(brentonia_fighter, IN_COMBAT);
UI_update_last_created(loc);

}