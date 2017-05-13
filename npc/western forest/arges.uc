/*
Arges the cyclops by the shore on the western forest of mainland
*/

void MinorOrbConvo1()
{
UI_push_answers();

	say("@After the Orb of Infinity shattered my people gathered the five minor orbs. We felt the power the orbs contained were too dangerous and must be protected.@");
	say("@As time passed on our numbers dwindled and it was decided that the orbs should be seperated. Five of the strongest of our race were given one of the orbs to protect.@");
	say("@Which of these orbs would you like to know about?@");
	UI_add_answer("Orb of Transfiguration");
	UI_add_answer("Orb of Persuasion");
	UI_add_answer("Orb of Chaos");
	UI_add_answer("Orb of Focus");
	UI_add_answer("Orb of Souls");
	UI_add_answer("Nevermind");

	converse
	{

	if (response == "Orb of Transfiguration")
		{
		say("@The Orb of Transfiguration was entrusted to Brontes, a strong and wise cyclops. He travelled to the mainland and sought refuge in a mountain range near where Dewtopia now resides.@");
		say("@I have not heard word from him in some time.@");
		UI_remove_answer("Orb of Transfiguration");
		}
	else if (response == "Orb of Persuasion")
		{
		say("@The Orb of Persuasion was given to Coeus for it was his intelligence which would allow him not to succumb to the orbs allure.@");
		say("@He travelled across the lands to settle on an uninhabited island in the south east waters. I do not know which one exactly as I have not spoken with him since he left.@");
		UI_remove_answer("Orb of Persuasion");
		gflags[TALK_TO_COEUS] = true;
		}
	else if (response == "Orb of Chaos")
		{
		say("@The Orb of Chaos was entrusted to Steropes. He travelled to the southern tip of the mainland. He set up camp there but soon the orb caused the lands to become twisted and poisoned.@");
		say("@He realized he would never be able to rest in one location because of the orbs influence on the land and has been travelling since.@");
		say("@Sadly I do not know what has become of him during his travels. I hope he still lives.@");
		UI_remove_answer("Orb of Chaos");
		}
	else if (response == "Orb of Focus")
		{
		say("@Iapetus was originally entrusted with this orb. He was slain by men and the orb taken from him to the city of Exeter. It was tasked to Crius to recover the orb from this place.@");
        say("@Crius waited for an opportune moment to recover the orb when Execter was destroyed through its power. He recovered the Orb from the ruins and it was decided he would travel to the northlands of the Frigid Plains.@");
		say("@I have not heard word of him since he left on this journey.@");
		UI_remove_answer("Orb of Focus");
		}
	else if (response == "Orb of Souls")
		{
		say("@The Orb of Souls was entrusted to your friend Polyphemus. You should know this already.@");
		UI_remove_answer("Orb of Souls");
		}

	else if (response == "Nevermind")
		{
		say("@As you wish.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}	


	}


}



void Arges object#(0x40b) ()
	{


var bark = "Hello";
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
				UI_item_say(item, "We are a dying race");
			else if (n == 2)
				UI_item_say(item, "I mourn for my people");
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
        call Arges, TALK;
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
		say("@I greet you once more.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@I am peaceful, do not attack.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag







		converse
		{

	if (response == "Bye")
			{
			say("@Be wary while in the forest.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Arges.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I try to stay alive and keep the knowledge of my people alive.@");
			UI_remove_answer("Job");
			UI_add_answer("Knowledge");
			}
		else if (response == "Knowledge")
			{
			say("@Much of the knowledge of my people has been lost as we slowly die out. There are few we can call friends who we can pass this knowledge onto.@");
			UI_remove_answer("Knowledge");
			UI_add_answer("I seek knowledge");
			}
		else if (response == "I seek knowledge")
			{
			say("@You have given me no reason to trust you at this time.@");
			UI_remove_answer("I seek knowledge");

			if (gflags[TALK_TO_CYCLOPS2])
				{
				UI_add_answer("Polyphemus sent me");
				}
			}
		else if (response == "Polyphemus sent me")
			{
			say("@If Polyphemus can trust you than so can I. What would you like to know about?@");
			UI_remove_answer("Polyphemus sent me");
			UI_add_answer("What became of the minor orbs");
			}	
		else if (response == "What became of the minor orbs")
			{
			MinorOrbConvo1();
			UI_remove_answer("What became of the minor orbs");
			}

		}}
	UI_remove_npc_face(item);
	}

