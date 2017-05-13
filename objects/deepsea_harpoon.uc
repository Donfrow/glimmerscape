// Used to make Agata the Insane in the Depths killable

void deepsea_harpoon shape#(1493)()
{
	if(event == READIED)
	{
		UI_clear_item_flag(-467, SI_TOURNAMENT);
	}
	else if (event == UNREADIED)
	{
		UI_set_item_flag(-467, SI_TOURNAMENT);
	}
}
