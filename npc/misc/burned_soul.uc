/*
Burned soul, in the cell by Lord of Flame
*/

void Burned_Soul object#(0x5d5) ()
	{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "It burns...";
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
        call Burned_Soul, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("The empty eyes look back at you.");
add(["Job", "Bye"]);
}
else
{
say("Empty eyes look back at you.");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("You are given no acknowledgement as you leave.");
	break;
	
	case "Name" (remove):
	say("You are answered with a dull, monotone voice. @My name has long since turned to ashes.@");
	
	case "Job" (remove):
	say("@My job is to suffer. Will the burning ever stop? Please... stop the burning.@");
	add(["Suffer", "Burning"]);
	
	case "Suffer" (remove):
	say("@Azechal leaves me to suffer. Will he ever choose to stop the pain? I was so loyal Azechal. Why has he foresaken me?@");
	add(["Azechal"]);
	
	case "Azechal" (remove):
	say("@My old mentor, my old instructor. He was to guide me through the ranks of the element known as fire. How foolish I was. I should have seen it coming.@");
	say("@And now I am here forever. Forever feeling the intense heat of fire upon my soul.@");
	add(["Mentor", "Fire", "Foolish"]);
	
	case "Mentor" (remove):
	say("@I was his apprentice. He was to teach me all his knowledge of fire. Little did I know the fate my thirst for knowledge would leave upon me.@");
	add(["Fate"]);
	
	case "Fate" (remove):
	say("@My soul forever burns. Never will I be free. I am forever corrupted.@");
	add(["Corrupted"]);
	
	case "Corrupted" (remove):
	say("@My essence is forever aflame. When one is in such a state one can never leave, never go anywhere. I am forever trapped in this accursed state.@");
	
	case "Fire" (remove):
	say("@Fire is such a lovely element. It brings life and it brings death. It is the strongest of the elements. It is this reason I sought out the Lord of Flame.@");
	add(["Lord of Flame"]);
	
	case "Lord of Flame" (remove):
	say("@Azechal, my old mentor, is the one known as the Lord of Flame. His laboratory is in the blazing depths of these caverns, beyond the brass door.@");
	add(["Brass Door"]);
	
	case "Brass Door" (remove):
	if(gflags[RECEIVED_LORDOFFLAMEKEY])
	{
		say("@I have already given you the key so that you may venture beyond the brass door. I can offer you no more.@");
	}
	else
	{
		say("He reaches his charred hand through the bars and hands you a key. @This key shall unlock the door. Be wary when you pass through the door or else you may suffer the same fate that is now burned upon me.@");
		UI_add_party_items(1, 641, 44, 28); //Add the key to the door
		gflags[RECEIVED_LORDOFFLAMEKEY] = true;
		
	}
	
	case "Foolish" (remove):
	say("@What a fool I was. Why was I so foolish to think Azechal would share his knowledge of fire with anyone? I should have seen that he was merely using me.@");
	say("@A mere a pawn... a component in his experiments.@");
	say("@Yet, I cannot go back and undue that which has been done. My foolishness has forever cursed me to feel the heat of fire on my very essence for eternity.@");
	add(["Pawn", "Experiments"]);
	
	case "Pawn" (remove):
	say("@Azechal needed a willing participent to use within his tests. I thought he would share the results with me, with his apprentice, but I was naive. He merely wanted a complacent subject.@");
	say("@I should have seen the thirst for power in his eyes but I was too blind.@");
	
	case "Experiments" (remove):
	say("The pale face looks at you, almost appearing as if to cry. @So many things I let him do to me. So many theories I let him test upon me.@");
	say("@I dare not speak of them. Who knows what he could still do to my poor essence...@");
	if(UI_is_dead(-387))
	{
		add(["Lord of Flame is dead"]);
	}
	
	case "Lord of Flame is dead" (remove):
	say("He stares blankly. @His body may be destroyed but I can assure you he still lives on in the very flames themselves.@");
	
	case "Burning" (remove):
	say("@Can you not feel the intense heat? No... perhaps not. You are not torn apart by the very flames you sought to control.@");
	
}
}



}
