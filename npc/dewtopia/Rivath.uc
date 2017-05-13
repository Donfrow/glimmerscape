/*
guy trying to blow into sugar caves
*/



void Rivath_Give_Warning()
{
UI_push_answers();
converse(["Give warning", "Do not give warning"])
{
	case "Give warning" (remove):
	say("@Very volitile Hector claims? I am sure he is just a bumbling old man. The plan must be put in motion now!@");
	karma = karma + 250;
	KarmaGoodSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Do not give warning" (remove):
	karma = karma - 250;
	KarmaBadSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}

void Rivath_Yes_No()
{
UI_push_answers();

gflags[MET_BROTHER] = true;
converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("@Many thanks to you! Tell Hector I have sent you, he will know what you mean. I will eagerly await your return.@");
	say("@Oh, and be sure you go to Hector and not Hectar as Hectar is head of the Dewtopian guard! You can find him just outside of Dewtopia's northern wall.@");
	gflags[GET_POWDER] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("@A shame, but I do suppose it is really my problem, not yours.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}


}

void Rivath_Avatar_Say object#()()
{
	script AVATAR
	{
		say "Eck, what a mess";
	}
}

void Move_Rivath object#()()
{
	UI_move_object(-319, [1894, 915]);
}

void Rivath_Explosion_Sprite object#()()
{
	var loc = get_object_position(319);
    UI_sprite_effect(1, loc[1], loc[2], 0, 0, 0, -1);
}

void Rivath_Explode object#()()
{
	var loc = get_object_position(319);
			
	// CREATE THE SCORCH MARKS
			
	var scorch1 = UI_create_new_object(224); // Centre mark
	UI_set_item_frame(scorch1, 5); 
	UI_update_last_created([loc]);
			
	var scorch2 = UI_create_new_object(224); // top mark
	UI_set_item_frame(scorch2, 2); 
	UI_update_last_created([loc[1], loc[2]-2]);			

	var scorch3 = UI_create_new_object(224); // bottom mark
	UI_set_item_frame(scorch3, 1); 
	UI_update_last_created([loc[1], loc[2]+2]);	

	var scorch4 = UI_create_new_object(224); // left mark
	UI_set_item_frame(scorch4, 3); 
	UI_update_last_created([loc[1]-2, loc[2]]);	

	var scorch5 = UI_create_new_object(224); // right mark
	UI_set_item_frame(scorch5, 4); 
	UI_update_last_created([loc[1]+2, loc[2]]);
	
	// CREATE THE BODY PARTS

	var body1 = UI_create_new_object(799); // torso
	UI_set_item_frame(body1, 9); 
	UI_update_last_created([loc[1], loc[2]-1]);

	var body2 = UI_create_new_object(799); // left leg
	UI_set_item_frame(body2, 7); 
	UI_update_last_created([loc[1]-1, loc[2]+3]);

	var body3 = UI_create_new_object(799); // right leg
	UI_set_item_frame(body3, 8); 
	UI_update_last_created([loc[1]+2, loc[2]+2]);

	var body4 = UI_create_new_object(799); // left arm
	UI_set_item_frame(body4, 6); 
	UI_update_last_created([loc[1]-2, loc[2]]);

	var body5 = UI_create_new_object(799); // head
	UI_set_item_frame(body5, 5); 
	UI_update_last_created([loc[1], loc[2]-3]);
			
	UI_remove_party_items(1, 704, ANY, ANY); 

}

void Rivath object#(0x53f) ()
	{

var bark = "Do not startle me like that!";
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
				UI_item_say(item, "In time");
			else if (n == 2)
				UI_item_say(item, "Soon brother");
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
        call Rivath, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
	say("@Phew, I am glad it is only you.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Hello there.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
if (gflags[HAVE_POWDER])
	{
	UI_add_answer("Here is your powder");
	}

		converse
		{
	if (response == "Bye")
			{
			say("@Forget I am here please!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Rivath.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@At the moment I do not possess a job in the true sense. I have a mission, but not a job.@");
			UI_remove_answer("Job");
			UI_add_answer("Mission");
			}
		else if (response == "Mission")
			{
			say("@My brother Virath was thrown into the blasted Sugar Caves! He was mistaken for a bandit, now it is my job to free him.@");
			UI_remove_answer("Mission");
			UI_add_answer("Virath");
			UI_add_answer("Mistaken");
			}
		else if (response == "Virath")
			{
			say("@Yes, I realize his name is not very original.@");
			UI_remove_answer("Virath");
			}
		else if (response == "Mistaken")
			{
			say("@He was hauled away on a dubious charge of being a Plains Bandit! He would not even rob a goblin! I must free him before he perishes in those blasted caves.@");
			UI_remove_answer("Mistaken");
			UI_add_answer("Dubious charge");
			}
		else if (response == "Dubious charge")
			{
			say("@What I have gathered is he was accused by some fellow named Geth. The Dewtopian guard, trying to show punishments to would-be bandits quickly had him dispatched to the Sugar Caves.@");
			say("@But now I have a plan most cunning to set him free!@");
			UI_remove_answer("Dubious charge");
			UI_add_answer("Cunning plan");
			}
		else if (response == "Cunning plan")
			{
			say("@I have been in this spot, nearly alone, for many months ensuring perfection for my plan.@");
			say("@I will blow a giant hole into the blasted mountain using exploding powder and escape with my brother during the resulting confusion.@");
			say("@It is all ready to go... except I lack the exploding powder. Hector was to deliver it to me but he never showed up as planned.@");
			say("@He does not seem like the type of person to deceive a man however.@");
			say("@I would investigate and pickup the powder myself, but I am afraid that the Dewtopian Guard will find out about my plan and throw me in the caves as well!@");
			say("@Would you go and retreive the powder from Hector just north of Dewtopia for me?@");
			Rivath_Yes_No();
			UI_remove_answer("Cunning plan");
			}
		else if (response == "Here is your powder")
			{
			say("@You have brought me the powder? My plan can now go into motion!@");
			Rivath_Give_Warning();
			gflags[BROTHER_DEAD] = true;
			
			UI_set_item_flag(-319, DONT_MOVE);
			script -319
			{
				say "I am coming brother!";
				wait 3;
				call Sound_Explosion;
				call Rivath_Explosion_Sprite;
				wait 3;
				call Rivath_Explode;
				call Move_Rivath;
				wait 10;
				call Rivath_Avatar_Say;
			}
			UI_modify_schedule(-319, 0, STANDTHERE, [1893, 901]);
			UI_modify_schedule(-319, 1, STANDTHERE, [1893, 901]);
			UI_modify_schedule(-319, 2, STANDTHERE, [1893, 901]);
			UI_set_schedule_type(-319, STANDTHERE);
			break;
			
			
			}

		}
	UI_remove_npc_face(item);
	}
}
