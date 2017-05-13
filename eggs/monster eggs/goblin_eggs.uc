void egg_create_male_friendly_goblin_sleep object#()()
{
    var loc = get_object_position();
    var trapper = UI_create_new_object(MALE_GOBLIN_SHAPE);
    trapper->set_alignment(NEUTRAL);
    trapper->set_schedule_type(SLEEP);
    UI_update_last_created([loc[1], loc[2]]);
    UI_set_usecode_fun(trapper, TrapperSleepTalk);
}

void egg_create_male_friendly_goblin_loiter object#()()
{
    var goblin_count = UI_die_roll(1, 3);
    while (goblin_count >0)
    {
        var ran_equip = UI_get_random(2);
        var male_goblin = UI_create_new_object(MALE_GOBLIN_SHAPE); // shape for male goblin
        object_ref = male_goblin;
    	male_goblin->set_alignment(NEUTRAL);
		male_goblin->set_schedule_type(LOITER);
		var loc = get_object_position();
		var loc_offsetx = UI_die_roll(1, 3);
		var loc_offsety = UI_die_roll(1, 3);
		UI_update_last_created([loc[1]-loc_offsetx, loc[2]-loc_offsety, loc[3]]);
		var club = UI_create_new_object(590); // club
		UI_give_last_created(male_goblin); // give the club to the goblin
		var food = UI_create_new_object(377); // food shape		
		var food_frame = UI_die_roll(7, 11); // the meat frames
		var n = UI_die_roll(1, 5); // random number for gold
		UI_set_item_quantity(food, n);
		UI_set_item_frame(food, food_frame);
		UI_give_last_created(male_goblin);
		
		if (ran_equip == 1)
		{
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(male_goblin);
            var leather_legs = UI_create_new_object(574);
            UI_give_last_created(male_goblin);

        }
        else
        {
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(male_goblin);
        }
        UI_set_usecode_fun(male_goblin, Goblin_Friendly_Talk);
		goblin_count = goblin_count - 1; // lower it by 1 so it only runs at max 5 times
    }
}

void egg_create_female_friendly_goblin_loiter object#()()
{
    var goblin_count = UI_die_roll(1, 4);
    while (goblin_count >0)
    {
        var ran_equip = UI_get_random(2);
        var female_goblin = UI_create_new_object(FEMALE_GOBLIN_SHAPE); // shape for female goblin
        object_ref = female_goblin;
    	female_goblin->set_alignment(NEUTRAL);
		female_goblin->set_schedule_type(LOITER);
		var loc = get_object_position();
		var loc_offsetx = UI_die_roll(1, 3);
		var loc_offsety = UI_die_roll(1, 3);
		UI_update_last_created([loc[1]-loc_offsetx, loc[2]-loc_offsety, loc[3]]);
		var club = UI_create_new_object(590); // club
		UI_give_last_created(female_goblin); // give the club to the goblin
		var food = UI_create_new_object(377); // food shape		
		var food_frame = UI_die_roll(7, 11); // the meat frames
		var n = UI_die_roll(1, 5); // random number for gold
		UI_set_item_quantity(food, n);
		UI_set_item_frame(food, food_frame);
		UI_give_last_created(female_goblin);
		
		if (ran_equip == 1)
		{
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(female_goblin);
            var leather_legs = UI_create_new_object(574);
            UI_give_last_created(female_goblin);

        }
        else
        {
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(female_goblin);
        }
        UI_set_usecode_fun(female_goblin, Goblin_Friendly_Talk);
		goblin_count = goblin_count - 1; // lower it by 1 so it only runs at max 5 times
    }
}

void egg_gruplinort_goblins object#()()
{
if(UI_is_dead(-282))
{
}
else
{

    var goblin_count = UI_die_roll(1, 3);
    while (goblin_count >0)
    {
        var ran_equip = UI_get_random(2);
        var male_goblin = UI_create_new_object(MALE_GOBLIN_SHAPE); // shape for male goblin
        object_ref = male_goblin;
    	male_goblin->set_alignment(HOSTILE);
		male_goblin->set_schedule_type(IN_COMBAT);
		var loc = get_object_position();
		var loc_offsetx = UI_die_roll(1, 3);
		var loc_offsety = UI_die_roll(1, 3);
		UI_update_last_created([loc[1]-loc_offsetx, loc[2]-loc_offsety, loc[3]]);
		var club = UI_create_new_object(590); // club
		UI_give_last_created(male_goblin); // give the club to the goblin
		var food = UI_create_new_object(377); // food shape		
		var food_frame = UI_die_roll(7, 11); // the meat frames
		var n = UI_die_roll(1, 5); // random number for gold
		UI_set_item_quantity(food, n);
		UI_set_item_frame(food, food_frame);
		UI_give_last_created(male_goblin);
		
		if (ran_equip == 1)
		{
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(male_goblin);
            var leather_legs = UI_create_new_object(574);
            UI_give_last_created(male_goblin);

        }
        else
        {
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(male_goblin);
        }
		goblin_count = goblin_count - 1; // lower it by 1 so it only runs at max 5 times
    }
}

}











