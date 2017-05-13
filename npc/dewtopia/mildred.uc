/* Mildred wife farmer outside of walls
*/

void Mildred object#(0x528) ()
	{

var bark = "Greetings";
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
				UI_item_say(item, "Such toil for so little");
			else if (n == 2)
				UI_item_say(item, "So much work");
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
        call Mildred, TALK;
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
	say("@Returned again have we?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to my farm.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
if(gflags[KILL_PLAINSRIDER_HECTAR] || gflags[KILL_PLAINSRIDER])
{
	if(UI_is_dead(-500))
	{
	}
	else
	{
		add(["The Plains Rider"]);
	}
}
	
		converse
		{
	if (response == "Bye")
			{
			say("@Farewell.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Mildred.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I work on this farm with my husband Hildar.@");
			UI_remove_answer("Job");
			UI_add_answer("Farm");
			UI_add_answer("Hildar");
			}
		else if (response == "Farm")
			{
			say("@It is a difficult task but Hildar and I manage, despite the goblins and bandits.@");
			UI_remove_answer("Farm");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			}
		else if (response == "Hildar")
			{
			say("@He is not the richest man in the lands but I do love him.");
			UI_remove_answer("Hildar");
			}
		else if (response == "Goblins")
			{
			say("@Foul creatures, but not very bright. Occasionally they wander over to our unprotected farms to pillage.@");
			say("@But for the most part seem to be fixated on attacking the wall.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@At least goblins do not attack their own kind, unlike the bandits. They choose to attack the weakest of us without regard for what will happen to their victims.@");
			say("Mildred scowls. @We are easy targets for them so they are constantly stealing from us, and to top it off they mock us for being poor after they have robbed us!@");
			say("@I hope one day they encounter a troll from the catacombs, then we will see how tough they are.@");
			UI_remove_answer("Bandits");
			UI_add_answer("Easy targets");
			UI_add_answer("Catacombs");
			}
		else if (response == "Easy targets")
			{
			say("@Though we supply Dewtopia with much food we are not well protected. The rare time we get a guard to assist us it is one of the trainee's who is too inexperienced to be much help.@");
			say("@At the moment Rufus comes around occasionally, but he thinks too highly of himself.@");
			say("@But I suppose it is better than nothing.@");
			UI_remove_answer("Easy targets");
			UI_add_answer("Rufus");
			}
		else if (response == "Rufus")
			{
			say("@He is a knight in trainee from the inner city. He is a small man that believes he is destined for greatness.@");
			say("@He is known among us as Rufus the Small, though he is large in ego.@");
			UI_remove_answer("Rufus");
			gflags[RUFUS] = true;
			}
		else if (response == "Catacombs")
		{
			say("@To the north of our field lies an entrance to a series of tunnels which spans beneath Dewtopia. Rumour has it that it is inhabited by trolls.@");
			say("Mildred shakes her head. @But you will never hear anyone inside the walls mention anything of it. They prefer to think of it as an 'outer wall problem' since that is where the entrance lies.@");
			UI_remove_answer("Catacombs");
		}
		else if (response == "The Plains Rider")
		{
			say("She cringes. @I heard that man is quite the brute. He does not come here very much though. Hildar may know more about it than I do.@");
			UI_remove_answer("The Plains Rider");
		}
		}
	UI_remove_npc_face(item);
	}
}
