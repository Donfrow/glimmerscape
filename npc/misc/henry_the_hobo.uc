/*
Hobo outside the back entrance to the crypts
*/

void Henry_the_Hobo object#(0x5d8) ()
	{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Star light star bright";
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
				UI_item_say(item, "The cow goes @Moo@");
			else if (n == 2)
				UI_item_say(item, "The dog says @Bark@");
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
        call Henry_the_Hobo, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@I see you!@");
add(["Job", "Bye"]);
}
else
{
say("A rather ragged looking man chippers up when he sees he. @I see you! Yar I do!@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("As you are about to say goodbye to the man his attention is taken elsewhere by a shiny object.");
	break;
	
	case "Name" (remove):
	say("The man thinks for a moment and nudges you. @I am Henry. I bet you did not know that!@");
	
	case "Job" (remove):
	say("A puzzled look appears on his face. @What is theeeese job you speak of? Do you mean my home? The fishies? Oh how I love the fishies.@");
	say("Suddenly he starts to giggle. @But do not anger the fishies. If you do they make the scary noises from the caves.@");
	RandomPartySay("@Methinks this man may not quite have all of his faculties.@");
	add(["Home", "Fish", "Scary noises", "Caves"]);
	
	case "Home" (remove):
	say("@Look at me's home. Ain't it purdy? I lives in my home. Do you lives in my home too? I do not recognize you. You must not live in my home. Did you build it?@");
	add(["Build"]);
	
	case "Build" (remove):
	say("@I nots know who built my home. It was here when I found it. Maybe I did build it? I nots remember things clearly. Why you asking about my home? It is my home not yours!@");
	
	case "Fish" (remove):
	say("He puts his hand to his mouth and speaks softly. @The fishies do not know it but when I take them out of the water I eat them. Do not tell them though.@");
	say("His voice suddenly becomes loud. @Yep, I like playing so much with the fishies I put string in the water for them to play with. Me and the fishies have so much fun together.@");

	case "Scary noises" (remove):
	say("@The fishies do not like it when I am mean to them. They make the scary noises come out of the cave. I have no choice but to be nice to the fishies.@");
	say("He leans to you and begins whispering. @I have to be more careful to avoid angry the fishies. The noises are so scary.@");
	RandomPartySay("@Must we continue listening to this crazy talk?@");
	
	case "Caves" (remove):
	say("At the mention of the caves he backs up and starts to hit himself in the head. @I do not like the caves. I do not like the caves. The caves scare me.@");
	add(["Scare you"]);
	
	case "Scare you" (remove):
	say("He begins hitting himself harder. @The locked door. So many scary things. So scary. Do not let them continue. The caves will eat you!@");
	add(["Locked door", "Eat you"]);
	
	case "Locked door" (remove):
	say("@I cannot get past the locked door but I hear the scary noises. The fish must not want me in the cave. No, I will listen to the fish and not go into the cave.@");
	
	case "Eat you" (remove):
	say("Suddenly the man starts screaming. @The cave will you like I eat the fishies! Eeek! I let the fishies know what I do with them! Run away!@");
	script (-472)
	{
		say "Aieeeeee";
	}
	break;

	
	
}
}



}
