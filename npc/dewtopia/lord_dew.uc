/* Dew - Ruler of Dewtopia
*/

void Deliver_Sarah_Letter()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if(response == "Yes")
        {
            say("Thank you my fine subject. Here is the letter.");
            UI_add_party_items(1, GOOD_SCROLL, 92, 3);
			gflags[SARAH_LETTER] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("I understand your reluctance. I shall find another way to send her my love.");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Lord_Dew object#(0x4f0) ()
	{

var bark = "Greetings";
var bark_intro = "Hail noble";	

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
				UI_item_say(item, "Hail to the king");
			else if (n == 2)
				UI_item_say(item, "It is good to be the king");
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
        call Lord_Dew, TALK;
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
	say("@Welcome back.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to Dewtopia.@");
	UI_set_item_flag(item, MET, true);
	}

	

if (gflags[CHEATING_SLUT])
{
    UI_add_answer("Brana is cheating");
    if(gflags[SLUT_JAILED])
    {
        UI_remove_answer("Brana is cheating");
        UI_add_answer("Brana");
    }
}

if (gflags[AT_WAR])
{
    UI_add_answer("War!");
}

SacrificeForOrb();

		converse
		{
	if (response == "Bye")
			{
			say("@So long my subject.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@You do not know who I am? I am Lord Dew of course!@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the ruler of Dewtopia and the surrounding lands.@");
			UI_remove_answer("Job");
			UI_add_answer("Surrounding lands");
			}
		else if (response == "Surrounding lands")
			{
			say("@Dewtopia originally existed only within the city walls but it has expanded so quickly that we have run out of room within the walls.@");
			say("@You can speak to the royal historian for more information.@");
			UI_remove_answer("Surrounding lands");
			}
		else if (response == "Brana is cheating")
			{
			say("@You claim that Lady Brana is cheating on me? It breaks my heart to think that she would offer herself to you.@");
			say("@But tis not your fault she possesses all the qualities of a rake. I shall send Brana to toil in the Sugar Caves for the rest of her days for this, though that does not heal my aching heart.@");
			say("@Thank you for your truthfullness kind subject.@");
			UI_remove_answer("Brana is cheating");
			gflags[SLUT_JAILED] = true;
			UI_move_object((-252), [1620, 2150]);
			UI_modify_schedule((-252), 3, 8, [1620, 2150]);
			UI_modify_schedule((-252), 6, 14, [1643, 2047]);
			UI_modify_schedule((-252), 7, 8, [1620, 2150]);
			UI_add_answer("Aching heart");
			}
		else if (response == "Want to live forever?")
		{
            say("@What a wonderous thing that would be. But alas, I am not so vain to think that I should be one to live forever.@");
			say("@A good question but alas, I know mortality is one of the things which makes one great.@");
            UI_remove_answer("Want to live forever?");
        }
        else if (response == "Brana")
        {
            say("@Brana have left a large hole in my heart. I am ashamed to admit it but I now desire Countess Sarah of Brentonia to heal my damaged pride.@");
            UI_remove_answer("Brana");
            UI_add_answer("Countess Sarah");
        }
        else if (response == "Aching heart")
        {
            say("@Brana has left a large hole in my heart. I am ashamed to admit it but I now desire Countess Sarah of Brentonia to heal my damaged pride.@");
            UI_remove_answer("Aching heart");
            UI_add_answer("Countess Sarah");
        }
        else if (response == "Countess Sarah")
        {
            say("@I was once lucky enough to hold her in my arms but since then she have left for Brentonia's ruler Lord Brent.@");
			if(gflags[SARAH_LETTER])
			{
			}
			else
			{
				say("He eyes you up. @As you have proven yourself to be extremely loyal to me would you deliver a letter to her for me?@");
				Deliver_Sarah_Letter();
			}
            UI_remove_answer("Countess Sarah");
        }
        else if (response == "War!")
        {
            say("@If Lord Brent wants a war, than war he shall get! It is only a matter of time now but I would not wait around for it for it shall surely be many years from now before this is settled.@");
            break;
        }


}	
	UI_remove_npc_face(item);

}
}

