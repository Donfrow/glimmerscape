/*
Walker, head of the resistence in Hansall
*/

void Walker_Battle()
{
UI_push_answers();

converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("You think the man smiles but you are uncertain. @I offer you my many thanks for aiding us in such terrible times.@");
	say("@If you find yourself anywhere in the ruins of the city feel free to take anything of use from the buildings. We can certainly use any supplies you can find.@");
	gflags[ON_HENSALL_QUEST] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	
	case "No" (remove):
	say("The man appears angry but his tone does not change. @Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}
	
}

void Walker object#(0x5ae) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Ah it is you";
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
				UI_item_say(item, "Such terrible times");
			else if (n == 2)
				UI_item_say(item, "How could this have happened");
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
        call Walker, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

if(gflags[HENSALL_FREED])
{
say("@With the gateway closed we are now able to round up and slay any of the remaining creatures.@");
converse(["Job", "Bye"])
{
	case "Bye" (remove):
	say("@I wish you the best of luck in whereever you go from here.@");
	break;
	
	case "Job" (remove):
	say("@Although the gateway is closed some beasts still inhabit our realm so I oversee the slaughter of those that remain. I do not suspect that will take long.@");
	say("@After that time I am not certain what I shall do though I suppose I am the leader of the town until it is back in normal order so that a new mayor can be elected.@");
	say("@Perhaps after that I will try to fix my pub. I do not know.@");
	add(["Gateway", "Beasts", "Mayor", "Pub"]);
	
	case "Gateway" (remove):
	say("@I suppose even though Nakentep opened the gateway it is not entirely his fault. I do not think any of us could truely foresee such carnage from his experiments.@");
	say("@But now is not the time for placing blame. We must begin to heal and rebuild.@");
	add(["Nakentep"]);
	
	case "Nakentep" (remove):
	say("@I admit I was quite angry with Nakentep earlier but after learning of what actually happened the fury has managed to subside.@");
	say("@And the last thing that man needs is another person blaming him for what happened. He is already beating himself up over it enough as it is.@");
	
	case "Beasts" (remove):
	say("@It seems with the doorway closed the beasts are not as strong as they used to be. I do not suspect that the few that remain in our world will manage to last very long.@");
	say("@Still, I suspect many of us will have nightmares of them for many nights to come.@");
	
	case "Mayor" (remove):
	say("@Although I have no love of politics Hensall needs a leader at this terrible time. Until the city is safe and people have time to heal there will not be an election to fill Farglesworth's position.@");
	say("Walker pauses for a moment. @Even if he was alive I do not think the town would be willing to let him continue his job anyway.@");
	add(["Farglesworth"]);
	
	case "Farglesworth" (remove):
	say("@I do not like to speak ill of the dead but I do not think he was the greatest mayor. That is not to say he did not do some good things though.@");
	say("Walker thinks for a moment. @Though I suppose the mere fact that he was mayor when the invasion started will forever tarnish his reputation and overshadow any good he ever did.@");
	
	case "Pub" (remove):
	say("Walker sighs. @It was always my dream to run a pub but now that dream lies in ruins. I am not certain if I will work to rebuild it or not.@");
}

	
}
else
{	
if (UI_get_item_flag(item, MET)) 
{
	say("Walker appears ragged and exhausted. @I hope you bring good word.@");
	
}
else
{
	say("The man looks you up and down. @You are that fellow whom the scouting party managed to save. It is good to see you are in good health.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);
	add(["Scouting party"]);
}

converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("@Be careful out there.@");
	break;
	
	case "Name" (remove):
	say("@Parden my rudeness. I am Walker.@");
	
	case "Scouting party" (remove):
	say("@We are running extremely low on supplies so I have no choice but to order men and woman to scout the ruins of the town and surrounding area for anything we can use.@");
	say("@Luckily for you when you were ambushed one of these parties was able to intervene and save you.@");
	
	case "Job" (remove):
	say("@I am a retired freelance soldier who opened up a pub here in Hensall. Sadly that pub is now destroyed and I have once again had to take up arms.@");
	add(["Soldier", "Hensall", "Pub", "Arms"]);
	
	case "Soldier" (remove):
	say("@I received my training by the soldiers of Brentonia and for many years I offered my services for those in need. I have been in many scuffles between kingdoms.@");
	add(["Scuffles"]);
	
	case "Scuffles" (remove):
	say("@I have no particular allegiance to anyone kingdom or monarch. I have fought along side Brentonian knights, Dewtopian knights, and even have done work for the Solusek Mining Company.@");
	
	case "Hensall" (remove):
	say("@It is, nay I should say was, a small city that was quickly growing until the invasion. Now it lies mostly in ruins.@");
	add(["Invasion"]);
	
	case "Invasion" (remove):
	say("@Otherworldly beasts began to spring fourth from the home of the mage Nakentep and have since overrun most of the city.@");
	say("@The beasts have slain many of the townsfolk and all that remains are huddled in this location. I fear we cannot hold out much longer.@");
	add(["Nakentep", "Otherworldly beasts", "Hold out"]);
	
	case "Nakentep" (remove):
	say("Walker holds a cold stare. @It is he who opened the doorway which allowed the beasts which now relentlessly destroy Hansall.@");
	say("@I tried to warn Farglesworth about the dangers but he was content to let Nakentep continue his experiments.@");
	add(["Farglesworth", "Experiments"]);
	
	case "Farglesworth" (remove):
	say("Walker snarls. @Farglesworth is the mayor of Hansall. Despite many of the townsfolk in fear of Nakentep's work he allowed it to continue.@");
	say("Walker pauses. @Though to be fair Farglesworth did order Nakentep to place a protective barrier so that nothing could enter his home without a special medallion.@");
	say("@The barrier turned out to serve quite the opposite purpose though.@");
	add(["Opposite purpose"]);
	
	case "Opposite purpose" (remove):
	say("@The barrier was supposed to keep anything from going in or out of Nakentep's home unless a special medallion was worn.@");
	say("@Unfortunately it seems the beasts can walk through the barrier anyway... while we cannot.@");
	add(["Medallion"]);
	
	case "Medallion" (remove):
	say("@Other than Nakentep I believe only Farglesworth had a medallion to pass through the barrier. Since Farglesworth is not with us in the only area of town we control no doubt he lies dead somewhere in the city.@");
	say("@Medallion in hand.@");
	
	case "Experiments" (remove):
	say("@Nakentep was working on inter-realm travel of some sort. I know he had managed to open at least one doorway as he had an otherworldly servant.@");
	add(["Otherworldly servant"]);
	
	case "Otherworldly servant" (remove):
	say("@I have never seen it myself. No doubt it is one of the same type of beasts that is destroying the town.@");
	
	case "Otherworldly beasts" (remove):
	say("@Never before have I seen such horrible creatures, and I have seen many beasts. Winged serpents and red skinned man like beasts. Far more savage than anything one would encounter in our world.@");
	
	case "Hold out" (remove):
	say("Walker motions around. @Two buildings and a basement is all that we still control. Sadly I do not think we can hold out much longer.@");
	say("Walker sighs. @We have lost many soldiers and townsfolk in the invasion and we are nearly out of supplies. I fear if we do not have a miracle we are all doomed.@");
	if(gflags[ON_HENSALL_QUEST])
	{
		say("@Hopefully with your help we will manage to shut down the gate through which the beasts enter our realm but I am not hopeful.@");
	}
	
	case "Pub" (remove):
	say("@It was always a dream of mine to run a pub. I thought Hensall would be a perfect place for such a business.@");
	say("@Unfortunately it is now but another building destroyed in the invasion.@");

	case "Arms" (remove):
	say("@All abled bodied citizens have taken up arms to defend what little remains of the town. Unfortunately it is proving to be a losing battle.@");
	if(gflags[ON_HENSALL_QUEST])
	{
		say("@Hopefully with your aid we will manage to retake the town but I remain doubtful.@");
		say("@And do not forget to take anything of use from the ruins of the city.@");
	}
	else
	{
		say("Walker looks you up and town. @I realize this is not your fight but we did save your life. Will you aid us in the battle against the beasts?@");
		Walker_Battle();
	}
	
	

}
} // end else statement bracket
}
}
