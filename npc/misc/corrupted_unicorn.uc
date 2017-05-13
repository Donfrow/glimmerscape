/*
Corrupted Unicorn in the Good test (when evil)
*/

void Corrupted_Unicorn object#(0x5c1) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Your type is not welcome here";
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
        call Corrupted_Unicorn, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
say("@Your twisted and corrupt heart is a boon upon the lands.@");
converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("@Will your dark heart protect you from the corrupted forces of good?@");
	UI_set_alignment(449, HOSTILE);
	UI_set_schedule_type(449, IN_COMBAT);
	UI_set_opponent(449, AVATAR);
	break;
	
	case "Name" (remove):
	say("@My name is of no concern for those who dare enter a pure land with a twisted heart.@");
	
	case "Job" (remove):
	say("The creature lets out a hidious laugh. @My job is to guide those pure of heart. Those whom are not pure of heart shall be faced with twisted madness.@");
	add(["Pure of heart", "Twisted madness"]);
	
	case "Pure of heart" (remove):
	say("@You are nothing but a shadow of pureness. What once was an blank palette is now nothing but wanton and greed due to your presence.@");
	say("@Can you not see such a wonderful place now stands in pain and suffering due to your intrusion?@");
	add(["Intrusion"]);
	
	case "Intrusion" (remove):
	say("@Would one such as yourself be welcomed into a place of good? No, of course not. All that you know and care for is the opposite for which such a place stands for.@");
	say("@Did that stop you though? Of course not. Your greed, your desire, draws you to and do things that are not welcome. That is why you are left with such madness.@");
	
	case "Twisted madness" (remove):
	say("@Do you not see that this land should be a utopian paradise? No, any such place the likes of you would destroy with your greed.@");
	say("@Do not fret though, for you shall spend an eternity here, forever rotting in the very place you shaped with your black heart.@");
	add(["Eternity", "Black heart"]);
	
	case "Eternity" (remove):
	say("@Do you truely think I shall ever let you leave? Ha ha ha!@");
	
	case "Black heart" (remove):
	say("@Your heart desires that which will only benefit you. Do you think this place is normally twisted? No, your cold desires twist us so that you may see yourself.@");
}

}
}
