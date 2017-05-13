/*
Floyden the scholar outside cotton cove
*/

void Floyden_First()
{

UI_push_answers();
converse(["Create Food", "Cure","Detect Trap","Light","Telekinesis","Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Create Food" (remove):
	buySpell(50, 0);


	case "Cure" (remove):
	buySpell(50, 1);

		
	case "Detect Trap" (remove):
	buySpell(50, 2);

	case "Light" (remove):
	buySpell(50, 5);
	
	case "Telekinesis" (remove):
	buySpell(50, 7);

}	
}

void Floyden_Second()
{
UI_push_answers();
converse(["Awaken", "Destroy Trap", "Great Light", "Heal", "Protection", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Awaken" (remove):
	buySpell(50, 8);
	
	case "Destroy Trap" (remove):
	buySpell(50, 9);

	case "Great Light" (remove):
	buySpell(50, 12);
	
	case "Heal" (remove):
	buySpell(50, 13);

	case "Protection" (remove):
	buySpell(50, 15);
	
}	
}

void Floyden_Third()
{
UI_push_answers();
converse(["Enchant Missle", "Protect All", "Paralyze", "Sleep", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Enchant Missle" (remove):
	buySpell(50, 18);

	case "Protect All" (remove):
	buySpell(50, 20);

	case "Paralyze" (remove):
	buySpell(50, 21);
	
	case "Sleep" (remove):
	buySpell(50, 22);
	
}	
}

void Floyden_Fourth()
{
UI_push_answers();
converse(["Mass Curse", "Unlock Magic", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Mass Curse" (remove):
	buySpell(50, 28);
	
	case "Unlock Magic" (remove):
	buySpell(50, 31);
	
}	
}

void Floyden_Fifth()
{
UI_push_answers();
converse(["Dispel Field", "Explosion", "Great Heal", "Invisibility", "Mass Sleep", "Erstam's Surprise","Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Dispel Field" (remove):
	buySpell(50, 33);
	
	case "Explosion" (remove):
	buySpell(50, 34);
	
	case "Great Heal" (remove):
	buySpell(50, 35);
	
	case "Invisibility" (remove):
	buySpell(50, 36);
	
	case "Mass Sleep" (remove):
	buySpell(50, 37);
	
	case "Erstam's Surprise" (remove):
	buySpell(50, 39);
	
}	
}

void Floyden_Sixth()
{
UI_push_answers();
converse(["Betray", "Cause Fear", "Create Ammo", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Betray" (remove):
	buySpell(75, 40);
	
	case "Cause Fear" (remove):
	buySpell(75, 42);
	
	case "Create Ammo" (remove):
	buySpell(75, 46);
	
}	
}
void Floyden_Seventh()
{
UI_push_answers();
converse(["Energy Field", "Energy Mist", "Mass Awaken", "Mass Might", "Poison Mist", "Restoration","Vibrate", "Lightning", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Energy Field" (remove):
	buySpell(75, 48);
	
	case "Energy Mist" (remove):
	buySpell(75, 49);
	
	case "Mass Awaken" (remove):
	buySpell(75, 50);
	
	case "Mass Might" (remove):
	buySpell(75, 51);
	
	case "Poison Mist" (remove):
	buySpell(75, 52);
	
	case "Restoration" (remove):
	buySpell(75, 53);
	
	case "Vibrate" (remove):
	buySpell(75, 54);
	
	case "Lightning" (remove):
	buySpell(75, 55);
	
}	
}

void Floyden_Eighth()
{
UI_push_answers();
converse(["Delayed Blast", "Swordstrike", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Delayed Blast" (remove):
	buySpell(100, 58);
	
	case "Swordstrike" (remove):
	buySpell(100, 63);
	
}	
}

void Floyden_Ninth()
{
UI_push_answers();
converse(["Invisible All","Spiral Missile", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Invisible All" (remove):
	buySpell(100, 66);
	
	case "Spiral Missile" (remove):
	buySpell(100, 67);
	
}	
}




void Floyden_Learn_Spells()
{
UI_push_answers();
converse(["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	
	case "First" (remove):
	say("@What spell are you interested in?@");
	Floyden_First();
	
	case "Second" (remove):
	say("@What spell are you interested in?@");
	Floyden_Second();
	
	case "Third" (remove):
	say("@What spell are you interested in?@");
	Floyden_Third();
	
	case "Fourth" (remove):
	say("@What spell are you interested in?@");
	Floyden_Fourth();
	
	case "Fifth" (remove):
	say("@What spell are you interested in?@");
	Floyden_Fifth();
	
	case "Sixth" (remove):
	say("@What spell are you interested in?@");
	Floyden_Sixth();
	
	case "Seventh" (remove):
	say("@What spell are you interested in?@");
	Floyden_Seventh();
	
	case "Eighth" (remove):
	say("@What spell are you interested in?@");
	Floyden_Eighth();
	
	case "Ninth" (remove):
	say("@What spell are you interested in?@");
	Floyden_Ninth();
	
}
}

void Floyden_Supplies()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("@Wonderful! I was expecting three crates of supplies. I will expect nothing less from you.@");
	gflags[RETRIEVE_FLOYDEN_SUPPLIES] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("Floyden huffs. @You would not be able to retrieve them anyway.@");
}
}


void Floyden object#(0x5ba) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Can you not see I am busy?";
var bark_intro = "Hail";
var supplies = UI_count_objects(PARTY, LAB_SUPPLIES, ANY, ANY);

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
				UI_item_say(item, "This is an interesting result");
			else if (n == 2)
				UI_item_say(item, "I think I've got it!");
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
        call Floyden, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@Oh, it is you again.@");
	if(gflags[RETURNED_FLOYDEN_SUPPLIES])
	add(["Learn spells"]);
}
else
{
	say("@It is about time you showed up with those supplies. Oh, you are not you Devlin.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

if(gflags[RETRIEVE_FLOYDEN_SUPPLIES])
{
	if(supplies >= 1)
	{
		add(["Lab supplies"]);
	}
}

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
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@Do not touch anything on your way out.@");
	break;
		
	case "Name" (remove):
	say("@If you must know I am Floyden.@");
	
	case "Job" (remove):
	say("The man laughs. @I am a scholar, a teacher, a seeker of knowledge. I uncover the mysteries of the world.@");
	add(["Scholar", "Teacher", "Seeker of knowledge", "Mysteries"]);

	case "Scholar" (remove):
	say("@You know, one who is learned, one who possesses knowledge. It is questions such as these why I live outside the cities.@");
	add(["Cities"]);
	
	case "Cities" (remove):
	say("@I could live in such places as Brentonia or Dewtopia and not have to worry about supplies but then I would be bothered more often by the likes of you.@");
	say("@Though every now and then someone such as yourself do manage to find their way to my humble abode to pester me.@");
	if(gflags[RETURNED_FLOYDEN_SUPPLIES])
	{
	}
	else
	{
		say("@And speaking of supplies, where in the world is Devlin with my latest shipment.@");
		add(["Devlin"]);
	}
	add(["Brentonia", "Dewtopia"]);
	
	case "Devlin" (remove):
	say("@I hired Devlin and his wife some time ago to bring me the supplies I require for my work from various locations around the world.@");
	say("@They have not arrived with my latest shipment in sometime. I do hope the bandits did not intercept them as I need those supplies to continue my work.@");
	if(gflags[RETRIEVE_FLOYDEN_SUPPLIES])
	{
	}
	else
	{
		say("Floyden eyes you up. @If you were willing to go and retrieve my supplies I would be willing teach you various spells for a small fee. Do you agree to this?@");
		Floyden_Supplies();
	}
	
	case "Brentonia" (remove):
	say("The man rolls his eyes. @Brentonia is on the northern part of this continent but it is filled such commoners who would interupt me at every moment.@");
	say("@But why do I bother explaining this to you? I am not your geography teacher.@");
	
	case "Dewtopia" (remove):
	say("Floyden laughs. @Now there is a city full of buffoons and ignoramuses. But why do I bother to speak of this to one such as yourself? No doubt you are the same as them.@");
	
	case "Teacher" (remove):
	say("@I am a teacher of magic but I only teach to those I feel are worthy of my teachings.@");
	if(gflags[RETURNED_FLOYDEN_SUPPLIES])
	{
		say("@As I mentioned I am willing to teach you some of my spells as you have proven yourself to be useful.@");
		add(["Learn spells"]);
	}
	else
	{
		say("@As you have done nothing for me I see no reason why I should even bother extending my services to you... not that you could comprehend them anyway.@");
	}
	
	case "Seeker of knowledge" (remove):
	say("@One cannot hope to understand the ways of the world if they do not seek out knowledge. It is for this reason that I have made the pursuit of knowledge my lifes work.@");
	say("@Would I be able to create marvels of the world such as my hard headed servant here if not for knowledge? No. One could not. It is for reasons such as this I seek knowledge.@");
	add(["Servant"]);
	
	case "Servant" (remove):
	say("@My servant is a beast of pure rock with life imbued into it. Strong as a cyclops yet hard as a rock. It never needs to sleep, it never needs to eat. It is nearly perfection if not for its lack of intellect.@");
	say("@Still, with such a protector no bandit, goblin or anyone else would dare trouble me.@");
	add(["Pure rock", "Bandits", "Goblins"]);
	
	case "Pure rock" (remove):
	say("Floyden grins. @I am managed to unlock the secrets to bring none life into a moving, nearly living form.@");
	say("He points to the creature of rock. @Before this beast was nothing but a boulder, but now it moves and lives. It can even communicate in a crude fashion.@");
	add(["Communicate"]);
	
	case "Communicate" (remove):
	say("Floyden seems exceptionally proud of his creation. @It is quite a simple beast but it is able to learn extremely basic communication skills.@");
	say("@But I did not create it for conversation, merely as a body guard.@");
	
	case "Bandits" (remove):
	say("@The surrounding plains are littered with scoundrels and thieves. If it were not for my servant they would have slain me many times over.@");
	say("Floyden released a boisterous laugh. @Sometimes they still do attempt to attack me but my servant makes quick, and messy, work of them.@");
	if(gflags[RETURNED_FLOYDEN_SUPPLIES])
	{
		say("@I almost feel bad for sending Devlin out their unprotected but I paid him well enough for the risk he took. I suppose he should have used some of that money for a bodyguard.@");
	}
	else
	{
		say("@No doubt it is their fault that my supplies are quite past their expected arrival time.@");
	}
	
	case "Goblins" (remove):
	say("Floyden crinches his face in disguist. @Vile creatures. Luckily for me they do not normally travel down this far south. I would hate to smell their vile stench day after day.@");
	
	case "Mysteries" (remove):
	say("@There are so many mysteries in this world yet most of the time simpletons merely live day to day not seeking to unlock the secrets this world has hidden.@");
	say("@This knowledge is what drives us, gives us our daily pleasures. Someone must unlock it. Someone must get the credit for such discoveries.@");
	
	case "Lab supplies" (remove):
	if(supplies >= 3)
	{
		say("When you present the supplies to Floyden a somber expression appears on his face. @I suppose since you are delivering them poor Devlin has met his end. However that is the risk he took.@");
		say("@I shall not dwell on it.@");
		say("@As you have brought me these much needed supplies I am now willing to teach you spells, should your mind be able to handle such knowledge.@");
		say("@Thank you for your prompt service.@");
		gflags[RETURNED_FLOYDEN_SUPPLIES] = true;
		gflags[RETRIEVE_FLOYDEN_SUPPLIES] = false;
		UI_remove_party_items(3, LAB_SUPPLIES, ANY, ANY);
		add(["Learn spells"]);
	}
	else
	{
		say("@I told you I was expecting three crates of supplies and I will expect nothing less!@");
	}
	
	case "The Plains Rider" (remove):
	say("Floyden rubs his chin for a moment. @Hmm, that name sounds familiar. I think that was the brutish fellow who attempted to intimidate me into paying gold to him in exchange for protection.@");
	say("@Of course, with my servant here I had no use for such a service. I offered to pay him if he would protect my supply convoys but he seemed more interested in getting paid to do nothing.@");
	say("@He would hear none of it though. I have no idea where he went after I told him, in no uncertain terms, to go lost.@");
	
	case "Learn spells" (remove):
	var spell_book = UI_count_objects(PARTY, 761, ANY, ANY);
	if(spell_book > 0)
	{
		say("@It will cost 50 gold coins for spells in the first to fifth circle, 75 gold coins for spells in the sixth to seventh circle and 100 gold coins for spells in the eigth and ninth circle.@");
		say("@What circle are you looking to learn?@");
		Floyden_Learn_Spells();
	}
	else
	{
		say("@You do not have a spellbook!@");
	}
}

}
}

