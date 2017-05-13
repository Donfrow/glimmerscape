/*
Blindfolded man, pretending random things occur
*/

void Understand_Blindfold()
{
UI_push_answers();

converse(["Huh?", "I understand"])
{
	case "Huh?" (remove):
	say("@To appear as if all the steps that were, are, and will be taken are truely unseen and random.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "I understand" (remove):
	say("The man motions to his blindfold. @I see that you truely do not.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}
	
}

void Blind_Man object#(0x590) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Do you see the sands of time?";
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
				UI_item_say(item, "What has become will be seen");
			else if (n == 2)
				UI_item_say(item, "What will be is seen");
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
        call Blind_Man, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The man turns and faces you directly. @Your eyes not yet opened.@");
	
}
else
{
	say("A blind folded man turns and faces you. @Your eyes look to be opened but you first must close them.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("@Fate is beckoning you.@");
	break;
	
	case "Name" (remove):
	say("@If you close your eyes will you see more clearly? Perhaps if you open them wide then you will see? No, you will not in either case. I am the Nameless one.@");
	
	case "Job" (remove):
	say("The man makes several motions with his hand, as if rolling a pair of dice or spinning a wheel.");
	say("@To ensure that the sands in the hourglass flow through the grains of time ensuring the beach is not the same everywhere.@");
	say("@Simply put, to ensure that chance has a chance to occur.@");
	add(["Motions", "Chance", "Occur", "Blindfold"]);
	
	case "Motions" (remove):
	say("The motions continue as the man speaks. @Do you think all which was, is, and will be works of its own volition?@");
	add(["Volition"]);
	
	case "Volition" (remove):
	say("The man move his arms as if spinning a massive, invisible wheel. @The exercise of all that was, is, and will be must be kept in motion.@");
	
	case "Chance" (remove):
	say("@Chance does not exist one when knows all that will ever be. The outcome which will be observed has already been determined.@");
	say("The man stops and makes a quick gesture of rolling dice. @Yet the dice must continue to roll.@");
	add(["There is no chance then?", "Dice"]);
	
	case "There is no chance then?" (remove):
	say("@When one sees all chance cannot exist. But the motions must continue for that is how it is seen that chance will be determined. Nothing is random.@");
	add(["Random"]);
	
	case "Dice" (remove):
	say("@A nearly perfect game of chance. The roll of two die will always seem to be random. But it is simply not so when one already knows the outcome.@");
	add(["Outcome"]);
	
	case "Outcome" (remove):
	say("@The outcome is already set. The roll simply must be done for the outcome to occur.@");

	case "Random" (remove):
	say("@Much like the events which lead you here the the outcome of the roll will appear to be random but before the dice are even cast the outcome is already known.@");
	
	case "Occur" (remove):
	say("@It is foreseen the event that will occur, along with all the happenings preceeding it. The rolling of the dice, the spinning of the wheel, they are all parts of the act preceeding the final outcome.@");
	add(["Final outcome", "Why act as you do?"]);
	
	case "Final outcome" (remove):
	say("@The final outcome is the event. Everything else is merely minor episodes leading to the event.@");
	add(["What is the event?"]);
	
	case "What is the event?" (remove):
	say("@That is simply not for you to know.@");
	
	case "Why act as you do?" (remove):
	say("The man tugs his blindfold. @For that is how it has been seen.@");
	
	case "Blindfold" (remove):
	say("A quick movement of the mans hand tightens the blindfold. @To prevent seeing the unseen which is already seen.@");
	Understand_Blindfold();
	
}

}
}
