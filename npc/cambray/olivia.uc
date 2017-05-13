//Olivia in Cambray


void ArthisTale()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            say("A big smile appears. @Generations ago the island of Cambray had no settlement but soon it would become a turning point in history.@");
            say("@At this time point in history a Death Knight known as Arthis roamed the lands wielding a sword of destruction known as The Black Sword. With this sword he was able to strike down any foe and everyone in the lands feared him.@");
            say("@Knowing his power Arthis would cause terror to any who displeased him or stepped in his way all. For many years all of Desporia lived in fear.@");
            say("@Overtime Arthis gained followers and greater terror ensued until a brave warrior named Elena decided that someone must make a stand.@");
            say("@Elena set out upon the land telling all who would listen know that she would face Arthis alone on the island on Cambray, knowing that Arthis would be unable to resist such a challenge. Many were certain that Elena would meet her demise.@");
            say("@Elena travelled to Cambray and waited. As she had predicted Arthis and his band of goons showed up, laughing at the woman who dared to challenge Arthis. But history was about to change.@");
            say("@Arthis wielded his sword intent on using the power to strike Elena down with ease but the sword would not work. Arthis, having lost much of his combat skill by relying on the sword, charged Elena where a mighty clash ensued.@");
            say("@Neither of the fighters were able to inflict much of damange until Arthis landed a critical blow, mortally wounding Elena. But Elena would not let Arthis continue his reign of terror.@");
            say("@As Arthis gloated and mocked his wounded opponent Elena gained a burst of strength, driving her sword directly through the Death Knights heart. Arthis fell immediately, with a smirk still on his face.@");
            say("@Arthis's followers, shocked and filled with rage, brutally beat the already dying victor to death.@");
            say("@After desecrating Elena's lifeless body they took Arthis's body to a small cavern on this very island to act as a tomb. It is to this day where his body still lies.@");
            say("@Do you have any questions?@");
            UI_add_answer("How did she stop the magic of The Black Sword?");
            UI_add_answer("What became of Elena?");
            UI_add_answer("What became of The Black Sword?");
			UI_add_answer("Nevermind");
            UI_remove_answer("Yes");
			UI_remove_answer("No");
        }
        else if (response == "No")
        {
            say("Olivia looks disapointed. @Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
		else if (response == "Nevermind")
		{
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
		}
        else if (response == "How did she stop the magic of The Black Sword?")
        {
            say("Olivia smiles. @This is a very common question. There are many ideas but the general consensus is she was so pure of heart that she was able to wear the fabled Donal's Breastplate of Mourning.@");
            UI_remove_answer("How did she stop the magic of The Black Sword?");
            UI_add_answer("Donal's Breastplate of Mourning");
        }
        else if (response == "Donal's Breastplate of Mourning")
        {
            say("@The breastplate is said to be blessed with the power of light and goodness by Donal Ultor. It is unknown for certain if Elena actually wore the fabled armor as her body was ravaged and found naked after her victory.@");
            UI_remove_answer("Donal's Breastplate of Mourning");
        }
        else if (response == "What became of Elena?")
        {
            say("@After word of victory spread many travelled to Cambray. The first to arrive found Elena's body ravaged and naked. Her body was placed in one of the mountains, directly south of where her monument now stands.@");
            UI_remove_answer("What became of Elena?");
        }
        else if (response == "What became of The Black Sword?")
        {
            say("@Noone knows exactly what became of the weapon after Arthis fell as no further stories or records mention it. However it is generally believed one of his followers took it.@");
            UI_remove_answer("What became of The Black Sword?");
        }
    }
}


void Olivia object#(0x569) ()
	{
	
var bark = "Well met";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if(gflags[HYDRA_HYSTERIA])
		{
		}
		else
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
				UI_item_say(item, "Learn your history");
			else if (n == 2)
				UI_item_say(item, "Beautiful Cambray");
			}
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
        call Olivia, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");

UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@I am glad that you are enjoying Cambray.@");
		UI_remove_answer("Name");
	}
else
	{
	say("A pleasent smile greets you. @Welcome to Cambray.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("@Do enjoy your stay.@");			
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me Olivia.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I am a historian and keeper of Lady Elena's monument here in Cambray.@");
            UI_remove_answer("Job");
            UI_add_answer("Historian");
            UI_add_answer("Monument");
            UI_add_answer("Cambray");
        }
        else if (response == "Historian")
        {
            say("@While I am not officially the towns historian I know most of the relevant history and am also married to the mayor. I do think that gives me enough legitimacy.@");
            UI_remove_answer("Historian");
            UI_add_answer("Mayor");
        }
        else if (response == "Mayor")
        {
            say("@The mayor is my husband Morrison. He is a wonderful man. I am glad that the citizens of Cambray elected such a great leader.@");
            UI_remove_answer("Mayor");
        }
        else if (response == "Monument")
        {
            say("@The monument is a wonderful statue of Lady Elena who was the great warrior who managed to slay the Death Knight Arthis.@");
			say("@Would you like to hear the tale of Lady Elena?@");
            ArthisTale();
            UI_remove_answer("Monument");
        }
        else if (response == "Cambray")
        {
            say("@Cambray is a wonderful island and city is it not? The tomb of Lady Elena is even found here. Sadly, the tomb of Death Knight Arthis is as well.@");
            UI_remove_answer("Cambray");
            UI_add_answer("Tomb of Lady Elena");
            UI_add_answer("Tomb of Arthis");
        }
        else if (response == "Tomb of Lady Elena")
        {
            say("@If you wish you can visit Lady Elena's tomb whenever you please. It is located directly south of her monument.@");
            UI_remove_answer("Tomb of Lady Elena");
        }
        else if (response == "Tomb of Arthis")
        {
            say("Olivia scowls. @The tomb of that horrible man is found in one of the mountain ranges here. Noone is allowed to enter it unless on official business, which is quite rare.@");
            say("@Some people wish to have it open much like Lady Elena's tomb in an effort to attract more tourists. I cannot believe anyone would want to visit such a place!@");
            UI_remove_answer("Tomb of Arthis");
        }


        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

