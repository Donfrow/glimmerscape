void SouthWest_Mainland_Troll_Convo()
{
UI_show_npc_face(661);
say("A large, ugly looking troll approaches you. @Wut is dis?@");

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("@I clubs you and eat your bones!@");
	UI_set_alignment(-473, HOSTILE);
	UI_set_schedule_type(-473, IN_COMBAT);
	UI_set_opponent(-473, PARTY);
	break;
	
	case "Name" (remove):
	say("The thuggish troll pauses for a moment before speaking. @Mes gots no needs for name.@");
	
	case "Job" (remove):
	say("The troll shows his club proudly. @Mes club the tinies that bothers me.@");
	add(["Club", "Tinies"]);
	
	case "Club" (remove):
	say("It is clear the creature is quite proud of its club. @Me and my's club smash things! We's smash things like you!.@");
	add(["Like me"]);
	
	case "Like me" (remove):
	say("@Club likes smashing things likes you.@");
	
	case "Tinies" (remove):
	say("The troll stands tall, showing its muscular chest proudly. @You is a tiny. Me is a biggy. Me and club smash da tinies. It fun to listen to crunch of tinies.@");
	add(["Crunch"]);
	
	case "Crunch" (remove):
	say("@Yous weak bones easy to crunch. Fun to listen to yous bones crunch under club and as I eats you.@");
	add(["Eat"]);
	
	case "Eat" (remove):
	say("A large ugly tongue darts across the trolls lips. @Me is hungry and you looks tasty.@");
	UI_set_alignment(-473, HOSTILE);
	UI_set_schedule_type(-473, IN_COMBAT);
	UI_set_opponent(-473, PARTY);
	break;
}

}

void egg_southwest_troll_trigger object#()()
{
	if(UI_is_dead(-473))
	{
	}
	else
	{
		script -473
		{
			say "Wut is dis?";
		}
		UI_si_path_run_usecode(-473, [663, 2644], SCRIPTED, -473, SouthWest_Mainland_Troll_Convo, 0);
	}
}

void Something_Is_Amiss_Troll object#()()
{
    var party = UI_get_party_list();
	var cnt = UI_get_array_size(party);
    var rand;
    if (cnt == 1)
	{
		AVATAR.say("@A strange noise is eminating from behind that bush.@");
        rand = 1;  // Have only avatar.
	}	
    else
	{
		RandomPartySay("@I hear a strange noise coming from behind that bush over there.@");
	}

}

void egg_southwest_troll_noise object#()()
{
	if(UI_is_dead(-473))
	{
	}
	else
	{
	script item
		{
			nohalt;
			say "Murgle Garble";
			wait 5;
			say "crunch crunch";
			wait 5;
			say "scrapelernes";
			wait 5;
			call Something_Is_Amiss_Troll;
		}
	}
}