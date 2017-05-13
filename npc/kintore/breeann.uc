/*
Elren the boat guy on Kintore island
*/



void Breeann object#(0x4ae) ()
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
				UI_item_say(item, "Try the mutton");
			else if (n == 2)
				UI_item_say(item, "Slow business lately");
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
        call Breeann, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@What can I get for you today?@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
	}
else
	{

	say("@Welcome to Kintore.@");
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
			say("@I do hope you return some time.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Breeann, and might I add it is a pleasure to meet you.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I run the Chicken's Thigh here in Kintore. Nowhere else on the island will you find such succulent moresals of food to calm your growling belly.@");
			UI_remove_answer("Job");
			UI_add_answer("Buy");
			UI_add_answer("Kintore");
			UI_add_answer("Chicken's Thigh");
			}

		else if (response == "Chicken's Thigh")
			{
			say("@It is a rather unappealing name I admit however I bought it from an old man some time ago and have never gotten around to changing it.@");
			say("@To be honest, I do not think I ever will. Despite unpleasent name it has started to grow on me.@");
			UI_remove_answer("Chicken's Thigh");
			}
		else if (response == "Kintore")
			{
			say("@Surely you know where you are? This is Kintore, the only city on Kintore Island!");
			UI_remove_answer("Kintore");
			UI_add_answer("Kintore Island");
			}
		else if (response == "Kintore Island")
			{
			say("@It is a mid size island with a mountain range through the centre. I shudder to say the Dark Monks have taken up home here.@");
			UI_remove_answer("Kintore Island");
			UI_add_answer("Dark Monks");
			}
		else if (response == "Dark Monks")
			{
			say("@The Dark Monks are a cult of those who worship dark magic and death. They tend to stay in their asylum to the far east of the island at least.@");
			say("@Though they recently took poor Ashele during the night. It is horrible for me to say but I hope that Ashele will satisfy their hunger so that they do not return.@");
			UI_remove_answer("Dark Monks");
			UI_add_answer("Ashele");
			}
		else if (response == "Ashele")
		{
			say("@Ashele was a fine woman, mother and wife. Sadly the Dark Monks took her from the city one night for their disgusting rituals. We all fear her to be dead.@");
			say("@Although her sudden disappearence has effected us all, I feel much sorrow for poor Joth.@");
			UI_remove_answer("Ashele");
			UI_add_answer("Joth");
		}
		else if (response == "Joth")
		{
			say("@Joth was Ashele's husband. He loved her dearly and has been quite broken up since her disappearence. Hopefully one day he will be able to move on.@");
			UI_remove_answer("Joth");
		}
		else if (response == "Seen any ex-dark monks lately?")
			{
			say("@I cannot say that I have. I could not imagine them letting one leave the covenant alive.@");
			UI_remove_answer("Seen any ex-dark monks lately?");
			}
		else if (response == "Buy")
		{
			say("@An excellent idea! My food is the tastiest this side of Desopria. What do you desire?@");
			var muttoncost = 12;
			var beefcost = 20;
			var fowlcost = 15;
			var hamcost = 13;
			BuyMeat(muttoncost, beefcost, fowlcost, hamcost);
			UI_remove_answer("Buy");
		}
		
		
}		}
	UI_remove_npc_face(item);
	}

