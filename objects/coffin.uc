void coffin shape#(1498)()
{

if(event == DOUBLECLICK)
{

var frame = UI_get_item_frame(item);

if(frame == 0)
{
	UI_play_sound_effect(126);
	UI_set_item_frame(item, 2);
}

if(frame == 2)
{
	UI_play_sound_effect(126);
	UI_set_item_frame(item, 0);
}

}

}


