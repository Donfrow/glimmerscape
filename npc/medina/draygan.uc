/*
Draygan the guard at the Nautical Guild
*/

void FreeDeadEye()
{
    UI_push_answers();
    UI_add_answer("I'm a nice person");
    UI_add_answer("I love him!");
    
    if (gflags[FREE_DEADEYE])
    {
        UI_add_answer("Key to LeChuck's fortress");
    }
    converse
    {
        if (response == "I'm a nice person")
        {
            say("@Clearly you are too nice. He would slay you as soon as he had the chance. So my answer is no.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Key to LeChuck's fortress")
        {
            if (gflags[FREE_DEADEYE_KILLFLAG])
            {
                say("@I have done all I can to help you in this matter.@");
            }
            else
            {
            say("@That is a compelling reason... but I have a feeling he will double cross you as soon as he is free. But I have an idea that can help you.@");
            say("@Give him this lockpick. It is easily broken and will be of no use to him. Make sure he gives you the key to the fortress before you give him the pick. I cannot stress that enough.@");
            say("@I am certain he will attempt to weasel his way into getting the lockpick first so do not fall for his tricks. You will not get another chance and I will not free him for real if you fail.@");
			say("@So do not fail.@");
            UI_add_party_items(1, BREAKABLE_LOCKPICK, ANY, ANY); // easily breakable lockpick
            gflags[FREE_DEADEYE_KILLFLAG] = true;
            }
            UI_clear_answers();
            UI_pop_answers();
            break;

        }
        else if (response == "I love him!")
        {
            say("@Where were you when he was committing his piracy then? If you wish I could lock you up with him, that way everyone is happy.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}



void Draygan object#(0x49c) ()
	{

var bark = "Hail";
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
				UI_item_say(item, "The less pirates the better");
			else if (n == 2)
				UI_item_say(item, "Nice day");
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
        call Draygan, TALK;
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
		say("@Welcome back. I hope you have slain some pirates since we last met.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Well met sailor. I hope that you have not been pillaged by any pirates lately.@");
		UI_set_item_flag(item, MET, true);
	}
	
if(gflags[FREE_DEADEYE_JAILOR_TEXT])
{
	UI_add_answer("Free Deadeye");
}
	
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Safe sailing.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I would be known as Draygan around these parts.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Well, I used to be a sailor but I now guard the jail cells here at the Nautical Guild.@");
            UI_remove_answer("Job");
            UI_add_answer("Jailor");
            UI_add_answer("Nautical Guild");
        }
        else if (response == "Nautical Guild")
        {
            say("@I am not quite sure how you hath ended up in here and not know where you art, but it is the Nautical Guild headquarters.@");
            UI_remove_answer("Nautical Guild");
        }
        else if (response == "Jailor")
        {
            say("@I feed and take care of the pirates we capture alive. We currently only have one, Deadeye. He likes to play innocent but he would double cross you the first chance he gets.@");
            UI_remove_answer("Jailor");
            UI_add_answer("Deadeye");
        }
        else if (response == "Deadeye")
        {
            say("@He was caught trying to steal a ship when one of the few ships we still have sailing came across him. He was quickly subdued since he seems to only pick on those weaker than him.@");
            UI_remove_answer("Deadeye");
            UI_add_answer("Free Deadeye");
        }
        else if (response == "Free Deadeye")
        {
            say("@And why would someone such as yourself be looking to do that?@");
            FreeDeadEye();
            UI_remove_answer("Free Deadeye");
        }

		}
	UI_remove_npc_face(item);
	}
}
