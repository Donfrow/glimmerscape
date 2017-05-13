void count_reagents()
{
    var black_pearl = UI_count_objects(PARTY, 842, ANY, 0);
    var bloodmoss =  UI_count_objects(PARTY, 842, ANY, 1);
    var nightshade = UI_count_objects(PARTY, 842, ANY, 2);
    var mandrake = UI_count_objects(PARTY, 842, ANY, 3);
    var garlic = UI_count_objects(PARTY, 842, ANY, 4);
    var ginseng = UI_count_objects(PARTY, 842, ANY, 5);
    var spider_silk = UI_count_objects(PARTY, 842, ANY, 6);
    var ash = UI_count_objects(PARTY, 842, ANY, 7);
    var bloodspawn = UI_count_objects(PARTY, 842, ANY, 8);
    var serpent_scale = UI_count_objects(PARTY, 842, ANY, 9);
    var worm_heart = UI_count_objects(PARTY, 842, ANY, 10);
    var agnium = UI_count_objects(PARTY, 842, ANY, 11);
    var serpentinium = UI_count_objects(PARTY, 842, ANY, 12);
    var zerine = UI_count_objects(PARTY, 842, ANY, 13);
    var phosphor = UI_count_objects(PARTY, 842, ANY, 14);

    AVATAR.say("@Lets see... there is ", black_pearl, " black pearls, ", bloodmoss, " bloodmoss, ", nightshade, " nightshade, ", mandrake, " mandrake, ", garlic, " garlic, ", ginseng, " ginseng, ", spider_silk, " spider silk, ", ash, " sulfurous ash, ", bloodspawn, " blood spawn, ", serpent_scale, " serpent scales and ", worm_heart, " worm hearts.@");
}
