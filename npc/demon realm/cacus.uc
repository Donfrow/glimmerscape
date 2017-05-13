/*
Cacus lord of the demon realm
*/


void Cacus object#(0x45c) ()
	{

 var book = UI_count_objects(1, 642, 12, 28); // Book in the old necromage house in moonshade
 
var bark = "Greetings human";
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
				UI_item_say(item, "Muhaha");
			else if (n == 2)
				UI_item_say(item, "The fiery lands are our domain");
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
        call Cacus, TALK;
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
		UI_add_answer("Ore");

if (UI_get_item_flag(item, MET)) 
	{
		say("@I see that you hath not yet left our realm.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Interesting, another human in our realm.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag



		converse
		{
        if (response == "Bye")
        {
            say("@You should not stay in our realm for too long.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Ah yes, a human would being oblivious to the nature of our realm. Tis not surprising. I am Lord Cacus.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the bearer of the hammer and ruler over this realm.@");
            UI_remove_answer("Job");
            UI_add_answer("Realm");
            UI_add_answer("Hammer");
        }
        else if (response == "Realm")
        {
            say("@Thee must know that you hath entered our realm. Thee would have had to create a gateway to enter here... unless you used someone elses gateway. Those who do not possess the skill to open the gateway themselves are not looked upon kindly by us.@");
            UI_remove_answer("Realm");
            UI_add_answer("Kindly");
        }
        else if (response == "Kindly")
        {
            say("@Your questions make me regard you dubiously... speak not to me anymore unskilled mundane.@");
            break;
        }
        else if (response == "Hammer")
        {
            say("@The Hammer of Dedication is a mighty weapon forged by those of your realm. It is passed on from each ruler of this realm and none shall rule over it without the hammer.@");
            UI_remove_answer("Hammer");
        }
        else if (response == "Ore")
        {
            say("@Our realm is home to many exotic creatures and materials. Occasionally those from other realms enter here in search of such things. While we will not slay you, we will not aid in your search to pilfer our realm.@");
            UI_remove_answer("Ore");
        }

		}
	UI_remove_npc_face(item);
	}
	}
