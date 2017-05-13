/*
Plains Rider (on the horse) in the Plains
*/

void Bredin_Father_Justice()
{
UI_push_answers();
converse(["Like Bredin's father?", "Say nothing"])
{
	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Like Bredin's father?" (remove):
	say("A boisterous laugh emits from the helmet. @That man was a fool and was unwilling to pay my very reasonable price for justice so I simply showed him the error of his ways.@");
	say("He lowers his head to you. @And if you wish to avoid the same fate I suggest you shut your mouth.@");
}
}

void Plains_Rider object#(0x5f5) ()
	{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Why do you pester me, maggot?";
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
				UI_item_say(item, "");
			else if (n == 2)
				UI_item_say(item, "");
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
        call Plains_Rider, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

if(UI_get_item_flag(item, MET))
{
say("Deep eyes look back at you through the helmet. @You best stop pestering me for your own good.@");
add(["Job", "Bye"]);
}
else
{
say("Deep eyes look back at you through the helmet. @You are brave to approach one as great as me.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}


converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("He lets out a short grunt before turning away.");
	break;
	
	case "Name" (remove):
	say("@How dare you ask one such as me your name? You are a nobody, and a nobody does not ask such things to the great Graneth, protector of the plains.@");
	
	case "Job" (remove):
	say("It almost seems as if the man growls at you. @I am the noblest protector of all the plains.@");
	say("@Along with my fine steed Secretariat I defend the poor and the weak of the great plains from those who would take advantage of them.@");
	add(["Noblest protector", "Secretariat", "Poor and weak", "Great plains"]);
	
	case "Noblest protector" (remove):
	say("@With bandits and goblins running amok in the great plains one person must rise and protect those who reside within it. I have picked up my sword and defend them with all my heart.@");
	say("@Though if you wish for me to protect you I warn you my services do not come cheap.@");
	add(["Services"]);
	
	case "Services" (remove):
	say("He lets out a stoic laugh. @Do you think that I would defend those weaker than I for free? Ha! Those who wish to be protected by the mighty sword of Graneth must pay up.@");
	say("@I assure you though, any gold you spend will be worth the price. There is no goblin or bandit that I will allow to live.@");
	
	case "Secretariat" (remove):
	say("He pats the horse on the top of its head. @Secretariat here is a fine horse. One of the finest in all the lands. With him along side me I will always defeat my foes.@");
	say("@In fact Secretariat and I are so feared on these plains that those who wish to do harm harm actually flee when they hear his mighty hooves crashing upon the ground.@");
	
	case "Poor and weak" (remove):
	say("@The poor and weak of the plains are the filth of the lands, but even filth such as they deserve protection from one as mighty as myself.@");
	say("He sneers at you. @Though some of the garbage are too foolish to realize they require my protection and refuse to pay up. Justice is brought swiftly to the foolish.@");
	add(["Pay up", "Justice"]);
	
	case "Pay up" (remove):
	say("@My protection is not free and at times those who I protect refuse to continue my services. Such foolish decisions people make.@");
	
	case "Justice" (remove):
	say("@Justice is brought to those who are foolish and refuse my services. Cold iron soon enough brings judgement to each and every one of them.@");
	if(gflags[KILL_PLAINSRIDER])
	{
		Bredin_Father_Justice();
	}
	
	case "Great plains" (remove):
	say("@The great plains span the southern portion of Desporia. Such a big space leaves much room for trouble to brew.@");
}
}

else if (event == DEATH)
{
	var loc = get_object_position(item);
	UI_kill_npc(-501);
	UI_move_object(-500, [loc[1]+1, loc[2]-5]);
	UI_set_schedule_type(-500, IN_COMBAT);
	UI_set_opponent(-500, PARTY);
	UI_set_alignment(-500, HOSTILE);
	script -500
	{
		wait 3;
		say "Nooo Secretariat!";
	}
}



}
