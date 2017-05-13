/*
Ralnak
*/



void Ralnak object#(0x563) ()
	{

var lechucks_beard = UI_count_objects(PARTY, LECHUCKS_BEARD, ANY, ANY);
 
var bark = "Hail to you";
var bark_intro = "Hail";

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
				UI_item_say(item, "I miss the sea air");
			else if (n == 2)
				UI_item_say(item, "These pretzels are making me thirsty");
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
        call Ralnak, TALK;
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

if (UI_get_item_flag(item, MET)) 
	{
		say("@What can I do for ya?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Welcome to the Nautical Guilds headquarters. How can I help ya?@");
		UI_set_item_flag(item, MET, true);
	}
	
if (lechucks_beard > 0)
{
    UI_add_answer("LeChuck's Beard");
}

// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Slay a pirate.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Yee be talking to Ralnak.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I be the receptionist here at the Nautical Guild after the last one ran off and got himself killed.@");
            UI_remove_answer("Job");
            UI_add_answer("Nautical Guild");
            UI_add_answer("Last one");
        }
        else if (response == "Last one")
        {
            say("@Gunus or Gunis or Guiness or some such. He longed for the sea too much and was promptly slain by pirates. Poor lad.@");
            UI_remove_answer("Last one");
            UI_add_answer("Pirates");
        }
        else if (response == "Pirates")
        {
            say("@They be breeding like rabbits lately it would seem. We are refusing to sail in hopes that they shrivel up and go away. But with a pirate like LeChuck I do not have high hopes.@");
            UI_remove_answer("Pirates");
            UI_add_answer("LeChuck");
        }
        else if (response == "LeChuck")
        {
            if (gflags[LECHUCK_DEAD])
            {
                say("@Now that ye have slain LeChuck the ships are free to sail again. The Nautical Guild is forever in your debt.@");
            }
            else
            {
                say("@He is the head of the more organized pirates and lives in a fortress to the north of DeathScorn mountains. If ye are interested in the bounty on him ye can check out the poster here in the guild.@");
                say("@And if ye decide to go about it, do not forget to bring a knife so that ye can cut the beard off his cold dead body... that is if he does not kill ye first.@");
            }
            UI_remove_answer("LeChuck");
        }
        else if (response == "Nautical Guild")
        {
            say("@We are the main source of shipping and receiving items throughout Desporia. I thought you knew this as I was under the impression that ye are a member.@");
            UI_remove_answer("Nautical Guild");
        }
        else if (response == "LeChuck's Beard")
        {
            say("@Impressive! LeChuck has slain many who were out to collect the bounty on his head. Ye have done an incredible service to all the lands. With LeChuck dead the ships can once again sail.@");
            say("@Ye have earned this key to the treasure room of the Nautical Guild. Had LeChuck been left alive I believe he may have managed to eventually plunder it himself. Ye deserve every bit of treasure.@");
            UI_remove_answer("LeChuck's Beard");
            UI_remove_party_items(1, LECHUCKS_BEARD, ANY, ANY);
            UI_add_party_items(1, KEY, 45, 3);
            gflags[LECHUCK_DEAD] = true;
        }
        

		}
	UI_remove_npc_face(item);
	}
}
