/*  Jeroan the Jail Guard # 2
*/

void Jeroan object#(0x4f3) ()
	{
		
var bark = "What can I do for you?";
var bark_intro = "Hail";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "Zzzz...");
			return;
			}
		if (UI_get_schedule_type(item) == 30)
			{		// Desk Work.
			UI_item_say(item, "So much paperwork...");
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (n == 1)
			UI_item_say(item, "I am the law");
		else if (n == 2)
			UI_item_say(item, "Noone better cross me");
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
        call Jeroan, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{
		
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
	say("@I see you are remaining lawful.@");
	}
else
	{
	say("@You best not be breaking any laws in my town or you will be shown to my jail.@");
	UI_set_item_flag(item, MET, true);
	}

if (gflags[ENTER_SUGAR_CAVES])
	{
	UI_add_answer("Key to Sugar Caves");
	gflags[ENTER_SUGAR_CAVES] = false;
	}
	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{
	if (response == "Bye")
			{
			say("@Do not break any laws.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Jeroan.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am one of two full time guards at the Dewtopian Prison.@");
			UI_remove_answer("Job");
			UI_add_answer("Dewtopian Prison");
			}
		else if (response == "Dewtopian Prison")
			{
			say("@The scoundrals and trouble makers come here before they are set free for minor crimes, or sent to toil in the underground sugar caves.@");
			say("@Though if you ask me, they all belong in toiling in the caves.@");
			UI_remove_answer("Dewtopian Prison");
			UI_add_answer("Minor Crimes");
			UI_add_answer("Underground sugar caves");
			}
		else if (response == "Minor Crimes")
			{
			say("@Minor crimes in Dewtopia consist of such things as petty theft, public disturbances and vandalism.@");
			say("@This does not include minor crimes that occur outside the walls. We only concern outselves with that when those ruffians enter Dewtopia and cause problems.@");
			UI_remove_answer("Minor Crimes");
			UI_add_answer("Outside the walls");
			}
		else if (response == "Outside the walls")
			{
			say("@Our main concern consists of keeping the inner city running. Trouble outside the walls is usually dealt with by those who reside outside.@");
			say("@Though there are times I wish I had power outside these walls. Poor Melinda runs a shelter to the south of the city which seems to attract nothing but trouble makers.@");
			UI_remove_answer("Outside the walls");
			UI_add_answer("Melinda");
			UI_add_answer("Shelter");
			}
		else if (response == "Melinda")
			{
			say("@A fine woman, but she cares about others too much. The residents of her shelter not treat her well because they know they can get away with it.@");
			say("@I say she should abandon her cause and move within the city walls and settle down.@");
			UI_remove_answer("Melinda");
			}
		else if (response == "Shelter")
			{
			say("@The shelter provides food and shelter to shipwrecked sailors, beggers, and other unsavoury characters that people like us would not consort with.@");
			UI_remove_answer("Shelter");
			}
		else if (response == "Underground sugar caves")
			{
			say("@I escort those convicted of major crimes to the sugar caves where they toil for however long Lord Dew sees fit.@");
			UI_remove_answer("Underground sugar caves");
			UI_add_answer("Major crimes");
			UI_add_answer("Lord Dew");
			}
		else if (response == "Lord Dew")
			{
			say("@He is my liege and ruler of this fine city.@");
			UI_remove_answer("Lord Dew");
			}
		else if (response == "Major crimes")
			{
			say("@Major crimes consist of such things as murder, theft from the Royal Mint and angering Lord Dew.@");
			say("@In fact, our newest guest was caught trying to steal from the Royal Mint.@");
			UI_remove_answer("Major crimes");
			UI_add_answer("Newest guest");
			}
		else if (response == "Newest guest")
			{
			say("@Do not let him fool you for he is certainly a smooth talker. He claims he is innocent but he was caught on red handed.@");
			UI_remove_answer("Newest guest");
			UI_add_answer("Red handed");
			}
		else if (response == "Red handed")
			{
			say("@He was found in the dead of night on top of the castle. Directly over top of the Royal Mint. With tools for breaking through stone no less.@");
			say("@He claims he is innocent but only a fool would believe he had no plans to rob the mint. It is nearly certain he will be sent to the sugar caves for this.@");
			UI_remove_answer("Red handed");
			}
		else if (response == "Key to Sugar Caves")
			{
			say("@Ah yes, I have heard of your heroic deeds and knighthood. It is my honour to give you your key to the Sugar Caves.@");
			say("@Not many other than those who have official business there bother to venture there but here is your key none the less. Be careful not to lose it as you only get one.@");
			UI_add_party_items(1, 641, 16, 29);
			UI_remove_answer("Key to Sugar Caves");
			}
		}
	UI_remove_npc_face(item);
	}
	}
