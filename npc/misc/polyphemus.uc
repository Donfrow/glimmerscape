/*
Polyphemus the cyclops on kintore island
*/

void PolyphemusSoulConvo()
{
UI_push_answers();
UI_add_answer("What happened to the minor orbs after that?");
converse
{
	if(response == "Nevermind")
	{
		say("@Very well.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
	}
	else if (response == "What happened to the minor orbs after that?")
	{
		say("@The minor orbs were protected by my race to prevent others from abusing their power.@");
		say("@You should seek out a cyclops named Arges who lives in the western forest of the mainland for he knows more than I. Let him know I have sent you.@");
		say("@As for the the Orb of Souls, it came under my guard. That is, until I lost it to the Dark Monks.@");
		gflags[TALK_TO_CYCLOPS2] = true; // Talk to another cyclops on the mainland
		UI_add_answer("Lost it");
		UI_add_answer("Dark Monks");
		UI_remove_answer("What happened to the minor orbs after that?");
	}
	else if (response == "Lost it")
	{
		say("@I had been living on this island long before the Dark Monks came here. I thought it to be safe but at some point they learned I possessed the orb and attacked.@");
		say("@They took the the orb and nearly my life.@");
		say("@Had it not been for Zorphos I would have surely died of my wounds afterwards.@");
		UI_remove_answer("Lost it");
		UI_add_answer("Zorphos");
	}
	else if (response == "Zorphos")
	{
		say("@He came across me gravely wounded shortly after the Dark Monks attacked and took the Orb of Souls. He was kind enough to help me regain my health and strength.@");
		say("@It is for this reason that I consider Zorphos, and his colleagues, to be a friend of my people.@");
		UI_remove_answer("Zorphos");
	}
	else if (response == "Dark Monks")
	{
		say("@They are a cult which worships dark magic. I believe they view the Orb of Souls as the ultimate object of dark power.@");
		say("@I have tried to retrieve it but I cannot get into their garrison to the east. Doors so strong even I cannot break them down.@");
		say("@Perhaps you could find a disillusioned member who managed to escape alive and still possesses a key to the asylum if you wish to retrieve the orb.@");
		say("@If there is any former member of the cult surely the citizens of Kintore would know as they despise the Dark Monks more than anything else.@");
		gflags[SEE_MONKS_ABOUT_ORB] = true;
		UI_remove_answer("Dark Monks");
	}
}
}

void MinorOrbConvo()
{
UI_push_answers();

	say("@The MageLord Akakothen created the five minor orbs your kind has sought for ages. He later combined them to form the Orb of Infinity.@");
	say("@What of them would you like to know, friend of Zorphos?");
	UI_add_answer("Orb of Transfiguration");
	UI_add_answer("Orb of Persuasion");
	UI_add_answer("Orb of Chaos");
	UI_add_answer("Orb of Focus");
	UI_add_answer("Orb of Souls");
	UI_add_answer("Orb of Infinity");
	UI_add_answer("Nevermind");

	converse
	{

	if (response == "Orb of Transfiguration")
		{
		say("@This orb is the birth mother of my people. This is the first orb the MageLord Akakothen created and use in his pursuit of ultimate power.@");
		say("@He thought he had achieved his dream with this orb but all he could do with it was blend matter together. He even blended human and giants together to create the cyclops race.@");
		say("@However unlike many others Akakothen had sufficient skill to use the orb. Those who do not possess sufficient skill will create a being of twisted flesh and madness.@");
		say("@I am thankful Akakothen possessed the skill needed to do this.@");
		UI_remove_answer("Orb of Transfiguration");
		}
	else if (response == "Orb of Persuasion")
		{
		say("@In MageLord Akakothen's attempt to bend time and space at will he created the Orb of Persuasion.@");
		say("@The result is not what he had wished for but it was still useful for him. Instead of the ability to bend time and space, the orb allowed the bearer to bend the will of others.@");
		say("@A mere suggestion by the holder of this orb would cause those who heard it to do as said. Of course, like the other orbs, one must possess the skill to be able to use the orb successfully.@");
		UI_remove_answer("Orb of Persuasion");
		}
	else if (response == "Orb of Chaos")
		{
		say("@This orb is an extremely dangerous orb. MageLord Akakothen did manage to bend time and space using it but the orb was nearly uncontrollable.@");
		say("@If the orb remained in one spot too long it would distort time and space in an unrecognizeable way.@");
		say("@Yet, intelligent use of the orb can allow the wielder to change the landscape in a beneficial way but even the slightest miscalculation can ruin a landscape.@");
		say("@In fact the Noxious Swamp on the mainland is a result of this orbs power to ruin the land and render it twisted and unusable.@");
		UI_remove_answer("Orb of Chaos");
		}
	else if (response == "Orb of Focus")
		{
		say("@The Orb of Focus possess much power. This orb allows the energy from the very planes of existence to be harnessed and focused onto what the wielder desires.@");
		say("@This can be quite deadly in the hands of one who wishes to do harm... or one who is lacking in sufficient skill to use it.@");
		say("@Using this orb MageLord Akakothen was able use its focusing power to help bind itself and the other four orbs together in order to construct the Orb of Infinity.@");
		say("@I do not believe he would have had the required energy to perform this task had it not been for this orb.@");
		UI_remove_answer("Orb of Focus");
		}
	else if (response == "Orb of Souls")
		{
		say("@MageLord Akakothen sought to not only control time and space, but the very fabric of a persons being. One cannot escape the influence of this orb even in death.@");
		say("@Since its creation no creature is able to pass onto the next world when they die as the orbs power permeates throughout the realm.@");
		say("@The souls of the dead remain in a state of limbo as a result.@");
		say("@The undead which wander these lands are tormented even moreso by the existence of this orb.@");
		say("@It causes them to become twisted and tormented and once slain the essence remains in this state, even while in limbo.@");
		UI_remove_answer("Orb of Souls");
		}
	else if (response == "Orb of Infinity")
		{
		say("@Upon completion of the five orbs MageLord Akakothen realized that he could not create what he sought at once, and that his previous five failures where in fact what he required.@");
		say("@He realized that by combining the five orbs into one their powers would be strengthened and augmented.@");
		say("@Unfortunately his thirst for power had left the empire in which he ruled in shambles and the citizens began to revolt.@");
		say("@Yet throughout his quest he was unconcerned by this and when he finally succeeded he had managed to create the Orb of Infinity.@");
		say("@Dismally he was blinded by the power and did not realize that although the orb granted the power he sought, it was too unstable even for an adept mage like himself to handle.@");
		say("@I do not know exactly what occurred but the Orb of Infinity shattered draping a blinding light was seen throughout the land. Afterwards, the minor orbs were again seperate.@");
		UI_remove_answer("Orb of Infinity");
		PolyphemusSoulConvo();
		}
	else if (response == "Nevermind")
		{
		say("@As you wish.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}	



	}


}





void Polyphemus object#(0x411) ()
	{

var bark = "I mean you no harm";
var bark_intro = "Hail creature";

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
				UI_item_say(item, "I have failed");
			else if (n == 2)
				UI_item_say(item, "I am a disapointment");
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
        call Polyphemus, TALK;
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
		say("@Welcome again, small one.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@What do you want of me?@");
		UI_set_item_flag(item, MET);
	}
// End MET Flag

var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);

if (gflags[TALK_TO_CYCLOPS])
{
	if(gflags[POLYPHEMUS_FRIEND])
	{
		UI_add_answer("Orbs");
	}
	else
	{
		UI_add_answer("Zorphos sent me");
	}
}
if (has_soul_orb > 0)
{
	UI_add_answer("I have recovered the Orb of Souls");
}

		converse
		{

	if (response == "Bye")
			{
			say("@Farewell, small one.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Very few people ask a cyclops his name, usually they just attack. I see you art different. I am Polyphemus.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@If by job you mean purpose, than I no longer have a purpose, for I have failed.@");
			UI_remove_answer("Job");
			UI_add_answer("Failed");
			}
		else if (response == "Failed")
			{
			say("@I will not speak of it, leave me be.@");
			break;
			}
		else if (response == "Zorphos sent me")
			{
			say("@I have not seen Zorphos in some time. I do hope he is well. But why did he send you to me?@");
			UI_add_answer("Orbs");
			UI_remove_answer("Zorphos sent me");
			}
		else if (response == "Orbs")
			{
			MinorOrbConvo();
			gflags[POLYPHEMUS_FRIEND] = true;
			UI_remove_answer("Orbs");
			}
		else if (response == "I have recovered the Orb of Souls")
		{
			say("The cyclops almost appears as if it is humbled. @I am forever in your debt for removing the Orb of Souls from the possession of the Dark Monks.@");
			say("@As you are a friend of my people and as I have already failed to protect it the Orb of Souls is now yours to do with as you feel is best.@");
			UI_remove_answer("I have recovered the Orb of Souls");
		}



		}
	UI_remove_npc_face(item);
	}
}
