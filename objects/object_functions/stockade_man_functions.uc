void UnFreeze_Dewtopia_Prisoner object#()()
{
	UI_clear_item_flag(-382, 16); // Unfreeze the prisoner
}

void Move_Dewtopia_Prisoner object#()()
{
	UI_clear_item_flag(AVATAR, 16); // Unfreeze Avatar
	UI_move_object(-382, [1670, 979, 0]); // Stockade man NPC number
	script -382
	{
		actor frame 19;
		face SOUTH;
		
		wait 2;
		actor frame 16;
	}
}

void Open_Stockades_Dewtopia object#()()
{
	var stockades = UI_find_nearest(AVATAR, 1435, 4);
	script stockades
	{
		frame 3;
		wait 3;
		frame 4;
	}
}

void Poo object#()()
{
	var make_stocks = UI_create_new_object(STOCKS);
	UI_set_item_frame(STOCKS, 5);
	UI_update_last_created([1669, 980, 0]);
}

void Stockade_Man_Exit object#()()
{
	var stockades = UI_find_nearest(AVATAR, 1435, 4);
	UI_remove_item(stockades);
		

	
}

void Stockade_Man_Mini_Convo()
{

UI_push_answers();
UI_add_answer("None of your concern");
UI_add_answer("You are being taken to Brentonia");

converse
{
	if(response == "None of your concern")
	{
		say("@No, I suppose it is not. Though a change of scenery.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
	}
	else if (response == "You are being taken to Brentonia")
	{
		say("@Well, I suppose I will at least be given a farce of a trial there.@");
		UI_remove_answer("None of your concern");
		UI_remove_answer("You are being taken to Brentonia");
		UI_add_answer("Farce trial");
		UI_add_answer("Enough of this");
	}
	else if (response == "Enough of this")
	{
		say("@Of course, I did not expect one such as you to listen to my tale of woe.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
	}
	else if (response == "Farce trial")
	{
		say("@Oh they accuse me of collaborating with the goblins to destroy some new outpost they tried to put up outside the city.@");
		say("@Of course, they are so quick to judge all goblins that they do not even care for the difference for the savage goblins of the west and the more neutral southern goblins.@");
		UI_remove_answer("Farce trial");
		UI_add_answer("Western goblins");
		UI_add_answer("Southern goblins");
	}
	else if (response == "Western goblins")
	{
		say("The man seems happy that you are willing to listen to him. @The goblins of the west are savage brutes who slay and eat children and even their own kind.@");
		say("@They are the goblins which are constantly threatening the lands.@");
		UI_remove_answer("Western goblins");
	}
	else if (response == "Southern goblins")
	{
		say("@There is a tribe of goblins which lives in the mountain range that is to the east of the Noxious Swamp. These goblins generally do not leave their cave and are rather kind and they tend to keep to themselves.@");
		say("The man pauses. @Of course, you must think me mad. But I assure you, it is true. I first came into contact with them after barely escaping a bandit attack.@");
		say("@I was gravely wounded but they actually nursed me back to health.@");
		say("@Despite a language barrier we were able to communicate, although crudely. Eventually I ended up travelling north with several of them, but we were caught in the western goblin attack on the outpost.@");
		say("@Sadly the goblins I was travelling with were slain, but not before the Brentonian guard identified me as a goblin collaborator.@");
		say("@It is because of this that I am wanted by them.@");
		UI_remove_answer("Southern goblins");
	}
}

}

void Stockade_Man_Talk object#()()
{
	UI_set_item_flag(-382, 16); // Freeze the NPC who is in stockades until ready
	UI_show_npc_face(636, 0);
	say("The man looks up at you. @Oh joy. A new tormentor.@");
	UI_add_answer("Tormentor");
	UI_add_answer("You are coming with me");
	UI_add_answer("Lets go");
	converse
		{
			if (response == "Lets go")
			{
				say("@It will be nice to stretch...@");
				UI_add_to_party(-382);
				break;
			}
			else if (response == "Tormentor")
			{
				say("@I really ought to watch my tongue. Does this mean I will get even more torture now?@");
				UI_add_answer("Torture");
				UI_remove_answer("Tormentor");
			}
			else if (response == "Torture")
			{
				say("The man makes an obviously fake smile. @I tend to lean towards the thumb screws myself.@");
				UI_remove_answer("Torture");
			}
			else if (response == "You are coming with me")
			{
				say("@Does this mean I get to see the sun again? Oh joy. Where are we going?@");
				Stockade_Man_Mini_Convo();
				UI_remove_answer("You are coming with me");
				
			}
			
		}

}

void Free_Dewtopian_Stockade_Man()
{
	script AVATAR
	{
		face WEST;
		actor frame STAND;
		wait 3;
		call Stockade_Man_Talk;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
		actor frame STAND;
		wait 1;
		call Open_Stockades_Dewtopia;
		wait 3;
		call Move_Dewtopia_Prisoner;
		wait 3;
		call UnFreeze_Dewtopia_Prisoner;
	}
}



void stockade_man_move()
{
script item

{



    frame 0;
    repeat 32

    {
	wait 8;
        next frame cycle;



    };

    }

}

void stockade_man_look()
{
	script item
	{
		frame 0;
		repeat 1
		{
			wait 3;
			next frame cycle;
		};
	}

}
