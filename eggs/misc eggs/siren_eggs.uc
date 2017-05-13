void Move_Heilbrunn()
{

	if(gflags[LEARN_OF_SMUGGLERS])
	{
		if(gflags[SMUGGLERS_DEAD])
		{
		}
		else
		{
			UI_move_object(-464, [2934, 2087, 0]);
			UI_modify_schedule(-464, 0, LOITER, [2934, 2087]);
		}
	}
	
}


void Sirens_Tale()
{
UI_push_answers();
converse(["Give option to leave", "Give no option"])
{

case "Give option to leave" (remove):
say("@You think I would willingly leave such a place? You are a fool. A fool who shall die!@");
karma = karma + 300;
KarmaGoodSprites();
UI_clear_answers();
UI_pop_answers();
break;

case "Give no option" (remove):
say("@You dare order me out? I shall have your head!@");
karma = karma - 300;
KarmaBadSprites();
UI_clear_answers();
UI_pop_answers();
break;

}
}

void Heilbrunn_Convo object#()()
{

UI_show_npc_face(566);
say("A large man looks at you. @Who are you? Nevermind... you are in our operation, clearly uninvited...@");
converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("@It is time for you to die...@");
	UI_set_opponent(-464, PARTY);
	UI_set_schedule_type(-464, IN_COMBAT);
	UI_set_alignment(-464, HOSTILE);
	gflags[SMUGGLER_LEADER_TRIGGER] = true;
	break;
	
	case "Name" (remove):
	say("@Ha! I am Heilbrunn, now that you would have ever heard of me since everyone who has either already knows me or is dead...@");
	
	case "Job" (remove):
	say("@Are you daft? Can you not see the wonderful operation I have setup to spread illicit goods throughout the lands?@");
	say("@No, of course not, or  you would not be asking dumb questions. How someone as dumb as you managed to get in here is beyond me.@");
	add(["Sirens"]);
	
	case "Sirens" (remove):
	say("You tell the smuggler about the sirens and how they want him out of the isle. @Haha, do not make me laugh! They can do nothing to me! We cannot hear their song, they are helpless!@");
	say("@In fact, I already have a nice stuffed one right outside my room... perhaps I should stuff you...@");
	Sirens_Tale();
	UI_set_opponent(-464, PARTY);
	UI_set_schedule_type(-464, IN_COMBAT);
	UI_set_alignment(-464, HOSTILE);
	gflags[SMUGGLER_LEADER_TRIGGER] = true;
	break;
	
}

}

void Heilbrunn_Convo_Trigger object#()()
{

if(UI_is_dead(-464))
{

}
else
{

	if(gflags[LEARN_OF_SMUGGLERS])
	{

		if(gflags[SMUGGLER_LEADER_TRIGGER])
		{
			
		}
		else
		{
			//AVATAR.say("Hitting the script");
			script -464
			{
				nohalt;
				say "Who are you...";
				wait 5;
				call Heilbrunn_Convo;
			}
		}
	}
}

}
