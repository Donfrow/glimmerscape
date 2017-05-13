void StatueCheck()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");

    converse
    {
        if(response == "Yes")
        {
            say("@I shall return you from wence you came.@");
            gflags[LEFT_KARMA_TEST] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}
