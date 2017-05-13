/*
Nakentep the mage in Hensall
*/

void Nakentep object#(0x5af) ()
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
				UI_item_say(item, "What have I done");
			else if (n == 2)
				UI_item_say(item, "The deaths are on my shoulders");
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
        call Nakentep, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
say("@Now that the gate is closed we can speak.@");

if(!(item->get_item_flag(MET)))
{
	add(["Name"]);
}

converse(["Job", "Bye"])

{
	
	case "Name" (remove):
	say("@Of course. In all that was going on we did not have a proper introduction. I am Nakentep.@");
	item->set_item_flag(MET);
	
	case "Bye" (remove):
	say("@Thank you again for helping me close the gate. Now to rebuild the town...@");
	break;	
	
	case "Job" (remove):
	say("@My job is that of a bumbling fool. It is my fault the town is in ruin. I should have forseen these events. What a fool I have been. Curse my servant!@");
	add(["Ruin", "Servant"]);
	
	case "Ruin" (remove):
	say("@Hensall is in ruins and many lie dead thanks to my quest for knowledge. Oh what a fool I was. Never again will I dabble in the art of inter-realm gateways.@");
	add(["Inter-realm gateways"]);
	
	case "Inter-realm gateways" (remove):
	say("@It was my belief there were more realms than that of the demon realm so I worked endlessly to open a gateway to these other realms.@");
	say("The man shakes his head. @How could I not see that the beasts would be too powerful for me? How could I not see forsee our magic not affecting them?@");
	add(["Demon realm", "Magic"]);
	
	case "Demon realm" (remove):
	say("@Many years ago a great mage opened the first gateway to a realm that we now know as the demon realm. I was only trying to continue with his work! What a fool I was!@");

	case "Magic" (remove):
	say("@I should have forseen that our magic may not effect creatures from other realms in the same way it effects creatures here but I was too foolish to think of that possibility.@");
	say("@The barrier the mayor insisted I place at the entrance to my home did not even have an effect on the creatures. They were able to pass through it without any resistance.@");
	say("Nakentep lowers his head. @All it did was prevent others from entering my home to help me in closing the gate, that is until you managed to recover one of the medallions.@");
	add(["Medallion"]);
	
	case "Medallion" (remove):
	say("@I placed a magical incantation on the medallion you used to enter my home that temporarily distorts the barrier so that one can pass through it.@");
	say("@It was supposed to keep anything from being able to leave my home but instead all it did was keep us out when the gateway was opened.@");
	
	case "Servant" (remove):
	say("@During one of my first successful experiments I opened a gateway and a red skinned brute appeared in my home. It seemed aggressive but I used my magic to tame the beast.@");
	say("@I thought my magic would allow me to tame the creature so that it could perform menial labour tasks while I continued my work. It worked for some time until I managed to open another gateway.@");
	say("@As soon as the gateway opened my servant became so aggressive that it was almost as if my magic had no effect on it.@");
	say("@Before I could even cast a spell my servant had knocked me unconcious. When I awoke I was shackled to the wall and the gateway remained open, with otherworldly beasts pouring out into Hensall.@");
	say("@It was not until you managed to free me that I had a chance to close the gateway.@");


	

}

}
}
