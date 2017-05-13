/*
Lord Nagafen in the southern mountains
*/

void Get_Crown()
{
	UI_push_answers();
	UI_add_answer("Yes");
	UI_add_answer("No");
	converse
	{
		if(response == "Yes")
		{
			say("@A shame. I was starting to enjoy our conversation.@");
			gflags[FIGHT_FOR_CROWN] = true;
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else if (response == "No")
		{
			say("@A wise choice.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
	}
}


void Lord_Nagafen object#(0x581) ()
	{

var bark = "Who speaks to me?";
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
				UI_item_say(item, "My domain is supreme");
			else if (n == 2)
				UI_item_say(item, "");
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
        call Lord_Nagafen, TALK;
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
		say("The massive red dragon looks at you. @Returned again I see. You are lucky I still do not hunger for you.@");
		UI_remove_answer("Name");
		if(gflags[LEARN_OF_CROWN])
		{
			UI_add_answer("Give me the goblin crown!");
		}
	}
else
	{

		say("A massive beast stands before you. @This shall be a treat.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


    converse
    {
        if (response == "Bye")
        {
            say("@But I have so enjoyed our conversation.@");
            break;
        }
        else if (response == "Name")
        {
            say("The red dragon breathes hot air into your face. @Lord Nagafen stands before you.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@My my. Such curiousity for one who enters my home.@");
            UI_remove_answer("Job");
            UI_add_answer("Curiousity");
            UI_add_answer("Home");
        }
        else if (response == "Curiousity")
        {
			say("A snort fills the cavern. @Most often times my meals flee in terror.@");
			UI_remove_answer("Curiousity");
			UI_add_answer("Meals");
        }
        else if (response == "Meals")
        {
			say("@Goblins are usually my main course but they are such slow creatures. Unable to hold the simplest conversation.@");
			UI_remove_answer("Meals");
			UI_add_answer("Goblins");
			UI_add_answer("Conversation");
        }
        else if (response == "Goblins")
        {
			say("The dragon bears its teeth to you. @Although they are brutish in appearance they are quite easy to chew. Though I still have not tried the main course.@");
			UI_remove_answer("Goblins");
			UI_add_answer("Main course");
        }
        else if (response == "Main course")
        {
			say("@I have slain their feeble king. Soon I shall feast upon him. I wonder if the food their nobles eat make them taste better? No matter, soon I shall find out.@");
			say("The dragon lets out a massive snort. @I hope you did not think you were the main course. A course, perhaps, but not the main course. You are far too thin to be a main course.@");
			UI_remove_answer("Main course");
			UI_add_answer("King");
        }
        else if (response == "King")
        {
			say("A sharp claw motions around the cavern. @He is around here, somewhere.@");
			if(gflags[LEARN_OF_CROWN])
			{
				UI_add_answer("Give me the goblin crown!");
			}
			UI_remove_answer("King");
        }
        else if (response == "Give me the goblin crown!")
        {
			say("The dragon stands on its hind legs. @Of all my prizes you want that? The crown is nothing but a lousy trinket. It could not even stand up to the heat of my flames without becoming scorched and warped.@");
			say("A loud snort fills the cavern. @Regardless, I shall not be giving up any of my prizes without a fight. Not even one as useless as that crown.@");
			say("@Are you certain you wish to fail in your feeble attempt to take the crown from me?@");
			Get_Crown();
			if(gflags[FIGHT_FOR_CROWN])
			{
				UI_set_schedule_type(-385, IN_COMBAT);
				UI_set_alignment(-385, HOSTILE);
				UI_set_opponent(-385, PARTY);
				break;
			}
			UI_remove_answer("Give me the goblin crown!");
        }
        else if (response == "Conversation")
        {
			say("A claw points at you. @You are not much more intelligent than the goblins it would seem, but at least you speak the common tongue.@");
			say("The dragon eyes you before speaking again. @Even one such as myself enjoys some banter back and fourth. But do not think that I will not hesitate to let you fill my stomach should the desire occur.@");
			UI_remove_answer("Conversation");
        }
        else if (response == "Home")
        {
			say("The dragon motions to the cavern. @You my little human have wandered into my lair.@");
			UI_remove_answer("Home");
			UI_add_answer("Lair");
        }
        else if (response == "Lair")
        {
			say("@Lair, home. It is where I reside. It is where I live and hold my treasure. It has my own little spark of flame.@");
			UI_remove_answer("Lair");
			UI_add_answer("Flame");
			UI_add_answer("Treasure");
        }
        else if (response == "Treasure")
        {
			say("What appears to be a pleased look appears. @What kind of dragon would I be if I did not have my own treasure? It is particularly stunning, if I may so myself.@");
			say("The dragon glares at you. @Which I may.@");
			UI_remove_answer("Treasure");
        }
        else if (response == "Flame")
        {
			say("The dragon eyes you for a moment. @Surely you have noticed the breath of fire which I have brought into this cavern? Surely you have noticed that I am being of the flame?@");
			UI_remove_answer("Flame");
			UI_add_answer("Breath of fire");
			UI_add_answer("Being of flame");
        }
        else if (response == "Breath of fire")
        {
			say("You think a puzzled look appears on the dragons massive face. @The caverns are filled with flames. In fact, so many flames that even the fire elementals have taken up residence.@");
			say("@Surely you have noticed such things as you have traversed the caverns to reach me?@");
			UI_remove_answer("Breath of fire");
			UI_add_answer("Fire elementals");
        }
        else if (response == "Fire elementals")
        {
			say("The dragon snorts. @There is a creature I truely do not understand. They appear to live on the flames themselves and usually appear shortly after I settle upon a home.@");
			say("@Are they born from the flames or are they merely attracted to them? This I cannot say but never have they tried to lay a hand, or a flame should I say, upon me.@");
			say("@Perhaps I am some sort of lifeblood to them. I do not know.@");
			UI_remove_answer("Fire elementals");
        }
        else if (response == "Being of flame")
        {
			say("The dragon eyes you. @Could you truely not tell by my appearance? I am not a being of ice, such as an ice dragon, nor am I a being of poison like a green dragon.@");
			say("@I am a being of fire. A fire dragon.@");
			UI_remove_answer("Being of flame");
			UI_add_answer("Ice dragon");
			UI_add_answer("Green dragon");
        }
        else if (response == "Ice dragon")
        {
			say("@You will never find an ice dragon anywhere close to where I reside. My brothers and sisters of the ice prefer the cold climate found only in the frigid northlands.@");
			UI_remove_answer("Ice dragon");
        }
        else if (response == "Green dragon")
        {
			say("@A green skinned dragon with deadly venom, more so than any spider or scorpian one will ever cross. My brothers and sisters of that type prefer the more temperate climates found throughout the lands.@");
			UI_remove_answer("Green dragon");
        }
}
	UI_remove_npc_face(item);
	}
}
