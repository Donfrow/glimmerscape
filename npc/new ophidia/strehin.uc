//Strehin, "mayor" of New Ophidia

void Strehin object#(0x576) ()
	{
	
var bark = "Hello there";
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
				UI_item_say(item, "Temperatures are steady");
			else if (n == 2)
				UI_item_say(item, "Much work to be done");
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
        call Strehin, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
    UI_show_npc_face(item);

    UI_add_answer("Name");
    UI_add_answer("Job");
    UI_add_answer("Bye");

if (UI_get_item_flag(item, MET))
	{
		say("@Always a pleasure to see you.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@If you are looking for work please know this is the off season and we are not hiring seasonal workers at the moment.@");
	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
            say("@Do keep yourself warm.@");
            break;
        }
        else if (response == "Name")
        {
            say("@The names Strehin@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the leader of this icy settlement.@");
            UI_remove_answer("Job");
            UI_add_answer("Leader");
            UI_add_answer("Settlement");
        }
        else if (response == "Leader")
        {
            say("@Some would call me mayor but the way I see it you must have an actual town to be mayor of.@");
            UI_remove_answer("Leader");
        }
        else if (response == "Settlement")
        {
            say("@When I was a trapper many years ago I found it quite the annoyance to not have much in terms of workable facilities up in these frigid plains so I setup this camp.@");
            say("@Some would like to claim that I set it up due to some mythical calling by the Ophidians, but I assure you it was merely geographical benefits. That does not stop people from calling it New Ophidia however.@");
            UI_remove_answer("Settlement");
            UI_add_answer("Trapper");
            UI_add_answer("Founded");
            UI_add_answer("New Ophidia");
        }
        else if (response == "Trapper")
        {
            say("@We trappers are folk who hunt dangerous creatures for the hides they provide. We then make fine cloth and clothes of it. It is quite the dangerous profession.@");
            say("The man thinks for a moment. @I am not much of a trapper anymore I suppose as age has taken its toll on me. Now I merely keep this settlement in good working order.@");
            UI_remove_answer("Trapper");
        }
        else if (response == "Founded")
        {
            say("@Many years ago me and a few colleagues of mine set up a settlement on this spot to help with the trapping. Since then others have joined us to make this spot what it is today.@");
            UI_remove_answer("Founded");
            UI_add_answer("Colleagues");
        }
        else if (response == "Colleagues")
        {
            say("A lone tear escapes the mans right eye. @All the others have either disappeared or killed in their duties as trappers over the years. I am the only original founder left.@");
            UI_remove_answer("Colleagues");
            UI_add_answer("Killed");
			UI_add_answer("Disappear");
        }
        else if (response == "Killed")
        {
            say("@The animals trappers slay can be quite dangerous opponents. The last founder, other than myself, to die was Rupert. He was eaten alive by the yeti after he tried to ambush a yeti hunting party.@");
            UI_remove_answer("Killed");
            UI_add_answer("Yeti");
        }
        else if (response == "Yeti")
        {
            say("@Terrible beasts those yeti are. They have a semblance of intelligence like their goblin cousins to the south, but are far more vicious. Damn fine pelts though.@");
            say("Strehin pauses. @Word of advice to you though. If you ever find yourself in a position that you think can take out a band of yeti, think twice as the brutes are quite strong.@");
            UI_remove_answer("Yeti");
        }
		else if (response == "Disappear")
		{
			say("@There is only one that actually disappeared. Sometimes I really wander whatever became of Duncan.@");
			UI_remove_answer("Disappear");
			UI_add_answer("Duncan");
		}
		else if (response == "Duncan")
		{
			say("@Duncan was one of the founders. He disappeared one day while out trapping. We do not know if he fell victim to the Yeti, the coldness, or something else entirely as noone has ever found his body.@");
			say("Strehin sighs. @I can only hope that whatever happened to him it was painless.@");
			UI_remove_answer("Duncan");
		}
        else if (response == "New Ophidia")
        {
            say("@It is the name outsiders have given to this settlement due to its proximity to what is left of the Ophidian Empire. I never had the intention of having anything to do with those ruins though.@");
            say("@This name has also brought several fanatics to this area over the years.@");
            UI_remove_answer("New Ophidia");
            UI_add_answer("Fanatics");
        }
        else if (response == "Fanatics")
        {
            say("@Every now and then a group of people who wish to find lost treasure, rebuild the empire, or who knows what else are drawn to this place due to its name. Most of the time they end up dying due to the various beasts which inhabit this area.@");
            say("@Right now a husband and wife have rented out the old slaughter house to try and preach the ways of the Ophidian Empire to the seasonal trappers that join us.@");
            say("@There is also some woman to the far north who has given us some sort of ultimatium.@");
            UI_remove_answer("Fanatics");
            UI_add_answer("Husband and wife");
            UI_add_answer("Slaughter house");
            UI_add_answer("Seasonal trappers");
            UI_add_answer("Woman");
        }
        else if (response == "Husband and wife")
        {
            say("@Urstan and Tansha are their names. Normally I would not rent the building to such people but they are former trappers so I know that they can handle themselves.@");
            UI_remove_answer("Husband and wife");
        }
        else if (response == "Slaughter house")
        {
            say("@It was not really a slaughter house, but it is where we used to bring the corpses to skin. Frankly I'm surprised that Urstan and Tansha have been able to get rid of the smell.@");
            UI_remove_answer("Slaughter house");
        }
        else if (response == "Seasonal trappers")
        {
            say("@In the early years of this settlement we nearly wiped out the local wildlife so we decided to start hiring seasonal trappers so that the beasts would have time to breed.@");
            say("@They get to stay in the old slaughter house for free as long as they listen to Urstand and Tansha preach every night. Most of them are happy to do this for free room and board.@");
            UI_remove_answer("Seasonal trappers");
        }
        else if (response == "Woman")
        {
			say("@She called herself the Ice Witch and came here babbling about embracing the cold or some nonsense. She seems quite into the cold and seemed to become aroused even speaking of it.@");
			say("@During the course of my conversation with her she gave an ultimatium about letting her transform us to the next level or somesuch. It was at this point I told her to leave our settlement and not to come back.@");
			say("@So far she has not returned but some trappers in the field have come back from a hunt saying that a strange woman appeared and began to spout off the same sort of ideas. It is most certain that it is the same woman.@");
			say("@Regardless, she seems to certainly cause some distress amoung the trappers but there is not much I can do as long as she does not do it in the settlement itself.@");
			say("@It is not like I run the entire frigid planes.@");
			UI_remove_answer("Woman");
        }

    }

}
		
UI_remove_npc_face(item);	
}

