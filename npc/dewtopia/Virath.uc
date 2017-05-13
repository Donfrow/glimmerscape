/*
Brother trapped in sugar caves
*/

void Virath object#(0x54a) ()
	{

var bark = "What brings you into this hole?";
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
				UI_item_say(item, "I am innocent");
			else if (n == 2)
				UI_item_say(item, "What did I do to deserve this");
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
        call Virath, TALK;
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
	say("@Hail again.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Hail.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
if (gflags[MET_BROTHER])
	{
	UI_add_answer("Rivath is trying to rescue you");
	}
if (gflags[BROTHER_DEAD])
	{
	UI_remove_answer("Rivath is trying to rescue you");
	UI_add_answer("Your brother was trying to rescue you");
	}

		converse
		{
	if (response == "Bye")
			{
			say("@Leave me to toil...@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Virath.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@My job is to toil for mere morsals of bread here in the Sugar Caves.@");
			UI_remove_answer("Job");
			UI_add_answer("Toil");
			}
		else if (response == "Toil")
			{
			say("@I was but a mere traveling merchant when a bandit who had infultraded Dewtopia managed to get me sent here.@");
			say("@He accused me of being a bandit and had enough sway to get me stuck in here. I am now here indefinately.@");
			UI_remove_answer("Toil");
			UI_add_answer("Indefinately");
			}
		else if (response == "Indefinately")
			{
			say("@I put up a big fight when they tried to arrest me. I injured a guard severely so even if my innocence is proven I shall remain here.@");
			UI_remove_answer("Indefinately");
			}
		else if (response == "Rivath is trying to rescue you")
			{
			say("@The kind boy! As you are a Dewtopian knight I am not sure why you have not arrested him already so you have my thanks.@");
			say("@If I could repay you I would but surely you would not care for a piece of my moldy bread.@");
			UI_remove_answer("Rivath is trying to rescue you");
				if (gflags[BROTHER_DEAD])
				{
				UI_add_answer("Rivath has killed himself");
				}
			}
		else if (response == "Rivath has killed himself")
			{
			say("@You say Rivath has blown himself up attempting to rescue me? That is truely a shame.@");
			say("@He was never one to heed warnings when given to him. He was far too rash when he wished to complete a plan of his.@");
			say("@I suppose with noone left on the outside to try to free me I will never see my freedom from this accursed place.@");
			UI_remove_answer("Rivath has killed himself");
			}
		else if (response == "Your brother was trying to rescue you")
			{
			say("@You say my brother Rivath has blown himself up attempting to rescue me? That is truely a shame.@");
			say("@He was never one to heed warnings when given to him. He was far too rash when he wished to complete a plan of his.@");
			say("@I suppose with noone left on the outside to try to free me I will never see my freedom from this accursed place.@");
			UI_remove_answer("Your brother was trying to rescue you");
			}

		}
	UI_remove_npc_face(item);
	}
}
