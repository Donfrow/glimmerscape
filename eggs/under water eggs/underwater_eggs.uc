void underwater_plant_egg object#()()
{

	var loc = get_object_position();
	
	//Random for plant type	
	var plant_type = UI_get_random(6);
	if(plant_type == 1)
	{
		var plant = UI_create_new_object(1503);
		UI_set_item_frame(plant, 0);
		UI_update_last_created(loc);
	}
	else if (plant_type == 2)
	{
		var plant = UI_create_new_object(1504);
		UI_set_item_frame(plant, 0);
		UI_update_last_created(loc);
	}
	else if (plant_type == 3)
	{
		var plant = UI_create_new_object(1505);
		UI_set_item_frame(plant, 0);
		UI_update_last_created(loc);
	}
	else // 4-6 spawn no plant
	{
	}

}

void underwater_rock_egg object#()()
{

	var loc = get_object_position();
	
	var spawn_rock = UI_get_random(10);
	
	if(spawn_rock <= 5)
	{
	var rock_frame = UI_die_roll(0, 20);
	var rock = UI_create_new_object(203);
	UI_set_item_frame(rock, rock_frame);
	UI_update_last_created(loc);
	}
	else
	{
		// Spawn no rocks
	}
	


}

void undersea_chest_egg object#()()
{

	var chest_chance = UI_die_roll(0, 100);
	
	if(chest_chance <= 25)
	{
		var loc = get_object_position();
		var chest = UI_create_new_object(1506); // Undersea chest
		
		var chest_frame = UI_die_roll(1, 2);
		UI_set_item_frame(chest, chest_frame);
		
		UI_update_last_created(loc);
		
		var chest_contents = UI_die_roll(0, 100);
		
		if(chest_contents <= 25) // Magic armor set
		{
			var magic_chest = UI_create_new_object(666);
			UI_give_last_created(chest);

			var magic_legs = UI_create_new_object(686);
			UI_give_last_created(chest);
			
			var magic_helm = UI_create_new_object(383);
			UI_give_last_created(chest);
			
			var magic_gauntlets = UI_create_new_object(835);
			UI_give_last_created(chest);
			
			var magic_boots = UI_create_new_object(587);
			UI_set_item_frame(magic_boots, 1);
			UI_give_last_created(chest);
			
			var magic_shield = UI_create_new_object(663);
			UI_give_last_created(chest);
			
			var magic_sword = UI_create_new_object(547);
			UI_give_last_created(chest);

		}
		else if (chest_contents >= 75 && chest_contents <= 99)
		{
			var gold_bar_count = UI_die_roll(3, 8);
			while(gold_bar_count > 0)
			{
				UI_create_new_object(646); // Gold bars
				UI_give_last_created(chest);
				gold_bar_count = gold_bar_count - 1;
			}
		
		}
		else if (chest_contents > 25 && chest_contents < 75)
		{
			var coins = UI_create_new_object(SHAPE_GOLD);
			var coin_amount = UI_die_roll(50, 125);
			UI_set_item_quantity(coins, coin_amount);
			UI_give_last_created(chest);
		}
		else if (chest_contents == 100)
		{
			var glass_sword_count = UI_die_roll(1, 3);
			while(glass_sword_count > 0);
			{
				UI_create_new_object(604); // Glass sword
				UI_give_last_created(chest);
				glass_sword_count = glass_sword_count - 1;
			}
		}
	}
	else
	{
		// Do nothing
	}

}

void temp_undersea_cleanup_egg object#()()
{

var frame1 = 3;
while(frame1 > -1)
{
	UI_remove_from_area(1503, frame1, [1809, 561], [1911, 680]);
	frame1 = frame1-1;
}

var frame2 = 2;

while(frame2 > -1)
{
	UI_remove_from_area(1504, frame2, [1809, 561], [1911, 680]); // plants
	UI_remove_from_area(1505, frame2, [1809, 561], [1911, 680]); // plants
	UI_remove_from_area(1506, frame2, [1809, 561], [1911, 680]); // undersea chest
	frame2 = frame2-1;
}

var frame3 = 20;
while(frame3 > -1)
{
	UI_remove_from_area(203, frame3, [1809, 561], [1911, 680]);

	frame3 = frame3-1;
}

}


/**

NOTE TO ME - FEB 2017

I have commented out any shape changing to the dive suit shape. For some reason this is crashing the game, there were some errors about frame numb 2 >= 2 but the dive suit has all frames

Not sure why it's crashing but it's definitely related to changing the Avatar's shape. As such I've left it out rather than leave it broken as it's only cosmetic.

**/

void avatarDiveSuitFrame0 object#()()
{
	UI_set_item_frame(AVATAR, 0);
}

void avatarDiveSuitShape object#()()
{
	//UI_set_item_shape(AVATAR, 1502);
	//UI_set_item_frame(AVATAR, 0);
}

void avatar_dive_suit_egg()
{
	//UI_set_item_shape(AVATAR, 1502);
	//UI_set_item_frame(AVATAR, 0);
	
/**

	script item
	{
		wait 1;
		call avatarDiveSuitFrame0;
		wait 1;
		call avatarDiveSuitShape;
	}
	
**/
}





void underWaterAvatarWalkBack()
{
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	script AVATAR
	{
		call avatarDiveSuitFrame0;
		wait 1;
		call avatarDiveSuitShape;
	}
}

void avatarUnderWaterShipWalk object#()()
{
		AVATAR->si_path_run_usecode([1857, 611], 2, AVATAR, underWaterAvatarWalkBack, true);
}

void avatarUnderWaterStop object#()()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);	
}

void underWaterWanderingStop()
{
	var avatarLocation = AVATAR->get_object_position();
	var avatarLocationX = avatarLocation[1];
	var avatarLocationY = avatarLocation[2];
	
	UI_set_item_flag(AVATAR, DONT_MOVE);
	
	// The non-ship wreck site
	if(avatarLocationX >= 1777 && avatarLocationX <= 1952 && avatarLocationY >= 530 && avatarLocationY <= 716)
	{
		AVATAR->si_path_run_usecode([1872, 611], 2, AVATAR, underWaterAvatarWalkBack, true);
		script AVATAR
		{
			say "I must stay close to the ship.";
			call avatarDiveSuitFrame0;
			wait 1;
			call avatarDiveSuitShape;
		}
	}
	else
	{
		AVATAR->si_path_run_usecode([1827, 877], 2, AVATAR, underWaterAvatarWalkBack, true);
		script AVATAR
		{
			say "I must stay close to the ship.";
			call avatarDiveSuitFrame0;
			wait 1;
			call avatarDiveSuitShape;
		}
	}


}















