/*
Karnax the head dark monk
*/

void OrbTalk()
{

UI_push_answers();
UI_add_answer("I wish to join your cult");
UI_add_answer("Give me the orb");

	converse

	{

	if (response == "I wish to join your cult")
		{
		say("@I sense much hesitation in you... you should leave before you become our next sacrifice.@");
		gflags[ORB_OF_SOULS_SPAWNABLE] = true;
		UI_remove_answer("I wish to join your cult");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
	else if (response == "Give me the orb")
		{
		say("@You will never find it, I possess the only key to its location, you will wither and die before the orb ever graces your hands!@");
		gflags[ORB_OF_SOULS_SPAWNABLE] = true;
		UI_remove_answer("Give me the orb");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}



	}


}


void Karnax object#(0x4cf) ()
	{

var bark = "Are you ready to give up everything?";
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
				UI_item_say(item, "Death is the way");
			else if (n == 2)
				UI_item_say(item, "Feast on despair");
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
        call Karnax, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@The darkness brings you back.@");
	}
else
	{

		say("@I do not know how you have gotten into our sanctuary, but I sense the darkness has beckoned you to me.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (gflags[SEE_MONKS_ABOUT_ORB]) // learned from the cyclops the dark monks took the orb
	{
	UI_add_answer("Orb of Souls");
	}



		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Walk in darkness.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Leader Karnax.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I lead those who are blind to the true path of darkness.@");
			UI_remove_answer("Job");
			UI_add_answer("Blind");
			UI_add_answer("Darkness");
			}
		else if (response == "Blind")
			{
			say("@One must feast on the innards of man to truely appreciate that which is. I take the blind to the dinner table.@");
			UI_remove_answer("Blind");
			}
		else if (response == "Darkness")
			{
			say("@Those who seek veer from the darkness but darkness is the true way. The soul is a dark spot, one that must be blackened.@");
			UI_add_answer("Dark spot");
			UI_remove_answer("Darkness");
			}
		else if (response == "Dark spot")
			{
			say("@A man is but a vessel for the darkness that resides in the boundless void of existence.@");
			UI_remove_answer("Dark spot");
			UI_add_answer("Boundless void");
			}
		else if (response == "Boundless void")
			{
			say("@The boundless void is the land of souls which lingers and withers in the morrow.@");
			UI_remove_answer("Boundless void");
			UI_add_answer("What the devil are you talking about?");
			}
		else if (response == "What the devil are you talking about?")
			{
			say("@The darkness eats within those who do not seek it and do not harness the power. Eat the darkness, embrace its foamy goodness.@");
			UI_remove_answer("What the devil are you talking about?");
			UI_add_answer("You are a lunatic!");
			UI_add_answer("Your ideas intrigue me");
			}
		else if (response == "Your ideas intrigue me")
			{
			say("@That is because they are intriguing.@");
			UI_remove_answer("You are a lunatic!");
			UI_remove_answer("Your ideas intrigue me");
			UI_add_answer("I wish to subscribe to your newsletter");
			}
		else if (response == "I wish to subscribe to your newsletter")
			{
			say("@I see.@");
			UI_remove_answer("I wish to subscribe to your newsletter");
		

			}
		else if (response == "You are a lunatic!")
			{
			say("@Alas, it appears you are not able to be redeemed for you do not suckle on the withered teet of morrow.@");
			UI_remove_answer("You are a lunatic!");
			break;
			}




		else if (response == "Orb of Souls")
			{
			say("@The Orb of Souls has beckoned you to me. Yes, I can feel your lust for the darkness.@");
			say("@Join us, and you too can rever in the greatness of the Orb of Souls and the pain and despair it brings.@");
			OrbTalk();
			UI_remove_answer("Orb of Souls");
			}



		}
	UI_remove_npc_face(item);
	}
}
