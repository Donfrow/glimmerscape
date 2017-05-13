/*
Moniak
*/

void MoniakConfirm()
{
UI_push_answers();

converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("Moniak smiles. @Thank you. Hopefully an outsider will bring a fresh perspective and settle my unease once and for all.@");
	say("@If you do not know where to begin perhalps you should investigate Alagnar's study. As of late I have seen Jordell visiting it more than usual.@");
	gflags[CONFIRM_SUSPICIONS_BRENTONIA] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("The man sighs. @I suppose it is not your burden to deal with.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}

void Moniak object#(0x5a2) ()
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
				UI_item_say(item, "We must proceed");
			else if (n == 2)
				UI_item_say(item, "Something must be done");
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
        call Moniak, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@A pleasure, as always.@");
}
else
{
	say("@Well met, stranger.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

if(gflags[BRENTONIA_TRAITORS_DEAD])
{
	add(["Plot uncovered"]);
}
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@I wish you the best of luck in your travels.@");
	break;
		
	case "Name" (remove):
	say("The man seems stunned. @It has been such a long time since someone has asked me such a thing that I have taken everyone knowing me for granted. Forgive me, I am Moniak.@");
	
	case "Job" (remove):
	say("@I am a knight of Brentonia, as well as a member of the Inner Circle of Lord Brent.@");
	add(["Inner Circle", "Brentonia", "Knight", "Lord Brent"]);
	
	case "Inner Circle" (remove):
	say("@We are a group of citizens, each of whom have our own area of expertise or skill, that Lord Brent looks to for guidence.@");
	say("@In fact, such a group truely shows how wise Lord Brent really is. He admits he simply cannot know everything.@");
	if(gflags[BRENTONIA_SAVED])
	{
		say("@It is such a shame that the circle has experienced such unfortunate events as of late, but at least with the plot by Jordell and Vortas exposed and quashed we can begin to heal.@");
	}
	else
	{
		say("Moniak thinks for a moment before speaking. @Though I fear something is not right with the circle at this time. Lately we have suffered a series of unfortunate events that cannot be by chance.@");
		say("@But I do not know how to proceed.@");
		add(["Proceed"]);
	}
	add(["Unfortunate events"]);
	
	case "Unfortunate events" (remove):
	say("Moniak shakes his head. @Recently a number of members of the circle have died. It has put a hamper on ruling but I am confident that we can heal and get past such difficult times.@");
	
	case "Proceed" (remove):
	say("You feel as if Moniak is looking deep inside you. @I fear that someone on the circle is working on a plot to overthrow Lord Brent and the rest of the circle.@");
	say("@It cannot be a coincidence that such a large number of Inner Circle members have died. Someone must be behind this, but only a member of the Inner Circle would have something to gain.@");
	add(["Gain", "Deaths"]);
	
	case "Gain" (remove):
	say("@I do not like to think ill of the other members of the circle but I have always been wary of Jordell. She believes she to be better than nearly everyone and seems to have much contempt for the circle.@");
	say("@It is my fear that she has always felt as if she has a duty to become the sole ruler of Brentonia, without input of others. In fact, the only one she ever looked up to was Vortas.@");
	say("@Sadly, with his passing she may now feel like she must begin to purge the circle to realize this obligation she feels she has.@");
	if(gflags[CONFIRM_SUSPICIONS_BRENTONIA])
	{
		say("Hopefully your investigation will help uncover the truth.@");
		add(["Where to begin"]);
	}
	else
	{
		say("@If only I could confirm my suspicions.@");
		add(["Confirm"]);
	}
	add(["Vortas"]);
	
	case "Vortas" (remove):
	say("@Vortas is, was I should say, the oldest member of the circle. He was ambushed by goblins while overseeing the construction of an outpost.@");
	say("@Sadly we have not yet managed to recover his body.@");
	
	case "Confirm" (remove):
	say("@The perspective of an outsider in this matter would help Brentonia greatly. Would you help to discover if there is indeed such a plot?@");
	MoniakConfirm();
	
	case "Where to begin" (remove):
	say("@The only insight I can offer you is to investigate Alagnar's study as Jordell has been in there more than usual.@");
	
	case "Deaths" (remove):
	say("@Vortas, Tonidra and Ernesta are the members of the circle who have recently passed. While the death of Vortas not suspicious I am not certain that is the case in the deaths of Tonidra and Ernesta.@");
	add(["Tonidra", "Ernesta"]);
	
	case "Tonidra" (remove):
	say("@Tonidra was a lovely woman who had much compassion for the poor. She even had a shelter built for them within the city. She would regularly visit them and they enjoyed her company very much.@");
	say("@However during one visit something occurred between one of the homeless and Tonidra. Some sort of altercation ensued in which both fell to their deaths.@");
	say("@Yet there has never been any sort of altercation between anyone at the shelter until that time and noone witnessed what actually transpired that day. I find the entire event very suspicious.@");
	say("He sighs. @Sadly this event has led to Brentonia's citizens to abandon their support for the cause that Tonidra cared so much about.@");
	
	case "Ernesta" (remove):
	say("@Ernesta was a very strong woman but she took to alcohol after Tonidra's death. She would spend much of her free time drinking in the Dirty Fork. However one night she never made it home.@");
	say("@This particular night she left the pub alone and was then found the next morning laying dead in the streets. It appears as if she had fallen and hit her head on the pathway.@");
	say("Moniak pauses. @Though I am not certain this is the case. Ernesta was a very nimble woman, even when intoxicated. I just cannot believe it was such a simple accident.@");
	say("@Especially after the suspicious death of Tonidra.@");
	
	case "Brentonia" (remove):
	say("A big smile appears. @Such a lovely place to live. We are graced with a most noble leader.@");
	
	case "Knight" (remove):
	say("@I am a knight which is the official guards and soldiers of Brentonia. The only other soldiers which come close to our skill and discipline are the Dewtopian knights.@");
	add(["Dewtopia"]);
	
	case "Dewtopia" (remove):
	say("Moniak looks puzzled. @Dewtopia is a kingdom to the south. It is run by Lord Dew. I would think you would know this?@");
	
	case "Lord Brent" (remove):
	say("@Lord Brent is the ruler of Brentonia. He is a fair and noble leader.@");
	
	case "Plot uncovered" (remove):
	if(gflags[BRENTONIA_TRAITORS_DEAD])
	{
		if(gflags[BRENTONIA_SAVED])
		{
			say("@I cannot thank you enough for uncovering the plot to overthrow the circle and Lord Brent. Hopefully now Brentonia can heal.@");
		}
		else
		{
			say("You relate the tale to Moniak about finding Vortas and Jorell scheming in a hidden room in Alagnar's study.");
			say("@I am such a fool! I did not even know Jordell knew of the safe room but how could I have not thought about checking it?@");
			say("@Add to the fact that Vortas was still alive and hiding there. I could have uncovered the entire plot myself, possibly saving Tonidra and Ernesta, if I had just checked that room.@");
			say("Moniak shakes his head. @Regardless of what I may have failed at, thank you for uncovering the plot. Hopefully now Brentonia can heal.@");
			
			
			// Give reward of 3 str and int, but don't go over 30
			var currentStr = UI_get_npc_prop(AVATAR, STRENGTH);
			var currentInt = UI_get_npc_prop(AVATAR, INTELLIGENCE);			
			var maxStr = (30-currentStr);
			if (maxStr > 3)
				maxStr = 3;
				
			var maxInt = (30-currentInt);
			if (maxInt > 3)
				maxInt = 3;
					
			UI_set_npc_prop(AVATAR, STRENGTH, maxStr);
			UI_set_npc_prop(AVATAR, INTELLIGENCE, maxInt);		

			gflags[BRENTONIA_SAVED] = true;
			add(["Safe room"]);
		}
		add(["Plot"]);
	}
	
	case "Safe room" (remove):
	say("@Lord Brent is meant to be taken to the safe room in the event of invasion, though luckily it has not been used for its actual purpose as of yet.@");
	
	case "Plot" (remove):
	say("@It would seem that Vortas and Jordell had plotted to turn public opinion against Lord Brent and the Inner Circle, thereby making their takeover unchallenged.@");
	say("@By my guess their hope was slay members of the circle to weaken it then have Jordell rescue Vortas, whom we all thought to be dead, and become a hero to the people.@");
	say("@At this point they could remove Lord Brent and any other remaining members of the circle from power unchallenged by the public. It was quite convoluted but they seemed to be successful until you stopped them.@");

}

}
}


