void Fall_To_Vox_Lair()
{
    if(gflags[VOX_DEBRIS_HOLE])
    {
        UI_move_object(PARTY, [734, 186, 0]);
    }
}

void Exit_Vox_Lair()
{

        UI_move_object(PARTY, [1294, 679, 0]);

}

void Ice_Cave_Exit()
{
    UI_earthquake(15);
    var ice_hole = UI_create_new_object(1400); // tile on the ground
    UI_set_item_frame(ice_hole, 19);
    UI_update_last_created([1311, 687, 0]);
    gflags[VOX_DEBRIS_HOLE] = true;
}

void Lady_Vox_Talk_To_Avatar object#()()
{
    UI_show_npc_face(635);
    say("@More humans in my lair... your kind has been quite intrusive as of late. Delicious though.@");
    UI_add_answer("Name");
    UI_add_answer("More humans");
    UI_add_answer("Lair");
    UI_add_answer("Delicious");
    UI_add_answer("Prepare to die!");
    UI_add_answer("Bye");
    
    converse
    {
        if (response == "Bye")
        {
            say("@I may not be hungry but I will certainly not refuse a free meal.@");
            UI_clear_item_flag(AVATAR, 16);
			UI_set_opponent((-140), PARTY);
			UI_set_alignment((-140), HOSTILE);
			UI_set_schedule_type((-140), IN_COMBAT);
			//AttackParty();
			UI_clear_item_flag((-140), 16);
            break;
        }
        else if (response == "Name")
        {
            say("The dragon spreads its wings and looks into your eyes. @I am Lady Vox.@");
            UI_remove_answer("Name");
        }
        else if (response == "More humans")
        {
            say("@Generally your kind stays away from my lair though every now and then a few of you come after my treasure.@");
            UI_remove_answer("More humans");
            UI_add_answer("Feed");
            UI_add_answer("Treasure");
        }

        else if (response == "Feed")
        {
            say("The dragon opens her mighty jaws. @I do enjoy a fresh meal.@");
            UI_remove_answer("Feed");
        }
        else if (response == "Treasure")
        {
            say("@Shiny, is it not?@");
            UI_remove_answer("Treasure");
        }
        else if (response == "Lair")
        {
            say("@My ice giants and I are used to smaller creatures such as wolves or bears making their way into these caverns or falling through the opening ice.@");
			say("@Though the yeti seem to have a fascination with venturing in as well.@");
            UI_remove_answer("Lair");
            UI_add_answer("Ice giants");
            UI_add_answer("Yeti");
        }
        else if (response == "Ice giants")
        {
            say("You think the dragon lets out a laugh. @My servants are the ice giants and give me their unwaivering loyalty.@");
            UI_remove_answer("Ice giants");
        }
        else if (response == "Yeti")
        {
            say("The dragon appears to pick her teeth. @They are the most filling of the creatures that I feast upon, but they are rather stringy.@");
            UI_remove_answer("Yeti");
        }
        else if (response == "Delicious")
        {
            say("@It can grow weary feasting on the same creatures day after day. Your kind is a nice change, and so tasty.@");
            UI_remove_answer("Delicious");
        }
        else if (response == "Prepare to die!")
        {
            say("The dragon snorts. @You are not the first to utter such words before me, nor will you be the last. Come now, I hunger.@");
            UI_clear_item_flag(AVATAR, 16);
			UI_set_opponent((-140), PARTY);
			UI_set_alignment((-140), HOSTILE);
			UI_clear_item_flag((-140), 16);
			UI_set_schedule_type((-140), IN_COMBAT);
			//AttackParty();
            break;
        }


    }
}
