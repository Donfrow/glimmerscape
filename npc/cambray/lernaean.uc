//Lernaean the hydra

void Find_Offspring()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            say("All three heads speak at once. @You are too kind. Please return and let us know when you have found out what became of the creators bloodline.@");
            gflags[FIND_BLOODLINE] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("All three heads look to the ground until the centre one speaks. @The creator always said most of his kind were heartless. I see not much has changed after all this time.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void LernaeanName()
{
    UI_push_answers();
    UI_add_answer("Avatar");
    UI_add_answer("Make up name");
    UI_add_answer("Lernaean");
    UI_add_answer("Noone");
    converse
    {
        if (response == "Avatar")
        {
            say("The heads perk up. @The creator used to mumble about the Avatar.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Make up name")
        {
            say("A puzzled look appears on all three heads. @You humans possess the oddest names, Make up name.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Lernaean")
        {
            say("The heads pause. @The creator never mentioned another Lernaean.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Noone")
        {
            say("The heads nod. @You humans are often very shy.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}


void Lernaean object#(0x45e) ()
	{
	
var bark = "Hail human";
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
        call Lernaean, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
        UI_show_npc_face(item);
        
if(gflags[HYDRA_NO_TALK])
{
    if(gflags[NICE_TRESSA])
    {
        say("The right head speaks. @We shall not speak to you until the offspring of Zarkane allows it.@");
    }
    else
    {
        say("@We do not wish to kill you. Please, leave us as the offspring of Zarkane demands.@");
    }
}
else
{
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");



if(gflags[CONVINCE_HYDRA])
{
    UI_add_answer("Obey me");
}

if(gflags[ZARKANE_DAUGHTER])
{
    say("Zarkane's offspring");
}

if (UI_get_item_flag(item, MET)) 
	{
		say("@Again you visit us.@");
		UI_remove_answer("Name");
	}
else
	{
	say("The massive beast looks at you. @It has been sometime since we have seen anyone here.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("All three heads stare at you and then speak in unison. @Goodbye.@");			
			break;
			}
		else if (response == "Name")
			{
			say("All three heads speak at once. @We are Lernaean. And who might you be?@");
			LernaeanName();
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("The heads look at each other. @Job? We do not make monetary gains in our existence, but that is not to say we do not have a purpose.@");
            UI_remove_answer("Job");
            UI_add_answer("Purpose");
            UI_add_answer("Existence");
        }
        else if (response == "Purpose")
        {
            say("The heads mumble to each other until the left one speaks. @Everything has a purpose, but we do not know what our purpose actually is.@");
            say("The middle head speaks. @The creator never told us what we were for.@");
            UI_remove_answer("Purpose");
        }
        else if (response == "Existence")
        {
            say("The right head speaks. @We did not exist until the creator brought us into this world.@");
            UI_remove_answer("Existence");
            UI_add_answer("Creator");
        }
        else if (response == "Creator")
        {
            say("The middle head looks at you. @The creator was a powerful mage called Zarkane but he passed away long ago. It was he and his progeny we serve.@");
            say("The left head speaks up. @I suppose you could call that our purpose, to serve the creator. For what reason exactly we do not know.@");
            gflags[ZARKANE_EXPERIMENT_INFO] = true;
            UI_remove_answer("Creator");
            UI_add_answer("Long ago");
        }
        else if (response == "Long ago")
        {
            say("Each head mumbles to each other until the left head speaks to you. @Generations of your kind have come and gone since the passing of the creator. We do not even know what has become of the creators progeny as we have been trapped in here since then.@");
            say("@Sadly, without the creator or knowledge of his progeny our existence is meaningless.@");
            UI_remove_answer("Long ago");
            UI_add_answer("Generations");
            UI_add_answer("Progeny");
            UI_add_answer("Trapped");
        }
        else if (response == "Generations")
        {
            say("All three heads laugh. As the laughter subsides the right head speaks to you. @Your kind live for less than 100 years. We do not know how long we shall live but we have yet to feel any signs of age upon us.@");
            UI_remove_answer("Generations");
        }
        else if (response == "Progeny")
        {
            say("The left head speaks. @The creator did have a daughter Marabella. She would come to this cave and visit us until the creator passed on.@");
			say("@We do not know if the bloodline died with her or if she bore at least one child.@");
            UI_remove_answer("Progeny");
            UI_add_answer("One child");
        }
        else if (response == "One child")
        {
			if (gflags[HYDRA_HYSTERIA])
			{
				say("The heads speak in unison with what appears to be tears from their eyes. @The bloodline no more. We have helped drive the bloodline to madness. We are truely a monster.@");
				say("The left head speaks. @Leave us to our sorrow for the rest of our days.@");
				break;
			}
			else
			{
            if (gflags[ZARKANE_DAUGHTER])
            {
                say("The heads look rather pleased. Finally the middle one speaks. @We cannot thank you enough for letting us know what happened to the one child. If only her offspring would visit us.@");
            }
            else
            {
                say("All three heads appear boggled. The centre head finally speaks @Are you that daft? The daughter of the creator must have bore at least one child for the bloodline to continue.@");
                if (gflags[FIND_BLOODLINE])
                {
                    say("@We shoud not be so harsh. You are helping us find what became of the creators bloodline. We apologize.@");
                }
                else
                {
                    say("The heads mumble to each other for a moment. @Would you discover what became of the creators bloodline for us? We would forever in your debt.@");
                    Find_Offspring();
                }
            }
            UI_remove_answer("One child");
			}
        }
        else if (response == "Trapped")
        {
            say("The right head speaks. @We have been here since the creator died. Before he perished he sealed us in here. We do not know why.@");
            UI_remove_answer("Trapped");
            UI_add_answer("What about food?");
        }
        else if (response == "What about food?")
        {
            say("The centre head speaks. @Small animals and other creatures occasionally find their way in here. We do not know how they get in but they nourish us sufficiently.@");
            UI_remove_answer("What about food?");
        }
        else if (response == "Obey me")
        {
            say("The heads look at you blankly. @We serve only the bloodline left behind by Zarkane.@");
            UI_remove_answer("Obey me");
        }
        else if (response == "Zarkane's offspring")
        {
            say("The heads look at each other in excitement as you tell them of Tressa. The left one finally speaks. @You have brought us wonderful news. We have wondered for many years what became of Marabella, and to finally know that she had a family of her own.@");
            say("The right head speaks up. @Perhaps one day this Tressa will visit us?@");
            UI_remove_answer("Zarkane's offspring");
        }
        
        }
		
	UI_remove_npc_face(item);
}
}	
	}

