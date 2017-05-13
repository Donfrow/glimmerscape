void Disenchant_SFX(target_x, target_y)
{
    UI_play_sound_effect(97);
    UI_sprite_effect(12, target_x, target_y, 0, 0, 0, 10);
}

void Create_Disenchanted_Whip(target_x, target_y, target_z)   // magic whip
{
// CREATE WHIP ON GROUND
var leather_whip = UI_create_new_object(WHIP);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE NIGHTSHADE
var nightshade = UI_create_new_object(REAGENTS);
UI_set_item_quantity(nightshade, 3);
UI_set_item_frame(nightshade, 2);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLOODSPAWN
var bloodspawn = UI_create_new_object(REAGENTS);
UI_set_item_quantity(bloodspawn, 1);
UI_set_item_frame(bloodspawn, 8);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE GINSENG
var ginseng = UI_create_new_object(REAGENTS);
UI_set_item_quantity(ginseng, 3);
UI_set_item_frame(ginseng, 5);
UI_update_last_created([target_x, target_y, target_z]);

}

void Create_Disenchanted_FSword(target_x, target_y, target_z) // fire sword
{
// CREATE SWORD ON GROUND
var sword = UI_create_new_object(ONE_HAND_SWORD);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE ASH
var ash = UI_create_new_object(REAGENTS);
ash->set_item_quality(3);
UI_set_item_frame(ash, 7);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLOODSPAWN
var bloodspawn = UI_create_new_object(REAGENTS);
UI_set_item_quantity(bloodspawn, 1);
UI_set_item_frame(bloodspawn, 8);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLOODMOSS
var bloodmoss = UI_create_new_object(REAGENTS);
UI_set_item_quantity(bloodmoss, 3);
UI_set_item_frame(bloodmoss, 5);
UI_update_last_created([target_x, target_y, target_z]);

}

void Create_Disenchanted_Axe(target_x, target_y, target_z)     // axe
{
// CREATE SWORD ON GROUND
var sword = UI_create_new_object(AXE);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE MANDRAKE ROOT
var root = UI_create_new_object(REAGENTS);
root->set_item_quality(4);
UI_set_item_frame(root, 3);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLOODSPAWN
var bloodspawn = UI_create_new_object(REAGENTS);
UI_set_item_quantity(bloodspawn, 1);
UI_set_item_frame(bloodspawn, 8);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLACK PEARL
var pearl = UI_create_new_object(REAGENTS);
UI_set_item_quantity(pearl, 3);
UI_set_item_frame(pearl, 5);
UI_update_last_created([target_x, target_y, target_z]);

}

void Create_Disenchanted_Bow(target_x, target_y, target_z)     //Bow
{
// CREATE BOW ON GROUND
var sword = UI_create_new_object(BOW);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE MANDRAKE ROOT
var root = UI_create_new_object(REAGENTS);
root->set_item_quality(4);
UI_set_item_frame(root, 3);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLOODSPAWN
var bloodspawn = UI_create_new_object(REAGENTS);
UI_set_item_quantity(bloodspawn, 1);
UI_set_item_frame(bloodspawn, 8);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLOODMOSS
var bloodmoss = UI_create_new_object(REAGENTS);
UI_set_item_quantity(bloodmoss, 3);
UI_set_item_frame(bloodmoss, 1);
UI_update_last_created([target_x, target_y, target_z]);

}

void Create_Disenchanted_MSword(target_x, target_y, target_z) // fire sword
{
// CREATE SWORD ON GROUND
var sword = UI_create_new_object(ONE_HAND_SWORD);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE SILK
var silk = UI_create_new_object(REAGENTS);
silk->set_item_quality(3);
UI_set_item_frame(silk, 7);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLOODSPAWN
var bloodspawn = UI_create_new_object(REAGENTS);
UI_set_item_quantity(bloodspawn, 1);
UI_set_item_frame(bloodspawn, 8);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLACKPEARL
var blackpearl = UI_create_new_object(REAGENTS);
UI_set_item_quantity(blackpearl, 3);
UI_set_item_frame(blackpearl, 0);
UI_update_last_created([target_x, target_y, target_z]);

}

void Create_Disenchanted_Armor(target_x, target_y, target_z, armor_type) // magic armor
{
    if(armor_type == 1) // helm
    {
        // CREATE HELM ON GROUND
        var helm = UI_create_new_object(CRESTED_HELM);
        UI_set_item_frame(helm, 2);
        UI_update_last_created([target_x, target_y, target_z]);
    }
    else if (armor_type == 2) // breastplate
    {
        // CREATE PLATE ARMOR ON GROUND
        var breastplate = UI_create_new_object(PLATE_ARMOR);
        UI_update_last_created([target_x, target_y, target_z]);
    }
    else if (armor_type == 3) // shield
    {
        // CREATE PLATE ARMOR ON GROUND
        var shield = UI_create_new_object(CURVED_HEATER);
        UI_update_last_created([target_x, target_y, target_z]);
    }
    else if (armor_type == 4) // legs
    {
        // CREATE PLATE ARMOR ON GROUND
        var legs = UI_create_new_object(PLATE_LEGS);
        UI_update_last_created([target_x, target_y, target_z]);
    }
    else if (armor_type == 5) // gauntlets
    {
        // CREATE GAUNTLETS ON GROUND
        var gauntlets = UI_create_new_object(GAUNTLETS);
        UI_update_last_created([target_x, target_y, target_z]);
    }
    else if (armor_type == 6) // boots
    {
        // CREATE BOOTS ON GROUND
        var boots = UI_create_new_object(BOOTS);
        UI_set_item_frame(boots, 2);
        UI_update_last_created([target_x, target_y, target_z]);
    }


// CREATE SILK
var silk = UI_create_new_object(REAGENTS);
silk->set_item_quality(3);
UI_set_item_frame(silk, 7);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE BLACK PEARL
var pearl = UI_create_new_object(REAGENTS);
UI_set_item_quantity(pearl, 3);
UI_set_item_frame(pearl, 0);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE MANDRAKE ROOT
var root = UI_create_new_object(REAGENTS);
root->set_item_quality(4);
UI_set_item_frame(root, 3);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE NIGHTSHADE
var nightshade = UI_create_new_object(REAGENTS);
UI_set_item_quantity(nightshade, 3);
UI_set_item_frame(nightshade, 2);
UI_update_last_created([target_x, target_y, target_z]);

// CREATE GINSENG
var ginseng = UI_create_new_object(REAGENTS);
UI_set_item_quantity(ginseng, 3);
UI_set_item_frame(ginseng, 5);
UI_update_last_created([target_x, target_y, target_z]);
}


