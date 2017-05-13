/*
Alayna the musuem lady in brentonia
*/

void AlaynaReward()
{
    UI_push_answers();
    UI_add_answer("I could not possibly");
    UI_add_answer("Pathetic!");
    
    converse
    {
        if (response == "I could not possibly")
        {
            say("@You are certainly too kind. There are not many who possess such kindness. May good fortune shine upon you.@");
            karma = karma + 850;
			KarmaGoodSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Pathetic!")
        {
            say("@I am sorry for offending you with my offer. Here is your coin. Thank you once again and I do apologize for its measly amount.@");
            UI_add_party_items(50, SHAPE_GOLD, ANY, ANY);
            karma = karma - 500;
			KarmaBadSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}
void Artifacts()
{
    UI_push_answers();
    UI_add_answer("Earrings");
    UI_add_answer("Flux Capacitor");
    UI_add_answer("Drum");
    UI_add_answer("Brush");
    UI_add_answer("Goblet");
    UI_add_answer("Gem");
	UI_add_answer("Helm");
    
    if (gflags[GAVE_MOLTEN_CLOAK])
    {
        UI_add_answer("Molten cloak");
    }
    if (gflags[SOLD_SHIELD])
    {
        UI_add_answer("Shield of Valor");
    }
    
    UI_add_answer("Nothing more");
    

    converse
    {
    if (response == "Flux Capacitor")
    {
        say("@It is said that the Flux Capacitor is an ancient object that even predates the ancient Ophidian empire.@");
		say("@Its purpose is unknown but it is rumoured that the great MageLord Akakothen once possessed it.@");
        UI_remove_answer("Flux Capacitor");
    }
    else if (response == "Earrings")
    {
        say("@The Serpent Earrings are a wonderful pair of earrings that is said to be used by the great heirophant to open the wall of lights. What those two things are, noone knows.@");
        UI_remove_answer("Earrings");
    }
    else if (response == "Drum")
    {
        say("@The drum is a goblin artifact which was recovered during a raid. It is said that its drumsticks are made out of human bone.@");
        UI_remove_answer("Drum");
    }
    else if (response == "Brush")
    {
        say("@The brush is a goblin artifact which is said to be made out of human bone. It is rather creepy if I may say so!@");
        UI_remove_answer("Brush");
    }
    else if (response == "Goblet")
    {
        say("@The goblet never runs out of liquid and is everlasting. It is said to have been retreived from the fiery depths of a mystical place known only as 'The Furnace'.@");
        UI_remove_answer("Goblet");
    }
    else if (response == "Gem")
    {
        say("@Not much is known about the glowing gem. It seems to bear mystical text written in a mix of letters and numbers, possibly an offspring of our own native tongue.@");
		say("@Some even refer to it as the fiery gem for the redish glow which it enabates.@");
        UI_remove_answer("Gem");
    }
    else if (response == "Nothing more")
    {
        say("@Alright then... but I will also tell you a secret about a new exhibit that will be here soon.@");
        say("@I should not be telling this to you since it has not yet been announced, but there is a new ancient document which has been discovered and is currently being looked into in the castle.@");
        say("@The document is said to be an ancient Ophidian manuscript detailing the mystical artifacts of their empire. But I should speak no more of this.@");

        UI_clear_answers();
        UI_pop_answers();
        break;
    }
    else if (response == "Molten cloak")
    {
        say("@The Molten Cloak was given by King Tranix of the demons back in ancient times when man first entered the demon realm. It hath passed from many hands since that time and it now rests in the Brentonia Museum for all to see.@");
        UI_remove_answer("Molten cloak");
    }
    else if (response == "Shield of Valor")
    {
        say("@The Shield of Valor is a mighty shield, known as the strongest shield in all of the land. It is able to withstand blows greater than that even of a magical shield.@");
		say("@It has been passed from skilled and noble warriors through the ages, until recently when it was acquired by the museum.@");
        UI_remove_answer("Shield of Valor");
    }
	else if (response == "Helm")
	{
		say("@The helm is a great artifact which grants vision to anyone who wears it. The magic which grants this ability is unknown despite years of study onf the helm.@");
		say("@It was originally found during a dig by the great archeologist Jones who graciously donated it to the museum.@");
		UI_remove_answer("Helm");
	}
    }
    
}


void Alayna object#(0x4db) ()
	{

var scroll = UI_count_objects(PARTY, GOOD_SCROLL, 82, ANY);
 
var bark = "A pleasure to see you";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Look at this artifact");
			else if (n == 2)
				UI_item_say(item, "These objects are very old");
			}
		}

if (event == DOUBLECLICK)
{

script AVATAR
{
    actor frame STAND;
    say bark_intro;
    wait 10;
}
    script item
    {
        wait 5;
        say bark;
        wait 8;
        call Alayna, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
		say("@I knew that you could not stay away from the exhibits.@");
		UI_remove_answer("Name");
		if (scroll >0)
		{
			UI_add_answer("Scroll");
		}

	}
else
	{

		say("@Welcome to Brentonia. You made a wise choice to visit the museum.@");
		UI_set_item_flag(item, MET, true);
	}



// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Do return sometime.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Tis always a pleasure to see a new face. I am Alayna.@");
            UI_remove_answer("Name");
			if (scroll >0)
			{
				UI_add_answer("Scroll");
			}
        }
        else if (response == "Job")
        {
            say("@I am curator of the museum here in Brentonia.@");
            UI_remove_answer("Job");
            UI_add_answer("Brentonia");
            UI_add_answer("Museum");
        }
        else if (response == "Brentonia")
        {
            say("@It is a very well run and clean city. It was founded many years ago and has prospered ever since.@");
            UI_remove_answer("Brentonia");
        }
        else if (response == "Museum")
        {
            say("@It is the personal collection of ancient artifacts and other trinkets of our ruler. He has allowed them to all be seen so that everyone may admire them, rich or poor.@");
			say("@One artifact, the helm, does not belong to our ruler however. The helm has graciously been donated to the museum by the archeologist Jones.@");
            say("@The museum also has tasting tables so that one may taste the different wines and beers from throughout the land.@");
            UI_remove_answer("Museum");
            UI_add_answer("Artifacts");
			add("Jones");
        }
        else if (response == "Artifacts")
        {
            say("@Of what artifact would you like to know about?");
            Artifacts();
            UI_remove_answer("Artifacts");
        }
		else if (response == "Jones")
		{
			say("@Jones is a well known archeologist who focuses on the Ophidian ruins. As far as I know he is currently excavating a site by the lake next to the Noxious Swamp.@");
			UI_remove_answer("Jones");
		}
        else if (response == "Scroll")
        {
            say("@I cannot believe you have a letter from my husband. I thought him to be dead for some time. I have cursed his name so much since he disappeared...@");
			say("Alayna looks away. @I am shamed at the scorn which I have directed at him. He was only doing his obligation, his duty. Regardless of my own failings I thank you for bringing this note.@");
            say("@Please, take 50 gold coins for all the trouble that you have gone through to bring this to me. It is not much but it is all I can spare. I hope you do not take offense to such a small reward.@");
            AlaynaReward();
            UI_remove_party_items(1, GOOD_SCROLL, 82, ANY);
            UI_remove_answer("Scroll");
        }
        

		}}
	UI_remove_npc_face(item);
	}

