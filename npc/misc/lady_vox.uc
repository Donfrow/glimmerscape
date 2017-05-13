/*
Lady Vox
*/


void Lady_Vox object#(0x48c) ()
	{

	if (event != 1)
		return;
	UI_show_npc_face(item);





		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Yes, yes, bye.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Gabbie Mardoddle.@");
			UI_remove_answer("Name");
			}

		}
	UI_remove_npc_face(item);
	}

