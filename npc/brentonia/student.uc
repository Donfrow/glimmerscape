/*
Generic student in Brentonia
*/


void Brentonia_Student object#(0x59d) ()
	{

var bark_random = UI_get_random(4);
var bark;

if(bark_random == 1)
{
bark = "I am not supposed to talk to strangers";
}
else if (bark_random == 2)
{
bark = "Teacher does not like us talking";
}
else if (bark_random == 3)
{
bark = "I am trying to learn";
}
else if (bark_random == 4)
{
bark = "Stranger danger!";
}
	
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
			var n = UI_get_random(5);// 1-2.
			if (n == 1)
				UI_item_say(item, "Math is hard");
			else if (n == 2)
				UI_item_say(item, "This is a dumb subject");
			else if (n == 3)
				UI_item_say(item, "Why do we have to learn this?");
			else if (n == 4)
				UI_item_say(item, "He spit on me!");
			else if (n == 5)
				UI_item_say(item, "I hate this");
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
    }
    // avatar's script here
    abort;
}

}
