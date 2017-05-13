void disenchanting_stone shape#(1434)()
{
    var stone_loc = get_object_position();
    
    var stone_x = stone_loc[1];
    var stone_y = stone_loc[2];
    var stone_z = stone_loc[3];
    
    var avatar_loc = UI_get_object_position(AVATAR);

    var avatar_x = avatar_loc[1];
    var avatar_y = avatar_loc[2];
    var avatar_z = avatar_loc[3];

    if(event == DOUBLECLICK)
    {
        var armor_type;
        var target = UI_click_on_item();
        var target_shape = UI_get_item_shape(target[1]);
        var target_frame = UI_set_item_frame(target[1]);
        var target_x = target[2];
        var target_y = target[3];
        var target_z = target[4];
        
        if(target_shape == LIGHTNING_WHIP)
        {
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove whip
            Create_Disenchanted_Whip(target_x, target_y, target_z);
        }
        else if (target_shape == 551)  // fire sword
        {
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove sword
            Create_Disenchanted_FSword(target_x, target_y, target_z);
        }
        else if (target_shape == 552) // magic axe
        {
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove axe
            Create_Disenchanted_Axe(target_x, target_y, target_z);
        }
        else if (target_shape == MAGIC_SWORD)
        {
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove sword
            Create_Disenchanted_MSword(target_x, target_y, target_z);
        }
        else if (target_shape == MAGIC_HELM)
        {
            armor_type = 1;
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove helm
            Create_Disenchanted_Armor(target_x, target_y, target_z, armor_type);
        }
        else if (target_shape == MAGIC_ARMOR)
        {
            armor_type = 2;
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove bp
            Create_Disenchanted_Armor(target_x, target_y, target_z, armor_type);
        }
        else if (target_shape == MAGIC_SHIELD)
        {
            armor_type = 3;
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove shield
            Create_Disenchanted_Armor(target_x, target_y, target_z, armor_type);
        }
        else if (target_shape == MAGIC_LEGS)
        {
            armor_type = 4;
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove legs
            Create_Disenchanted_Armor(target_x, target_y, target_z, armor_type);
        }
        else if (target_shape == MAGIC_GAUNTLETS)
        {
            armor_type = 5;
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove gaunts
            Create_Disenchanted_Armor(target_x, target_y, target_z, armor_type);
        }
        else if (target_shape == BOOTS)
        {
            if(target_frame == 1)
            {
                Disenchant_SFX(target_x, target_y);
                remove_item(); // remove stone
                UI_set_item_frame(target[1], 2);
                Create_Disenchanted_Armor(target_x, target_y, target_z, armor_type);
            }
        }
        else if (target_shape == MAGIC_BOW)
        {
            Disenchant_SFX(target_x, target_y);
            remove_item(); // remove stone
            UI_remove_item(target[1]); // remove helm
            Create_Disenchanted_Bow(target_x, target_y, target_z);
        }
    }
}
