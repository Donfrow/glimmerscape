void Siren_Shell shape#(1492)()
{
	if(event == DOUBLECLICK)
	{
		var target = UI_click_on_item();
		UI_set_item_flag(target[1], CHARMED);
		UI_play_sound_effect(19);
	}
}
