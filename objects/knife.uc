void knife shape#(1154)()
{
    var target = UI_click_on_item();
    var target1 = UI_get_item_shape(target[1]);
    var frame = UI_get_item_frame(target);
    if (target1 == 1389 && frame == 0)
    {
        //AVATAR.say("Working");
        UI_create_new_object2(LECHUCKS_BEARD, [target[2], target[3], target[4]]);
    }
    else
    {
        //AVATAR.say("Failing to get body");
    }

}
