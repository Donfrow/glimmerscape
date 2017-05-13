void SignProposal()
{
    var proposal = UI_count_objects(PARTY, GOOD_SCROLL, 78, ANY);
    if(gflags[GET_SIGS] && proposal > 0)
    {
        UI_add_answer("Sign proposal");
    }
    else if (gflags[PROPOSAL_PASSED] || gflags[PROPOSAL_FAILED])
    {
        gflags[GET_SIGS] = false;
        UI_remove_answer("Sign proposal");
    }

}

void HaveEnoughSigs() // Have enough sigs for the proposal
{
    if (proposalsigs >= 4)
    {
        AVATAR.say("@There are now enough signatures to take this to the mayor.@");
        gflags[ENOUGH_SIGS] = true;
    }
    else if (badproposalsigs <= -4)
    {
        AVATAR.say("@I have turned so many people against this proposal that it cannot possibly pass...@");
        gflags[PROPOSAL_FAILED] = true;
        gflags[GET_SIGS] = false;
    }
}
