/*
Dryn, the sheriff in Rosendale
*/

void Dryn_Capture_Thugs()
{
UI_push_answers();

converse(["I will help capture them", "Say nothing"])
{
	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "I will help capture them" (remove):
	say("Dryn rubs his chin. @They are aware I am looking for them but they would not suspect a visitor would be after them. I will accept your help.@");
	say("@Return to me when you have managed to deal with the thugs.@");
	gflags[CAPTURE_ROSENDALE_THUGS] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}

void Dryn object#(0x5e2) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Good day";
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
				UI_item_say(item, "Keep it safe");
			else if (n == 2)
				UI_item_say(item, "Do not cause trouble");
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
        call Dryn, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@I trust you are keeping well.@");
add(["Job", "Bye"]);

if(gflags[HEARD_OF_THUGS])
{
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
	}
	else 
	{
	if(UI_is_dead(-483) && UI_is_dead(-484)) // Jorletta and Garvis dead
	{
	}
	else
	{
		add(["Thugs"]);
	}
	
	}
}

}
else
{
say("You are met by a rather stern looking man. @A new face. Stay out of trouble.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

if(UI_is_dead(-483) && UI_is_dead(-484)) // Garvis and Jorletta
{
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
	}
	else
	{
		add(["Thugs killed"]);
	}
}

converse([])
{
	case "Bye" (remove):
	say("@Do not cause any trouble.@");
	break;
	
	case "Name" (remove):
	say("The man keeps a strict tone when answering you. @Dryn. Sheriff Dryn.@");
	
	if(gflags[HEARD_OF_THUGS]) //If you have already learned of the thugs but have not yet met Dryn and don't want to have to talk again
	{
		if(gflags[ROSENDALE_THUGS_KILLED])
		{
		}
		else
		{	
		add(["Thugs"]);
		}
	}
	
	
	case "Job" (remove):
	say("@I am the law in this town. If you do not cause any trouble you will not have any trouble with me.@");
	add(["Law", "Town", "Trouble"]);
	
	case "Thugs" (remove):
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@As I mentioned I am apprecitive of your aiding me in putting an end to those thugs reign of terror. It is unfortunate that you had to kill two of them but at least we got that simpleton Mordlon.@");
		add(["Merdlon"]);
	}
	else
	{
		if(gflags[CAPTURE_ROSENDALE_THUGS])
		{
			say("@I see you have still been unsuccessful in dealing the thugs as I am still getting reports of muggings. Do what you need to do to put an end to this.@");
		}
		else
		{
			say("@The towns people are talking about the thugs to strangers now are they? Well I will be blunt. There is indeed a problem with a group of thugs mugging unsuspecting people at night.@");
			say("@I have yet to be able to identify them and I have been unable to catch them in the act. They are smart enough to manage to evade me but they will not evade me forever.@");
			Dryn_Capture_Thugs();
		}

	}
	
	case "Merdlon" (remove):
	say("@He is quite simple but that does not excuse his actions. He will spend quite some time in my jail repaying society for what he has done.@");
	
	case "Law" (remove):
	say("@It is my duty to enforce the law here in Rosendale. As long as you are not causing the citizens any issues I will have no issue with you.@");
	say("He stares at you coldly. @But if you do cause trouble you will end up in my jail.@");
	add(["Jail"]);
	
	case "Jail" (remove):
	say("@Inmates of my jail are inside 21 hours of every day. We offer 3 hours of guarded time outdoors in the yard.@");
	add(["Yard"]);
	
	case "Yard" (remove):
	say("@This is one of the better jails to be locked up in as at least you get to spend some time outside in the fresh air. Our inmates should not consider this a chance to escape though.@");
	say("He leers at you. @Even while in the yard they are watched very closely.@");
	add(["Inmates"]);
	
	case "Inmates" (remove):
	if(gflags[ROSENDALE_THUGS_KILLED] && UI_get_schedule_type(-485) == WANDER)
	{
		say("@Up until you discovered who the thugs were we only had one inmate, a pirate. Now he is accompanied by that simpleton Mordlon.@");
	}
	else
	{
		say("@We currently have one inmate in our prison, a pirate.@");
	}
	add(["Pirate"]);
	
	case "Pirate" (remove):
	say("@Shortly before the Nautical Guild placed its ban on sailing a boat on the way to Rosendale was ambushed by pirates.@");
	say("@They failed to take the boat and all died except for the fellow who is now a resident of our jail.@");
	add(["Nautical Guild"]);
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild is like the lawmen of the seas. They make the rules and deal with those who break the rules.@");
	
	case "Town" (remove):
	say("@You are currently in the town of Rosendale. It is home to the Great Galleria of Rosendale and some of the hardest rock you can find in all the lands.@");
	add(["Galleria", "Rock"]);
	
	case "Galleria" (remove):
	if(gflags[STATUE_BROKEN])
	{
		say("@The Galleria is located north of the jail. We have recently had a vandal destroy one of the statues and take a valuable artifact.@");
		say("@If you have any information regarding this please let me know so this ruffian can be brought to justice.@");
	}
	else
	{
		say("@The Galleria is located north of the jail. If you have any questions about it I suggest you go there as I am not here to be your tour guide.@");
	}
	
	case "Rock" (remove):
	say("@Some of the hardest rock you will ever find is found in the mountains to the west. That is about all I know of it.@");
	
	case "Trouble" (remove):
	say("@With the amount of visitors we get in this town, that is until recently, there are bound to be a few who get into trouble. Those that do end up under my watch.@");
	say("He glares at you. @I trust you will not end up that way.@");

	case "Thugs killed" (remove):
	say("You relate the tale of the ambush by the thugs late at night to Dryn. @Mordlon was actually found shortly after crying in a bush. When pressed to tell us what happened he admited to everything.@");
	say("@While I am not surprised that Mordlon and Garvis were involved it is somewhat surprising that Jorletta was the leader. I suppose she has been going bad for quite some time.@");
	say("@Regardless, Mordlon has been brought in to face justice after he fled like the cowardly he is. He shall not get to flee from my jail though.@");
	say("@Your assistance in this matter is greatly appreciated. You have helped to bring ease to this town once more.@");
	gflags[ROSENDALE_THUGS_KILLED] = true;
	
	var party = UI_get_party_list();
    var cnt = UI_get_array_size(party);
	
//	UI_set_npc_prop(party, EXPERIENCE, 500);
	UI_set_npc_prop(AVATAR, INTELLIGENCE, 1);
	
/*
	while (cnt > 0)
	{
		UI_set_npc_prop(cnt, EXPERIENCE, 500);
		cnt = cnt - 1;
	}
*/
	
	party_members = UI_get_party_list();
	party_members_count = UI_get_array_size(party_members);
	if (party_members_count == 1)
	{
		UI_set_npc_prop(AVATAR, EXPERIENCE, 1000);	
	}
	else
	{
		var x = party_members_count;
		while(x > 0)
		{
			
			UI_set_npc_prop(party_members[x], EXPERIENCE, 1000);

			x = x-1;
			
		}
	}
	
}

}
else if (event == DEATH)
{
	

}


}

