/*
Worley, stranded crew member in Hensall
*/


void Worley object#(0x5b1) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Arr";
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
				UI_item_say(item, "Bad times");
			else if (n == 2)
				UI_item_say(item, "Pirates and monsters all around");
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
        call Worley, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

if(gflags[HENSALL_FREED]) // IF HENSALL DEMON ATTACK IS OVER
{

if (UI_get_item_flag(item, MET)) 
{
	say("@It be a shame what is left of thw town but at least the invasion is over.@");
}
else
{
	say("@Well met there, good to see another survivor.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);
}

converse(["Job", "Bye"])
{
	case "Bye" (remove):
	say("@I wish ye the best of luck in yer travels.@");
	break;
	
	case "Name" (remove):
	say("@I be Worley.@");
	
	case "Job" (remove):
	say("@I has no job no more other than to see what I can do for the citizens of Hensall as they rebuild the town.@");
	say("@But before this change of career I was a sailor.@");
	add(["Rebuild", "Sailor"]);
	
	case "Rebuild" (remove):
	say("@With the invasion over it is time to rebuild what is left of the city. As my ship destroyed and crew slain I do not have much of a choice but to join them in rebuilding.@");
	say("Worley leans towards you. @I have seen some horrid things in my days at sea but I am certainly not looking forward to cleaning out all the bodies of those who fell.@");
	
	case "Sailor" (remove):
	say("@Indeed, a sailor. Me and the other members of the crew arrived in Hensall shortly after the invasion began. We thought things looked odd before we docked but we did so anyway.@");
	say("@Next thing we knew savage beasts the likes I have never seen in me travels were attacking us. The rest of the crew fell and I would have too had a scouting party not saved me.@");
	add(["Crew", "Scouting party"]);
	
	case "Crew" (remove):
	say("@We had been through a lot as we sailed the seas over the years but it finally came to an end. I prefer to think that the rest of them are now sailing to their hearts content in another life.@");
	
	case "Scouting party" (remove):
	say("@They had seen us dock but were unable to reach us before all but I had been slain by the beasts. They managed to get some supplies before they had no choice but to retreat.@");
	say("@Or so I was told. I was unconcious for most of it.@");
	add(["Supplies"]);
	
	case "Supplies" (remove):
	say("@When the invasion was still going on these folks had no choice but to scavange for any supplies to aid them in the fight.@");
	say("@Now that the invasion is over they need to scavange through the ruins of the town to get whatever is still of use. At least they can now scavange without fear of being slain.@");


}

	
}
else
{	
if (UI_get_item_flag(item, MET)) 
{
	say("Worley nods at you. @Good to see yer still in one piece.@");
	
}
else
{
	say("A man looks over at you. @Yer that fellow the scouting party saved, aren't ye?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);
}

converse(["Job", "Bye"])
	
{		
	case "Bye" (remove):
	say("@I wish ye the best of luck.@");
	break;
	
	case "Name" (remove):
	say("@Yar, it always be better to know the name of those ye be fighting alongside. I be Worley.@");
	
	case "Job" (remove):
	say("@I has no job no more other than to fight alongside the citizens of Hensall to try and keep back their would be slayers.@");
	say("@But before this change of career I was a sailor.@");
	add(["Fight alongside", "Sailor"]);
	
	case "Fight alongside" (remove):
	say("@I not be a citizen of this town but I be trapped here like the rest of them. It be fight or be killed by the nasties which are attacking this town.@");
	say("@And personally I rather be a fighter than be a corpse lying somewhere in this town.@");
	
	case "Sailor" (remove):
	say("@Indeed, a sailor. Me and the other members of the crew arrived in Hensall shortly after the invasion began. We thought things looked odd before we docked but we did so anyway.@");
	say("@Next thing we knew savage beasts the likes I have never seen in me travels were attacking us. The rest of the crew fell and I would have too had a scouting party not saved me.@");
	add(["Crew", "Scouting party"]);
	
	case "Crew" (remove):
	say("@We had been through a lot as we sailed the seas over the years but it finally came to an end. I prefer to think that the rest of them are now sailing to their hearts content in another life.@");
	
	case "Scouting party" (remove):
	say("@They had seen us dock but were unable to get to us in time before all but I had been killed by the beasts. They managed to retrieve some supplies before they had no choice but to retreat.@");
	say("@Or so I was told. I was unconcious for most of it.@");
	add(["Supplies"]);
	
	case "Supplies" (remove):
	say("@Aye, these folks have no choice but to scavange for any supplies to aid them in the fight. They managed to retrieve some supplies from the ship before being pushed back.@");
	say("@As it stands now they have lost ground and are no longer able to make it back to me ship for the rest of the cargo.@");
	add(["Lost ground"]);
	
	case "Lost ground" (remove):
	say("@They used to control more of the city but have been pushed back as time goes on. This area here is all the only part of the city that is  left under their control.@");
	say("Worley whispers to you. @And this ain't much.@");
	

}
} // end else statement bracket
}
}
