//Old Man Mardin in Cambray



void Zarkane_History()
{
    UI_push_answers();
    UI_add_answer("Nothing");
    UI_add_answer("Who was he?");
    
    converse
    {
        if(response == "Nothing")
        {
            say("@Alright.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Who was he?")
        {
            say("Mardin furrows his brow. @Zarkane was before my time but as I child I often heard stories about him. But you will not hear stories from the townsfolk about him anymore.@");
            say("Mardin pauses. @Where to begin? Well, Zarkane was a powerful mage who lived in a house on the western portion of the island. Some thought he was mad, others thought he was brilliant.@");
            say("@It is even rumoured that he his ideas were so far fetched, or feared, I am not sure which, that he was exiled from Exeter. Regardless, he ended up on Cambray with his wee daughter.@");
            say("@As Cambray grew and became known for being the place where Arthis fell many people were fearful someone would attempt to regain Arthis's power.@");
            say("Mardin wheezes. @Unfortunately this paranoia made Zarkane a prime target for this fear. It was not long before the townsfolke became uneasy and went to arrest Zarkane.@");
            say("@Zarkane was captured and a farce of a trial was carried out, where he was sentenced to death. I was never told exactly how they put him to death but I cannot imagine it was pretty.@");
            UI_remove_answer("Who was he?");
            UI_add_answer("What of his daughter?");
            UI_add_answer("What do you think?");
        }
        else if (response == "What of his daughter?")
        {
            say("@Ayup. As paranoid as the townsfolke were they were not about to execute a wee babe. Or a young girl. I cannot recall exactly how old she was said to be, but I digress.@");
            say("@She was adopted by the Milton family, who were into the fishing business, and put to work at the docks. Noone spoke to her about her father, but there were plenty of whispers behind her back.@");
            say("It seems as if a tear is about to form. @I always felt sorry for her when I heard the stories about how she was treated.@");
            gflags[ZARKANE_DAUGHTER] = true;
            UI_remove_answer("What of his daughter?");
        }
        else if (response == "What do you think?")
        {
            say("Mardin looks to be in deep thought. @Folks do not normally ask me such a thing, but I reckon that if Zarkane was a powerful mage and down right evil he would have butchered his captors.@");
            say("@The fact that there are no ruins or tales of his capture lead me to believe he had faith in the judicary proces up until his death, and was not after power for himself.@");
            UI_remove_answer("What do you think?");
        }
    }
}

void Spectral_Tower_Talk()
{
    UI_push_answers();
    UI_add_answer("Nothing");
    UI_add_answer("Zarkane the Mage");
    UI_add_answer("What is it?");
    UI_add_answer("Where is it?");

    converse
    {
        if(response == "Nothing")
        {
            say("@Alright.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Zarkane the Mage")
        {
            say("@What would you like to know about him?@");
            Zarkane_History();
            UI_remove_answer("Zarkane the Mage");
        }
        else if (response == "What is it?")
        {
            say("@The stories that I have heard is that Zarkane created creatures so dangerous that he essentially needed a fortress to keep them contained.@");
            say("@Although fear has kept people out of the tower since Zarkane was put to death, one can still hear whispers from the children about what monsters still reside within.@");
            UI_remove_answer("What is it?");
            UI_add_answer("Creatures");
        }
        else if (response == "Where is it?")
        {
            say("Mardin looks around. @It is to the south east... no wait, the northeast... no northwest of Cambray. It is only reachable by boat as it is not actually on the island.@");
            UI_remove_answer("Where is it?");
        }
        else if (response == "Creatures")
        {
            say("Mardin chuckles. @Ayup. Supposedly some sort of mix between different species. The only one I ever heard mentioned is a mix between a dragon and a serpent though.@");
            UI_remove_answer("Creatures");
            UI_add_answer("Dragon-serpent");
        }
        else if (response == "Dragon-serpent")
        {
            say("You cannot tell if Mardin is shaking due to his age or out of fear. @Said to be some sort of three headed hybrid beast which would eat you slowly, while still alive.@");
            say("@I suppose only Zarkane knows for sure as folks are too afraid to enter the tower to investigate.@");
            UI_remove_answer("Dragon-serpent");
            UI_add_answer("What do you think?");
        }
        else if (response == "What do you think?")
        {
            say("Mardin stares blankly for a moment. @I suppose that if such a beast existed it would have escaped the tower long ago.@");
            say("Mardin pauses. @Then again, if Zarkane was as powerful as they say then surely he had powerful magic locking it in until he was ready to unleash it upon the world.@");
            say("@I guess I do not know what I think.@");
            UI_remove_answer("What do you think?");
        }
    }

}

void Mardin object#(0x56d) ()
	{
	
var bark = "Who? What?";
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
				UI_item_say(item, "Yar har har");
			else if (n == 2)
				UI_item_say(item, "Where are my false teeth?");
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
        call Mardin, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");

if(gflags[MARDIN_TALK])
{
    UI_add_answer("Zarkane the Mage");
    UI_add_answer("Spectral tower");
}

if(gflags[HYDRA_HYSTERIA])
{
	UI_add_answer("Everyone is dead!");
}

UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("Mardin looks around. @Who, what?@");
		UI_remove_answer("Name");

	}
else
	{
	say("The old man looks at you. @Why, I have not seen you since your funeral. How have you been?@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("The man stares off into space.");			
			break;
			}
		else if (response == "Name")
			{
			say("The man looks confused. @That is a good question. Marzo? Matrix? Mardin? Yes, Mardin is my name!@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I have a job?@");
            UI_remove_answer("Job");
        }
        else if (response == "Zarkane the Mage")
        {
            say("Mardin's demeanour completely changes. @Most people do not know of him or prefer willfully do not bring it up. What would you like to know?@");
            Zarkane_History();
            UI_remove_answer("Zarkane the Mage");
        }
        else if (response == "Spectral tower")
        {
            say("Mardin looks shocked. @Not many folk mention that tower. It is said to have belonged to Zarkane the Mage. What is it you would like to know about it?@");
            Spectral_Tower_Talk();
            UI_remove_answer("Spectral tower");
        }
		else if (response == "Everyone is dead!")
		{
			say("Mardin peers at you. @Ayup. Most of my friends have passed due to old age.@");
			UI_add_answer("Tressa killed everyone");
			UI_remove_answer("Everyone is dead!");
		}
		else if (response == "Tressa killed everyone")
		{
			say("@Ayup. Tressa is a fine lady. I never took her for a millwright though. Where is everyone anyway?@");
			UI_remove_answer("Tressa killed everyone");
			UI_add_answer("Everyone is dead!");
		}


        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

