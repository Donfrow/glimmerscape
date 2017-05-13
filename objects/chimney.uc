void chimney shape#(982)()
{
    if (event == DOUBLECLICK)
    {
        var loc = get_object_position();
        if (loc[1] == 1591 || loc[1] == 1596)
        {
            UI_si_path_run_usecode(AVATAR, [loc[1], loc[2], loc[3]-1], SCRIPTED, AVATAR, GoDownChimney, true);
        }
    }
}
