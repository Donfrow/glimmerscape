/*
Gloria the inn keeper in Kintore
*/



void Gloria object#(0x4ad) ()
	{

var necklace = UI_count_objects(PARTY, 955, 0, 5); // The necklace you get out of the basement of Solusek Mining Co.
	
var bark = "And to you";
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
				UI_item_say(item, "I wish people would clean up");
			else if (n == 2)
				UI_item_say(item, "At least I help people");
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
        call Gloria, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Always a pleasure.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@It is always nice to see a new face in Kintore.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (necklace > 0)
	{
	UI_add_answer("Necklace");
	}


		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");
		LookForDarkMonk();
		converse
		{

	if (response == "Bye")
			{
			say("@Farewell.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("She does a small cursty. @You may call me Gloria.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I run the inn here in Kintore.@");
			UI_remove_answer("Job");
			UI_add_answer("Inn");
			UI_add_answer("Kintore");
			}
		else if (response == "Inn")
			{
			say("@Well, I am not sure it is so much of an inn as it is a shelter. I do not require payment from those who stay there.@");
			say("@That is not to say I would turn them down however.@");
			UI_remove_answer("Inn");
			}

		else if (response == "Kintore")
			{
			say("@It is not as big as some of the other cities you can find but it is a decent city if you ask me.@");
			say("@Not even the Dark Monks bother us much.@");
			UI_remove_answer("Kintore");
			UI_add_answer("Dark Monks");
			}
		else if (response == "Dark Monks")
			{
			say("@The Dark Monks worship death and despair. They hath a domicile in the mountains to the far east of the island.@");
			UI_remove_answer("Dark Monks");
			}
		else if (response == "Seen any ex-dark monks lately?")
			{
			say("@I cannot say for certain if one fellow who stayed here for a several nights was a Dark Monk or not, but it did don the robes the Dark Monks wear.@");
			UI_remove_answer("Seen any ex-dark monks lately?");
			UI_add_answer("Where did he go?");
			}
		else if (response == "Where did he go?")
			{
			say("@I believe he mentioned travelling to the south east of the island, past the swamps.@");
			say("@You can check his basket to see if he left anything if you wish. It would save me the hassle of having to throw out any left over belongings myself.@");
			say("@He stayed in the back left bed.@");
			UI_remove_answer("Where did he go?");
			}
		else if (response == "Necklace")
			{
			say("@You have come across the body of my estranged husband Djarny? I must say I am not heartbroken to see find out he has died. He had left me some time ago on some adventure.@");
			say("@To be honest I am surprised he even rememebered to leave me anything in his will. But I thank you for bringing the necklace to me.@");
			UI_remove_party_items(1, 955, 0, 5);
			UI_remove_answer("Necklace");
			karma = karma+150;
			}
		
		
		}
	UI_remove_npc_face(item);
	}
}
