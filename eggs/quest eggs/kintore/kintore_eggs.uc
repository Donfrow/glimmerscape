void EmptyKintoreFunction()
{
}

void Ashela_Script_Encounter()
{
UI_show_npc_face(387, 0);
say("A pretty woman in dark robes approachs the room and begins to swoon. @The blood, the death, it is so wonderful.@");

converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("The woman begins to scream. @I need blood and pain. I need to taste your death!@");
	UI_set_oppressor(-419, AVATAR);
	UI_set_alignment(-419, HOSTILE);
	UI_set_schedule_type(-419, IN_COMBAT);
	UI_clear_item_flag(-419, DONT_MOVE);
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	gflags[MET_ASHELE] = true;
	break;

	case "Name" (remove):
	say("The woman looks to the body of Karnax and moans. @I am Ashela.@");
	if(gflags[JOTH_WIFE])
	{
		add(["Kidnapped"]);
	}
	
	case "Job" (remove):
	say("A loud moan escapes her lips. @I embrace the blood, the death, the darkness. It is so lovely. It tastes so good.@");

	
	case "Kidnapped" (remove):
	say("@The Dark Monks did indeed kidnap me but they taught me all about death and despair. It feels so good. It is so captivating.@");
	add(["What of Joth?", "Taught", "Captivating"]);
	
	case "What of Joth?" (remove):
	say("Ashela squints. @Joth would never understand. But surely he would enjoy to be sacrificed by my dagger. Yes. He shall satisfy my hunger for him with his death.@");
	gflags[LEARNED_OF_JOTH_WIFE] = true;
	
	case "Taught" (remove):
	say("@I was blind but now I see the ways of Karnax. I see the delicious taste of taking the mortality of another. It makes me feel so good.@");
	say("Ashela rolls her eyes into the back of her head and cuts her arm with her dagger. @It makes me feel so aroused. It makes the cuts so enjoyable.@");
	add(["Karnax"]);
	
	case "Karnax" (remove):
	say("@I see that you have taken the life of Karnax. That is what he would have enjoyed. I must complete his transition.@");
	add(["Transition"]);
	
	case "Transition" (remove):
	say("The woman lets out a series of moans and pants. @I must feast upon him. Feel his death inside of me.@");
	
	case "Captivating" (remove):
	say("@The citizens of Kintore are all blind to what the Dark Monks are truely about. They do not see how the blood and death is beautiful, so irresistible.@");
}

}



void egg_ashela_encounter object#()()
{
var karnax_dead = UI_is_dead(-207);
var orb_of_souls = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var ashela_dead = UI_is_dead(-419);

if (karnax_dead && orb_of_souls >0)
{
	if(ashela_dead)
	{
	}
	else
	{
		UI_set_item_flag(AVATAR, DONT_MOVE);
		UI_move_object(-419, [2400, 2071, 0]);
		UI_si_path_run_usecode(-419, [2382, 2084, 0], SCRIPTED, -419, Ashela_Script_Encounter, 1);
		UI_si_path_run_usecode(AVATAR, [2383, 2082, 0], SCRIPTED, AVATAR, EmptyKintoreFunction, 0);
	}
}

}