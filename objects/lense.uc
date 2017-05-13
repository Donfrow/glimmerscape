void lense shape#(1374) ()
{
    var frame = get_item_frame();
    
if (frame == 0)
{
    var loc = get_object_position();
    var lense = UI_click_on_item();
    var lense1 = UI_get_item_shape(lense[1]);

        if (lense1 == ORB_OF_PERSUASION)
        {
            var focused_persuasion_orb = UI_create_new_object2(FOCUSED_ORB_PERSUASION, [loc[1], loc[2], loc[3]+1]);
            UI_set_item_frame(focused_persuasion_orb, 0);
            UI_remove_item(lense[1]);
            UI_remove_from_area(LENS, 0, [loc[1], loc[2]], [loc[1], loc[2]]);
            UI_remove_party_items(1, LENS, ANY, ANY, ANY);
        }
        else if (lense1 == ORB_OF_FOCUS)
        {
			//AVATAR.say("x position is ", loc[1], " and y position is ", loc[2], " and z position is ", loc[3]);
            var focused_focus_orb = UI_create_new_object2(FOCUSED_ORB_PERSUASION, [loc[1], loc[2], loc[3]+1]);
            UI_set_item_frame(focused_focus_orb, 1);
            UI_remove_item(lense[1]);
            UI_remove_from_area(LENS, 0, [loc[1], loc[2]], [loc[1], loc[2]]);
            UI_remove_party_items(1, LENS, ANY, ANY, ANY);
        }
        else if (lense1 == 0)
        {
            //AVATAR.say("Thinks it clicked on world");
        }
        else
        {
            //AVATAR.say("Not returning correct shape");
        }
}

else
{
    AVATAR.say("The lense is destroyed.");
}

}

