
void Moongate_Block object#()()
{

var wearing_necklace = UI_get_readied(AVATAR, NECK); // get object reference for what's in neck slot
var necklace = UI_get_item_shape(wearing_necklace); // get object shape for what's in neck slot
if(gflags[HENSALL_FREED]) // If the town has been freed
{
}
else
{
	if (necklace == HENSALL_MEDALLION) // check if it is the medallion in neck slot
	{
	}
	else
	{
		UI_set_item_flag(AVATAR, DONT_MOVE);
		UI_si_path_run_usecode(AVATAR, [2280, 2681, 0], SCRIPTED, AVATAR, UnFreezeAvatar, 0);
		script AVATAR
		{
			say "I cannot seem to enter";
		}
	}

	}
}

void Hensall_Demon_Talk()
{
UI_show_npc_face(493, 0);
say("A redish beast like the ones you encountered outside the house approaches you. @It is time for you to die human.@");

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("The creature begins to charge at you.");
	UI_clear_item_flag(-432, DONT_MOVE);
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	break;
	
	case "Name" (remove):
	say("@Name of no concern to you.@");
	
	case "Job" (remove):
	say("@Slave no more to likes of you. Your kind no longer the master.@");
	add(["Slave", "Master"]);
	
	case "Slave" (remove):
	say("@No longer do I serve the one you call Nakentep. Now Nakentep slave to me.@");
	add(["Nakentep"]);
	
	case "Nakentep" (remove):
	say("@Nakentep serve us now! Soon all of you serve us!@");
	UI_show_npc_face1(573, 0);
	say("A man chained to the wall yells at you. @Slay the beast now! Slay it before it is too late!@");
	add(["Us"]);
	
	case "Us" (remove):
	say("@Your kind no longer the rulers of this realm. Soon you bow before us.@");
	add(["Realm"]);
	
	case "Realm" (remove):
	say("The creatures begins to scream at you. @Your kind invade our realm. Your kind try your magic on us. Now you will obey us!@");
	add(["Can't we all just get along?"]);
	
	case "Can't we all just get along?" (remove):
	say("The creature continues to scream. @You will serve or you will die!@");
	
	case "Master" (remove):
	say("It seems to be a sore point for the creature as it yells furiously. @Your kind no longer make servant out of my kind! Our kind make you servant like you made us servant!@");
	say("@Your kind time is up! No longer will your kind be strong!@");
}

}

void Hensall_Demon_Encounter object#()()
{
	UI_move_object(-432, [2279, 2644, 0]);
	UI_set_item_flag(-432, DONT_MOVE);
	UI_set_item_flag(AVATAR, DONT_MOVE);	
	UI_si_path_run_usecode(-432, [2279, 2649, 0], SCRIPTED, -432, Hensall_Demon_Talk, 0);
}