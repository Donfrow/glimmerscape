void Abata_Convo()
{

UI_show_npc_face(651, 0);

say("A rather unkempt woman screams at you. @Adooodle you da moogle!@");

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("The woman screams.");
	UI_set_alignment(-467, HOSTILE);
	UI_set_schedule_type(-467, IN_COMBAT);
	UI_set_opponent(-467, AVATAR);
	break;
	
	case "Name" (remove):
	say("She shakes her head violantly. @Abata moogle you you scream pain! Fragel de sack yes. No. The sack fraggle!@");
	
	case "Job" (remove):
	say("She flails her arms wildly. @You suffer yes pain no please you will. Pooglededish said you now moogledamoosh I say. Sing sing prance oh to town.@");
	
}
}