// START OF FUNCTIONS FOR FIRST ORB CONSTRUCTION

void Orb_Creation_Lightning01 object#()()
{
    UI_sprite_effect(6, 2359, 1417, 0, 0, 0, -1);
    UI_sprite_effect(BLUE_LIGHTNING, 2354, 1410, 0, 0, 0, -1);
    UI_play_sound_effect(71);
    UI_play_sound_effect(50);
}

void Orb_Creation_Lightning02 object#()()
{
    UI_sprite_effect(RED_LIGHTNING, 2354, 1422, 0, 0, 0, -1);
    UI_play_sound_effect(71);
}

void Orb_Creation_Lightning03 object#()()
{
    UI_sprite_effect(YELLOW_LIGHTNING, 2366, 1410, 0, 0, 0, -1);
    UI_play_sound_effect(71);
}

void Orb_Creation_Lightning04 object#()()
{
    UI_sprite_effect(BLUE_LIGHTNING, 2366, 1422, 0, 0, 0, -1);
    UI_sprite_effect(6, 2366, 1410, 0, 0, 0, -1);
    UI_play_sound_effect(71);
    UI_play_sound_effect(50);
}

void Orb_Creation_Lightning05 object#()()
{
    UI_sprite_effect(RED_LIGHTNING, 2359, 1417, 0, 0, 0, -1);
    UI_play_sound_effect(71);
}


void Kill_Zorphos object#()()
{
UI_sprite_effect(LIGHTNING, 2360, 1409, 0, 0, 0, -1);
UI_kill_npc(-27);
gflags[ZORPHOS_DEAD] = true;
}

void First_Orb_Failure object#()()
{
UI_show_npc_face(329, 0);
say("@I can see orb forming before my eyes! Such a magnificant sight... what is this happening? The ether is collapsing!@");
say("Zorphos starts to contort, obviously in pain. @I cannot constrain it! I was foolish to think I could wield such power!@");
script -27
{
	nohalt;
	say "Noo!";
	actor frame KNEEL;
	wait 4;
	call Kill_Zorphos;
}


}

void Remove_Orbs_First_Construct object#()()
{

// Remove the orbs

UI_remove_from_area(ORB_OF_FOCUS, 0, [2349, 1406],  [2371, 1425]);
UI_sprite_effect(MEDIUM_BLAST, 2354, 1410, 0, 0, 0, -1);
UI_remove_from_area(ORB_OF_CHAOS, 0, [2349, 1406],  [2371, 1425]);
UI_sprite_effect(MEDIUM_BLAST, 2366, 1410, 0, 0, 0, -1);
UI_remove_from_area(ORB_OF_TRANSFIGURATION, 0, [2349, 1406],  [2371, 1425]);
UI_sprite_effect(MEDIUM_BLAST, 2366, 1422, 0, 0, 0, -1);
UI_remove_from_area(ORB_OF_SOULS, 0, [2349, 1406],  [2371, 1425]);
UI_sprite_effect(MEDIUM_BLAST, 2354, 1422, 0, 0, 0, -1);
UI_remove_from_area(ORB_OF_PERSUASION, 0, [2349, 1406],  [2371, 1425]);
UI_sprite_effect(4, 2360, 1415, 0, 0, 0, -1);
UI_play_sound_effect(40); // explosion sound

// Recreate the spent orbs

UI_create_new_object(SPENT_ORB);
UI_update_last_created([2354, 1410, 2]);
UI_create_new_object(SPENT_ORB);
UI_update_last_created([2366, 1410, 2]);
UI_create_new_object(SPENT_ORB);
UI_update_last_created([2366, 1422, 2]);
UI_create_new_object(SPENT_ORB);
UI_update_last_created([2354, 1422, 2]);
UI_create_new_object(SPENT_ORB);
UI_update_last_created([2360, 1415, 2]);

gflags[CONSTRUCT_ORB1] = false;
}



// START OF FUNCTIONS FOR FINAL ORB CONSTRUCTION
//
//
//
//	ALL OF THE BELOW FUNCTIONS PERTAIN TO THE SCRIPTED SEQUENCE OF THE AVATAR REMAKING THE ORB OF INFINITY
//
//
//
//

// Explosions around the room

void Explosion_Finale01 object#()()
{
	UI_sprite_effect(1, 1372, 502, 0, 0, 0, -1);
}

void Explosion_Finale02 object#()()
{
	UI_sprite_effect(1, 1396, 508, 0, 0, 0, -1);
}

void Explosion_Finale03 object#()()
{
	UI_sprite_effect(1, 1375, 517, 0, 0, 0, -1);
}

void Explosion_Finale04 object#()()
{
	UI_sprite_effect(1, 1383, 501, 0, 0, 0, -1);
}

void Explosion_Finale05 object#()()
{
	UI_sprite_effect(1, 1383, 518, 0, 0, 0, -1);
}

void Explosion_Debris01 object#()()
{
	UI_sprite_effect(1, 1374, 505, 0, 0, 0, -1);
	var debris = UI_create_new_object(202);
	UI_set_item_frame_rot(debris, 6);
	UI_update_last_created([1374, 505, 0]);
}

void Explosion_Debris02 object#()()
{
	UI_sprite_effect(1, 1392, 508, 0, 0, 0, -1);
	var debris = UI_create_new_object(202);
	UI_set_item_frame_rot(debris, 38);
	UI_update_last_created([1392, 508, 0]);
}

void Blue_Fancy_Sprite01 object#()()
{
	UI_sprite_effect(47, 1371, 512, 0, 0, 0, -1);
}

void Blue_Fancy_Sprite02 object#()()
{
	UI_sprite_effect(47, 1398, 512, 0, 0, 0, -1);
}

void Blue_Fancy_Sprite03 object#()()
{
	UI_sprite_effect(47, 1368, 521, 0, 0, 0, -1);
}

void Blue_Fancy_Sprite04 object#()()
{
	UI_sprite_effect(47, 1382, 500, 0, 0, 0, -1);
}

void Orb_Smoke_Middle object#()()
{
	UI_sprite_effect(3, 1383, 508, 0, 0, 0, -1);
}

void Orb_Smoke_TopLeft object#()()
{
	UI_sprite_effect(3, 1379, 504, 0, 0, 0, -1);
}

void Orb_Smoke_TopRight object#()()
{
	UI_sprite_effect(3, 1387, 504, 0, 0, 0, -1);
}

void Orb_Smoke_BottomLeft object#()()
{
	UI_sprite_effect(3, 1379, 514, 0, 0, 0, -1);
}

void Orb_Smoke_BottomRight object#()()
{
	UI_sprite_effect(3, 1387, 514, 0, 0, 0, -1);
}

void Orb_of_Infinity_Sprite object#()()
{
	UI_sprite_effect(54, 1383, 508, 0, 0, 0, -1);
}

void Remove_Orbs_Final object#()()
{

UI_remove_from_area(ORB_OF_FOCUS, 0, [1374, 500],  [1392, 517]);
UI_remove_from_area(ORB_OF_CHAOS, 0, [1374, 500],  [1392, 517]);
UI_remove_from_area(ORB_OF_TRANSFIGURATION, 0, [1374, 500],  [1392, 517]);
UI_remove_from_area(ORB_OF_SOULS, 0, [1374, 500],  [1392, 517]);
UI_remove_from_area(ORB_OF_PERSUASION, 0, [1374, 500],  [1392, 517]);

UI_create_new_object(ORB_OF_INFINITY);
UI_update_last_created([1383, 508, 2]);

}

// Final Big blue magic things for removing orbs

void Final_Construct_Sprite_Middle object#()()
{
	UI_sprite_effect(47, 1383, 508, 0, 0, 0, -1);
}

void Final_Construct_Sprite_TopLeft object#()()
{
	UI_sprite_effect(47, 1379, 504, 0, 0, 0, -1);
}

void Final_Construct_Sprite_TopRight object#()()
{
	UI_sprite_effect(47, 1387, 504, 0, 0, 0, -1);
}

void Final_Construct_Sprite_BottomLeft object#()()
{
	UI_sprite_effect(47, 1379, 514, 0, 0, 0, -1);
}

void Final_Construct_Sprite_BottomRight object#()()
{
	UI_sprite_effect(47, 1387, 514, 0, 0, 0, -1);
}

// FUNCTIONS FOR HAVING AVATAR GET CRUSHED BY DEBRIS


void Avatar_Mini_Debris01 object#()()
{

	script AVATAR
	{
		say "The temple is collapsing!";
	}
	var debris = UI_create_new_object(201);
	UI_set_item_frame_rot(debris, 3);
	UI_update_last_created([1380, 508, 0]);

	var debris1 = UI_create_new_object(201);
	UI_set_item_frame_rot(debris, 2);
	UI_update_last_created([1384, 515, 0]);

}

void Avatar_Mini_Debris02 object#()()
{

	var debris = UI_create_new_object(201);
	UI_set_item_frame_rot(debris, 6);
	UI_update_last_created([1384, 512, 0]);

}

void Avatar_Mini_Debris03 object#()()
{

	var debris = UI_create_new_object(201);
	UI_update_last_created([1380, 509, 0]);

}

void Avatar_Debris object#()()
{
	var debris = UI_create_new_object(202);
	UI_set_item_frame_rot(debris, 6);
	UI_update_last_created([1386, 513, 0]);
	var avatar_sleep = UI_create_new_object(1024);
	UI_set_item_frame_rot(avatar_sleep, 45);
	UI_update_last_created([1382, 511, 0]);	
	UI_set_item_flag(AVATAR, 22);


}

void Kill_Death object#()()
{
	UI_modify_schedule(-192, 0, STAND, [1891, 918]);
	UI_move_object(-192, [1891, 918]);
	var death_body = UI_create_new_object(762);
	UI_set_item_frame(death_body, 23);
	UI_update_last_created([1400, 1096]);
		
}

void Move_Avatar_To_Cave_In object#()()
{
	UI_move_object(AVATAR, [1379, 511]);
	script AVATAR
	{
		nohalt;
		face WEST;
		actor frame LIE;
	}
}

void Party_Say_After_Crush object#()()
{
	RandomPartySay("@It is amazing you are alive! We thought you lost for certain!@");
}

void Avatar_After_Crush_Getup object#()()
{
	script AVATAR
	{
		nohalt;
		actor frame LIE;
		wait 3;
		actor frame KNEEL;
		say "Ugggh";
		wait 3;
		actor frame STAND;
		wait 2;
		call Add_All_Party_Members;
		wait 1;
		call Party_Say_After_Crush;
		call UnFreezeAvatar;
	}
}

// Big Death Convo for after Avatar is crushed
void Death_Convo()
{
	UI_show_npc_face(572);
	say("The dark figure looks before you. @I sense you have not come looking for me this time.@");
	
	converse(["What happened?","Why am I here?"])
	{
	
	case "What happened?" (remove):
	say("The figure speaks slowly. @You have met your demise.@");
	add(["Demise", "Why not warn me earlier?"]);
	
	case "Demise" (remove):
	say("@It is when you come before me.@");
	
	case "Why not warn me earlier?" (remove):
	say("What almost appears to be a sigh escapes the dark figure. @As you know the Orb of Souls prevents me from seeing when such things should occur. Only after that is dealt with will I again be able to see such things.@");
	
	case "Why am I here?" (remove):
	say("@Your closeness to the Orb of Souls, now the Orb of Infinity, has brought you before me as you should when you reached... your end.@");
	add(["Orb of Souls", "Orb of Infinity", "End"]);
	
	case "Orb of Souls" (remove):
	say("@Your use of the Orb of Souls has allowed you to avoid the state of limbo which the other beings of your realm suffer from. It is only because of that that you appear before me as you should.@");
	
	case "Orb of Infinity" (remove):
	say("@You have succeeded in recreating the Orb of Infinity, however as a result of this quest you stand before me.@");
	UI_display_area([1382, 509]);
	add(["Now what?"]);
	
	case "End" (remove):
	say("@Merely your body has met its end.@");
	
	case "Now what?" (remove):
	say("The figure lets out a clear sigh. @I do not know.@");
	add(["How can you not know?"]);
	
	case "How can you not know?" (remove):
	say("@I am merely a guide in death. I cannot see into the seeds of destiny.@");
	add(["Figure something out!"]);
	
	case "Figure something out!" (remove):
	say("@I cannot aid you any further. You... we... are stuck until another begins where you left off.@");
	add(["And if noone does?"]);
	
	case "And if noone does?" (remove):
	say("This is the first time you ever notice one of your questions visibly shaking the ominous figure. @We shall remain like this forever.@");
	add(["Unacceptable"]);
	
	case "Unacceptable" (remove):
	say("The figure does not even hide what you think to be its fear. @The only way to return you would mean giving up my existence.@");
	add(["Existence"]);
	
	case "Existence" (remove):
	say("@It is possible to give up my energy and power and force you back into your living world. Should I do this those who pass on shall forever have noone to guide them in death.@");
	add(["This is already the case"]);
	
	case "This is already the case" (remove):
	say("@Should someone finish where you left off it will no longer be the case. I must wait for the Orb of Infinity to be destroyed.@");
	add(["Do not be naive"]);
	
	case "Do not be naive" (remove):
	say("As you begin to chastise the figure on the odds of this every actually happening it quickly raises its hand to silence you. @That which is nearly impossible is a moment that always has a chance to occur in the vastness of time that is eternity.@");
	add(["Long time for it not to"]);
	
	case "Long time for it not to" (remove):
	say("The figure appears pleased at your defiance. @You truely are the one which I have been waiting for.@");
	add(["Waiting for"]);
	
	case "Waiting for" (remove):
	say("@I believe you to be correct in your assumption that this is the only chance for the Orb of Infinity to be destroyed.");
	say("@You are my only hope for freeing those in limbo. For once again opening the passage of death into the next world.@");
	say("The figure pauses. @I have no choice but to give up my existence to provide you with another chance at life, another chance to destroy the orb. I trust that my sacrifice will not be in vain.@");
	add(["What to do", "Lets do this"]);
	
	case "What to do" (remove):
	say("@The only insight I can offer you is to take the Orb of Infinity to a place where it will have a mystical connection, a connection that lasts through the ages.@");
	say("Suddenly Death stammers. @Ice... seek ice. You have been... before it was ice... at a time other than now. Go... frozen forest... north of Ophidia... the Ophidia that is new. Use the orb... where part of it was born.@");
	UI_display_area([1150, 680, 0]);
	
	case "Lets do this" (remove):
	say("You almost think the creature is stalling. @Do not let the knowledge that death will forever be unguided cause you fear. It is far better to be forever unguided in death than stuck in a state of limbo for eternity.@");
	add(["I understand"]);
	
	case "I understand" (remove):
	say("It almost appears as if Death itself takes a deep breath. @Let you return to life...@");
	
	targetx = 1400;
	targety = 1096;
	
	avatarx = 1400;
	avatary = 1108;
	
	gflags[DEATH_DEAD] = true;
	
	script -192
	{
		nohalt;
		say "Destroy the orb!";
		wait 2;
		actor frame CAST_1;
		wait 2;
		actor frame CAST_2;
		wait 2;
		actor frame KNEEL;
		call White_Lightning;
		call Lightning_Sound;
		wait 2;
		call Kill_Death;
		wait 4;
		call Big_Blue_Ring_Avatar;
		call Teleport_Sound02;
		wait 5;
		call Fade;
		wait 4;
		call Move_Avatar_To_Cave_In;
		call UnFade;
		wait 4;
		call Avatar_After_Crush_Getup;
	}
	
	break;
	}
}

void Path_Death_To_Avatar object#()()
{
	UI_move_object(-192, [1399, 1084, 0]);
	
	UI_si_path_run_usecode(-192, [1400, 1096, 0], SCRIPTED, -192, Death_Convo, 1); // Move death
}

void MoveDeathToAvoidPathFailure object#()()
{
	UI_move_object(-192, [1399, 1084, 0]);
	script -192
	{
		wait 5;
		call Path_Death_To_Avatar;
	}

}



void Move_Avatar_To_Death object#()()
{
	UI_move_object(AVATAR, [1400, 1108, 0]);
}

void Avatar_Crush()
{
script AVATAR
{
	nohalt;
	face NORTH;
	wait 1;
	call Earthquake;
	call Avatar_Mini_Debris01;
	wait 5;
	say "Ahhh";
	call Avatar_Mini_Debris02;
	face WEST;
	call Earthquake;
	actor frame LEAN;
	wait 1;
	call Avatar_Mini_Debris03;
	actor frame KNEEL;
	wait 3;
	call Avatar_Debris;
	wait 5;
	call Fade;
	wait 10;
	call Move_Avatar_To_Death;
	actor frame STAND;
	face NORTH;
	call Clear_DontRender;
	wait 5;
	// Remove the 2 below, Death was failing to path, thus unfade was ever failing to be called, updated to move death so he should be in a pathable position
	//call Path_Death_To_Avatar;
	//wait 15;
	call UnFade;
	wait 5;
	//call Path_Death_To_Avatar;
	call MoveDeathToAvoidPathFailure;
	
}


}

void Path_Avatar_To_Orb object#()()
{

UI_si_path_run_usecode(AVATAR, [1382, 510, 0], SCRIPTED, AVATAR, Avatar_Crush, 0);

}




// MAIN CODE FOR FINAL AVATAR CONSTRUCTION OF ORB

void Avatar_Construction_Finale()
{

		UI_play_music(65);
		script AVATAR
		{
			nohalt;
			call Remove_All_Party_Members;
			face NORTH;
			actor frame SWING_1;
			wait 2;
			actor frame SWING_2;
			wait 1;
			actor frame SWING_3;
			wait 1;
			actor frame STAND;
			say "Oh my...";
			call Earthquake;
			wait 3;
			call Explosion_Debris02;
			call Sound_Explosion;
			call Explosion_Finale01;
			wait 3;
			call Orb_Smoke_TopLeft;
			call Orb_Smoke_BottomRight;
			call Sound_Explosion;
			call Explosion_Finale05;
			wait 1;
			call Sound_Explosion;
			call Explosion_Finale02;
			wait 1;
			call Explosion_Debris01;
			wait 1;
			call Orb_Smoke_TopRight;
			call Orb_Smoke_Middle;
			call Sound_Explosion;
			call Explosion_Finale04;
			wait 1;
			call Sound_Explosion;
			call Explosion_Finale03;
			wait 7;
			call Orb_Smoke_BottomLeft;
			call Blue_Fancy_Sprite01;
			call Teleport_Sound01;
			wait 1;
			call Earthquake;
			call Orb_Smoke_BottomRight;
			call Blue_Fancy_Sprite04;
			call Teleport_Sound01;
			wait 1;
			call Blue_Fancy_Sprite03;
			call Teleport_Sound01;
			wait 1;
			call Blue_Fancy_Sprite02;
			call Teleport_Sound01;
			
			// MAIN CONSTRUCTION OF ORB OF INFINITY SEQUENCE						
			wait 10;
			call Final_Construct_Sprite_TopLeft;
			call Final_Construct_Sprite_TopRight;
			call Final_Construct_Sprite_Middle;
			call Final_Construct_Sprite_BottomLeft;
			call Final_Construct_Sprite_BottomRight;
			call Teleport_Sound03;
			wait 5;
			call Remove_Orbs_Final;
			wait 5;
			call Orb_of_Infinity_Sprite;
			wait 15;
			call Path_Avatar_To_Orb;
				
		}

}


void HammerOfDivinity()
{

	if(gflags[FLUX_USED_FINAL])
	{
		UI_close_gumps();
		var target = UI_click_on_item();
		var target_shape = UI_get_item_shape(target[1]);	
		targetx = target[2]-1;
		targety = target[3]-1;
		if (target_shape == ORB_OF_FOCUS)
		{
			// See Above for the function Avatar_Construction_Finale
			UI_set_item_flag(AVATAR, DONT_MOVE);
			UI_si_path_run_usecode(AVATAR, [targetx, targety+2, 0], SCRIPTED, AVATAR, Avatar_Construction_Finale, 0);

		}
	}
		
    else if (gflags[USED_FLUX_ON_ORB] && gflags[CONSTRUCT_ORB1])
    {
	UI_close_gumps();
    var target = UI_click_on_item();
    var target1 = UI_get_item_shape(target[1]);
        if (target1 == ORB_OF_FOCUS)
        {
            UI_play_sound_effect(95);
            gflags[USED_FLUX_ON_ORB] = false;
            gflags[ORBS_IN_PLACE] = false;
            gflags[RECREATE_ORBS] = true;
            //First_Orb_Failure();
            var bark = "Nooo";
            script -27
            {
				nohalt;
                call FreezeAvatar;
                wait 5;
                call Orb_Creation_Lightning03;
                wait 4;
                call Orb_Creation_Lightning01;
                wait 9;
                call Orb_Creation_Lightning05;
                wait 8;
                call Orb_Creation_Lightning03;
                wait 10;
                call Orb_Creation_Lightning04;
                wait 15;
                call First_Orb_Failure;
                say bark;
                wait 4;
                call Remove_Orbs_First_Construct;
                wait 5;
                call UnFreezeAvatar;
                
            }





            gflags[FAILED_FIRST_ORB] = true; // failed to make the orb the first time

            gflags[RECREATE_ORBS] = true;

        }
        else
        {
        }
    }
    else
    {
    AVATAR.say("@Stop, Hammertime!@");
    }
}

