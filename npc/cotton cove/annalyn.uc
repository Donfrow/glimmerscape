/*
Annalyn, woman in bigger house at road by cotton cove
*/

void HelpAnnalyn()
{
UI_push_answers();
converse(["Yes", "No"])
{

	case "Yes" (remove):
	say("@Thank you! I am certain old Lady Dorsy has something to do with it but everyone else will not even entertain the notion. There is something just not right with that woman.@");
	gflags[HELP_ANNALYN] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("Annalyn shrugs. @I suppose you are like the others and think I am crazy for thinking old Lady Dorsy has anything to do with it.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	

}
}

void Annalyn object#(0x5c8) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hail to you";
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
				UI_item_say(item, "I am worried");
			else if (n == 2)
				UI_item_say(item, "These are terrible times");
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
        call Annalyn, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

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


if(gflags[DEFEATED_ANNALYN_WITCH]) // Defeated the witch and set this flag in the below conversation
{
say("Annalyn stares at you for a moment. @Welcome back.@");


converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@I hope you remain safe.@");
	break;
	
	case "Job" (remove):
	say("Annalyn stares at you blanklet for a moment. @With my husband and daughter slain and Old Lady Dorsy no longer of this world I do not know what my purpose in live is anymore.@");
	say("@I suppose I will simply take things as they come, day by day.@");
	add(["Daughter","Husband", "Old Lady Dorsy"]);
	
	case "Daughter" (remove):
	say("Annalyn sobs lightly. @Poor Chloe. I knew I should not have let her wander off so far but I never thought Old Lady Dorsy would kidnap her.@");
	say("@At least that old witch can harm no others now. I spit upon her corpse.@");
	
	case "Husband" (remove):
	say("@Poor Bernard. I never should have sent him out alone to search for Chloe. Maybe if he had someone with him Old Lady Dorsy would not have attacked him.@");
	say("Annalyn wipes away a tear from her face. @Sadly, hindsight is always something you can only get aftwards. I will have to live with what happened.@");
	add("Disappearance");
	
	case "Old Lady Dorsy" (remove):
	say("Blood rushes into Annalyns face at the mentino of Old Lady Dorsy. @That witch, that hag, that horrible beldam. I curse her name until the day I die.@");
	say("@That crone is lucky she no longer lives in this realm as I would make her suffer beyond anything a person like her could envision.@");
	
	case "The Plains Rider" (remove):
	say("@I have heard of this plains rider before. He used to require that we here in Cotton Cove pay him money for protection.@");
	say("@And we did... until his rates became exorbitant. When he threatened us if we did not pay the entire town became up in arms and ran him out of town.@");
	say("@Last I heard he to the very south of the plains with his head between his legs. Good riddance I say.@");
}
	
}
else
{

if (UI_get_item_flag(item, MET)) 
{
	add(["Job", "Bye"]);
	say("@I am happy to see you are still in once piece.@");
}
else
{
	add(["Name", "Job", "Bye"]);
	say("A woman looks back at you intently. @It is rare to see someone travelling in times like these.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
if(UI_is_dead(-457) && UI_is_dead(-458))
{
add(["Husband and daughter"]);
}
	
converse([])
{

	case "Bye" (remove):
	say("@I hope you remain safe.@");
	break;
		
	case "Name" (remove):
	say("The woman looks shocked. @I am surprised you have not heard of me with the gossip the villagers by Cotton Cove have been spreading about crazy old Annalyn.@");
	say("She regains her composure. @I apologize for that. They have called me Crazy Annalyn far too often.@");
	
	case "Job" (remove):
	say("It appears as if the woman is about to cry. @My sole purpose in life is to try to find out what happened to my daughter and husband but noone will listen.@");
	say("Suddenly she becomes angry. @Everyone says I am crazy but I know it was old Lady Dorsy. It must have been bandits everyone says to me, but no, I know it was old Lady Dorsy!@");
	add(["Daughter","Husband", "Bandits", "Old Lady Dorsy"]);
	
	case "Daughter" (remove):
	say("@Poor Chloe! I knew I should not have let her wander off so far but I knew bandits would not concern themselves with my daughter! They may be vicious but they do have a code!@");
	add(["Code"]);
	
	case "Code" (remove):
	say("Annalyn stammers. @I should not have said that but I suppose it does not matter now. My brother used to be one of the Plains Bandits.@");
	say("@I am not a bandit but they leave me be as they have a certain code, honour if you will, amongst themselves that states that they will not harm the family of a fellow bandit, even a deceased one.@");
	say("@Of course I could not say such a thing to the villagers as surely they would assume I too was one and arrest me, or worse. Not that it matters now.@");
	add(["Brother", "Villagers"]);
	
	case "Brother" (remove):
	say("@My brother was always somewhat of a bad seed growing up but he did care for me and the rest of my family. Unfortunately he was slain a short while ago by the Dewtopian Knights... or a goblin.@");
	say("@To be honest I am not entirely sure as I have heard conflicting stories about his demise.@");
	add(["Goblins", "Demise"]);
	
	case "Goblins" (remove):
	if(gflags[GOBLINS_DEFEATED])
	{
		say("@Hidious creatures the goblins are, but at least they are no longer much of a threat since the Dewtopian raid on their city.@");
	}
	else
	{	
		say("@The goblins are horrible creatures, not an ounce of mercy or honour amonst them. Thankfully they are more focused on Dewtopia and tend to leave us alone.@");
	}
	add(["Dewtopia"]);
	
	case "Dewtopia" (remove):
	say("@How can someone not have heard of Dewtopia? It is a such a large and thriving city.@");
	
	case "Demise" (remove):
	say("@I have heard from various sources different tales of my brothers demise. To be honest it is not important to me to know how he died.@");
	
	case "Villagers" (remove):
	say("@The villagers of Cotton Cove and the small settlement outside of it are quite an interesting bunch of people.@");
	say("@There always must be some sort of excitement in their lives. Of course, if there is nothing to excite they will simply make up some issue to fill this void.@");
	say("@If they were to know I was related to a bandit I have no doubt they would pursue me with an almost epic zeal.@");

	case "Husband" (remove):
	say("@My husband Bernard went to search for our daughter by old Lady Dorsy's home and he has not returned in almost a week. I just know she is behind the disappearance of my daughter and husband.@");
	add("Disappearance");
	
	case "Disappearance" (remove):
	say("@I let my daughter Chloe play at the shores of Cotton Cove quite often but one day she did not return. Bernard went to search for her and I stayed home incase she found her way back here.@");
	say("@Since then I have seen neither of them. Everyone says it is bandits behind the dissappearance and that I am mad for accusing old Lady Dorsy, but I am certain it was not bandits.@");
	if(gflags[HELP_ANNALYN])
	{
	}
	else
	{
		say("@Will you help me find them?@");
		HelpAnnalyn();
	}
	
	case "Bandits" (remove):
	if(gflags[BANDITS_DEFEATED])
	{
		say("@With the bandits no longer a cause for concern here inthe plains no doubt people will sleep easier. I just wish they did not blame them for taking my daughter when I know it is not true.@");
	}
	else
	{
		say("@People are blaming the bandits for my husband and daughters disappearance. The bandits can be vicious but they have no use to do anything to a child.@");
		say("Annalyn sighs. @Sadly the townspeople will continue to blame the bandits for the actions of others.@");
	}
	
	case "Old Lady Dorsy" (remove):
	say("@Old Lady Dorsy lives north of Cotton Cove by some ancient ruins. She is a frail looking woman yet she lives alone and seems to have no fear of man or beasts alike.@");
	say("@I just know in my heart that she had something to do with the disappearance of my family. Noone in her condition can live alone in that area without something to protect themself.@");
	add(["Ancient ruins", "Condition", "Protection"]);
	
	case "Ancient ruins" (remove):
	say("@Old Lady Dorsy has a simple home by the twisted and dark ruins of some sort of cult. Many of the strongest men are afraid to travel there out of fear.@");
	say("@Those who do travel there are said to be chilled to the bone.@");
	add(["Cult"]);
	
	case "Cult" (remove):
	say("@Noone knows exactly what used to be there but it is common knowledge that those who visit are cold and dark within their hearts. Some believe a great doorway resides there that leads to a test of darkness.@");

	case "Condition" (remove):
	say("@The few times anyone sees old Lady Dorsy she appears frail and weak. Many do not know how she even manages to make it the town and back.@");
	
	case "Protection" (remove):
	say("@A woman as frail as old lady Dorsy must need some kind of protection. There are so many types of people out here that would have no qualms with taking advantage of her, yet she stays safe.@");
	say("Annalyn ponders for a moment. @Let alone the various other beasts that roam the plains such as the goblins. Something is clearly amiss with her.@");
	
	case "Husband and daughter" (remove):
	say("As you relate the fate of Bernard and Chloe to Annalyn she begins to tear up. @I cannot believe they are gone. I knew that woman had something to do with it but nobody would listen... nobody but you...@");
	say("She lowers her head. @While I knew she had was wicked I had no idea Old Lady Dorsy was a witch. I knew something was amiss with her but I would never have suspected that.@");
	say("@Sadly my husband and daughter are gone forever but you have brought closure to my life and owe you a great deal for avenging their deaths. Wait here.@");
	say("Annalyn goes to her bed and searches the nightstand before returning to you with an amulet. @Here, take this amulet. It belonged to Bernard and he always said it brought him luck.@");
	say("@Sadly they can no longer bring him any luck where he is now but hopefully it will be of use to you.@");
	UI_add_party_items(1, 1486, ANY, ANY); // Bernards Lucky Amulet
	gflags[DEFEATED_ANNALYN_WITCH] = true;
	
	case "The Plains Rider" (remove):
	say("@I have heard of this plains rider before. He used to require that we here in Cotton Cove pay him money for protection.@");
	say("@And we did... until his rates became exorbitant. When he threatened us if we did not pay the entire town became up in arms and ran him out of town.@");
	say("@Last I heard he to the very south of the plains with his head between his legs. Good riddance I say.@");
}
	
}

}
}

