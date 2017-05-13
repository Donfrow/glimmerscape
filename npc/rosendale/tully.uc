/*
Tully, the info lady at the Galleria
*/

void Tully_Questions_Galleria_People()
{
UI_push_answers();
say("@Of whom would you like to know about?@");
converse(["Yourself", "Edric", "Igon", "Dayne", "Darlessa", "Nevermind"])
{

	case "Yourself" (remove):
	say("Tully blushes profusely. @Not many people ask about me! I am quite flattered but to be honest there is not much to tell.@");
	say("@When I was a teenager I came here when the Galleria was rather new and was looking for someone to tell people about the exhibits. I ended up answering that call.@");

	case "Edric" (remove):
	say("@Edric was a former mayor of Rosendale and the founder of the Galleria. He was lost in a storm several years ago while travelling to promote the Galleria.@");
	say("@To remember Edric's ideas and work there is a portrait honouring him within the Galleria.@");
	
	case "Igon" (remove):
	say("@Igon is the sculptor of all of the statues which you can find in the Galleria. He was originally commissioned by Edric for a statue of Styr the Mighty.@");
	say("@His studio is located in the Galleria itself and occassionally the public is allowed to view him creating his next masterpiece.@");

	case "Dayne" (remove):
	say("@Dayne is the curator of the Galleria. He originally worked for Edric and took care of business when Edric was travelling to promote the Galleria.@");
	say("@When Edric was lost at sea during his travels Dayne took it upon himself to ensure the Galleria continued to run smoothly. Since that time Dayne has run the Galleria.@");

	case "Darlessa" (remove):
	say("@Darlessa is Dayne's personal assistant. She was hired by Dayne after Edric was lost.@");
	
	case "Nevermind" (remove):
	say("@Of course.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

}

}

void Tully_Questions_Exibhits()
{
UI_push_answers();
say("@Of which exhibits would you like to know about?@");

converse(["Styr the Mighty", "Lady Elena", "Lord Brent", "Tyrion", "Arthis", "Edric", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@Of course.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	
	
	case "Styr the Mighty" (remove):
	say("@Styr the Mighty was a mercenary who was hired to help control the growing goblin threat on the mainland many centuries ago and is the soldier who slew the Goblin King Blurkchuk centuries ago.@");
	say("@Blurkchuk was an exceptionally intelligent goblin and was banding together the various warring goblin tribes. This goblin alliance was a threat to all humans on the mainland.@");
	say("@When Blurkchuk was slain by Styr the goblin alliance began fighting within themselves.@");
	say("@This in-fighting greatly weakened the goblin strength and allowed for humans to become the central power.@");

	case "Lady Elena" (remove):
	say("@Lady Elena was the woman who defeated the deathknight Arthis. Arthis was a powerful figure whom slaughtered all who stood in his way with no regard for human life.@");
	say("@Many thought Arthis to be undefeatable until Lady Elena and Arthis had a final show down on the island of Cambray.@");
	say("@Lady Elena managed to defeat Arthis however she died from her wounds after the battle. She now has a shrine dedicated to her on the island of Cambray.@");
	
	case "Lord Brent" (remove):
	say("@Lord Brent is the ruler of Brentonia and one of the reasons the Galleria exists today. He financed the construction of the Galleria as well as the commissioning of the statues.@");
	say("@Without Lord Brent the Galleria would likely only be a footnote in the history of Rosendale.@");
	
	case "Tyrion" (remove):
	say("@Tyrion is the sage who first opened the first gateway into the Demon realm. It is his research that nearly all teleportation magic is based off of.@");
	if(gflags[STATUE_BROKEN])
	{
		say("@This exhibit at one time held a book which contained pages of some of his original research however recently a vandel defaced it and stole the book.@");
	}
	else
	{
		say("@This exhibit is especially special as his statue holds a book which contains original pages from some of his research.@");
	}
	
	case "Arthis" (remove):
	say("@Arthis was a deathknight who sought great power. Although he is regarded by nearly all as an evil force in history he nonetheless helped to shape our present day.@");
	say("@He was thought undefeatable until a final confrontation with Lady Elena on the island of Cambray left him dead.@");
	
	case "Edric" (remove):
	say("@The portrait of Edric is placed in honour of the founder of the Galleria.@");
	say("@Without him the Galleria would not exist today as he commissioned the first statue and convinced Lord Brent to fund further works of art.@");
}

}

void Tully_Questions_Galleria()
{
UI_push_answers();
say("@Would you like to know of the people, exhibits or the history of the Galleria?@");
converse(["People", "Exhibits", "History", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Of course.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "People" (remove):
	Tully_Questions_Galleria_People();
	
	case "Exhibits" (remove):
	Tully_Questions_Exibhits();
	
	case "History" (remove):
	say("@The Galleria was originally started by Edric many years ago. Edric had wanted to honour Styr the Mighty however there was very little interest in doing such a thing.@");
	say("@Edric eventually ran for mayor of Rosendale and when he was elected he commissioned a statue of Styr the Mighty to be made by Igon, a local artisen.@");
	say("@The statue was placed in a park where the Galleria is now located. One day Lord Brent of Brentonia was visiting Rosendale and was taken back by the excellent job done on the statue.@");
	say("@Edric convinced Lord Brent to fund an entire gallery that would house statues of legendary figures of Desporia. Lord Brent agreed on the condition that a statue of himself also be placed in the gallery.@");
	say("@Word eventually spread of the great works created by Igon and the Galleria became a popular tourist destination.@");
	say("@Edric travelled the lands to advertise the Galleria but was lost in a storm several years ago. Since then the Galleria has been run by Dayne.@");
}
}

void Tully_Rosendale_Questins()
{
UI_push_answers();
say("@What would you like to know?@");
converse(["General information","Nevermind"])
{

	case "Nevermind" (remove):
	say("@Of course.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "General information" (remove):
	say("@Rosendale is a city that was founded a century ago and can be found on an island that is located northeast of the mainland.@");
	say("@It was originally founded when it was discovered that the mountains on the western portion of the island contained some of the strongest rock in Desporia.@");
	say("@This rock is extremely heavy and difficult to work with but it quite strong and when polished looks beautiful. It is this rock that the finest statues in Desporia are constructed of.@");
	add(["Rock", "Statues"]);
	
	case "Rock" (remove):
	say("@The rock supply has been greatly depleted over the years however some still remains. It is expected that within the next 20 years all the rock on the island will have been mined out.@");
	
	case "Statues" (remove):
	say("@Many of the finest statues in Desporia were constructed here in Rosendale by its resident artist Igon.@");
	say("@Generally all statues are constructed here as there are very few people who able to afford to ship the uncarved stone off the island.@");
}
}

void Tully_Questions_Generic()
{
UI_push_answers();

say("@What would you like to know about?@");
	
converse(["Galleria", "Rosendale", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Of course.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Galleria" (remove):
	Tully_Questions_Galleria();
	
	case "Rosendale" (remove):
	Tully_Rosendale_Questins();	
	
}
}


void Tully object#(0x5df) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Good day to you";
var bark_intro = "Hail";

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == SLEEP)
		{
			UI_item_say(item, "Zzzz");
			return;
		}
		else if (UI_get_schedule_type(item) == IN_COMBAT)
		{
		}
		else
		{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Come see the Galleria");
			else if (n == 2)
				UI_item_say(item, "Visit the Galleria");
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
        call Tully, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("Tully does a small curtsy. @How nice of you to return.@");
add(["Job", "Bye"]);
}
else
{
say("The woman does a small cursty. @A pleasure to make your acquaintance.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@I do hope you return sometime.@");
	break;
	
	case "Name" (remove):
	say("A pleasent smile greets your question. @I am Tully. It is truely a pleasure to meet you.@");
	
	case "Job" (remove):
	say("@I am the guide for the Great Galleria of Rosendale. If you have any questions about the Galleria or Rosendale feel free to ask me, anytime.@");
	say("She beams a smile at you. @And I do mean anytime. I am always happy to help a tourist.@");
	add(["Questions", "Tourist"]);
	
	case "Questions" (remove):
	Tully_Questions_Generic();

	case "Tourist" (remove):
	say("@Rosendale is an attractive destination for tourists because of the Galleria. People come from quite far away to come see the fine works Igon creates.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@Lately we have not had many visitors as pirate activity pressured the Nautical Guild to place a ban on sailing. Thankfully this has been lifted so I hope we see more visitors soon.@");
	}
	else
	{
		say("@Unfortunately as of late people have been unable to come and visit the Galleria due to a ban on sailing by the Nautical Guild.@");
		say("@It would seem that pirates have become such a problem that the Nautical Guild sees such action as a necessity.@");
	}
	add(["Pirates", "Nautical Guild"]);
	
	case "Pirates" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@I do not leave the island often but one thing I do fear when leaving the island is pirates. Yet, with the ban on sailing lifted it would seem the Nautical Guild deems it safe to sail again.@");
		say("@I do hope this is the case. I despise pirates. Such filthy people they are.@");
		if(gflags[ROSENDALE_THUGS_KILLED])
		{
		}
		else
		{
			say("@Sadly, such people are not only found at sea. I have heard that there is a group of thugs who beat and rob people at night here in Rosendale.@");
			gflags[HEARD_OF_THUGS] = true;
			add(["Thugs"]);
		}
	}
	else
	{
		say("@I tend not to travel so my information is second hand but from what I have heard from those who do there is quite a fear of pirates lately.@");
		if(gflags[ROSENDALE_THUGS_KILLED])
		{
		}
		else
		{
			say("@Sadly, such people are not only found at sea. I have heard that there is a group of thugs who beat and rob people at night here in Rosendale.@");
			gflags[HEARD_OF_THUGS] = true;
			add(["Thugs"]);
		}
	}
	
	case "Thugs" (remove):
	say("@I do not know anything about the beatings personally but I heard that Dryn is looking into it and taking the stories very seriously.@");
	add(["Dryn"]);
	
	case "Dryn" (remove):
	say("@Dryn is the sheriff here in Rosendale. He works at the jail to the south.@");	
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild is a group based out of Medina that any legitimate sailor joins when they start sailing. As long as you are sailing with a member of the Nautical Guild you know you will not be cheated.@");
	say("@Their members also run the docks in nearly every city in Desporia.@");
	

}
}
else if (event == DEATH)
{
	

}


}

