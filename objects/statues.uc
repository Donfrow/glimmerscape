//Siren statue movement

void statues shape#(854)() // talking statue in karma tests
{

if(event == DOUBLECLICK)
{

var frame = UI_get_item_frame(item);
var loc = get_object_position(item);

	if(frame == 58 || frame == 26) // siren statue
	{
		if(gflags[ENTER_CORINAV_SHRINE])
		{
			if(loc[1] == 2738 && loc[2] == 2183)
			{
				NPC = PARTY;
				targetx = 1015;
				targety = 2812;
				targetz = 0;
				targetmap = 2;
				
				UI_infravision(AVATAR, true);
				
				script AVATAR
				{
					nohalt;
					call Fade;
					wait 4;
					call Generic_Move_NPC_Map;
					wait 2;
					face NORTH;
					wait 2;
					call UnFade;
				}
			
			}
			else if (loc[1] == 1010 && loc[2] == 2776 || loc[1] == 1022 && loc[2] == 2776)
			{
				NPC = PARTY;
				targetx = 2742;
				targety = 2183;
				targetz = 0;
				targetmap = 0;	
				
				UI_infravision(AVATAR, false);
				
				script AVATAR
				{
					nohalt;
					call Fade;
					wait 4;
					call Generic_Move_NPC_Map;
					wait 2;
					face EAST;
					wait 2;
					call UnFade;
				}
			}
		}
	}

}

}

