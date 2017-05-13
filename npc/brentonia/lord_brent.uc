/*
Lord Brent
*/


void Lord_Brent object#(0x43f) ()
	{

var bark = "Well met";
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
        call Lord_Brent, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (gflags[AT_WAR])
{
    say("@Begone!");
}
else
{


		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		
        SacrificeForOrb();

if (UI_get_item_flag(item, MET)) 
	{
		say("@Welcome back fine warrior.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Welcome to my humble castle.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@I wish you luck on your journies.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Why, I am Lord Brent.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Does the name not give it away? I rule over Brentonia.@");
            UI_remove_answer("Job");
            UI_add_answer("Brentonia");
        }
        else if (response == "Brentonia")
        {
            say("@It is a fine city that was founded many years ago, and has since thrived. This city is a beacon in the quest for knowledge and truth.@");
            UI_remove_answer("Brentonia");
            UI_add_answer("Knowledge");
            UI_add_answer("Truth");
        }
        else if (response == "Knowledge")
        {
            say("@Much time and effort is put into discovering knowledge, from every day mundane things to the extraodinary.@");
			say("@I feel knowledge is deserved by all that I even put my personal collection of artifacts on display for all to see.@");
            say("@Alagnar is very helpful with dating and discovering the history and purpose of artifacts.@");
            UI_remove_answer("Knowledge");
            UI_add_answer("Alagnar");
            UI_add_answer("Artifacts");
        }
        else if (response == "Artifacts")
        {
            say("@I have a museum setup within the city so that all may see the wonderous things.@");
            UI_remove_answer("Artifacts");
            UI_add_answer("What about thieves?");
        }
        else if (response == "What about thieves?")
        {
            say("@I have setup glass cases so that one may not simply walk in and take objects. One would have to break the glass to retrieve an item, and I cannot imagine someone being so crass!@");
            UI_remove_answer("What about thieves?");
        }
        else if (response == "Truth")
        {
            say("@There is truth, and truthiness. Truth is the real accurate facts, truthiness is not. One must seek truth, not truthiness.@");
            UI_remove_answer("Truth");
        }
        else if (response == "Alagnar")
        {
            say("@He is truely a fine fellow. Quite intelligent. If you come across any strange artifacts he would be the one to ask about them.@");
            UI_remove_answer("Alagnar");
        }
        else if (response == "Want to live forever?")
        {
            say("@It is an interesting thought. There are many schools of thought on such a matter. One thought being that our mortality is what makes us act the way we do.@");
            say("@Would we act the same if we knew we were to become immortal? Alas, I think many would succumb to the power and lust they could achieve over an infinate life.@");
			say("@I do not know if I would be strong enough to withstand such urges.@");
            say("@So I suppose the answer would be no. I do not believe I could fight the urges which turn an otherwise noble man into a power hungry maniac.@");
            UI_remove_answer("Want to live forever?");
        }
        
        }
		}
	UI_remove_npc_face(item);
	}
}
