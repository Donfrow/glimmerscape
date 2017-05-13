/*
Graplinosh the goblin in souther mountains
*/

void Graplinosh object#(0x57f) ()
	{

var bark = "Ooga human";
var bark_intro = "Goblin";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Groshbrog Lord Nagafen!");
			else if (n == 2)
				UI_item_say(item, "Nurglade Markus");
			}
		}
if (event == DOUBLECLICK)
{

script AVATAR
{
    actor frame STAND;
    say bark_intro;
    wait 10;
}
    script item
    {
        wait 5;
        say bark;
        wait 8;
        call Graplinosh, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

var goblinCrown = PARTY->count_objects(1487, ANY, ANY); // scorched goblin crown

if(goblinCrown > 0 && gflags[LEARN_OF_CROWN])
{
	if(gflags[CROWN_RETURNED]) // kill the conversation tree
	{
	}
	else
	{
		UI_add_answer("Return crown");
	}
}
		
if (UI_get_item_flag(item, MET)) 
	{
		say("The goblin again tries to greet you in your own tongue. @Meetings to you.@");
		UI_remove_answer("Name");

	}
else
	{

		say("The goblin looks before you and speaks in a broken tongue. @Greet nosh, Human.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


    converse
    {
        if (response == "Bye")
        {
            say("@Gribblegob.@");
            break;
        }
        else if (response == "Name")
        {
            say("@You call myself Graplinosh@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("He pauses for a moment and thinks. @Not work like human. Me new king of goblins.@");
            UI_remove_answer("Job");
            UI_add_answer("Goblins");
            UI_add_answer("New king");
        }
        else if (response == "Goblins")
        {
            say("The goblin winces as it tries to speak in your tongue. @Goblins not like goblins not here. Goblins not... savage.@");
            UI_remove_answer("Goblins");
            UI_add_answer("Savage");
        }
        else if (response == "Savage")
        {
            say("Graplinosh cringes. @Goblin brutes. Not brutes goblins here.@");
            UI_remove_answer("Savage");
        }
        else if (response == "New king")
        {
			say("It almost appears as if the creature could be crying. @Beast... you kind call dragon kill old king.@");
			UI_remove_answer("New king");
			UI_add_answer("Dragon");
			UI_add_answer("Old king");
        }
        else if (response == "Dragon")
        {
			say("@Caves not only home to goblins. Red dragon beast live too. Feed on goblins. Lord Nagafen dragon feed on goblin king.@");
			UI_remove_answer("Dragon");
			UI_add_answer("Lord Nagafen");
        }
        else if (response == "Lord Nagafen")
        {
			if(UI_is_dead(-385))
			{
				say("@Cavern safe with dragon gone. Goblin tribe thankful.@");
			}
			else
			{
				say("A look of terror appears on the goblins face. @Lord Nagafen strong. Goblins weak.@");
			}
			UI_remove_answer("Lord Nagafen");
        }
        else if (response == "Old king")
        {
			say("@Komplanuk old king. Komplanuk try kill Lord Nagafen. Komplanuk not live. Goblin crown lost.@");
			UI_remove_answer("Old king");
			UI_add_answer("Lord Nagafen");
			UI_add_answer("Goblin crown");
        }
        else if (response == "Goblin crown")
        {
			if(gflags[CROWN_RETURNED])
			{
				say("@You retrieved crown from dragon. Goblin tribe thankful but crown is ruined. Shameful to wear. Yours to keep.@");
				gflags[CROWN_RETURNED] = true;
			}
			else
			{
				say("@Not fully king without crown. Too weak to fight for crown. You get crown. Graplinosh be greatful!@");
				gflags[LEARN_OF_CROWN] = true;
			}
			UI_remove_answer("Goblin crown");
        }
		else if (response == "Return crown")
		{
			say("As you hand the scorched crown to the goblin the creature lets out what you think is a gasp. @You mighty to kill dragon but crown destroyed. No goblin can wear crown like this. More shame brought to tribe.@");
			say("The goblin lowers and shakes his head. @Sad day for goblins. Shame too great to wear crown. Must live in shame. You keep crown. Goblins thankful to you but goblins cannot use crown. Do what you want with crown.@");
			gflags[CROWN_RETURNED] = true;
			UI_set_npc_prop(AVATAR, STRENGTH, 1); // give 1 strength
			UI_set_npc_prop(AVATAR, EXPERIENCE, 1000); // give 500 experience (as it's halfed)
			UI_set_npc_prop(PARTY, EXPERIENCE, 1000); // give 500 experience to party
			UI_remove_answer("Return crown");
		}
}
	UI_remove_npc_face(item);
	}
}
