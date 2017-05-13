void Give_Joanne_Flowers()
{
	gflags[TELL_WENDILL] = true;
	UI_show_npc_face(459);
	if(gflags[PLAYED_TERRIBLE])
	{
		say("@That terrible racket was you? Why do you do such a thing?@");
		converse(["For Wendill", "Give flowers"])
		{
			case "For Wendill" (remove):
			say("As you explain you play the lute as a favour to Wendill Joanne looks at you with an awkward look.");
			say("@I was hoping he would try to get my attention at some point but this method of his is simply terrible.@");
			
			case "Give flowers" (remove):
			say("You hand over the flowers Wendill gave you to Joanne. She appears to smile slightly but then sighs. @He may have tried to be romantic but instead he hurts my ears.@");
			say("@Though it was nice of him to try something special and this note is sweet. I just wish he had chosen someone better than you to play.@");
			say("@I suppose I will still give him a chance. As for you, I would recommend that you not quit your day job to persue a musical career.@");
			UI_remove_party_items(1, BOUQUET, ANY, ANY);
			break;
		}
	}
	else if (gflags[PLAYED_MEDIOCRE])
	{
		say("@That racket was you? Why do you do such a thing?@");
		converse(["For Wendill", "Give flowers"])
		{
			case "For Wendill" (remove):
			say("As you explain you play the lute as a favour to Wendill Joanne looks at you with an awkward look.");
			say("@I was hoping he would try to get my attention at some point but could he have not picked someone beter at the lute?@");
			
			case "Give flowers" (remove):
			say("You hand over the flowers Wendill gave you to Joanne. She appears to smile slightly but then sighs. @He tries to be romantic but instead he interrupts my dinner.@");
			say("@Though it was nice of him to try something special and this note is sweet of him. I just wish he had chosen someone better than you to play.@");
			say("@I suppose I will still give him a chance. As for you, I would recommend that you not quit your day job to persue a musical career.@");
			UI_remove_party_items(1, BOUQUET, ANY, ANY);
			break;
		}
	}
	else if (gflags[PLAYED_GOOD])
	{
		say("@That music was you? Why do you do such a thing?@");
		converse(["For Wendill", "Give flowers"])
		{
			case "For Wendill" (remove):
			say("As you explain you play the lute as a favour to Wendill Joanne smiles at you.");
			say("@I was waiting until he would try to get my attention and when he finally does he went about it in such a sweet way.@");
			
			case "Give flowers" (remove):
			say("You hand over the flowers Wendill gave you to Joanne. @Wendill has taken the time to get my such a nice bouquet and he wrote a love note!@");
			say("@He must have worked so hard to put this together. It is all so perfect. Though no offense to you, but you could use a wee bit more practice on the lute.@");
			say("Joanne swoons. @It is all so nice. I cannot wait to see him again! Thank you!@");
			UI_remove_party_items(1, BOUQUET, ANY, ANY);
			break;
		}
	}
	else if (gflags[PLAYED_GREAT])
	{
		say("@That wonderful music was you? Why do you do such a thing?@");
		converse(["For Wendill", "Give flowers"])
		{
			case "For Wendill" (remove):
			say("As you explain you play the lute as a favour to Wendill Joanne smiles at you.");
			say("@I was waiting for him to try and get my attention and when he put so much effort into it. He has made me feel so special.@");
			
			case "Give flowers" (remove):
			say("You hand over the flowers Wendill gave you to Joanne. Upon receiving the flowers Joannes voice flutters. @I cannot believe Wendill has gone through all this!@");
			say("@He must have spent so much time preparing this. He must have spent so much to have such an excellent lute player serenade me. I cannot believe how much effort he put into this.@");
			say("Joanne swoons. @This is all so perfect. It is all so romantic. Wendill is truely the one for me. Thank you so much!@");
			UI_remove_party_items(1, BOUQUET, ANY, ANY);
			break;
		}
	}
	else
	{
		AVATAR.say("Not showing as playing");
	}
}

void Path_Joanne_To_Avatar object#()()
{
	UI_si_path_run_usecode(-440, [avatarx-3, avatary, avatarz], SCRIPTED, -440, Give_Joanne_Flowers , 1);
}

void Great_Lute_Play()
{
	script AVATAR
	{
		nohalt;
		call Music_Notes;
		call Lute_Music;
	}
	script -440
	{
		nohalt;
		wait 40;
		say "What is that wonderful music?";
		call Path_Joanne_To_Avatar;
	}
}

void Good_Lute_Play()
{
	script AVATAR
	{
		nohalt;
		call Music_Notes;
		call Lute_Music;
		wait 5;
		call Whip_Sound;
		wait 2;
		call Lone_Tick_Sound;
		wait 10;
		call Sewing_Sound;
	}
	script -440
	{
		nohalt;
		wait 40;
		say "What is that intriguing sound?";
		call Path_Joanne_To_Avatar;
	}
}

void Mediocre_Lute_Play()
{
	script AVATAR
	{
		nohalt;
		call Music_Notes;
		call Lone_Tick_Sound;
		wait 1;
		call Whip_Sound;
		wait 1;
		call Lone_Tick_Sound;
		wait 1;
	}
	script -440
	{
		nohalt;
		wait 5;
		say "What is that awful sound?";
		call Path_Joanne_To_Avatar;
	}
}

void Terrible_Lute_Play()
{
	script AVATAR
	{
		nohalt;
		call Music_Notes;
		call Sewing_Sound;
		wait 1;
		call Weird_Sound;
		wait 1;
		call Sewing_Sound;
		wait 1;
	}
	script -440
	{
		nohalt;
		wait 5;
		say "What is that terrible sound?";
		call Path_Joanne_To_Avatar;
	}
	
}

void Move_Joanne()
{
	UI_move_object(-440, [1210, 1335, 0]);
}

void lute shape#(692)()
{
    if (event == DOUBLECLICK)
    {
		var time = UI_game_hour();
		if(gflags[PLAY_FOR_WENDILL])
		{
			var loc = UI_get_object_position(AVATAR);
			avatarx = loc[1];
			avatary = loc[2];
			avatarz = loc[3];
			if(time >= 17 && avatarx >1216 && avatary > 1326 && avatarx <1232 && avatary <1343)
			{
				if(UI_is_dead(-440))
				{
					AVATAR.say("@It is pointless to play for Joanne as I have sent her to an early grave...@");
				}
				else
				{
			
					if(gflags[LUTE_LEVEL_1]) // terrible skill
					{
						AVATAR.say("@I am terrible at the lute. Do I really want to do this?@");
						converse(["Yes", "No"])
						{
							case "Yes" (remove):
							gflags[PLAYED_TERRIBLE] = true;
							gflags[PLAYED_FOR_WENDILL] = true;
							gflags[PLAY_FOR_WENDILL] = false;
							Move_Joanne();
							Terrible_Lute_Play();
							break;
							
							case "No" (remove):
							break;
						}
					}
					else if(gflags[LUTE_LEVEL_2]) // mediocre skill
					{
						AVATAR.say("@I am mediocre at the lute. Do I really want to do this?@");
						converse(["Yes", "No"])
						{
							case "Yes" (remove):
							gflags[PLAYED_MEDIOCRE] = true;
							gflags[PLAYED_FOR_WENDILL] = true;
							gflags[PLAY_FOR_WENDILL] = false;
							Move_Joanne();
							Mediocre_Lute_Play();
							break;
							
							case "No" (remove):
							break;
						}
					}
					else if(gflags[LUTE_LEVEL_3]) // mediocre skill
					{
						AVATAR.say("@I am mediocre at the lute. Do I really want to do this?@");
						converse(["Yes", "No"])
						{
							case "Yes" (remove):
							gflags[PLAYED_MEDIOCRE] = true;
							gflags[PLAYED_FOR_WENDILL] = true;
							gflags[PLAY_FOR_WENDILL] = false;
							Move_Joanne();
							Mediocre_Lute_Play();
							break;
							
							case "No" (remove):
							break;
						}
					}
					else if(gflags[LUTE_LEVEL_4]) // good skill
					{
						AVATAR.say("@I am pretty good at the lute but I could be better. Do I really want to do this?@");
						converse(["Yes", "No"])
						{
							case "Yes" (remove):
							gflags[PLAYED_GOOD] = true;
							gflags[PLAYED_FOR_WENDILL] = true;
							gflags[PLAY_FOR_WENDILL] = false;
							Move_Joanne();
							Good_Lute_Play();
							break;
							
							case "No" (remove):
							break;
						}
					}
					else if(gflags[LUTE_LEVEL_5]) // good skill
					{
						AVATAR.say("@I am excellent at the lute but I think I could use another lesson. Do I really want to do this?@");
						converse(["Yes", "No"])
						{
							case "Yes" (remove):
							gflags[PLAYED_GOOD] = true;
							gflags[PLAYED_FOR_WENDILL] = true;
							gflags[PLAY_FOR_WENDILL] = false;
							Move_Joanne();
							Good_Lute_Play();
							break;
							
							case "No" (remove):
							break;
						}
					}
					else if(gflags[LUTE_LEVEL_6]) // great skill
					{
						AVATAR.say("@I am terrific on the lute. Do I really want to do this?@");
						converse(["Yes", "No"])
						{
							case "Yes" (remove):
							gflags[PLAYED_GREAT] = true;
							gflags[PLAYED_FOR_WENDILL] = true;
							gflags[PLAY_FOR_WENDILL] = false;
							Move_Joanne();
							Great_Lute_Play();
							break;
							
							case "No" (remove):
							break;
						}
					}
					else // HAVE NO LUTE SKILL - terrible skill
					{
						AVATAR.say("@I am terrible at the lute. Do I really want to do this?@");
						converse(["Yes", "No"])
						{
							case "Yes" (remove):
							gflags[PLAYED_TERRIBLE] = true;
							gflags[PLAYED_FOR_WENDILL] = true;
							gflags[PLAY_FOR_WENDILL] = false;
							Move_Joanne();
							Terrible_Lute_Play();
							break;
							
							case "No" (remove):
							break;
						}
					}
				}
			}
			else
			{
				AVATAR.say("@I need to do this outside of Joannes home between the hours of six and midnight.@");
			}
			
		}
		else
		{
			UI_play_music(48, item);
		}
		
    }
}

