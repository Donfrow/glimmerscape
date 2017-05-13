/*
Brene the sewer in Kintore
*/



void Brene object#(0x419) ()
	{


var gabbie_sig = UI_count_objects(PARTY, 797, 61, 6); // Scroll found in the abandoned mining company building at DeathSquall mountains
var seal = UI_count_objects(PARTY, 1384, 0, 0);	 // Seal of the Solusek Mining Co.
var letter_head = UI_count_objects(PARTY, GOOD_SCROLL, 68, 2); // Letterhead from Gabbie's desk

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
				UI_item_say(item, "Sew all day long");
			else if (n == 2)
				UI_item_say(item, "Delicious apples");
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
        call Brene, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@It is always a pleasure to be graced with your face.@");
		UI_remove_answer("Name");
				
				if (gflags[FAKE_SCROLL])
					{
					UI_add_answer("Prepare a scroll");
					
					if (gabbie_sig > 0 && seal > 0 && letter_head > 0)
						{
						UI_add_answer("Scroll components");
						UI_remove_answer("Prepare a scroll");
						}				

					}
	}
else
	{

	say("@I may not be the first to welcome you, but welcome to Kintore.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");
		LookForDarkMonk();
		converse
		{

	if (response == "Bye")
			{
			say("@I do hope to see you again.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me Brene.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I sew items and also do minor paperwork for those who need it here in Kintore.@");
			UI_remove_answer("Job");
			UI_add_answer("Sew");
			UI_add_answer("Paperwork");
			UI_add_answer("Kintore");
			}
		else if (response == "Sew")
			{
			say("@I only do special orders so you cannot purchase anything from me at the moment.@");
			say("@Other than bandages of course.@");
			UI_remove_answer("Sew");
			}

		else if (response == "Paperwork")
			{
			say("@Such things as prepare documents, signatures for those who are too busy or cannot write, things such as that.@");
			say("@It is mainly the mayor who requires paperwork but I do minor paperwork for others when the need arises.@");
			if (gflags[FAKE_SCROLL])
			{
				UI_add_answer("Prepare a scroll");
			}
			UI_remove_answer("Paperwork");
			UI_add_answer("Mayor");
			}
		else if (response == "Kintore")
			{
			say("@It is a lovely city, is it not?");
			UI_remove_answer("Kintore");
			}
		else if (response == "Mayor")
			{
			say("@Mayor Gala is a fierce woman and will fight for the rights of Kintore's citizens, but she simply hates paperwork.@");
			UI_remove_answer("Mayor");
			}
		else if (response == "Seen any ex-dark monks lately?")
			{
			say("@I am sorry, but I am so busy that I do not normally pay attention to those who do not speak with me personally.@");
			UI_remove_answer("Seen any ex-dark monks lately?");

			}
		
		else if (response == "Prepare a scroll")
			{
			say("@I can prepare a scroll for you, you just need to tell me what it needs to contain.@");
			UI_remove_answer("Prepare a scroll");
			UI_add_answer("Scroll contents");
			}
		else if (response == "Scroll contents")
			{
			say("@As this is not being done by the company itself I can only assume that this is meant to fool someone... but I will not ask questions.@");
			say("@Regardless, I will need you to privide me with three objects to complete this task.@");
			say("@First, I will need a piece of the company letter head, which you can find at the company's head office.@");
			say("@Second, I will need a sample of Gabbie Mardoddle's full signature, which you may be able to obtain at the mining operation near DeathSquall Mountains. I believe they have an operations center on the south west portion of the island.@");
			say("@Finally, I will need a seal of the Solusek Mining Company. You will need to get this from the company's headquarters as well.@");
			say("@Bring these to me, along with 100 gold coins and I will prepare the scroll.@");
			UI_remove_answer("Scroll contents");
			}
		else if (response == "Scroll components")
			{
				if(chargeGold(100))
				{
				say("@Yes, these will do. Here let me prepare the scroll.@");
				say("@It is done. Take this scroll, and thank you for your payment. I wish you luck in whatever it is you are planning.@");
				UI_remove_party_items(1, GOOD_SCROLL, 61, 6); // Gabbies sig
				UI_remove_party_items(1, GOOD_SCROLL, 68, 2); // Company letterhead
				UI_remove_party_items(1, 1323, 0, 0); // Seal of the co.
				UI_add_party_items(1, GOOD_SCROLL, 69, 3); // Adds the scroll
				UI_remove_answer("Scroll components");
				gflags[FAKE_SCROLL] = false; // kills future fake scroll dialog
				}
				else
				{
					say("@While you may have the needed components you do not have enough gold coins to pay me.@");
				}
			}
		
		}
	UI_remove_npc_face(item);
	}
}
