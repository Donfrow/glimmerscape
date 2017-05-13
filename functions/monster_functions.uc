void KarmaGoodSlayTroll()
{
    UI_push_answers();
    UI_add_answer("I will bring justice");
    UI_add_answer("For 100 gold I will bring justice");
    
    converse
    {
        if (response == "I will bring justice")
        {
            say("The woman lets out a waterfall of tears. @I cannot thank you enough! I do not have much, but you make take whatever you wish from my house.");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "For 100 gold I will bring justice")
        {
            say("The woman lets out a waterfall of tears. @I do not have such coin. Justice will never be served.@");
            karma = 5000;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        
    }
}

void BeggerGiveCoinEvil()
{
    UI_push_answers();
    UI_add_answer("Go get a job you bum");
    UI_add_answer("Here is some coin");
    
    converse
    {
        if (response == "Go get a job you bum")
        {
            say("The begger looks only somewhat shocked and you suspect he has heard it before. He mutters to himself as he knows he will not get anything.");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
		
        else if(response == "Here is some coin")
		{
			if(chargeGold(1))
            {                say("The begger comes up and takes the gold coin. @Thank you, thank you. You are so kind! You have looked past greed and given some of your wealth to me. Please, take this lovely pinecone I found.@");
                karma = 5000;
                UI_add_party_items(1, 264, ANY, ANY); // add pinecone
            }
            else
            {
                say("The begger approaches and realizes you have no gold to give and mumbles off.");
            }
		
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
		
    }	
}




void DarkMonkTalk(npc)
{
    if(event == DOUBLECLICK)
    {

	UI_show_npc_face(620, 0);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

var random_convo = UI_get_random(3);

if(random_convo == 1)
{
    say("@I see the darkness in your eyes.@");
}	
else if (random_convo == 2)
{
say("@Another one who seeks the darkness.@");
}
else if (random_convo == 3)
{
say("@We love the leader.@");
}

if (random_convo == 1)
{
converse
{
	if (response == "Bye")
	{
		say("@I do hope you die soon...@");
		break;
	}
	else if (response == "Name")
		{
		say("@We do not require names for the darkness does not discern.@");
		UI_remove_answer("Name");
		}
	else if (response == "Job")
		{
		say("@To become one with the darkness...@");
		UI_remove_answer("Job");
		}
}
}

else if (random_convo == 2)
{
converse
{
	if (response == "Bye")
			{
			say("@The darkness beckons you.@");			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Joe. We are all Joe.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@My purpose is to see the darkness and embrace it.@");
			UI_remove_answer("Job");
			}
}
}

else if (random_convo == 3)
{
converse
{
	if (response == "Bye")
	{
		say("@Yes, yes seek the darkness.@");			
		break;
	}
	else if (response == "Name")
	{
		say("@I no longer go by a name. The darkness seeks only my obedience.@");
		UI_remove_answer("Name");
	}
	else if (response == "Job")
	{
		say("@The darkness must be saught and obeyed.@");
		UI_remove_answer("Job");
	}

}
}
UI_remove_npc_face(item);

    }
}

void DemonTalk()
{
    if(event == DOUBLECLICK)
    {

	UI_show_npc_face(273, 0);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

var random_convo = UI_get_random(2);

if(random_convo == 1)
{
    say("@What do you want?@");
}	
else if (random_convo == 2)
{
say("@Beware of our domain.@");
}

if (random_convo == 1)
{
converse
{
	if (response == "Bye")
			{
			say("@I hope you do not make it out of here alive...@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I care not to explain such things to your kind.@");
			UI_remove_answer("Name");
			UI_add_answer("My kind");
			}
		else if (response == "Job")
			{
			say("@Sadly it is not to slay the likes of you...@");
			UI_remove_answer("Job");
			}
		else if (response == "My kind")
		{
		  say("@Pathetic little human you are. I care not for your tongue. Begone.@");
		  UI_remove_answer("My kind");
		  break;
        }
}
}

else if (random_convo == 2)
{
converse
{
	if (response == "Bye")
			{
			say("@Do not return.@");			
			break;
			}
		else if (response == "Name")
			{
			say("@It is none of your concern.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I do not need to explain myself to one who invades our realm.@");
			UI_remove_answer("Job");
			UI_add_answer("Invade");
			}
		else if (response == "Invade")
		{
		  say("@Your kind think you can waltz into any realm you please. I care not for you.@");
		  UI_remove_answer("Invade");
        }

}

		}
	UI_remove_npc_face(item);

    }
}

void Exeter_Skeleton_Talk()
{
    if(event == DOUBLECLICK)
    {
    var face_frame = UI_die_roll(0, 1);
	UI_show_npc_face(277, face_frame);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("What happened here?");
		UI_add_answer("Bye");	

var random_convo = UI_get_random(2);

if(random_convo == 1)
{
    say("@I can... speak...@");
}	
else if (random_convo == 2)
{
say("@Conversation... so long...@");
}

if (random_convo == 1)
{
converse
{
	if (response == "Bye")
			{
			say("@Do not leave me like this...@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@My... name... I have a name?@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Long ago... job was had... what am I to do?@");
			UI_remove_answer("Job");
			}
		else if (response == "What happened here?")
            {
            say("@The light... the bright light... the shaking... what has happened to me?@");
		    UI_remove_answer("What happened here?");
            }
}
}

else if (random_convo == 2)
{
converse
{
	if (response == "Bye")
			{
			say("@Please... help me...@");			
			break;
			}
		else if (response == "Name")
			{
			say("@I... cannot recall.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I... sought knowledge... is that what I did?@");
			UI_remove_answer("Job");
			}
		else if (response == "What happened here?")
            {
            say("@The great light... stuck like this...@");
		    UI_remove_answer("What happened here?");
            }
}
}
else if (random_convo == 3)
{
converse
{
	if (response == "Bye")
			{
			say("@Do not leave me...@");			
			break;
			}
		else if (response == "Name")
			{
			say("@My mind... I cannot remember...@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I... did something...@");
			UI_remove_answer("Job");
			}
		else if (response == "What happened here?")
            {
            say("@A great light... now this... what has happened here?@");
		    UI_remove_answer("What happened here?");
            }
}
}

	UI_remove_npc_face(item);

    }
}

void KarmaBeggerTalk()
{
    if(event == DOUBLECLICK)
    {
    var face_frame = UI_die_roll(0, 1);
    
if (face_frame == 0)
{
    UI_show_npc_face(480);
}
else
{
    UI_show_npc_face(481);
}

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

var random_convo = UI_get_random(2);

if(random_convo == 1)
{
    say("The begger looks at you and speaks. @Could you please spare some coin?@");
}	
else if (random_convo == 2)
{
say("The begger hobbles over to you and speaks. @Please, spare a coin for an unfortunate soul?@");
}

if (random_convo == 1)
{
converse
{
	if (response == "Bye")
			{
			say("The begger mumbles as he leaves.");			
			break;
			}
		else if (response == "Name")
			{
			say("The begger looks shocked. @It has been far too long since anyone has cared to know my name.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("The begger lifts out his arm. @I am reduced to begging for a job. Could you spare some coin?@");
			BeggerGiveCoinEvil();
			UI_remove_answer("Job");
			}
}
}

else if (random_convo == 2)
{
converse
{
	if (response == "Bye")
			{
			say("The begger looks at you and hobbles off mumbling.");			
			break;
			}
		else if (response == "Name")
			{
			say("The begger looks startled. @Why, noone has asked my name before. But I am sure you do not truely care to hear it.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("The begger smiles with a crooked grin. @Could you spare a gold coin?@");
			BeggerGiveCoinEvil();
			UI_remove_answer("Job");
			}
}
}
	UI_remove_npc_face(item);

    }
}

void KarmaGoodWomanTalk()
{
    if(event == DOUBLECLICK)
    {
    UI_show_npc_face(439);
    say("The woman before you seems to be rather sad and holding back a waterfall of tears. @What do you wish?@");
    UI_add_answer("Name");
    UI_add_answer("Job");
    UI_add_answer("Bye");
    
    converse
    {
        if (response == "Bye")
        {
            say("The woman snivels as she waves you off.");
            break;
        }
        else if (response == "Job")
        {
            say("The woman answers meekly. @I was a wife and mother until the terrible troll took that away from me.@");
            UI_remove_answer("Job");
            UI_add_answer("Troll");
        }
        else if (response == "Name")
        {
            say("The sense as if the woman will burst into tears at any moment. @You may call me Susanna.@");
            UI_remove_answer("Name");
        }
        else if (response == "Troll")
        {
            say("The womans voice is full of sorrow, yet also anger. @Past the swamp in a cave lives a troll. It murdered my husband after he caught him slaying my daughter. Now I have noone in the world.@");
            say("The woman looks you in the eye. @I am too weak to bring justice to the beast, would you go slay the troll so that justice may be served?@");
            KarmaGoodSlayTroll();
            UI_remove_answer("Troll");
        }
    }
    }
}
