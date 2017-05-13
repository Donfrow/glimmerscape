/*
End game Jester, chaos
*/


void Jester object#(0x58f) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Do you seek the essense of all that will be?";
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
				UI_item_say(item, "What is, has been");
			else if (n == 2)
				UI_item_say(item, "What has been, is");
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
        call Jester, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The jester dances around you. @Have you won that which has been given?@");
	
}
else
{
	say("A jester stands before you. @Do you seek what is? Do you seek what has been?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("@Fate is beckoning you.@");
	break;
	
	case "Name" (remove):
	say("@Do you not recognize me? I am the one with no name.@");
	
	case "Job" (remove):
	say("@Do you forget what has been said already? No, you have not. Merely confused.@");
	say("The jester seems to start a conversation with himself. @I know I do not need to ask such questions for the answer is known already. But is it not such fun?@");
	add(["Confused", "Who are you talking to?", "Slippers"]);
	
	case "Confused" (remove):
	say("The jester dances. @You should put this all together. Do you not notice that which is? Do you not recognize that which has been?@");
	add(["Is", "Has been"]);
	
	case "Is" (remove):
	say("@Yes that which is is that which will be. I see you do not see it clearly. But that which will be will be seen clearly. So you see, you do see it clearly!@");
	
	case "Has been" (remove):
	say("@That which has been is also that which is. You do not see it clearly but to me it is all merely an illusion.@");
	add(["Illusion"]);
	
	case "Illusion" (remove):
	say("@That which you see is that which you cannot change. You cannot decide that which you will do for you have already decided.@");
	add(["Decided", "I hate you"]);
	
	case "Decided" (remove):
	say("@Have you not yet realized that the choices you have decided are ultimately the correct ones? Do you not see that you can only choose one course of action to get this far?@");
	add(["One course"]);
	
	case "One course" (remove):
	say("The jester bounces. @Only one course of action could and can get you to where you are and will be. It figures out at some point do you see. Do you like my slippers?@");
	
	case "I hate you" (remove):
	say("The jester cackles gleefully. @Yet you continue in our repartee, as it has been foreseen.@");
	
	case "Who are you talking to?" (remove):
	say("The jester leans over and whispers into the air before turning to you. @Do you not see that I speak to that which has, is, and will be? I whisper to the sands of time.@");
	add(["Slippers"]);
	
	case "Slippers" (remove):
	say("@They are lovely are they not? My feet walk in them. Or do they walk in me? Whatever it may be they let me walk to where I need to be.@");
	say("He leans over and whispers into your ear. @Or do they let me walk where I have been?@");
}

}
}
