/*
Captain Lucid at Dante's Trading Post
*/

void Lucid object#(0x456) ()
	{

var bark = "Why do you bother me at such a time?";
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
				UI_item_say(item, "Such a disaster");
			else if (n == 2)
				UI_item_say(item, "So many men lost");
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
        call Lucid, TALK;
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
		say("@Misfortune has not shined on you yet I see.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@I hope that misfortune does not see to you.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{

	if (response == "Bye")
			{
			say("@May misfortune be blind to ya.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I be Captain Lucid.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I be Captain of the Lusitania. Though, not much of me crew remains.@");
			UI_remove_answer("Job");
			UI_add_answer("Lusitania");
			UI_add_answer("Crew");

			}
		else if (response == "Lusitania")
			{
            say("@Tis me ship at the docks here at the trading post. I am lucky she still be afloat.@");
			UI_remove_answer("Lusitania");
			}
        else if (response == "Crew")
            {
            say("@Of me crew of eight, only two remain.@");
            UI_remove_answer("Crew");
            UI_add_answer("What happened?");
            }
         else if (response == "What happened?")
            {
                say("@Me ship had been hired to search out a lost vessel that the Solusek Mining Company had sent out to retreive an artifact of some sort. What we found was a terrible sight.@");
				say("@What we found was the ship encased in ice and its crew frozen... so we took what we could of the ships cargo, including the artifact, and set sail through the icy waters.@");
                say("@Misfortune decided to shine upon us that day... we ran into a chunk of ice which damaged the hull and we had no choice but to go ashore on an icy island.@");
				say("@We had nearly completed repairs when the Yeti attacked us. Most of my men were slain as we hastily cast off the shores.@");

                UI_remove_answer("What happened?");
                UI_add_answer("Yeti");
                UI_add_answer("Men");
            }
         else if (response == "Yeti")
         {
            say("@It seems the icy island we landed on was home to the fur covered beasts. I tried to save me crew but it was not possible. May they rest in peace.@");
            UI_remove_answer("Yeti");
         }
         else if (response == "Men")
         {
            say("@The only men which survived, along side me, was Pippens the Swabbie and Klemens. Not only did I lose many of my men to the yeti, but I lost the artifact to them as well.@");
            UI_remove_answer("Men");
            UI_add_answer("Pippens the Swabbie");
            UI_add_answer("Klemens");
            UI_add_answer("Artifact");
         }
         else if (response == "Pippens the Swabbie")
         {
            say("@Tis the newest member of my crew. A young lad who had high hopes. I do not think he will ever be the same after the yeti attack.@");
            UI_remove_answer("Pippens the Swabbie");
         }
         else if (response == "Klemens")
         {
            say("@Klemens is me right hand man. He saved me life on many occasions in the past. I am glad he was able to survive the Yeti onslaught.@");
			say("@That is not to say I am glad others did not, but at least me loyal friend Klemens did.@");
            UI_remove_answer("Klemens");
         }
         else if (response == "Artifact")
         {
            say("@It was an orb of some sort. It matters not now. The yeti have the chest it was in and it would be suicide to try and retrieve it from them.@");
            
            if (gflags[GOT_KEY])   // After pestering him to get key AND being on the main orb quest or just getting him to give it to you
                {
                    say("@And now that ye have the key to the chest ye can go kill yourself trying to get it back if ye so desire.@");
					UI_add_answer("Yeti's location");
                    UI_remove_answer("Artifact");
                }
            else
            {
            say("@I still have the key but I suppose tis not much use now.@");
            UI_remove_answer("Artifact");
            UI_add_answer("I want the key");
            }
            
         }
         else if (response == "I want the key")
         {
            say("@Why would ye be wanting that? Do ye think ye can go and retrieve the chest? It would be suicide!@");
            UI_remove_answer("I want the key");
            UI_add_answer("Just give me the key");
         }
         else if (response == "Just give me the key")
         {
            say("@I am not going to give it to ye so that ye can go and kill yourself!@");
            UI_remove_answer("Just give me the key");
            UI_add_answer("What can I do?");
         }
         else if (response == "What can I do?")
         {
            say("@With all due respect to your combat abilities, I do not wish to cause more deaths. I already killed most of me crew and I will not be going to let strangers get butchered on behalf of me.@");
			say("@There is nothing ye can do unless it be for something so important even I think it worth risking yer life for.@");
            say("@And do not think of murdering me for it. Ye will not succeed if ye try.@");
            UI_remove_answer("What can I do?");
            
            if (gflags[ON_MAIN_QUEST]) // If you are on the main quest given by zorphos
            {
                UI_add_answer("Important Quest");
            }
			else
			{
				UI_add_answer("How about 200 gold?");
			}
            
         }
		 else if (response == "How about 200 gold?")
		 {
			say("He sighs. @If ye are so desperate that ye would pay to kill yerself have the damn key.@");
			UI_add_party_items(1, KEY, 128, 11);
			gflags[GOT_KEY] = true;
			UI_remove_answer("How about 200 gold?");
		 }
         else if (response == "Important Quest")
         {
            say("You tell the captain of your quest for the Orbs. @That be quite the fanciful tale ye have there to try and get the key. Ye almost had me believing ye.@");
            UI_remove_answer("Important Quest");
            UI_add_answer("Keep trying");
         }
         else if (response == "Keep trying")
         {
            say("@Fine fine here is the damn key. If ye wish to go and kill yourself fine. Do not say I encouraged ye. Now will you please stop bugging me about that damned artifact!@");
            UI_remove_answer("Keep trying");
            gflags[GOT_KEY] = true;
			UI_add_answer("Yeti's location");
            UI_add_party_items(1, KEY, 128, 11);
         }
		 else if (response == "Yeti's location")
		 {
			say("@Ye really are serious about searching this thing out I see. So be it, the last bearing I saw on me sextant was 101 North 40 West.@");
			UI_remove_answer("Yeti's location");
		 }
		}
	UI_remove_npc_face(item);
	}
}
