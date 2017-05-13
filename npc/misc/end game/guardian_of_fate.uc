/*
End game, paladin, guardian
*/

void Goblin_Convo()
{
UI_push_answers();
converse(["What did it do?", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "What did it do?" (remove):
	say("@It existed.@");
	add(["Explain"]);
	
	case "Explain" (remove):
	say("The armored figure looks at you. @Just as you exist this goblin once existed. Its sole purpose in life was to act like a goblin.@");
	say("@And for that it shall be eternally punished.@");
}
}

void Fate_Vastness_Convo()
{
UI_push_answers();

converse(["I thought you were a speck?", "I understand"])
{
	case "I thought you were a speck?" (remove):
	say("@I am a speck in the vastness of the vastness that is I.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "I understand" (remove):
	say("@I am afraid you truely do not.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Death_Shade_Convo()
{
UI_push_answers();

converse (["Shade", "Why here?", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Shade" (remove):
	say("@That which is Death sacrificed itself so that you may once again live, destroying its essence in the process. But not all of what was, what is, Death was lost.@");
	say("@This shade is what little remains of that entity, fated to reside here eternally tormented for deeds done during its existence.@");
	add(["Deeds"]);
	
	case "Deeds" (remove):
	say("@The purpose of Death was to guide those who died into the realm of death. Death fulfilled this purpose. Death is to be punished for doing the very act it was destined to do.@");
	add(["Why punish Death?"]);
	
	case "Why punish Death?" (remove):
	say("The man speaks bluntly. @For that is what must be done.@");
	
	case "Why here?" (remove):
	say("@For this is where it must be.@");
	
}

}

void Akakothen_Ghost_Convo()
{

UI_push_answers();

converse (["Portion", "Tormented", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Portion" (remove):
	say("@The very essence of Akakothen was fated to be torn to pieces upon losing the Orb of Infinity. These portions of his essence are meant to seperated eternally.@");
	add(["Seperated"]);
	
	case "Seperated" (remove):
	say("@The seperated portion before you shall be forever stuck here. It shall never rejoin the rest of the essence that is Akakothen.@");
	
	case "Tormented" (remove):
	say("@The Hammer of Fate must fall to torment this portion of Akakothen.@");
	
}

}

void Crutch_Man_Kick()
{

UI_push_answers();

converse (["You should not have done so", "Say nothing"])
{
	case "You should not have done so" (remove):
	say("@Do not think I take pleasure or glee in any torment which I inflict upon those fated to be punished by me. I simply must punish them as it is foreseen that I do so.@");
	say("The man solemnly continues to speak. @Nor due I feel sadness or guilt for my actions. I am indifferent to all which I do. My actions are merely that which must be done.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Say nothing" (remove):
	say("The man stares at you. @Do not fret about your thoughts for I already know all that you have and will think.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Crutch_Man_Feed()
{

UI_push_answers();

converse (["That is unfair", "Say nothing"])
{
	case "That is unfair" (remove):
	say("You question the fairness of eternal torment for such a minor act. @The punishment for any one action may be extreme, non-existent, or somewhere inbetween.@");
	say("The man continues. @All actions are neither fair no unfair. They merely are. The punishment is simply what must be.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Say nothing" (remove):
	say("The man stares at you. @Do not fret about your thoughts for I already know all that you have and will think.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Crutch_Man_Convo()
{

UI_push_answers();

converse (["Why kick the crutch?", "Feed starving children", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Why kick the crutch?" (remove):
	say("@It was to be that I do that particular action. It had to be done.@");
	Crutch_Man_Kick();
	
	case "Feed starving children" (remove):
	say("@This man stole a loaf of bread from a wealthy land owner to feed his starving children so they would not starve to death.@");
	say("@It is for this that he is to be eternally tormented.@");
	Crutch_Man_Feed();

}
}

void What_Did_Crutch_Man_Do()
{

UI_push_answers();

converse (["What did he do?", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	

	case "What did he do?" (remove):
	say("@He is to be eternally punished for stealing a loaf of bread to feed his starving children.@");
	Crutch_Man_Convo();

}

}

void Fate_Prisoner_Convo()
{
UI_push_answers();

converse (["Death", "Ghost", "Crutches man", "Goblin", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Death" (remove):
	say("The armored figure stares as the cloaked figure. @What you see in this plane is but a shade of what was once known as Death.@");
	Death_Shade_Convo();
	
	case "Ghost" (remove):
	say("The armored figure runs a hand through the ghost. @This is but a mere portion of Akakothen doomed to forever be tormented.@");
	Akakothen_Ghost_Convo();
	
	case "Crutches man" (remove):
	say("The armored figure kicks the crutch out from beneath the man, causing him to fall with a loud thud. @This is the first and only time you are to encounter this man.@");
	
	case "Goblin" (remove):
	say("The armored figure pokes the goblin. @This brute cannot understand a thing. It does not understand where it is nor why it is here.@");
	Goblin_Convo();
}

}

void Guardian_of_Fate object#(0x591) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Do you suffer for your destiny?";
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
				UI_item_say(item, "Punishment that shall be, is");
			else if (n == 2)
				UI_item_say(item, "Punishment that was, shall be");
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
        call Guardian_of_Fate, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The heavily armored man moves as if the armor was as light as a feather. @Your suffering is and has not been.@");
	
}
else
{
	say("A heavily armored man approaches you with the fine movement of an acrobat. @Your past suffering shall be intolerable as that which you will experience.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("@Fate is beckoning you.@");
	break;
	
	case "Name" (remove):
	say("@As suffering that calls out to itself in the moment of infinity, I am Nameless.@");
	
	case "Job" (remove):
	say("The man smashes his fist against a wall. @The decision which will be handed down has been carried out by the speck of the infinite vastness of judgment.@");
	say("@It is my duty to bring forth that ruling for which it has been foreseen. The Hammer of Fate must be struck@");
	add(["Decision", "Infinite vastness", "Judgment", "Ruling", "Hammer of Fate"]);
	
	case "Decision" (remove):
	say("@The decision is the consequence for the course which life walks.@");
	add(["Consequence", "Walks"]);
	
	case "Consequence" (remove):
	say("@There are infinite consequences for the infinite actions which exist. The consequences cannot be avoided. One must suffer the consequences.@");
	add(["Suffer"]);
	
	case "Suffer" (remove):
	say("The eyes behind the helmet stare at you intently. @There is no fair or unfair in the suffering. I merely dole that which is meant to be.@");
	
	case "Walks" (remove):
	say("@Every decision which has been and will be is a step which must be walked.@");
	
	case "Infinite vastness" (remove):
	say("The man sternly looks into your eyes. @I am but a mere portion of that vastness.@");
	add(["What is the vastness?"]);
	
	case "What is the vastness?" (remove):
	say("@I am the vastness.@");
	Fate_Vastness_Convo();
	
	case "Judgment" (remove):
	say("@The judgment must be borne by whom it is foreseen shall carry it out. For some it is seen that I administer the judgement.@");
	say("@So I must carry out that judgment as that is how it must be.@");
	add(["Some"]);
	
	case "Some" (remove):
	say("The man motions around the room. @Those for which is has been foreseen that I am to carry out the ruling are unable to be anywhere but a prisoner here.@");
	add(["Prisoner"]);
	
	case "Prisoner" (remove):
	say("The clang of armor is head as the man points at the prisoners. @You recognize some but not all. I know you shall ask about them. You may do so now.@");
	Fate_Prisoner_Convo();
	
	case "Ruling" (remove):
	say("@The ruling is that which it was foreseen it shall be. I cannot deviate from that which is.@");
	
	case "Hammer of Fate" (remove):
	say("The man motions to a table. @The Hammer of Fate is but a tool used to do that which must be.@");
	
}

}
}
