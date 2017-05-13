void Homeless_Click()
{
	if(event == DOUBLECLICK)
	{

	var homeless_click = UI_get_random(4);
	if(homeless_click == 1)
	{
		script item
		{
			say "Leave me be";			
		}
	}
	else if (homeless_click == 2)
	{
		script item
		{
			say "Got any spare change, man?";			
		}
	}
	else if (homeless_click == 3)
	{
		script item
		{
			say "Leave me to my sorrows";			
		}
	}
	else if (homeless_click == 4)
	{
		script item
		{
			say "I do not need your pity";			
		}
	}	

	}
}


void egg_brentonia_homeless_sleep object#()()
{
    var loc = get_object_position();
	var shape = UI_get_random(3);
	var homeless;
	if(shape == 1)
	{
		homeless = UI_create_new_object(446); // ugly woman
	}
	else if(shape == 2)
	{
		homeless = UI_create_new_object(815); // boydon shape
	}
	else if (shape == 3)
	{
		homeless = UI_create_new_object(1166); // ugly man
	}

    homeless->set_alignment(NEUTRAL);
    homeless->set_schedule_type(SLEEP);
    UI_update_last_created([loc[1], loc[2], loc[3]]);
    UI_set_usecode_fun(homeless, Homeless_Click);
	
	// GIVE RANDOM PIECE OF GARBAGE
	var garbage_frame = UI_get_random(20);
	var garbage = UI_create_new_object(415); // garbage
	UI_set_item_frame(garbage, garbage_frame);
	UI_give_last_created(homeless);
}

void egg_brentonia_homeless_loiter object#()()
{
    var loc = get_object_position();
	var shape = UI_get_random(3);
	var homeless;
	if(shape == 1)
	{
		homeless = UI_create_new_object(446); // ugly woman
	}
	else if(shape == 2)
	{
		homeless = UI_create_new_object(815); // boydon shape
	}
	else if (shape == 3)
	{
		homeless = UI_create_new_object(1166); // ugly man
	}

    homeless->set_alignment(NEUTRAL);
    homeless->set_schedule_type(LOITER);
    UI_update_last_created([loc[1], loc[2], loc[3]]);
    UI_set_usecode_fun(homeless, Homeless_Click);
	
	// GIVE RANDOM PIECE OF GARBAGE
	var garbage_frame = UI_get_random(20);
	var garbage = UI_create_new_object(415); // garbage
	UI_set_item_frame(garbage, garbage_frame);
	UI_give_last_created(homeless);
	
}