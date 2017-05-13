void poo_egg object#()()
{
	var door_nearby = UI_find_nearby([1254, 1904, 0], 270, 5, MASK_NONE);
	
	//var door_nearby = UI_find_nearby(AVATAR, 270, 5, MASK_NONE);
	
	var frame = UI_get_item_frame(door_nearby);
	AVATAR.say(frame);
}
