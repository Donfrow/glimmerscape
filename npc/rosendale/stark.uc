/*
Stark, town child
*/

void Returning_Mr_Frumps()
{
UI_push_answers();

converse(["Give toy", "It will cost you"])
{

	case "Give toy" (remove):
	say("As you hand the stuffed toy to the child he jumps around laughing and singing. @You sure showed Lynel. You are the best ever!@");
	KarmaGoodSprites();
	UI_remove_party_items(1, MR_FRUMPS, ANY, ANY);
	karma = karma + 100;
	gflags[RETRIEVED_STARKS_TOY] = true;
	gflags[RETRIEVED_STARKS_TOY_GOOD] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "It will cost you" (remove):
	say("The childs smile and widen eyes suddenly turn to tears. @I thought you were nicer than mean old Lynel but you are not. You are just as bad.@");
	say("The child rustles around his belongings and pulls out a pile of gold coins. @Here, take this and give me back Mr. Frumps. It is my allowance for the last month.@");
	KarmaBadSprites();
	UI_remove_party_items(1, MR_FRUMPS, ANY, ANY);
	karma = karma - 50;
	gflags[RETRIEVED_STARKS_TOY] = true;
	gflags[RETRIEVED_STARKS_TOY_BAD] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;	

}

}

void Stark object#(0x5e8) ()
{

var mr_frumps_toy = UI_count_objects(PARTY, MR_FRUMPS, ANY, ANY);
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hello!";
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
				UI_item_say(item, "Wee!");
			else if (n == 2)
				UI_item_say(item, "Trala");
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
        call Stark, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("The child smiles at you. @Hello again!@");
add(["Job", "Bye"]);
}
else
{
say("A child smiles at you. @Hello there!@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

if(mr_frumps_toy > 0)
{
	if(gflags[LEARNED_OF_STARKS_TOY])
	{
		add(["Mr. Frumps"]);
	}
}

converse([])
{
	case "Bye" (remove):
	if(female)
	{
		say("The child blushes. @Goodbye beautiful lady.@");
	}
	else
	{
		say("@Goodbye!@");
	}
	break;
	
	case "Name" (remove):
	say("The child seems extremely happy that you wish to know more about him. @I am Stark.@");
	
	case "Job" (remove):
	say("A childish giggles is released from his mouth. @Silly, I do not have a job. I am only 10 years old.@");
	add(["10 years old"]);
	
	case "10 years old" (remove):
	say("It appears the child is quite proud of his age. @That is right. I am a big one-oh. Soon I will be a man and I will fight injustice and make my mother proud of me.@");
	add(["Injustice", "Mother"]);
	
	case "Injustice" (remove):
	if(gflags[RETRIEVED_STARKS_TOY])
	{
		if(gflags[RETRIEVED_STARKS_TOY_BAD])
		{
			say("The boy glares at you. @You are the type of person I will fight. You are a big meanie like Lynel.@");
		}
		else
		{
			say("@You and I fight injustice together! We showed that big brute Lynel that his grouchiness cannot stop us.@");
		}
	}
	else
	{
		say("@Mother always taught me to be kind and fair and to not be unjust to those around me. Not like the poo poo head Lynel.@");
	}
	add(["Lynel"]);
	
	case "Lynel" (remove):
	say("@Lynel is a big bully who thinks he can do whatever he wants since everyone loves the food he makes in his pub. He is only that way since noone likes to stand up to him.@");
	if(gflags[RETRIEVED_STARKS_TOY])
	{
		if(gflags[RETRIEVED_STARKS_TOY_BAD])
		{
			say("He glares at you. @You and him should be best friends. You are both big meanies.@");
		}
		else
		{
			say("@You and I fight injustice together! We showed that big brute Lynel that his grouchiness cannot stop us.@");
			say("He laughs. @You sure showed though. Now he knows someone is willing to stand up to him.@");
		}
	}
	else
	{
		say("@He is such a meanie that he took a toy I left outside and refuses to give it back! I have tried to get it myself but he does not even let me in his pub.@");
		gflags[LEARNED_OF_STARKS_TOY] = true;
	}
	add(["Pub"]);
	
	case "Pub" (remove):
	say("@He runs the pub here in town and he has banned me from being allowed inside it. He is such a meanie.@");
	if(gflags[RETRIEVED_STARKS_TOY])
	{
		say("@But he was not smart enough to ban you! You showed him and now I have my toy back!@");
	}
	else
	{
		say("The child looks at you. @But you would be allowed in! Please, please go and retreive my toy he took from me. I would be ever so thankful.@");
	}
	add(["Toy"]);
	
	case "Toy" (remove):
	if(gflags[RETRIEVED_STARKS_TOY])
	{
		say("He hugs the stuffed animal. @I love it so much. Thank you for getting Mr. Frumps back for me.@");
	}
	else
	{
		say("Tears start to run down the childs cheeks. @I was playing with Mr. Frumps at the town well when mother called me. I left it there to go see what she wanted.@");
		say("@When I got back I saw Lynel taking it inside his pub.@");
		say("@I begged him to give it back but he just laughed at me.@");
	}
	
	case "Mother" (remove):
	say("@My mother is Bethany! She is quite nice to me but she is always so busy. I tried telling her about my toy but she nodded her head. I do not think she was even paying attention.@");
	if(gflags[RETRIEVED_STARKS_TOY])
	{
		say("@At least you listend to me. Now I have Mr. Frumps back. I love it so.@");
	}
	else
	{
		say("@Now I do not have Mr. Frumps anymore. I cannot blame mother though. I know she is busy. I will have to find a way to get it back without mothers help.@");
	}
	
	case "Mr. Frumps" (remove):
	say("As you show the stuffed toy to Stark his eyes widen and a great big smile appears on his face. @You got Mr. Frumps from mean old Lynel!@");
	Returning_Mr_Frumps();
	
}
}
else if (event == DEATH)
{
	

}


}

