void Nude_Dancer_Click()
{
	if(event == DOUBLECLICK)
	{
		script item
		{
			say "Come and enjoy the show";			
			actor frame LEAN;
			wait 2;
			actor frame KNEEL;
			wait 2;
			actor frame STAND;

		}
	}
}


void egg_create_nude_dancer object#()()
{
    var loc = get_object_position();
    var nude_woman = UI_create_new_object(230); // nude woman
    nude_woman->set_alignment(NEUTRAL);
    nude_woman->set_schedule_type(DANCE);
    UI_update_last_created([loc[1], loc[2], loc[3]]);
    UI_set_usecode_fun(nude_woman, Nude_Dancer_Click);
}