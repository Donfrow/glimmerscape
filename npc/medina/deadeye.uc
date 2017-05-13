/*
Deadeye in the pirate jail
*/

void GetKeyFromDeadeye4()
{
    UI_push_answers();
    UI_add_answer("Give pick");
    UI_add_answer("Give me the damn key or I am leaving");
    
    converse
    {
        if (response == "Give pick")
        {
            GaveDeadeyePick();
            break;
        }
        else if (response == "Give me the damn key or I am leaving");
        {
            say("@Sheesh, what a baby. Here is your damn key. Thank ye for giving me the pick.@");
            UI_add_party_items(1, KEY, 4, ANY);
            UI_remove_party_items(1, 1375, ANY, ANY);
            gflags[GOT_KEY_FROM_DEADEYE] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void GetKeyFromDeadeye3()
{
    UI_push_answers();
    UI_add_answer("Give pick");
    UI_add_answer("I want the key first");
    
    converse
    {
        if (response == "Give pick")
        {
            GaveDeadeyePick();
            break;
        }
        else if (response == "I want the key first")
        {
            say("@And so you will get it, as soon as I get the pick.@");
            GetKeyFromDeadeye4();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void GetKeyFromDeadeye2()
{
    UI_push_answers();
    UI_add_answer("Give pick");
    UI_add_answer("No I want the key first");
    
    converse
    {
        if (response == "Give pick")
        {
            GaveDeadeyePick();
            break;
        }
        else if (response == "No I want the key first")
        {
            say("@So give me the pick so I can give ye the key.@");
            GetKeyFromDeadeye3();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void GetKeyFromDeadeye1()
{
    UI_push_answers();
    UI_add_answer("Give pick");
    UI_add_answer("Give me the key than I give you the pick");
    
    converse
    {
        if (response == "Give pick")
        {
            GaveDeadeyePick();
            break;
        }
        else if (response == "Give me the key than I give you the pick")
        {
            say("@Sounds good, give me the pick.@");
            GetKeyFromDeadeye2();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }

    }
}


void GetKeyFromDeadeye()
{
    UI_push_answers();
    UI_add_answer("Give pick");
    UI_add_answer("Give me the key first");
    
    converse
    {
        if (response == "Give pick")
        {
            GaveDeadeyePick();
            break;
        }
            
        else if (response == "Give me the key first")
        {
            say("@What? Ye do not trust me! I have such an honest face. How about ye give me the pick and I give ye the key?@");
            GetKeyFromDeadeye1();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
    
}

void DeadEyeName()
{
    UI_push_answers();
    UI_add_answer("I ask everyone");
    UI_add_answer("Habit");
    UI_add_answer("Name");
    converse
    {
        if (response == "I ask everyone")
        {
            say("@Ye be the curious sort then... such things could get a dagger in your back one day. But not today. I be Deadeye.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Habit")
        {
            say("@That be a bad habit, and an odd one to get in the firstplace. But I feel sorry for the simple folk. I be Deadeye.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Name")
        {
            say("@Yes... ye have already asked me that. Bit simple are we? Deadeye be my name, hopefully ye can comprehend that.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Deadeye object#(0x480) ()
	{

var fakepick = UI_count_objects(PARTY, 1375, ANY, ANY); // Fake lockpick
 
var bark = "What do ye want?";
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
				UI_item_say(item, "I be framed ye scurvy dogs");
			else if (n == 2)
				UI_item_say(item, "Without these bars ye would be crying to mommy");
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
        call Deadeye, TALK;
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


if (gflags[GOT_KEY_FROM_DEADEYE])
{
    UI_remove_answer("Name");
    UI_remove_answer("Job");
    UI_remove_answer("Bye");
    say("@Ye are a no good cheat! That lockpick broke the second I tried to use it! I will kill you if I ever get the chance!@");
}

else

{


if (UI_get_item_flag(item, MET)) 
	{
		say("@What do ye want string bean?@");
		UI_remove_answer("Name");
		if (gflags[GET_KEY_FROM_DEADEYE])
		{
		  UI_add_answer("Key to LeChuck's fortress");
        }
        if (fakepick > 0)
        {
            UI_add_answer("Lockpick");
            UI_remove_answer("Key to LeChuck's fortress");
        }

	}
else
	{

		say("@I be framed! The Nautical Guild set me up!@");
		UI_set_item_flag(item, MET, true);
		if (gflags[GET_KEY_FROM_DEADEYE])
		{
		  UI_add_answer("Key to LeChuck's fortress");
        }
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Ye leaving me to rot I see.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Why should the likes of ye want to be knowing such a thing?@");
            DeadEyeName();
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Any fleeting thoughts that yee were smarter than a melon have now vanished. I be a prisoner, what possible job could I have?@");
            UI_remove_answer("Job");
            UI_add_answer("You have hurt my feelings");
            UI_add_answer("What was your job?");
        }
        else if (response == "You have hurt my feelings")
        {
            say("@Poor baby. Would ye like me to go find your mommy?@");
            UI_remove_answer("You have hurt my feelings");
        }
        else if (response == "What was your job?")
        {
            say("@I was a pir... err a humble dirt salesman until this guild locked me up. I am innocent I tells ya!@");
            UI_remove_answer("What was your job?");
            UI_add_answer("I suspect you are a pirate");
        }
        else if (response == "I suspect you are a pirate")
        {
            say("@And I suspect that ye be a big pile of dung, what be yer point?@");
            UI_remove_answer("I suspect you are a pirate");
        }
        else if (response == "Key to LeChuck's fortress")
        {
            say("@I told ye, I not be a pirate ye scurvy dog. Ye are so daft if it were not for these bars I would pillage your ship and steal all your treasure!@");
            UI_remove_answer("Key to LeChuck's fortress");
            UI_add_answer("Yes, you are a pirate");
        }
        else if (response == "Yes, you are a pirate")
        {
            say("@So what if I be? Not like I am doing any harm locked up here.@");
            UI_remove_answer("Yes, you are a pirate");
            UI_add_answer("I want a key to LeChuck's fortress");
        }
        else if (response == "I want a key to LeChuck's fortress")
        {
            say("@I suppose I could help ye with that if ye would help me out... and by out, I mean OUT. If ye do that I will provide ye with what ye want.@");
            UI_remove_answer("I want a key to LeChuck's fortress");
            gflags[FREE_DEADEYE] = true;
			gflags[FREE_DEADEYE_JAILOR_TEXT] = true;
        }
        else if (response == "Lockpick")
        {
            say("@It is good to know that you have held up your end of the bargain and managed to smuggle in a lockpick for me... now give it to me.@");
            GetKeyFromDeadeye();
            UI_remove_answer("Lockpick");
        }
        
        }
        
        

		}
	UI_remove_npc_face(item);
	}
}
