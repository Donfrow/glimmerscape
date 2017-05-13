/*
Alar the phoenix in the southern mountains
*/

void Cavern_Life()
{
	UI_push_answers();
	UI_add_answer("Fire elementals");
	UI_add_answer("Dragon");
	UI_add_answer("Goblins");
	UI_add_answer("Phoenix");
	UI_add_answer("Human");
	UI_add_answer("Nevermind");
	converse
	{
		if(response == "Nevermind")
		{
			say("@But of course.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else if (response == "Fire elementals")
		{
			say("@There is a creature which intrigues even me. Much like a phoenix the fire elementals are birthed from the fires of the world.@");
			say("@But there is something strange about such creatures. They seem to have no ability to communicate, not even with other fire beings such as myself@");
			say("@And seek only to destroy whatever they encounter.@");
			say("@Yet they do possess a redumentary intelligence for they no longer attack me. It is almost as if they have learned that their attacks of fire have no effect on a fellow being of the flame.@");
			say("@Still, they are interesting creatures for one to study.@");
			UI_remove_answer("Fire elementals");
		}
		else if (response == "Goblins")
		{
			say("@Strictly speaking the goblins live just outside the molten portion of these caverns. They are resilient creatures as not many would live so close to such heat.@");
			say("@They also possess some form of intelligence and live in a social society. I would attempt to learn more about them but they are fearful of all the fire creatures of the cavern it would seem.@");
			say("@Still, I believe in time one could befriend them as they do not appear to be too brutish. At least from what I have seen.@");
			UI_remove_answer("Goblins");
		}
		else if (response == "Dragon")
		{
			say("@There are many types of dragon throughout the world but the only one I have ever encountered are the fire dragons as they tend to inhabit the same areas as a phoenix.@");
			say("Al'ar motions to the fire around you. @By that I mean thriving on the extreme heat and flames.@");
			say("@The one which inhabits this cavern calls himself Lord Nagafen and feeds upon the goblins. I almost feel sorry for the goblins as they do not stand a chance against such a foe.@");
			if(UI_is_dead(382))
			{
				say("@That is to say did inhabit this cavern, as I am aware that you have slain him. Speaking personally, I do not feel it is a much of a loss.@");
			}
			UI_remove_answer("Dragon");
		}
		else if (response == "Human")
		{
			say("@You are not the only human to enter these caverns. Every so often one enters in search of treasure or fame. Normally they do not make it back out.@");
			say("The bird quickly pipes up after realizing what it has said. @I do hope you are not one of them.@");
			say("@There is also one human which came in some time ago to harness the power of fire. I know he yet lives as I can sense him through the flames.@");
			UI_remove_answer("Human");
		}
		else if (response == "Phoenix")
		{
			say("@As a phoenix I was born from the flames, and the flames nourish me. I have no need for mates as the flames breath life into our eggs.@");
			say("@My kind is a timeless creature, never succumbing to the ravages of aging as long as we stay near our lifeblood, the flames. It can be quite a dull life actually.@");
			UI_remove_answer("Phoenix");
		}
		
	}
}


void Alar object#(0x582) ()
	{

var bark = "Hello to you human";
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
				UI_item_say(item, "Fire is lifeblood");
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
        call Alar, TALK;
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
		say("@It is always a pleasure to speak to you.@");
		UI_remove_answer("Name");

	}
else
	{

		say("A bird with burning feathers looks at you. @I say, well met.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


    converse
    {
        if (response == "Bye")
        {
            say("With a flick of flame the phoenix waves you off.");
            break;
        }
        else if (response == "Name")
        {
            say("@I am known by those who know me as Al'ar.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@The job of a phoenix is to simply exist.@");
            UI_remove_answer("Job");
            UI_add_answer("Exist");
            UI_add_answer("Phoenix");
        }
        else if (response == "Exist")
        {
			say("The bird eyes you. @I serve no purpose than to simply exist. Why must one serve a purpose in this world?@");
			say("@I suppose one could say that is the purpose of every creature in these caverns, or the world for that matter.@");
			UI_remove_answer("Exist");
			UI_add_answer("Creatures");
			UI_add_answer("What do you do?");
        }
        else if (response == "Creatures")
        {
			say("@There are many creatures throughout the world, but I will only speak of the fauna one can find throughout this cavern. What would you like to know about?@");
			Cavern_Life();
			UI_remove_answer("Creatures");
        }
        else if (response == "What do you do?")
        {
			say("@I live and observe my surroundings, learning as much as I can. I would truely like to know more of this world but a phoenix does not last long away from the flames. It is somewhat saddening.@");
			say("@I must say that this conversation has been delightful! It is such a nice treat.@");
			UI_remove_answer("What do you do?");
        }
        else if (response == "Phoenix")
        {
			say("@That is correct. I am a phoenix. Rare as we are you have found one.@");
			UI_remove_answer("Phoenix");
			UI_add_answer("Rare");
        }
        else if (response == "Rare")
        {
			say("@A phoenix is a creature which only reproduces once in a lifetime. And compared to the way creatures such as yourself live that is some time.@");
			UI_remove_answer("Rare");
			UI_add_answer("Lifetime");
			UI_add_answer("Reproduce");
        }
        else if (response == "Lifetime")
        {
			say("@As long as a phoenix stays by the flames we do not perish.@");
			UI_remove_answer("Lifetime");
        }
        else if (response == "Reproduce")
        {
			say("@We use the flames as the lifeblood for our eggs. I will spare you the details suffice to say that the flames are our mates, if one can call it that.@");
			UI_remove_answer("Reproduce");
        }
}
	UI_remove_npc_face(item);
	}
}
