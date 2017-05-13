void charged_flux_capacitor shape#(1392)()
{
    var loc = get_object_position();
	var avatar_loc = get_object_position(AVATAR);
    var item_quality = get_item_quality();
    var target = UI_click_on_item();
    var target_num = UI_get_item_shape(target[1]);
    if (target_num == SPENT_ORB)      // Akakothen
    {

        if (item_quality == 1) // The orb of persuasion
        {

		UI_set_item_shape(target[1], ORB_OF_PERSUASION);
		UI_set_item_shape(item, FLUX_CAPACITOR);
		UI_set_item_quality(item, 0);
		/*
        UI_remove_item(target[1]); // remove the dead orb shape
        UI_remove_from_area(CHARGED_FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        UI_remove_party_items(1, CHARGED_FLUX_CAPACITOR, ANY, ANY);
        UI_create_new_object(ORB_OF_PERSUASION);
        UI_update_last_created(avatar_loc);
        UI_add_party_items(1, FLUX_CAPACITOR, ANY, ANY);
		*/
        UI_sprite_effect(12, target[2], target[3], 0, 0, 0, -1);
        UI_play_sound_effect(67);
		UI_close_gumps();
        }
        else if (item_quality == 2) // Orb of transfiguration
        {
		UI_set_item_shape(target[1], ORB_OF_TRANSFIGURATION);
		UI_set_item_shape(item, FLUX_CAPACITOR);
		UI_set_item_quality(item, 0);
		/*
        UI_remove_from_area(CHARGED_FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        UI_remove_item(target[1]); // remove the dead orb shape
        UI_remove_party_items(1, CHARGED_FLUX_CAPACITOR, ANY, ANY);
        UI_create_new_object(ORB_OF_TRANSFIGURATION);
        UI_update_last_created(avatar_loc);
        UI_add_party_items(1, FLUX_CAPACITOR, ANY, ANY);
		*/
        UI_sprite_effect(12, target[2], target[3], 0, 0, 0, -1);
        UI_play_sound_effect(67);
		UI_close_gumps();
        }
        else if (item_quality == 3) // Orb of Souls
        {
		UI_set_item_shape(target[1], WEAKENED_SOUL_ORB);
		UI_set_item_shape(item, FLUX_CAPACITOR);
		UI_set_item_quality(item, 0);
		/*
        UI_remove_from_area(CHARGED_FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        UI_remove_item(target[1]);  // remove the dead orb shape
        UI_remove_party_items(1, CHARGED_FLUX_CAPACITOR, ANY, ANY);
        UI_create_new_object(WEAKENED_SOUL_ORB); // weakened orb of souls - need a soul to charge it
        UI_update_last_created(avatar_loc);
        UI_add_party_items(1, FLUX_CAPACITOR, ANY, ANY);
		*/
        UI_sprite_effect(12, target[2], target[3], 0, 0, 0, -1);
        UI_play_sound_effect(67);
        AVATAR.say("@The Orb of Souls does not appear as powerful as before. Perhaps Death has some insight into this.@");
		gflags[DEATH_WEAK_ORB] = true;
		UI_close_gumps();
        }
        else if (item_quality == 4) // Orb of Chaos
        {
		UI_set_item_shape(target[1], ORB_OF_CHAOS);
		UI_set_item_shape(item, FLUX_CAPACITOR);
		UI_set_item_quality(item, 0);
		/*
        UI_remove_from_area(CHARGED_FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        UI_remove_item(target[1]); // remove the dead orb shape
        UI_remove_party_items(1, CHARGED_FLUX_CAPACITOR, ANY, ANY);
        UI_create_new_object(ORB_OF_CHAOS);
        UI_update_last_created(avatar_loc);
        UI_add_party_items(1, FLUX_CAPACITOR, ANY, ANY);
		*/
        UI_sprite_effect(12, target[2], target[3], 0, 0, 0, -1);
        UI_play_sound_effect(67);
		UI_close_gumps();
        }
        else if (item_quality == 5) // Orb of Focus
        {
		UI_set_item_shape(target[1], ORB_OF_FOCUS);
		UI_set_item_shape(item, FLUX_CAPACITOR);
		UI_set_item_quality(item, 0);
		/*
        UI_remove_from_area(CHARGED_FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        UI_remove_item(target[1]); // remove the dead orb shape
        UI_remove_party_items(1, CHARGED_FLUX_CAPACITOR, ANY, ANY);
        UI_create_new_object(ORB_OF_FOCUS);
        UI_update_last_created(avatar_loc);
        UI_add_party_items(1, FLUX_CAPACITOR, ANY, ANY);
		*/
        UI_sprite_effect(12, target[2], target[3], 0, 0, 0, -1);
        UI_play_sound_effect(67);
		UI_close_gumps();
        }
    }
    else
    {
        UI_sprite_effect(12, target[2], target[3], 0, 0, 0, -1);
        UI_sprite_effect(6, target[2], target[3], 0, 0, 0, -1);
        UI_play_sound_effect(51);
        
        UI_add_party_items(1, FLUX_CAPACITOR, ANY, ANY);
        UI_remove_from_area(CHARGED_FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        UI_remove_party_items(1, CHARGED_FLUX_CAPACITOR, ANY, ANY);
		UI_close_gumps();

    }
                                      // || target1 == 1025 || target1 == 1026 || target1 == 1027 || target1 == 1028 || target1 == 1029
}
