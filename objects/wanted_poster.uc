void wantedposter shape#(1388)()
{
    var quality = get_item_quality();
    book_mode();
    
    if (quality == 1)
    {
        say("WANTED: Flanwald Larus");
        say("");
        say("REWARD: 250 gold pieces");
        say("");
        say("The Solusek Mining Company seeks the head of Flanwald Larus. Flanwald is wanted for the abandonment of his post which resulted in over 20 deaths.");
    }
    else if (quality == 2)
    {
        say("WANTED: Captain LeChuck");
        say("");
        say("REWARD: Choice of treasure from the Nautical Guild Storage Room");
        say("");
        say("The Nautical Guild seeks the death of the pirate Captain LeChuck. LeChuck is wanted in connection with the robbing of over 30 ships and deaths of numerous sailors.");
        say("");
        say("The beard of LeChuck is required to claim this bounty. A knife from the Nautical Guild may be used to cut it from his body.");
    }
}
