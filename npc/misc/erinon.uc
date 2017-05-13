/*
Erinon at the healing spring
*/



void Erinon_Who_Train()
{
UI_push_answers();

party_members = UI_get_party_list();
party_members_count = UI_get_array_size(party_members);

var x = party_members_count;

while(x > 1)
{
var name = UI_get_npc_name(party_members[x]);
add(name);
x = x-1;

}

converse(["Myself","Noone"])
{

	case "Noone" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Myself" (remove):
	if(UI_get_npc_prop(AVATAR, TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop(AVATAR, DEXTERITY);
		var currentCombat = UI_get_npc_prop(AVATAR, COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train you. You are already as proficient as I and would not learn anything.@");
		}
		else
		{
			say("Erinon looks at you. @You look like you are a skilled figher but show me how you would actually act against an opponent.@");
			say("As you swing your weapon at an invisible opponent Erinon watches intently. @I see some flaws in your techniques. Watch me closely.@");
			say("Erinon does a series of moves against an invisible opponent as you watch on. @Do you see how my feet were coordinated with the movement of my arms?@");
			say("@Keep your movement graceful and your strikes deadly and your opponent will be confused, then dead. Practice what you have seen and you too will be a great fighter.@");
			var maxDex = (30-currentDex);
			if (maxDex > 0)
				maxDex = 1;
					
			var maxCombat = (30-currentCombat);
			if (maxCombat > 2)
				maxCombat = 2;
				
			//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
				
			UI_set_npc_prop(AVATAR, DEXTERITY, maxDex);
			UI_set_npc_prop(AVATAR, COMBAT, maxCombat);
			UI_set_npc_prop(AVATAR, TRAINING, -1);		
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}

	case "Sentri" (remove):
	if(UI_get_npc_prop((-421), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-421), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-421), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train you. You are already as proficient as I and would not learn anything.@");
		}
		else
		{
			say("Erinon looks Sentri up and down. @It would appear as if you are a sailor. No doubt this has taught you how to be nimble. Let me see your skills.@");
			say("As Sentri swings his weapon Erinon watches. @You are indeed nimble but you tend to fumble too much, almost as if you are still compensating for the waves. Watch me.@");
			say("Erinon does a quick series of movements before speaking again. @Do you see how my feet and arms were coordinated? You must know what the other parts of your body are doing.@");
			say("Sentri tries again as Erinon watches. @I see you understand what I am saying though you must continue to make sure not to compensate for the waves.@");
			say("@Continue this and you will surely be a skilled warrior.@");
			var maxDex = (30-currentDex);
			if (maxDex > 0)
				maxDex = 1;
					
			var maxCombat = (30-currentCombat);
			if (maxCombat > 2)
				maxCombat = 2;
				
				
			UI_set_npc_prop((-421), DEXTERITY, maxDex);
			UI_set_npc_prop((-421), COMBAT, maxCombat);
			UI_set_npc_prop((-421), TRAINING, -1);		
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
		
	case "Rufus" (remove):
	if(UI_get_npc_prop((-301), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-301), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-301), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train you. You are already as proficient as I and would not learn anything.@");
		}
		else
		{
			say("Erinon laughs. @I do not mean it as a sign of disrespect. You can use this to your advantage to avoid incoming blows. Let me see you attack.@");
			say("As Rufus attacks Erinon nods. @Indeed, you are quite nimble but you seem to overstress your swings, almost as if you are trying to compensate for your size.@");
			say("@While you may not be able to land a deadly blow everytime you can use your size to avoid any incoming blows. Do not try to prove yourself as this will lead to your death.@");
			say("@If you take what I say to heart you will be a fierce warrior. And remember, even if it takes two strikes to slay your opponent, the opponent is still dead.@");
			var maxDex = (30-currentDex);
			if (maxDex > 0)
				maxDex = 1;
					
			var maxCombat = (30-currentCombat);
			if (maxCombat > 2)
				maxCombat = 2;
				
				
			UI_set_npc_prop((-301), DEXTERITY, maxDex);
			UI_set_npc_prop((-301), COMBAT, maxCombat);
			UI_set_npc_prop((-301), TRAINING, -1);		
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
	

	case "Rannick" (remove):
	if(UI_get_npc_prop((-6), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-6), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-6), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train you. You are already as proficient as I and would not learn anything.@");
		}
		else
		{
			say("Erinon nods. @You look to be as if you are a fierce warrior who has let some of his skills squander over time. But we shall see. Show me your attack.@");
			say("As Rannick attack Erinon watches. @I see my assessment was correct. I can tell at one point you were in complete coordination but you have let this skill slip away.@");
			say("@Remember to focus on what every part of your body is doing as you swing your weapon. I can tell you once had this skill, you simply must find it again.@");
			say("@Continue to practice and your skills will surely return.@");
			var maxDex = (30-currentDex);
			if (maxDex > 0)
				maxDex = 1;
					
			var maxCombat = (30-currentCombat);
			if (maxCombat > 2)
				maxCombat = 2;
				
				
			UI_set_npc_prop((-6), DEXTERITY, maxDex);
			UI_set_npc_prop((-6), COMBAT, maxCombat);
			UI_set_npc_prop((-6), TRAINING, -1);		
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
	
	
	case "Julia" (remove):
	if(UI_get_npc_prop((-151), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-151), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-151), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train you. You are already as proficient as I and would not learn anything.@");
		}
		else
		{
			say("Erinon smiles at Julia. @It is always a pleasure to see another female in the field of battle. Let me see what skills you possess.@");
			say("As Julia swings Erinon nods. @I would enjoy being against you in the battlefield for you are an easy target. You leave too much of yourself open to a killing strike.@");
			say("Erinon does a slow attack, indicating to Julia the vital areas she had left open to the enemy. @While you cannot always be fully protected you must not present a vital area to your enemy to strike.@");
			say("@In many instances quick work on your feet will only leave these areas open for a brief moment, and during that time your opponent will have no choice but to try to avoid your incoming attack.@");
			say("@If you keep your movements quick and nimble your opponent will never have the chance to attack you in these places. Keep this in mind, and you will surely become a dangerous opponent.@");
			var maxDex = (30-currentDex);
			if (maxDex > 0)
				maxDex = 1;
					
			var maxCombat = (30-currentCombat);
			if (maxCombat > 2)
				maxCombat = 2;
				
				
			UI_set_npc_prop((-151), DEXTERITY, maxDex);
			UI_set_npc_prop((-151), COMBAT, maxCombat);
			UI_set_npc_prop((-151), TRAINING, -1);		
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}	

	case "Tseramed" (remove):
	if(UI_get_npc_prop((-162), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-162), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-162), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train you. You are already as proficient as I and would not learn anything.@");
		}
		else
		{
			say("Erinon looks at Tseramed. @You look like you are quick on your feet. Come at me and show me what skills you have.@");
			say("Tseramed makes a swing at Erinon which she quickly counters. @You are skillful but it seems like you are unsure where you want your blade to travel. See where you wish it to lands. Try again.@");
			say("Tseramed makes another swing at Erinon. @That was much better this time. Continue focusing and you will see your blade hits its target with greater accuracy, giving you more time determine the next move.@");
			var maxDex = (30-currentDex);
			if (maxDex > 0)
				maxDex = 1;
					
			var maxCombat = (30-currentCombat);
			if (maxCombat > 2)
				maxCombat = 2;
				
				
			UI_set_npc_prop((-162), DEXTERITY, maxDex);
			UI_set_npc_prop((-162), COMBAT, maxCombat);
			UI_set_npc_prop((-162), TRAINING, -1);		
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}	
	
	case "Skynet" (remove):
	say("@I cannot train a machine!@");
	
	case "Artemis" (remove):
	UI_show_npc_face(1);
	say("@I do not have time for this. Take me to the mining operation right this instant!@");
	
	case "Markus" (remove):
	UI_show_npc_face(545);
	say("@Do you not have anything better to do than try and improve your prisoners combat skills?@");
	
	case "Bains" (remove):
	say("@This man seems off. He should not be here... you must have some sort of weird teleporting power otherwise he shouldn't be with you...@");
	say("@Perhaps you should take him back to the entrance of the goblin caves, I believe he may decide to leave you on his own...@");
	
	case "Darnella" (remove):
	say("@You seem out of sorts. You do not want to be here, do you?@");
	528->show_npc_face1(0);
	say("@That's for sure! I am with this fellow for salvage operations only and wish to return to my business as soon as possible.@");
	
}

}

void Erinon_Train()
{
UI_push_answers();

converse(["Yes", "No"])
{

	case "Yes" (remove):
	say("@Who do you wish to train with me?@");
	Erinon_Who_Train();
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("@As you so desire.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}

void Erinon_Spiderslay()
{
UI_push_answers();

converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("@You are truely a noble spirit. If you do not mind, please destroy some of the spider eggs while you are down there.@");
	say("The woman stops and thinks. @I have a key around here somewhere to my chest of old equipment. You are welcome to take it.@");
	gflags[KILL_SPIDER_QUEEN] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("@I understand. It would most certainly be suicide for you.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	
}

}

void Erinon_Allegiance()
{

UI_push_answers();

converse(["Brentonia", "Dewtopia", "Myself", "Noone"])
{

	case "Brentonia" (remove):
	say("The woman stares at you. @I have not heard of such a place.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Dewtopia" (remove):
	say("The woman stares at you. @I have not heard of such a place.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Myself" (remove):
	say("The woman stares at you. @I see, you are the type who is only after gains for yourself.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Noone" (remove):
	say("The woman stares at you. @I see, you are a wanderer, unsure of what you should do with your days.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Erinon object#(0x5a4) ()
	{
var head = UI_count_objects(PARTY, 1459, ANY, ANY);
var scroll = UI_count_objects(PARTY, GOOD_SCROLL, 88, ANY);
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "It has been some time...";
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
				UI_item_say(item, "I shall protect it");
			else if (n == 2)
				UI_item_say(item, "It must be kept safe");
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
        call Erinon, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The woman smiles. @It certainly is nice to speak with someone again.@");
	
}
else
{
	say("@It has been sometime since I have encountered someone... what is your allegiance?@");
	Erinon_Allegiance();
	add(["Name"]);	
}
if(scroll > 0)
{
add(["Scroll"]);
}

if(gflags[KILL_SPIDER_QUEEN] && head > 0)
{
	add(["Spider Queens head"]);
}

converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("The woman smiles. @I do hope you are safe in your travels.@");
	break;
	
	case "Name" (remove):
	say("The woman sighs. @It has been so long since anyone has asked me such a thing. I am Erinon.@");
	UI_set_item_flag(item, MET, true);
	
	case "Job" (remove):
	say("A moment of silence is brought about by the question. @My job is to protect the healing spring from any future expeditions that Akakothen may send. I cannot let him gain such power.@");
	say("@But before that I was a well known fighter and trainer.@");
	add(["Protect", "Healing spring", "Future expeditions", "Akakothen", "Fighter and trainer"]);
	
	case "Protect" (remove):
	say("@While I may have retired my armor long ago I stand by ready to retrieve it if I ever need to protect the spring from those who would bring it harm.@");
	say("@It must not fall into the wrong hands.@");
	add(["Wrong hands"]);
	
	case "Wrong hands" (remove):
	say("@Such an endless source of healing would be a terrible weapon in the hands of a tyrant. Imagine a tyrants armies constantly being healed by such waters. It would be a bloodbath.@");
	
	case "Healing spring" (remove):
	say("@Such a thing I would never have believed in if I did not find it myself. The waters produced by this spring actual heal our bodies like a potion or spell simply by their touch.@");
	say("@Yet it loses its healing properties quickly if taken away from the area. It almost seems as if there is something innately magical about these mountains.@");
	add(["Innately magical"]);
	
	case "Innately magical" (remove):
	say("@There is something about this area, some sort of greater force, which grants the water its healing power. Yet it quickly loses its potency once you walk back into the caverns.@");
	say("@In fact, I have been surviving for many years using the water of the spring, and I feel wonderful... but if I were to venture into the caverns myself I would surely die.@");
	add(["Die"]);
	
	case "Die" (remove):
	say("@The water has sustained me for so many years that I have lost count. Even if I travel towards the stairs to the cavern I become violently ill.@");
	say("@Sadly, it is this which prevents me from avenging the death of my comrads.@");
	add(["Comrads"]);
	
	case "Comrads" (remove):
	say("A tear slides down the womans face. @Many beasts stood in our way as we traversed the caverns in search of the spring, but there was one beast which was the worst of them all.@");
	say("@She is what I call the Spider Queen.@");
	add(["Spider Queen"]);
	
	case "Spider Queen" (remove):
	if(gflags[KILLED_SPIDER_QUEEN])
	{
		say("@Now that you have slain her I can rest easy at night knowing she no longer breathes. I am forever in your debt for avenging the death of Artellum and the rest of my party.@");
		say("@Sadly, it will be impossible to forever destroy her wretched spider offspring.@");
	}
	else
	{
		say("The woman shudders. @Such a vile, horrid woman. She lives within the deepest part of the caverns amoung the spiders. She is completely enamoured with them, and seems to be able to command them.@");
		say("@When we came across her in the caverns she made a motion with her hands and hundreds of spiders began to attack us. We tried to fight them off but there were too many of them. We had no choice but to flee.@");
		say("@But the spiders continued to give chase. We were quickly falling and only Artellum and I remained at the end. Artellum ended up giving his life so that I could escape.@");
	}
	add(["Artellum", "Spiders"]);
	
	case "Artellum" (remove):
	if(gflags[KILLED_SPIDER_QUEEN])
	{
		say("@Artellum was a good man who was an expert with magic. He gave up his life so that I could escape the clutches of the Spider Queen. I am in your debt for avenging his death.@");
	}
	else
	{
		say("@Artellum was a good man who was an expert with magic. It is only his magical knowledge that allowed him to hold them off long enough for me to escape.@");
		say("A tear slides down Erinon's cheek. @His final act in this world allowed me to live.@");
	}
	
	case "Spiders" (remove):
	if(gflags[KILLED_SPIDER_QUEEN])
	{
		say("@I am glad that that vile woman, nay, creature, fell to a cold blade. I am far happier knowing that she is now a rotting corpse. Sadly the spiders will continue to breed.@");
		say("Erinon snarls. @Hopefully they feed on that womans corpse instead of another poor adventurer.@");
	}
	else
	{
		say("@I do not know how many spiders have since been hatched since my escape but what I do know is that woman commanded them to give chase to us. What I would give to have that vile womans head.@");
		add(["Head"]);
	}
	
	case "Head" (remove):
	if(gflags[KILL_SPIDER_QUEEN])
	{
		say("@I would forever be in your debt if you manage to slay the beast and return her head to me.@");
	}
	else
	{
		say("@I would be forever in your debt if you could help me avenge the death of my party by slaying the Spider Queen.@");
		say("@Will you help me?@");
		Erinon_Spiderslay();
	}
	
	case "Future expeditions" (remove):
	say("@No doubt future expeditions have already ventured and perished in the caverns. It is only time until another expedition makes it all the way to the spring, such as you have.@");
	say("@But you are not my enemy. My enemy are those who serve Akakothen.@");

	case "Akakothen" (remove):
	say("The woman snarls. @No doubt that bastard knew of my feelings of hatred towards him which is why he sent me on the mission to find the spring. No doubt he thought I would perish.@");
	say("@Sadly, everyone else perished. But it has given me a steadfast resolve to defend it from any future expeditions he or his heirs send here.@");
	add(["Ophidian Empire is gone"]);
	
	case "Ophidian Empire is gone" (remove):
	say("As you explain to Erinon that the Ophidian Empire collapsed centuries ago she stares blankly. @I had no doubt that Akakothen was bad for the empire, but I could never imagine it actually collapsing.@");
	say("It almost seems as if she is about to cry. @I knew all those I left behind would be long gone by now, but I never thought everything they built would be as well.@");
	say("Just as you think the woman will cry she has an abrupt change in attitude. @But I suppose everything must come to an end eventually.@");
	
	case "Fighter and trainer" (remove):
	say("@I was once a proud soldier of the Ophidian Empire. It was also I who trained many new recruits in the art of quick attacks and avoidance. I can train you if you so desire.@");
	if(gflags[KILLED_SPIDER_QUEEN])
	{
		say("@Though, you have shown great skill in slaying the Spider Queen and I am not sure if I possess any skills that can help you, but I shall try.@");
	}
	else
	{
	}
	say("@Do you wish to train with me?@");
	Erinon_Train();
	
	case "Spider Queens head" (remove):
	say("Erinon gasps as you pull the severed head of the spider queen from your bag. @All these years I have waited for this day. The day that my party is avenged.@");
	say("@I cannot thank you enough. I can finally sleep knowing that that woman no longer breathes, no longer lives with those horrible creatures. I am forever in your debt.@");
	say("Erinon goes to her bed and pulls out an axe. @Please, take my axe as a reward. It is the strongest weapon I have ever wielded and will surely aid you in your journeys.@");
	say("@Thank you again for avenging my party, avenging my friends, where I have failed.@");
	gflags[KILLED_SPIDER_QUEEN] = true;
	UI_remove_party_items(1, 1459, ANY, ANY); // Remove spider queens head
	UI_add_party_items(1, 990, ANY, ANY); // Add Erinon's axe
	UI_set_npc_prop(AVATAR, STRENGTH, 2);
	
	case "Scroll" (remove):
	if(gflags[GAVE_GLENN_SCROLL])
	{
		say("Erinon eyes you. @I am not sure how you got a second copy of this scroll, but I once again thank you for bringing it to my attention.@");
	}
	else
	{
		say("You remember you have a scroll which you acquired from the MageLord's castle and hand it to Erinon. As she reads it her face crinkles and she begins to cry.");
		say("@Oh Glenn, I read your words so many years after you have passed on, receiving your warning too late. If only I had thought to do what you suggest.@");
		say("Erinon turns to you. @Before Akakothen sent me on this mission I thought he was growing suspicious of my allegiance. While I had my suspicians this mission would be my last for him I did not suspect he intended to have my die on it.@");
		say("@Sadly, this letter reaches me too late, there is nothing I can do about it what has been done. I do thank you for bringing it to my attention, regardless of how useful it is.@");
		gflags[GAVE_GLENN_SCROLL] = true;
		gflags[RECEIVED_GLENN_SCROLL] = true;
		UI_set_npc_prop(AVATAR, TRAINING, 2);
	}
	UI_remove_party_items(1, GOOD_SCROLL, 88, ANY);
}

}
}
