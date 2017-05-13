/*
Dugglesworth the ghostly servant in the mansion
*/


void Dugglesworth object#(0x5b6)()
{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Ungh";
var bark_intro = "Hail spirit";
var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var has_infinity_orb = UI_count_objects(PARTY, ORB_OF_INFINITY, ANY, ANY);

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
				UI_item_say(item, "Uuungh");
			else if (n == 2)
				UI_item_say(item, "Aoooieee");
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
        call Dugglesworth, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{
UI_show_npc_face(item);
if(has_soul_orb > 0 || has_infinity_orb > 0)
{
	if (UI_get_item_flag(item, MET)) 
	{
		say("The apparition looks back at you with empty eyes.");
	}
	else
	{
		say("A ghostly apparition looks back you at with eyes of panic. @I saw everything. It was horrible!@");
		UI_set_item_flag(item, MET, true);
		add(["Name"]);
	}
	
	converse(["Job", "Bye"])
	{
		case "Name" (remove):
		say("The apparition seems startled. @So few care the name of a servant. I am Miss Dugglesworth. How may I help you?@");
		
		case "Bye" (remove):
		say("@Uuuugh.@");
		break;
		
		case "Job" (remove):
		say("The ghost begins sweeping motions with a non existant broom. @I serve the owners of this house. I keep it in good order. But it is such a mess lately.@");
		say("The apparition bends over to try and pick up some garbage and appears frustrated as her ghostly hand passes through it. @I cannot seem to keep this place clean.@");
		add(["Owners", "Place"]);
		
		case "Owners" (remove):
		say("@I serve master Clenus Archibald and his fine wife Tricia. I also tend to their child. Oh but he has been so sick lately. I fear the worst for poor Patrick.@");
		add(["Clenus", "Tricia", "Patrick"]);
		
		case "Clenus" (remove):
		say("@He is often locked up in his office doing some sort of work but I cannot blame him. He created his fortune from nothing so he must work hard to keep it from failing.@");
		say("@But he can be so uncaring. He rarely sees his child and leaves most of his fatherly duties to me. It is I who plays with the child, I who reads him his bedtime stories.@");
		say("The ghost looks confused. @Where did Patrick run off to this time?@");
		
		case "Tricia" (remove):
		say("A silent chuckle fills the room. @That woman is a caring mother but she is too neurotic with the child. She watches me like a hawk to ensure that I bring no harm to the child.@");
		say("@She has even beaten me for reading his bedtime story without the right tone of voice. But I deserved it. The child needs a good bedtime story.@");
		say("Suddenly the apparition beings to panic. @But the butcher knife. She would not have Patrick locked up! No, she would not let Clenus put him away.@");
		add(["Locked up", "Butcher knife"]);
		
		case "Locked up" (remove):
		say("@The child is changing! He is not himself since the disease! He killed and began to eat the family cat! It was horrible to see such a thing! But Tricia sees none of it. All she sees is her baby.@");
		say("@The child tried to attack me while she watched. She would not interfere with what her little baby wants to do. The child is going mad!@");
		
		case "Butcher knife" (remove):
		say("It is clear the ghost is reliving a terrible moment. @Not the knife! Please stop Tricia! He is your husband! Stop cutting him! He only cares about the childs wellbeing!@");
		say("@Please, no Tricia! Stop it! It hurts! No! You are killing me! I will do whatever you want! Stop it! Tricia... no!@");
		add(["What is happening?"]);
		
		case "What is happening?" (remove):
		say("It is clear the ghost has no idea what is going on and is merely vocalizing what was her last moments on earth. @Master Clenus... she has went into the cellar...@");
		say("@I... cannot lock the door... you must do it... keep them from getting out...@");
		break;
		
		case "Patrick" (remove):
		say("@What a lovely child he is. That is before the illness. He was such a lovely child but the illness has changed him. He is now a horrible beast. But Tricia will see none of it.@");
		say("It is clear that the ghost shutters. @She would rather put an end to us than hear criticism of her child... the woman has gone mad.@");
		add(["Mad"]);
		
		case "Mad" (remove):
		say("@She is mad! Stop the bloodshed Tricia! Please! He only cares for you and the child! The child is sick! Please stop the madness! No! Please!@");
		RandomPartySay("@It appears that the ghost is reliving her final painful moments in this world.@");
		break;
		
		case "Place" (remove):
		say("@Such a lovely house is it not? But it is so hard to keep clean. But that is what I am paid to do. I must keep cleaning or else Master Clenus will be angry. Please, let me clean.@");
		break;
	}
	
	
}
else
{
	say("An eerie face looks back at you and moans.");
}

}
}
