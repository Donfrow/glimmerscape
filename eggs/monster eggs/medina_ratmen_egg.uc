void Medina_Ratman_Convo_Ratticus_Dead()
{
	var face_frame = UI_die_roll(0, 2);
	UI_show_npc_face(642, face_frame);
	say("@Leader Ratticus is slain. Please do not harm the rest of us!@");
}

void Medina_Ratman_Convo()
{

	var face_frame = UI_die_roll(0, 2);
	var random_convo = UI_get_random(3);
	UI_show_npc_face(642, face_frame);
	if(event == DOUBLECLICK)
	{
	if(random_convo == 1)
	{
		say("The creature appears to be quite timid. @Speak with Ratticus if you desire but please do us no harm.@");
	}
	else if (random_convo == 2)
	{
		say("The creature looks at you sheepishly. @Ratticus can speak with you. He is our leader.@");
	}
	else if (random_convo == 3)
	{
		say("@Ratticus will speak on our behalf. I cannot.@");
	}
	}

}


void egg_medina_ratmen object#()()
{
    var ratticus_dead = UI_is_dead(-200);

    var count = 1;
        while (count > 0)
        {
        var ratman = UI_create_new_object(382); // ratman shape
        ratman->set_alignment(NEUTRAL);
        ratman->set_schedule_type(LOITER);
        UI_update_last_created(get_object_position());
        var gem = UI_create_new_object(760); // Gem shape
		var gem_frame = UI_die_roll(0, 11);
        UI_set_item_frame(gem, gem_frame);
        UI_give_last_created(ratman);

		if (ratticus_dead)
		{
			UI_set_usecode_fun(ratman, Medina_Ratman_Convo_Ratticus_Dead);
		}
		else
		{
			UI_set_usecode_fun(ratman, Medina_Ratman_Convo);
		}
		
        count = count-1;
        }

}






