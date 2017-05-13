/* Melinda (Shelter lady)
*/
			
void Melinda object#(0x4f5) ()
	{
var bark = "How can I help you?";
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
				UI_item_say(item, "Please stop that");
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
        call Melinda, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);
if (UI_get_item_flag(item, 28)) 
	{
	say("@Welcome back to the shelter.@");
	}
else
	{
	say("@Welcome to the shelter for those down on their luck.@");
	say("@You may stay as long as you wish.@");
	UI_set_item_flag(item, 28, true);
	}
	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{
	if (response == "Bye")
			{
			say("@Good journey to you.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Melinda.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I operate the shelter here just south of Dewtopia.@");
			UI_remove_answer("Job");
			UI_add_answer("Shelter");
			}
		else if (response == "Shelter")
			{
			say("@The shelter here is for those down on their luck. One cannot be blamed for the misfortunes that befall them.@");
			UI_remove_answer("Shelter");
			UI_add_answer("Misfortunes");
			}
		else if (response == "Misfortunes")
			{
			say("@Storms, goblins, a many number of things can bring one to mine shelter.@");
			UI_remove_answer("Misfortunes");
			UI_add_answer("Storms");
			UI_add_answer("Goblins");
			UI_add_answer("Many things");
			}
		else if (response == "Storms")
			{
			say("@A sailors livelyhood depends on the sea. A storm damaging, or worse yet, sinking their vessel can years of work, or ruin them.@");
			say("@So I feel it is my duty to help those in need.");
			UI_remove_answer("Storms");
			}
		else if (response == "Many things")
			{
			say("@I have heard far too many tales of woe in my many years running this shelter.@");
			say("@One which sticks out in particular was a man that was badly burnt when a powder keg exploded in his home just north of Dewtopia.@");
			say("@He had lost all his belongings and was permanently scarred. He had lived in the shelter for several months.@");
			say("@I believe he eventually moved back into the crumbled remains of his home.@");
			UI_remove_answer("Many things");
			}
		else if (response == "Goblins")
			{
			say("@The inner city of Dewtopia is protected, but there are those whom are stuck outside the protective walls.@");
			say("@With ever increasing goblin raids those who escape from a goblin attack are lucky to escape with their own lives, let alone their possessions.@");
			say("@So, naturally I do what I can to help them in my shelter. It is a pity Lord Dew will not give me any help to fix it.@");
			UI_remove_answer("Goblins");
			UI_add_answer("Lord Dew");
			}
		else if (response == "Lord Dew")
			{
			say("@He is a well enough man to those inside the walls, but those of us out here could use more help.@");
			say("@If he took one convicted felon from the sugar caves and put him to work on the shelter, it would not be in such disarray.@");
			UI_remove_answer("Lord Dew");
			UI_add_answer("But why trust a felon to fix the shelter?");
			}
		else if (response == "But why trust a felon to fix the shelter?")
			{
			say("@It is my belief that most sent to toil in the Sugar Caves are not guilty of anything that demands such a harsh punishment.@");
			say("@But I dare not speak that to Lord Dew, lest I end up there myself.@");
			UI_remove_answer("But why trust a felon to fix the shelter?");
			}
/*		else if (response == "Why trust a felon to fix the shelter?");
			{
			say("@It is mine belief that most sent to toil in the sugar caves are not guilty of anything that demands such a harsh punishment.@");
			say("@But I dare not speak that to Lord Dew, lest I end up there myself.@");
			UI_remove_answer("Why trust a felon to fix the shelter?");
			}*/
		}
	UI_remove_npc_face(item);
	}
}
