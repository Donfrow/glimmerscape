void fluxcapacitor shape#(1385) ()
{
var loc = get_object_position();

    if(gflags[ORBS_IN_PLACE])
    {
  
        var target = UI_click_on_item();
        var target_shape = UI_get_item_shape(target[1]);
        if(target_shape == ORB_OF_FOCUS)
        {
            UI_sprite_effect(12, target[2], target[3], 0, 0, 0, -1);
            UI_play_sound_effect(91);
            gflags[USED_FLUX_ON_ORB] = true;
            UI_show_npc_face(329, 0);
			script -27
			{
				say "Amazing!";
				wait 24;
				call Zorpho_Incantation; //objects/object_functions/flux_capacitor_functions.uc
        
			}
		}
    }

	else if (gflags[ORBS_IN_PLACE1])
	{
        var target = UI_click_on_item();
        var target_shape = UI_get_item_shape(target[1]);
        if(target_shape == ORB_OF_FOCUS)
        {
            UI_sprite_effect(12, target[2], target[3], 0, 0, 0, -1);
            UI_play_sound_effect(91);
            UI_earthquake(20);
            gflags[FLUX_USED_FINAL] = true;
            script AVATAR
            {
				say "Ooompa Loompa Doobadee Doo Teewanawana jabba no bodda";
				wait 10;
				say "I have a bad feeling about this";
            }

        }        		
	}

    else if (gflags[RECREATE_ORBS])
    {
    var target = UI_click_on_item();
    var target_shape = UI_get_item_shape(target[1]);
    var target_frame = UI_get_item_frame(target[1]);
    var target_quality = UI_get_item_quality(target[1]);
    
        if (target_shape == AKAKOTHEN_SHAPE)      // Akakothen   ORB OF PERSUASION
        {
			UI_set_item_shape(item, CHARGED_FLUX_CAPACITOR);
			UI_set_item_quality(item, 1);
        //UI_remove_from_area(FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        //UI_remove_party_items(1, FLUX_CAPACITOR, ANY, ANY);
        //UI_add_party_items(1, CHARGED_FLUX_CAPACITOR, 1, ANY);
        }
        else if (target_shape == 778 && target_frame == 10 || target_frame == 42) //|| target_shape == 778 && target_frame == 42) // shape which contains the spider body shape (frame 10 or 42)
        { // ORB OF TRANSFIGURATION
			UI_set_item_shape(item, CHARGED_FLUX_CAPACITOR);
			UI_set_item_quality(item, 2);
        //UI_remove_from_area(FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        //UI_remove_party_items(1, FLUX_CAPACITOR, ANY, ANY);
        //UI_add_party_items(1, CHARGED_FLUX_CAPACITOR, 2, ANY);
        }
        else if (target_shape == 1275)      // 'Victim' shape
        { // ORB OF SOULS
			UI_set_item_shape(item, CHARGED_FLUX_CAPACITOR);
			UI_set_item_quality(item, 3);
        //UI_remove_from_area(FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        //UI_remove_party_items(1, FLUX_CAPACITOR, ANY, ANY);
        //UI_add_party_items(1, CHARGED_FLUX_CAPACITOR, 3, ANY);
        }
        else if (target_shape == WARPED_WOOD) // shape for wood
        { // ORB OF CHAOS
			UI_set_item_shape(item, CHARGED_FLUX_CAPACITOR);
			UI_set_item_quality(item, 4);
        //UI_remove_from_area(FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
        //UI_remove_party_items(1, FLUX_CAPACITOR, ANY, ANY);
        //UI_add_party_items(1, CHARGED_FLUX_CAPACITOR, 4, ANY);
        }
        else if (target_shape == CHARRED_REMAINS) // Orb of Focus
        {
			UI_set_item_shape(item, CHARGED_FLUX_CAPACITOR);
			UI_set_item_quality(item, 5);
          //  UI_remove_from_area(FLUX_CAPACITOR, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
            //UI_remove_party_items(1, FLUX_CAPACITOR, ANY, ANY);
           // UI_add_party_items(1, CHARGED_FLUX_CAPACITOR, 5, ANY);
        }
        else
        {	
			
			UI_play_sound_effect(1);
			UI_sprite_effect(3, target[2], target[3], 0, 0, 0, -1);
        }
		UI_close_gumps();
    }
    else
    {
        AVATAR.say("@This is what makes time travel possible.@");
    }
    
}

