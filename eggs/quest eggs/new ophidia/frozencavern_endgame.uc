void endGameAvatarFamiliarSurroundingHint()
{
if (gflags[ENDGAME_FOREST_HINT])
{
	script AVATAR
	{
		say "This looks familiar...";
		wait 15;
		say "As if I was here before, before it was frozen.";
		wait 15;
		say "This must be what Death was referring to.";
	}
	gflags[ENDGAME_FOREST_HINT] = true;
}
	
}