void Goblin_Friendly_Talk(male_goblin)
{
	var n = UI_die_roll(1, 3);
	var avatar_bark = "It cannot speak our tongue";
	if(event == DOUBLECLICK)
	{
		if(n == 1)
		{
			script object_ref
			{
				say "Oogadamoogadee!";
			}
			script AVATAR
			{
				wait 2;
				say avatar_bark;
			}
		}
		else if (n == 2)
		{
			script object_ref
			{
				say "Gobbledegook";
			}
			script AVATAR
			{
				wait 2;
				say avatar_bark;
			}
		}
		else if (n == 3)
		{
		
			script object_ref
			{
				say "Grubblefresh Madgamoo";
			}
			script AVATAR
			{
				wait 2;
				say avatar_bark;
			}
		}
	}
}