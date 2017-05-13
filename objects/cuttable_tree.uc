

void cuttable_tree shape#(1425)()
{

if(event == DOUBLECLICK)
{

    var frame = get_item_frame();
    var axe_readied = UI_is_readied(AVATAR, 1, WOODCUTTERS_AXE, ANY); // woodcutters axe is in avatars hand
    var loc = get_object_position();

    if(axe_readied)
    {

        if (frame == 0)
        {
            //AVATAR.say("X is ", loc[1], " and Y is ", loc[2]);
            UI_si_path_run_usecode(AVATAR, [loc[1]+1, loc[2], loc[3]], SCRIPTED, AVATAR, Cut_Down_Tree, 1);

            script item
            {
				nohalt;
                wait 35;
                repeat 5

                {
                    next frame;
                };
            }


        }
        else if (frame == 5)
        {
			tree_cut = 0;
            UI_si_path_run_usecode(AVATAR, [loc[1]+1, loc[2]-3, loc[3]], SCRIPTED, AVATAR, Chop_Up_Tree, 1);
        }
    }
    else
    {
        AVATAR.say("@It would help if I had an axe ready to cut down this tree.@");

    }




}

}
