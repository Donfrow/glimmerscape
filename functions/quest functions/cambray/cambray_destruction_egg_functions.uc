// FUNCTIONS FOR THE TOWN SLAUGHTER

void End_Hydra_Encounter1()
{
	UI_move_object(-94, [2648, 65]);
	UI_clear_item_flag(-94, DONT_MOVE);
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	gflags[HYDRA_HYSTERIA_KILL_EGG] = true;
	script AVATAR
	{
		say "That was interesting";
	}
}

void Path_Hydra_Exit object#()()
{
	UI_si_path_run_usecode(-94, [2841, 206, 0], SCRIPTED, -94, End_Hydra_Encounter1, 0);
}

void Kill_Tressa object#()()
{
	UI_kill_npc(-366);
}

void Kill_Foucalt object#()()
{
	UI_kill_npc(-372);
}

void Tressa_Death_Convo object#()()
{
	UI_show_npc_face1(539, 0); // Tressa face	
	say("@What... what have I done? Foucalt was right. I have brought shame upon my families name, upon everyone. I am the true monster.@");
	AVATAR.say("@And what of me?@");
	UI_show_npc_face1(539, 0); // Tressa face	
	say("@You have shown me my true colours. Live with yourself knowing you have brought this upon this once thriving town. Now my dagger shall meet my heart for what I have done.@");
}

void End_Hydra_Encounter object#()()
{
	script (-94)
	{
		nohalt;
		wait 2;
		face NORTH;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		call Kill_Foucalt;
	}
	
	script -372 // Foucalt
	{
		nohalt;
		say "Please, mercy! I beg of you!";
		wait 5;
		say "Ugh";
	}
	
	script -366 // Tressa
	{
		nohalt;
		wait 18;
		say "What have I done?";
		wait 10;
		call Tressa_Death_Convo;
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		actor frame SWING_3;
		call Hit_Sound;
		call Kill_Tressa;		
	}
	
	script -94
	{
		wait 35;
		say "Blood of Zarkane, nooo!";
		wait 10;
		say "Purpose no longer. Must return. Weap.";
		call Path_Hydra_Exit;
	}
}

void Foucalt_Hydra_Path object#()()
{

	UI_si_path_run_usecode(-94, [2837, 254, 0], SCRIPTED, -94, End_Hydra_Encounter, 0);

}

void Foucalt_Death_Convo object#()()
{
    UI_show_npc_face0(550, 0); // Foucault face
	say("@I never wanted my quest for knowledge to turn into something like this!@");
	UI_show_npc_face1(539, 0); // Tressa face	
	say("@They brought it upon themselves Foucalt! And at least now you can continue your quest for knowledge without these fanatics!@");
	UI_show_npc_face0(550, 0); // Foucault face
	say("@Look at what you have done Tressa. You have fulfilled exactly what they said you would do. They were not the fanatics.@");
	UI_show_npc_face1(539, 0); // Tressa face		
	say("@How dare you say such a thing, after I saved you from the mob, and this is how you repay my kindness?@");
	

}

void Kill_Beck object#()()
{
	UI_kill_npc(-362);
}

void Kill_Tobale object#()()
{
	UI_kill_npc(-369);
}

void Kill_Jasper object#()()
{
	UI_kill_npc(-370);
}

void Kill_Loretta object#()()
{
	UI_kill_npc(-371);
}

void Kill_Morrison object#()()
{
	UI_kill_npc(-360);
}

void Kill_Vanessa object#()()
{
	UI_kill_npc(-367);
}

void Kill_Xander object#()()
{
	UI_kill_npc(-368);
}

void Kill_Olivia object#()()
{
	UI_kill_npc(-361);
}

void Beck_Death()
{
	script -362 // Beck
	{
		face WEST;
		say "I will stop you!"; // 7 waits to this point
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		say "Ungh";
	}
}

void Tobale_Death()
{
	script -369 // Tobale
	{
		nohalt;
		face WEST;
		say "Fear my magic!"; // 7 waits to this point
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		say "Noo";

	}
}

void Path_Survivors object#()()
{
	UI_si_path_run_usecode(-369, [2842, 252, 0], SCRIPTED, -362, Tobale_Death, 0);
	UI_si_path_run_usecode(-362, [2842, 255, 0], SCRIPTED, -362, Beck_Death, 0);
}

void Hydra_Kill_Spree_Cont()
{

	script -94 // Hydra
	{
		nohalt;
		face WEST;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		call Kill_Morrison;
		wait 2;
		face SOUTH;
		wait 3;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		wait 3;
		call Kill_Loretta;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;		// 27 waits
		call Kill_Jasper;
		actor frame SWING_3;
		face EAST;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		call Kill_Beck;
		actor frame SWING_3;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		call Kill_Tobale;
		actor frame SWING_3;
	}
	
	script -366 // Tressa
	{
		nohalt;
		wait 70;
		say "You are safe now Foucalt";
		wait 5;
		call Foucalt_Death_Convo;
		wait 6;
		call Foucalt_Hydra_Path;
		call End_Hydra_Encounter;
		
	}
	
	script -360 // Morrison
	{
		nohalt;
		wait 4;
		say "Arrgh";
	}
	
	script -371 // Loretta
	{
		nohalt;
		say "Have mercy!";
		wait 15;
	}
	
	script -370 // Jasper
	{
		nohalt;
		wait 12;
		say "Loretta, noo!";
		call Path_Survivors;
		wait 15;
		say "I shall join you my love!";
		wait 2;
	}

}

void Path_Hydra_To_Morrison object#()()
{
	UI_si_path_run_usecode(-94, [2840, 256, 0], SCRIPTED, -368, Hydra_Kill_Spree_Cont, 0);
}

void Venessa_Die object#()()
{
	script -367
	{
		nohalt;
		wait 2;
		face NORTH;
		say "We shall end this!";
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		wait 3;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		say "Xander, noo!";
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		
	}
}

void Vanessa_Path object#()()
{
	UI_si_path_run_usecode(-367, [2834, 245, 0], SCRIPTED, -368, Venessa_Die, 0);
}

void Tressa_Convo()
{
	UI_show_npc_face0(539, 0); // Tressa face
	say("@Leave that man alone. I am the one you are after Morrison!@");
    UI_show_npc_face1(77, 0); // Morrison face	
	say("@I should have known you had something to do with this Tressa. Your ilk has always been sour!@");
	UI_show_npc_face1(355, 0); // Loretta face	
	say("@Do not be so mean Morrison. She cannot help her bloodline.@");
	UI_show_npc_face1(370, 0); // Jasper face		
	say("@Stay out of this Loretta!@");
	UI_show_npc_face1(13, 0); // Olivia face
	say("@Jasper is right Loretta. You do not know what a horrible bloodline she has been bred from.@");
	UI_show_npc_face0(539, 0); // Tressa face
	say("@Shut your face Olivia! You are a horrible, horrible woman who deserves nothing of which you have.@");
	UI_show_npc_face1(13, 0); // Olivia face
	say("@Do not take your anger over your tainted blood out on me Tressa. You should be thanking me, after all I have let you stay here you unsightly whore.@");
	UI_show_npc_face0(539, 0); // Tressa face
	say("@Shut up! Shut up! I will kill you all! Shut up!@");
	UI_show_npc_face1(13, 0); // Olivia face
	say("@See what I mean everyone? See her true colours!@");
	UI_show_npc_face1(355, 0); // Loretta face	
	say("@You are clearly inciting her Olivia!@");
	UI_show_npc_face1(13, 0); // Olivia face
	say("@And this is how she handles it? By bringing such a hidious beast before us? For corrupting poor Foucalt? Morrison, have her sent to the stocks! She deserves no pity.@");
	say("@She deserves contempt!@");
    UI_show_npc_face1(77, 0); // Morrison face	
	say("@Tressa has chosen to bring forward the past which we have tried so hard to forget, to forgive.@");
	say("@She has shown that our kindness has gone unrewarded. Zarkane's lust, his madness, flows through her veins.@");
	say("@Even now she has chosen to bring the beast before us to try and intimidate us.@");
	say("@But I say our fair city shall not fall victim to her. Much like our ancestors did before us, we shall fight against this bloodline.@");
	say("@Xander, place Tressa under arrest, and slay the beast.@");
	UI_show_npc_face1(13, 0); // Olivia face
	say("@A wise decision Morrison.@");
	UI_show_npc_face0(539, 0); // Tressa face
	say("@I see how it is. This towns ideals have not changed one bit. You have declared me guilty without even a farce of a trial yet you think I will come willingly?@");
	UI_show_npc_face1(77, 0); // Morrison face	
	say("@You will come quietly Tressa or I shall execute you myself!@");
	UI_show_npc_face0(539, 0); // Tressa face
	say("@You are in denial Morrison. I will not go quietly. Lernaean, attack!@");
	
	
	script -94 // Hydra
	{
		nohalt;
		call Vanessa_Path;
		wait 3;

		face WEST;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		call Kill_Olivia; // 9 waits
		face SOUTH;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2; 
		wait 3;
		call Hit_Sound;
		call Kill_Xander; // 15 waits
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		wait 3;
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		wait 3;
		call Kill_Vanessa; // 24 waits
	}
	
	script -366 // Tressa
	{
		nohalt;
		actor frame STAND;
		wait 50;
		say "Time to die Morrison";
		call Path_Hydra_To_Morrison; 
	}
	
	script -361 // Olivia
	{
		nohalt;
		wait 4;
		say "Aaargh";
	}
	
	script -372 // Foucalt
	{
		nohalt;
		actor frame STAND;
	}
	
	script -368 //Xander
	{
		nohalt;
		face NORTH;
		actor frame STAND;
		wait 3;
		say "Die beast";
		actor frame SWING_1;
		wait 3;
		actor frame SWING_2;
		wait 3;
		call Hit_Sound;
		actor frame SWING_3;
		wait 3;
		actor frame SWING_2;
		wait 3;
		actor frame SWING_1;
		say "Uggh";
	}
	
	script -360 // Morrison
	{
		nohalt;
		wait 25;
		say "Have mercy!";
	}
	
	script -369 // Tobale
	{
		nohalt;
		wait 20;
		say "Stop this madness!";
	}
	
	
}

void Path_Hydra_And_Tressa()
{
	script -368 // Xander
	{
		actor frame STAND;
		face NORTH;
		say "What is that noise?";
	}
	script -372 // Foucalt
	{
		actor frame STAND;
		face NORTH;
	}
    UI_si_path_run_usecode(-94, [2838, 243, 0], EGG, -368, Nothing_Function, 0);
    UI_si_path_run_usecode(-366, [2838, 246, 0], EGG, -368, Tressa_Convo, 0);		
}

void Foucalt_Bark()
{
	script -372
	{
		say "I swear I am innocent";
	}
}

void Path_Xander_Out()
{

    UI_si_path_run_usecode(-368, [2836, 248, 0], EGG, -368, Path_Hydra_And_Tressa, 1);

}

void Path_Foucalt_Out()
{

    UI_si_path_run_usecode(-372, [2834, 248, 0], EGG, -372, Path_Xander_Out, 0);
}

void Path_Xander_Into_House object#()()
{
    UI_si_path_run_usecode(-368, [2829, 247, 0], EGG, -368, Path_Foucalt_Out, 0);
	UI_move_object(-94, [2837, 210, 0]); // Move the hydra
	UI_move_object(-366, [2843, 215, 0]); // Move Mariah

}

void Remove_Foucalt_Door object#()()
{
	UI_remove_from_area(376, 2, [2828, 244], [2835, 252]);
}

void Xander_Door_Break()
{
	script -368 // Xander
	{
		nohalt;
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		call Remove_Foucalt_Door;
		wait 1;
		actor frame STAND;
		wait 2;
		call Path_Xander_Into_House;
	}
}

void Xander_Door_Break_Path()
{
    UI_si_path_run_usecode(-368, [2833, 247, 0], EGG, -368, Xander_Door_Break, 0);
	script -360
	{
		actor frame STAND;
		face NORTH;
	}
}

void Path_Morrison_Away object#()()
{
    UI_si_path_run_usecode(-360, [2833, 253, 0], EGG, -360, Xander_Door_Break_Path, 0);
}

void Morrison_Talk object#()()
{
    UI_show_npc_face0(77, 0); // Morrison face
    say("@Come out Foucault! Do not make us break down this door!@");
    UI_show_npc_face1(550, 0); // Foucault face
    say("@I have not done anything to warrent this!@");
    UI_show_npc_face0(13, 0); // Olivia face
    say("@You dare to try and learn about that monster Zarkane! Won't someone please think of the children!?@");
    UI_show_npc_face1(550, 0); // Foucault face
    say("@My pursuit of knowledge is a noble cause. You are all acting paranoid! I will not come out to be tried like such a mob!@");
    UI_show_npc_face0(77, 0); // Morrison face
    say("@If you will not come out we will bring you out. Xander, break down this door.@");

}

void Town_Talking() // Called in the cambray_destruction_egg.uc that starts the fight off
{
		script AVATAR
		{
			nohalt;
			actor frame STAND;
			face SOUTH;
		}
        script -360
        {
			nohalt;
            say "Come out Foucault!";
            wait 10;
            call Morrison_Talk;
            wait 2;
            say "Break it down...";
            call Path_Morrison_Away;
        }

        script -361
        {
            wait 3;
            say "The nerve...";
        }

        script -362
        {
			nohalt;
            say "Poor man";
			wait 15;
			say "This will be interesting";
        }

        script -370
        {
			nohalt;
            wait 6;
            say "Trouble is brewing";
			wait 17;
			say "Oh my";
        }

        script -372
        {
			nohalt;
            wait 4;
            say "I am innocent!";
        }
}


































// FUNCTIONS FOR THE CAVE PORTION

void Teleport_Tressa_and_Hydra()
{
    UI_set_item_flag(-366, 16); // freeze tressa
    UI_set_item_flag(-94, 16); // freeze hydra
    UI_move_object(-366, [2645, 0059, 0]);
    UI_move_object(-94, [2657, 0059, 0]);
    
    script -366
    {
        wait 1;
        actor frame STAND;
        face EAST;
    }
    script -94
    {
        wait 1;
        actor frame STAND;
        face WEST;
    }
    
}

void Hydra_Tressa_Convo object#()()
{
    UI_show_npc_face0(539, 0); // tressa face
    say("Tressa stares at you with ferocious look on her face. @I knew you would come back to taint this noble creature.@");
    UI_show_npc_face1(634, 0); // hydra face
    say("@Mistress Tressa, this creature was kind to us.@");
    UI_show_npc_face0(539, 0); // tressa face
    say("@Only to meet selfish goals my gentle beast.@");
    UI_add_answer("Lies!");
    UI_add_answer("That about sums it up");
    UI_add_answer("How did you get here?");
    converse
    {
        if(response == "Lies!")
        {
            say("@Of course you would say that. You are simply after power.@");
            UI_remove_answer("Lies!");
            UI_remove_answer("That about sums it up");
            UI_add_answer("It is the truth!");
        }
        else if (response == "It is the truth!")
        {
            say("@If that is the case why did you seek me out in order to control the beast? What other motive could it be other than power?@");
            UI_remove_answer("It is the truth!");
            UI_add_answer("Helping Foucault");
        }
        else if (response == "Helping Foucault")
        {
            say("Tressa laughs. @You cannot even lie well. Why would such a peaceful sage seek something such as this?@");
            UI_remove_answer("Helping Foucault");
            UI_add_answer("Protection");
        }
        else if (response == "Protection")
        {
            say("Tressa looks less angry. @Perhaps... but I see no reason to think this is the case.@");
            UI_show_npc_face1(634, 0); // hydra face
            say("The middle head speaks. @This creature did not come in and attempt to slay us. This creature has not sought to harm us. We believe this creature is noble.@");
            UI_show_npc_face0(539, 0); // tressa face
            say("The rage appears to subside. @I did not know... I could not have known... perhaps you have been telling the truth...@");
            say("Tressa pauses. @I should believe you. You would have tried to slay this fine creature if you were truely after power and reverence. Yet, I cannot fully accept this yet. I am sorry.@");
            UI_remove_answer("Protection");
            gflags[NICE_TRESSA] = true;
            gflags[HYDRA_HYSTERIA] = true;
            gflags[HYDRA_NO_TALK] = true;
            break;
        }
        else if (response == "That about sums it up")
        {
            UI_show_npc_face0(539, 0); // tressa face
            say("Tressa growls. @I knew it. Everyone in this world is selfish and after their own desires. I have no choice but to use this creature to help rid the world of creatures like you.@");
            say("@Attack the true beast with me Lernaean.@");
            UI_show_npc_face1(634, 0); // hydra face
            say("The heads speak in unison. @We shall listen to the offspring of Zarkane.@");
            gflags[HYDRA_NO_TALK] = true;
            gflags[KNOCK_OUT_AVATAR_HYDRA] = true;
            gflags[HYDRA_HYSTERIA] = true;
            break;
        }
        else if (response == "How did you get here?")
        {
            say("@The knowledge to get here has been passed down through my bloodline but until now fear has prevented us from using this knowledge.@");
            UI_show_npc_face1(634, 0); // hydra face
            say("If the creature is able to cry, it almost appears as if it is about to.");
            UI_show_npc_face0(539, 0); // tressa face
            say("Tressa attempts to comfort the creature. @I am sorry Lernaean. I know better now.@");
            UI_remove_answer("How did you get here?");
        }
    }
    
}

void Clear_Tressa_Hydra_Unfreeze object#()()
{
    //UI_clear_item_flag(AVATAR, 16);
    UI_clear_item_flag(-94, 16);
    UI_clear_item_flag(-366, 16);
}

void Create_Fire_Ball_Hydra_Avatar object#()()
{
    UI_sprite_effect(30, 2649, 0067, 0, 0, 0, -1); // fire blast
}

void Move_Avatar_Hydra object#()()
{
    UI_move_object(AVATAR, [2647, 0130, 00]);
}

void Avatar_After_Flame object#()()
{

    script AVATAR
    {
        frame LIE;
        call PaletteFade;
        wait 5;
        call Move_Avatar_Hydra;
        wait 11;
        frame KNEEL;
        wait 2;
        frame STAND;
        wait 2;
        call UnFreezeAvatar;
        call Clear_Tressa_Hydra_Unfreeze;
    }
}

void Knock_Out_Avatar_Hydra object#()()
{
        UI_modify_schedule(-366, 6, LOITER, [2654, 0065]);
        script -94
        {
        actor frame CAST_1;
        wait 2;
        actor frame CAST_2;
        call Create_Fire_Ball_Hydra_Avatar;
        wait 5;
        call Clear_Tressa_Hydra_Unfreeze;
        actor frame STAND;
        wait 3;
        call Avatar_After_Flame;
        }
/*
    if(gflags[KNOCK_OUT_AVATAR_HYDRA])
    {

        script -94
        {
        actor frame CAST_1;
        wait 2;
        actor frame CAST_2;
        call Create_Fire_Ball_Hydra_Avatar;
        wait 5;
        call Clear_Tressa_Hydra_Unfreeze;
        actor frame STAND;
        wait 3;
        call Avatar_After_Flame;
        }
    }
    else
    {

        
        script item
        {
            call Clear_Tressa_Hydra_Unfreeze;
            call UnFreezeAvatar;
        }
    }
*/
}


void Hydra_Kill()
{
    script -366
    {
        say "I should have come sooner";
        wait 15;
        face SOUTH;
        say "I should have known...";
        wait 4;
        call Hydra_Tressa_Convo;
        wait 2;
        call Knock_Out_Avatar_Hydra;

    }
    script -94
    {
        wait 7;
        say "We serve you";
        wait 7;
        face SOUTH;
    }
    script AVATAR
    {
        actor frame STAND;
        face NORTH;
    }
}

void Path_Avatar_to_Screen()
{
    UI_set_item_flag(-366, 16); // freeze tressa
    UI_set_item_flag(-94, 16); // freeze hydra
    UI_set_item_flag(AVATAR, 16); // freeze Avatar
    UI_si_path_run_usecode(AVATAR, [2649, 0067, 0], SCRIPTED, AVATAR, Hydra_Kill, 0);
}
