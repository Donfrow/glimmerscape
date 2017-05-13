/*
Jordell
*/



void Jordell object#(0x5a1) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "What do you want?";
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
				UI_item_say(item, "I could do so much better");
			else if (n == 2)
				UI_item_say(item, "Things can be improved");
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
        call Jordell, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("Jordell rolls her eyes at you. @Oh, it is you again.@");
}
else
{
	say("A woman looks at you and rolls her eyes. @What would someone like you want with me?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("Jordell simply turns away from you.");
	break;
		
	case "Name" (remove):
	say("@Do you really have to ask such a thing? I am Jordell.@");
	
	case "Job" (remove):
	say("She lets out a laugh. @I am a member of the Inner Circle of Brentonia of course. Anyone who is anything knows that.@");
	add(["Inner Circle", "Brentonia", "Anyone"]);
	
	case "Inner Circle" (remove):
	say("@Only the elite of Brentonia are worthy to advise Lord Brent. As I am such a person I am needed to advise our noble leader. Though at times the petty squabbles can delay what needs to be done.@");
	add(["Elite", "Lord Brent", "Squabbles"]);
	
	case "Elite" (remove):
	say("The woman laughs at you. @Clearly you are not one of the elite. You lack the understanding of the world at large. You lack the vision.@");
	say("@I suppose I should help guide you though. After all, it is the duty of one such as myself to help guide those less fortunate.@");
	
	case "Lord Brent" (remove):
	say("@Lord Brent is a fair ruler, acting in the best interest of his people but I feel he would be nothing without the Inner Circle to help guide him.@");
	say("@Though he is wise enough to see the need to put those such as myself around him to help lead.@");
	
	case "Squabbles" (remove):
	say("@Take for instance the outpost construction that was recently ambushed. We lost our most valued member of the circle, Vortas, yet the circle squabbles on what to do next.@");
	say("@Yet his body still lies where he was slain, exposed to the elements. That is not what should happen to such valued man. His body should be recovered!@");
	say("@But no, the circle squabbles about how to proceed. Sometimes I wish the circle simply did not exist.@");
	
	case "Brentonia" (remove):
	say("@Is it not such a wonderful place to be? Only through such great leadership of the Inner Circle does it thrive so.@");
	
	case "Anyone" (remove):
	say("Jordell rolls her eyes. @If you have to ask you are not.@");
}

}
}


