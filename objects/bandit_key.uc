void bandit_key shape#(1517)()
{

if(event == DOUBLECLICK)
{
	var doubleClickedFrame = item->get_item_frame();
	
	var clickTarget = UI_click_on_item();
	var clickTargetFrame = clickTarget[1]->get_item_frame();
	var clickTargetShape = clickTarget[1]->get_item_shape();
	
	//AVATAR.say("Original item frame is ", doubleClickedFrame);
	//AVATAR.say("Click item frame is ", doubleClickedFrame);
	
	var loc = AVATAR->get_object_position();
	UI_close_gumps();
	
	if(doubleClickedFrame == 3) // Combined at least 2 keys, and you now have a magic key you can combine with the final key.
	{
		//AVATAR.say("Clicked item shape is ", clickTargetShape);
		//AVATAR.say("Clicked item frame is ", clickTargetFrame);
		//Check to see if you're clicking on one of the keys
		
		if((clickTargetShape == 1517 && clickTargetFrame == 0) || (clickTargetShape == 1517 && clickTargetFrame == 1) || (clickTargetShape == 1517 && clickTargetFrame == 2))	
		{
		
			UI_sprite_effect(13, loc[1], loc[2], 0, 0, 0, -1);
			UI_play_sound_effect(64);
			
			//Turn the bandit key into the usable key
			//AVATAR.say("Creating the final key");
			UI_set_item_shape(item, 641);
			UI_set_item_frame(item, 2);
			UI_set_item_quality(item, 43);
			UI_move_object(item, [loc]);
			
			// Remove the clicked target object
			UI_remove_item(clickTarget[1]);
		}
		else
		{
			AVATAR.say("@I need to combine this with another bandit key.@");
		}
	}
	else //Combine the first set of keys to form the first magic key (frame 3)
	{
		if(clickTargetShape == BANDIT_KEY && clickTargetFrame != 3) //Frame 3 is the mid tier key
		{
			UI_remove_item(clickTarget[1]);
			UI_remove_item(item);
			
			//create the midtier key
			var midKey = UI_create_new_object(1517);
			midKey->set_item_frame(3);
			UI_update_last_created([loc]);
				
			// graphics for combine
			UI_sprite_effect(13, loc[1], loc[2], 0, 0, 0, -1);
			UI_play_sound_effect(64);
		}
		else
		{
			AVATAR.say("@Perhaps if I were to combine the bandit keys together...@");
		}
	}
}

}
