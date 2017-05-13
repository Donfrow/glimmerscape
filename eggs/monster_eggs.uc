void egg_create_pirate object#()()
{
    var piratecount = UI_die_roll(1, 5);

    var lechuck_dead = UI_is_dead(-209);
    if (lechuck_dead)
    {
    }
    else
    {
        while (piratecount >0)
        {
        var ran_equip = UI_get_random(2);
        var pirate = UI_create_new_object(458); // 458 = shape num for pirate
    	pirate->set_alignment(2);
		pirate->set_schedule_type(0);
		UI_update_last_created(get_object_position());
		var dagger = UI_create_new_object(1131); // great dagger
		UI_give_last_created(pirate); // give the dagger to the pirate
		var gold = UI_create_new_object(SHAPE_GOLD); // gold		
		var n = UI_die_roll(12, 45); // random number for gold
		UI_set_item_quantity(gold, n);
		UI_give_last_created(pirate);
		
		if (ran_equip == 1)
		{
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(pirate);
            var leather_legs = UI_create_new_object(574);
            UI_give_last_created(pirate);
        }
        else
        {
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(pirate);
        }
		
		piratecount = piratecount - 1; // lower it by 1 so it only runs at max 5 times
		
		      }
    }

}

void egg_pirate_test object#()()
{

var pirate = UI_create_new_object(458); // 458 = shape num for pirate
pirate->set_alignment(0);
pirate->set_schedule_type(8);
UI_update_last_created(get_object_position());
var npc = pirate;

// UI_set_usecode_fun(pirate, TestingTalk); - TestingTalk has been removed
}

void egg_dark_monk_sit object#()()
{
    var leader_dead = UI_is_dead(-207);
    
    if (leader_dead)
    {
    }
    else
    {
    var count = 1;
        while (count > 0)
        {
        var n = UI_get_random(9);
        var dark_monk = UI_create_new_object(179); // 179 = shape num for dark monk
        dark_monk->set_alignment(2);  //hostile
        dark_monk->set_schedule_type(16); // sit
        UI_update_last_created(get_object_position());
        var body_part = UI_create_new_object(BODY_PARTS);
        UI_set_item_frame(body_part, n);
        UI_give_last_created(dark_monk);
        UI_set_usecode_fun(dark_monk, DarkMonkTalk);
        count = count-1;
        }
    }
}

void egg_dark_monk_sleep object#()()
{
    var leader_dead = UI_is_dead(-207);

    if (leader_dead)
    {
    }
    else
    {
    var count = 1;
        while (count > 0)
        {
        var n = UI_get_random(9);
        var dark_monk = UI_create_new_object(179); // 179 = shape num for dark monk
        dark_monk->set_alignment(2);  // hostile
        dark_monk->set_schedule_type(14); // sleep
        UI_update_last_created(get_object_position());
        var body_part = UI_create_new_object(BODY_PARTS);
        UI_set_item_frame(body_part, n);
        UI_give_last_created(dark_monk);
        UI_set_usecode_fun(dark_monk, DarkMonkTalk);
        count = count-1;
        }
    }
}

void egg_dark_monk_eat object#()()
{
    var leader_dead = UI_is_dead(-207);

    if (leader_dead)
    {
    }
    else
    {
    var count = 2;
        while (count > 0)
        {
        var n = UI_get_random(9);
        var dark_monk = UI_create_new_object(179); // 179 = shape num for dark monk
        dark_monk->set_alignment(2); // hostile
        dark_monk->set_schedule_type(5); // eat
        UI_update_last_created(get_object_position());
        var body_part = UI_create_new_object(BODY_PARTS);
        UI_set_item_frame(body_part, n);
        UI_give_last_created(dark_monk);
        UI_set_usecode_fun(dark_monk, DarkMonkTalk);
        count = count-1;
        }
    }
}

void egg_dark_monk_loiter object#()()
{
    var leader_dead = UI_is_dead(-207);

    if (leader_dead)
    {
    }
    else
    {
    var count = 3;
        while (count > 0)
        {
        var n = UI_get_random(9);
        var dark_monk = UI_create_new_object(179); // 179 = shape num for dark monk
        dark_monk->set_alignment(2); // hostile
        dark_monk->set_schedule_type(11); // loiter
        UI_update_last_created(get_object_position());
        var body_part = UI_create_new_object(BODY_PARTS);
        UI_set_item_frame(body_part, n);
        UI_give_last_created(dark_monk);
        UI_set_usecode_fun(dark_monk, DarkMonkTalk);
        count = count-1;
        }
    }
}

void egg_demon_loiter object#()()
{
    var leader_dead = UI_is_dead(-92);

var count = UI_get_random(4);

while (count > 0)
{
    var demon = UI_create_new_object(883); // shape num for wingless garg
    demon->set_alignment(1); // neutral
    demon->set_schedule_type(12); // wander
    UI_update_last_created(get_object_position());
    UI_set_usecode_fun(demon, DemonTalk);
        if (leader_dead) // If player has killed the demon king
    {
        AttackAvatar();
    }
    count = count-1;
}

}

void egg_spawn_exeter_undead object#()()
{
    var has_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
	var has_orb2 = UI_count_objects(PARTY, 1411, ANY, ANY); // Weakened orb of souls
    var count = UI_get_random(4);
    var loc = get_object_position();
    
    while (count > 0)
    {
        if (has_orb || has_orb2)
        {
        var skeleton = UI_create_new_object(528); // Skeleton
        skeleton->set_alignment(1); // neutral
        skeleton->set_schedule_type(11); // loiter
        UI_update_last_created([loc[1], loc[2]]);
        UI_set_usecode_fun(skeleton, Exeter_Skeleton_Talk);
        }
        else
        {
        var skeleton = UI_create_new_object(528); // Skeleton
        skeleton->set_alignment(2); // hostile
        skeleton->set_schedule_type(IN_COMBAT); // combat
        UI_update_last_created([loc[1], loc[2]]);
        }
        count = count-1;
        loc[1] = loc[1] - 1 + count;
    }
}

void egg_create_karma_begger_E object#()()
{
    var begger_shape = UI_die_roll(1052, 1053); // the 2 begger shapes

        var loc = get_object_position();
        
        var begger = UI_create_new_object(begger_shape); // begger
        begger->set_alignment(1); // neutral
        begger->set_schedule_type(LOITER); // loiter
        UI_update_last_created([loc[1], loc[2]]);
        UI_create_new_object(1407); // beggers pouch
        UI_give_last_created(begger);
        UI_set_usecode_fun(begger, KarmaBeggerTalk);

}

void egg_create_base_bandit object#()()
{

    var leader1 = UI_is_dead((-166)); // female bandit leader
    var leader2 = UI_is_dead((-164)); // male bandit leader

if (leader1 && leader2) // if the bandit leaders are dead
{
}
else
{

    var bandit_count = UI_get_random(3);
    var loc = get_object_position();


    
while (bandit_count > 0)
    {
    var bandit_shape = UI_get_random(2);
    if (bandit_shape == 1)
    {
        var bandit = UI_create_new_object(259); // bandit (ranger)
        bandit->set_alignment(2);
        bandit->set_schedule_type(0);
  		//UI_update_last_created(get_object_position());
  		UI_update_last_created([loc[1]-bandit_count, loc[2]-bandit_count]);
        var ran_equip = UI_get_random(2);
		var gold = UI_create_new_object(SHAPE_GOLD); // gold
		var n = UI_die_roll(12, 45); // random number for gold
		UI_set_item_quantity(gold, n);
		UI_give_last_created(bandit);

		if (ran_equip == 1)
		{
            var poison_dagger = UI_create_new_object(564);
            UI_give_last_created(bandit);
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(bandit);
            var leather_legs = UI_create_new_object(574);
            UI_give_last_created(bandit);

        }
        else
        {
            var sword = UI_create_new_object(599); // sword
            UI_give_last_created(bandit); // give the sword to the bandit
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(bandit);
        }
  		
    }
    else
    {
        var bandit = UI_create_new_object(381); // bandit (fawn guard)
        bandit->set_alignment(2);
        bandit->set_schedule_type(0);
  		UI_update_last_created([loc[1]-bandit_count, loc[2]-bandit_count]);
        var ran_equip = UI_get_random(2);
		var gold = UI_create_new_object(SHAPE_GOLD); // gold
		var n = UI_die_roll(12, 45); // random number for gold
		UI_set_item_quantity(gold, n);
		UI_give_last_created(bandit);

		if (ran_equip == 1)
		{
            var poison_dagger = UI_create_new_object(564);
            UI_give_last_created(bandit);
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(bandit);
            var leather_legs = UI_create_new_object(574);
            UI_give_last_created(bandit);

        }
        else
        {
            var sword = UI_create_new_object(599); // sword
            UI_give_last_created(bandit); // give the sword to the bandit
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(bandit);
        }
    }

bandit_count = bandit_count - 1;

} // end while
} // end if
}

void egg_create_bandit_wench object#()()
{

var leader1 = UI_is_dead(-166); // female bandit leader
var leader2 = UI_is_dead(-164); // male bandit leader

if (leader1 && leader2) // if the bandit leaders are dead
{
}
else
{
    var loc = get_object_position();
    var wench_count = UI_get_random(2);
    
    while(wench_count > 0)
    {
        var wench = UI_create_new_object(742); // wench
        wench->set_alignment(2);
        wench->set_schedule_type(0);
        UI_update_last_created([loc[1]-wench_count, loc[2]-wench_count]);


        var gold = UI_create_new_object(SHAPE_GOLD); // gold
		var n = UI_die_roll(5, 23); // random number for gold
		UI_set_item_quantity(gold, n);
		UI_give_last_created(wench);
        
        wench_count = wench_count - 1;

    }
}
    
}

void egg_create_karma_woman_good object#()()
{
    var loc = get_object_position();
    var woman = UI_create_new_object(1107); // woman
    woman->set_alignment(0);
    woman->set_schedule_type(LOITER);
    UI_update_last_created([loc[1], loc[2], loc[3]]);
    UI_set_usecode_fun(woman, KarmaGoodWomanTalk);
}

void egg_create_trapper_sit object#()()
{
    var loc = get_object_position();
    var hour_time = UI_game_hour();
    if (hour_time > 18 && hour_time < 21)
    {
        var trapper = UI_create_new_object(917); // trapper
        trapper->set_alignment(0); // friendly
        trapper->set_schedule_type(SIT);
        UI_update_last_created([loc[1], loc[2]]);
        UI_set_usecode_fun(trapper, TrapperSitTalk);
    }
}

void egg_create_trapper_sleep object#()()
{
    var loc = get_object_position();
    var trapper = UI_create_new_object(917); // trapper
    trapper->set_alignment(0); // friendly
    trapper->set_schedule_type(SLEEP);
    UI_update_last_created([loc[1], loc[2]]);
    UI_set_usecode_fun(trapper, TrapperSleepTalk);
}

void egg_create_icegoblin object#()()
{
    var icegoblincount = UI_die_roll(1, 5);
    while (icegoblincount >0)
    {
        var ran_equip = UI_get_random(2);
        var icegoblin = UI_create_new_object(1433); // shape for icegoblin
    	icegoblin->set_alignment(2);
		icegoblin->set_schedule_type(0);
		var loc = get_object_position();
		var loc_offsetx = UI_die_roll(1, 3);
		var loc_offsety = UI_die_roll(1, 3);
		UI_update_last_created([loc[1]-loc_offsetx, loc[2]-loc_offsety, loc[3]]);
		var club = UI_create_new_object(590); // club
		UI_give_last_created(icegoblin); // give the club to the pirate
		var food = UI_create_new_object(377); // food shape		
		var food_frame = UI_die_roll(7, 11); // the meat frames
		var n = UI_die_roll(1, 5); // random number for gold
		UI_set_item_quantity(food, n);
		UI_set_item_frame(food, food_frame);
		UI_give_last_created(icegoblin);
		
		if (ran_equip == 1)
		{
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(icegoblin);
            var leather_legs = UI_create_new_object(574);
            UI_give_last_created(icegoblin);
        }
        else
        {
            var leather_armor = UI_create_new_object(569);
            UI_give_last_created(icegoblin);
        }
		
		icegoblincount = icegoblincount - 1; // lower it by 1 so it only runs at max 5 times
    }

}













