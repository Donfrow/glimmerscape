



void egg_book_about_orb object#()()
{

if (gflags[SPAWN_ORB_BOOK])
	{
	UI_create_new_object(642);
	set_item_quality(4);
	set_item_frame(13);
	UI_update_last_created([UI_get_object_position()]);


	}

}