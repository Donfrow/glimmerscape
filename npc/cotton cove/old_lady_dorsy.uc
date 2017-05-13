/*
Old Lady Dorsy - the witch
*/

void Old_Lady_Dorsy_Name()
{

var avatar_name = UI_get_npc_name(0);

UI_push_answers();
converse(["Old Lady Dorsy", "Awesome Face", avatar_name, "Batlin"])
{

	case "Old Lady Dorsy" (remove):
	say("The woman gives you a cold stare. @You best learn some manners or you will eventually find yourself in trouble.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Awesome Face" (remove):
	say("The woman looks skeptical. @Never before have I heard such an odd name.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	/* NOT FUNCTIONING
	case avatar_name (remove):
	say("@It is a pleasure to meet you.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	*/ 
	
	case "Batlin" (remove):
	say("@It is a pleasure to meet you Batlin. I hope all is going well with the inner triad.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

}

}

void Old_Lady_Dorsy object#(0x5c9) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hail to you";
var bark_intro = "Hail";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else if (UI_get_schedule_type(item) == TEND_SHOP)
		{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Lovely, lovely");
			else if (n == 2)
				UI_item_say(item, "This should bring some pain");
		}
		else if (UI_get_schedule_type(item) == IN_COMBAT)
		{
		}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Dumdadee");
			else if (n == 2)
				UI_item_say(item, "Ho hum hee");
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
        call Old_Lady_Dorsy, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
{
	add(["Job", "Bye"]);
	say("Old Lady Dorsy beams a crooked smile at you. @Well if it is not you again.@");
}
else
{
	add(["Name", "Job", "Bye"]);
	say("A rather portly woman smiles back at you with a crooked grin. @It is always nice to meet a new face.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
if(gflags[HELP_ANNALYN])
{
add(["Missing persons"]);
}
	
converse([])
{
	
	case "Bye" (remove):
	say("@Yes yes, you must be on your way deary.@");
	break;
	
	case "Name" (remove):
	say("The crooked grin widens to reveal what appears to be rotting teeth. @My, such manners you young folk have. I am Lady Dorsy.@");
	say("@And now that you know my name, what is yours?@");
	Old_Lady_Dorsy_Name();
	
	case "Job" (remove):
	say("As the woman continues to speak the stench of her breath offends your nostrils. @I am long since retired. Now I live here in my home, alone, with only my cat to keep me company.@");
	add(["Retired", "Home", "Cat"]);
	
	case "Retired" (remove):
	say("@I used to sew clothes for those less fortunate are now long since past. No longer can my hands work a needle and thread for they are too frail.@");
	add(["Less fortunate", "Frail"]);
	
	case "Less fortunate" (remove):
	say("@It is sad that there are so many who do not even have a roof over their heads or clothes on their backs. These folks often have no family or anyone to care for them.@");
	say("@If many of them simply disappeared I do not think anyone would notice they were gone.@");
	
	case "Frail" (remove):
	say("She raises her hands and shows you black and broken nails. @All the work with my hands over the years have left them frail and nearly useless. It is amazing I manage to even cook for myself.@");
	say("@It was all worth it though, helping those poor unfortunate people.@");
	
	case "Home" (remove):
	say("@My home is nice and cozy. It is so far off the usual path that few people of ill repute travel this way. At the same time I get a lovely shoreline.@");
	say("@I do not know why anyone would live in a city when they could live in a place such as this.@");
	add(["Usual path", "Ill repute"]);
	
	case "Usual path" (remove):
	say("@There is only a lone dirt road that leads up to my cozy little home here, and even that road is not connected to the road usually travelled.@");
	
	case "Ill repute" (remove):
	say("@Those who are crooks and thieves do not usually travel this way. Those that do will get a pleasent surprise if they should try any of their foul ways here.@");
	add(["Pleasent surprise"]);
	
	case "Pleasent surprise" (remove):
	say("As the woman grins it almost appears as if her teeth will fall out. @No need for you to inquire about that.@");
	
	case "Cat" (remove):
	say("@Is he not the most precious thing? He is an excellent at catching mice and keeps an eye on my house when I am out doing errands.@");

	case "Missing persons" (remove):
	say("As you begin to question Old Lady Dorsy about Annalyn's missing husband and child she raises her hand to silence you. @That Annalyn, she has such a wild imagination.@"); 
	say("@I am not one to judge ones motherly and wifely duties but I will tell you this: I have seen her letting her child run freely unsupervised, far too often. If I had a child I would not act as she does.@");
	say("@I should not say this either but I have also seen her husband philandering around with many woman. So many in fact that I lost count long ago.@");
	say("Old Lady Dorsy pauses as she takes a breath, only to exhale the putrid aroma from her mouth afterwards. @I fear Annalyn is simply looking for someone to blame for problems she has created herself.@");
}


}
}

