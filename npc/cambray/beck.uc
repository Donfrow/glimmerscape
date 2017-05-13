//Beck the pub owner in Cambray

void Beck_People()
{
    UI_push_answers();
    UI_add_answer("Nothing");
    UI_add_answer("Morrison");
    UI_add_answer("Olivia");
    UI_add_answer("Tressa");
    UI_add_answer("Venessa");
    UI_add_answer("Tobale");
    UI_add_answer("Jasper");
    UI_add_answer("Loretta");
    UI_add_answer("Marpen");
    UI_add_answer("Melose");
    UI_add_answer("Old Man Mardin");


    converse
    {
        if(response == "Nothing")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Morrison")
        {
            say("@Morrison is the mayor of Cambray and husband to Olivia. He is a stern man and I would not have voted for him, but he runs the city well enough.@");
            UI_remove_answer("Morrison");
        }
        else if (response == "Olivia")
        {
            say("@Olivia is the wife of the mayor and is the guide to the monument of Lady Elena. She knows most of the history revolving around Arthis and Elena, and although she has no official title she is essentially the towns historian.@");
            UI_remove_answer("Olivia");
        }
        else if (response == "Tressa")
        {
            say("@Tressa is a member of the Milton family who have run the docks in Cambray for many generations. She is a nice woman but rather jumpidy at times for reasons I cannot explain.@");
            UI_remove_answer("Tressa");
        }
        else if (response == "Venessa")
        {
            say("@Venessa is one of the guards, along with her husband Xander, here in Cambray. She is not the most pleasent woman if you ask me.@");
            UI_remove_answer("Venessa");
        }
        else if (response == "Tobale")
        {
            say("@Tobale is the local apothocary here in Camray. He is a bit of a shyster in my opinion. I suspect most people would not bother with him if not for the fact that he is the only supplier.@");
            UI_remove_answer("Tobale");
        }
        else if (response == "Jasper")
        {
            say("@There is not much to say about Jasper. He tends to what little farmland the island holds and comes in here each night for a quick dinner. He is also married to a woman named Loretta.@");
            say("Beck leans in to you. @If you ask me, that man desperately needs a vacation.@");
            UI_remove_answer("Jasper");
        }
        else if (response == "Loretta")
        {
            say("@Loretta is the island seamstress and is married to Jasper. She is a fine woman but I do not understand what she sees in Jasper. Apparantly there is something that catches her fancy though.@");
            UI_remove_answer("Loretta");
        }
		else if (response == "Marpen")
		{
			say("@Marpen is the proprieter of the Lady Elena Gift Shop. He took a vacation shortly before the sailing ban came into effect and has not been seen since.@");
			if(gflags[LECHUCK_DEAD])
			{
				say("@Despite the sailing ban being officially over I suspect he is having some trouble finding a ship back. My guess is all the ships are quite overbooked.@");
			}
			else
			{
				say("@He was expected to return some time ago but I suspect he has not had much luck finding a ship back since the sailing ban came into effect.@");
			}
			UI_remove_answer("Marpen");
		}
        else if (response == "Melose")
        {
            if(gflags[SIRENUM_FREE])
            {
                say("@Melose is somewhat of a mercenary and is not actually a citizen of the town of Cambray, despite that he lives on the island.@");
                say("@He occasionally comes in here but lately his heart took him to other places. In fact, I have heard that the woman he longed for now lives with him.@");
            }
            else
            {
                say("Beck sighs. @Melose is somewhat of a mercenary and not actually a citizen of Cambray. He used to frequent my establishment but lately he has worn his heart of his sleeve and been in a depression.@");
                say("@I do not know who he longes for or what she does, but it has made him quite the unhappy fellow.@");
            }
            UI_remove_answer("Melose");
        }
        else if (response == "Old Man Mardin")
        {
            say("A hearty laugh escapes his mouth. @Old Man Mardin, now there is a sod. He is the oldest one alive on this island and knows the history that Olivia chooses to ignore.@");
            say("@If you have any questions about this place that do not pertain to Lady Elena, he would be the man to ask.@");
            UI_remove_answer("Old Man Mardin");
        }
        

    }
}

void Beck_Places()
{
    UI_push_answers();
    UI_add_answer("Nothing");
    UI_add_answer("Monument");
    UI_add_answer("Elena's Tomb");
    UI_add_answer("Arthis's Tomb");
    UI_add_answer("Abandoned house");
    UI_add_answer("Spectral tower");

    converse
    {
        if(response == "Nothing")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Monument")
        {
            say("@The monument of Lady Elena signifies how she managed to defeat the Death Knight Arthis on this very island many generations ago.@");
            say("@It is one of most fantastic sites to see on this island as it is rigorously maintained to honour the sacrifice she made for all of Desporia.@");
			say("@There is also a gift shop just north of the monument where you can pick up wonderful souveniers to remind you of your trip to Cambray.@");
            UI_remove_answer("Monument");
			UI_add_answer("Gift shop");
        }
		else if (response == "Gift shop")
		{
			say("@The Lady Elena Gift Shop sells many fine goods and trinkets to remind you of your trip to Lady Elene'as monument. Items range from Lady Elena figurines to Lady Elena pitchers.@");
			say("@Unfortunately, if you wish to purchase a souvenier you are unable to. Marpen, the proprietor, went on a trip to the mainland shortly before the sailing ban came into effect.@");
			if(gflags[LECHUCK_DEAD])
			{
				say("@Despite the ban being officially over I suspect he is having some trouble finding a ship back. My guess is all the ships are quite overbooked.@");
			}
			else
			{
				say("@As he had not yet returned I suspect he has not had much luck finding a ship back since the ban came into effect.@");
			}
		}
        else if (response == "Elena's Tomb")
        {
            say("@In order to honour Lady Elena's sacrifice to rid the world of Arthis her tomb where she was laid to rest many generations ago is open to the public and well maintained.@");
            say("@As Lady Elena was a humble woman it is not extravagant but it is still a surreal place to visit.@");
            UI_remove_answer("Elena's Tomb");
        }
        else if (response == "Arthis's Tomb")
        {
            say("Beck glares. @This tomb is locked and only those on official business may enter. Recently there was a resolution to open the tomb to all but it failed to pass.@");
            say("@It is a shame noone may enter as it would bring more business to the island. Sadly most of the residents here think only those wishing to follow in Arthis's steps would wish to view it.@");
            say("Beck sighs. @They do not seem to realize that one can simply be curious.@");
            UI_remove_answer("Arthis's Tomb");
        }
        else if (response == "Abandoned house")
        {
            say("@That house used to belong to Zarkane the Mage before he was put on trial and executed by the townsfolk generations ago.@");
            say("@The documents of that event have long since been 'lost' but I'm sure if you ask Old Man Mardin he will know more about the specifics.@");
            gflags[MARDIN_TALK] = true;
            UI_remove_answer("Abandoned house");
        }
        else if (response == "Spectral tower")
        {
            say("@While the spectral tower is not actually on the island of Cambray it is just off the north-west shore. It is said to have once belonged to Zarkane the Mage before his execution.@");
            say("Beck pauses. @I suspect Old Man Mardin could tell you more about it.@");
            gflags[MARDIN_TALK] = true;
            UI_remove_answer("Spectral tower");
        }
    }
}


void Beck_Information()
{
    UI_push_answers();
    UI_add_answer("Nothing");
    UI_add_answer("People");
    UI_add_answer("Places");
    
    converse
    {
        if(response == "Nothing")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "People")
        {
            say("@Whom would you like to know about?@");
            Beck_People();
            UI_remove_answer("People");
        }
        else if (response == "Places")
        {
            say("@What locations would you like to know about?@");
            Beck_Places();
            UI_remove_answer("Places");
        }
    }
    
}




void Beck object#(0x56c) ()
	{
	
var bark = "Hello";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if(gflags[HYDRA_HYSTERIA])
		{
		}
		else
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
				UI_item_say(item, "Best ale in town");
			else if (n == 2)
				UI_item_say(item, "Visit the sites");
			}
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
        call Beck, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");

UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("Beck grins. @They always come back for my fine food and drinks.@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
	}
else
	{
	say("@Welcome to the Camray Pub.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("@Do visit the sites while you are here.@");			
			break;
			}
		else if (response == "Name")
			{
			say("@I would be Beck.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I run the pub here in Cambray.@");
            UI_remove_answer("Job");
            UI_add_answer("Cambray");
            UI_add_answer("Pub");
        }
        else if (response == "Cambray")
        {
            say("@It is a nice town with several tourist attractions. I am glad they are here as it is good for business.@");
            UI_remove_answer("Cambray");
            UI_add_answer("Tourist attractions");
        }
        else if (response == "Tourist attractions")
        {
            say("@The shrine to Lady Elena and her tomb attract a fair number of visitors. Olivia can tell you more about the history behind these.@");
            UI_remove_answer("Tourist attractions");
        }
        else if (response == "Pub")
        {
            say("Beck motions around. @This fine establishment is run by me. It is a tough job but I make a decent profit and also pick up lots of information.@");
            UI_remove_answer("Pub");
            UI_add_answer("Buy");
            UI_add_answer("Information");
        }
        else if (response == "Information")
        {
            say("@As I serve the visitors and townsfolk I tend to learn about the happenings and tales of the area. What would you like to know about?@");
            Beck_Information();
            UI_remove_answer("Information");
        }
        else if (response == "Buy")
        {
            var muttoncost = 20;
            var beefcost = 15;
            var fowlcost = 15;
            var hamcost = 20;
            //say("@I charge ", muttoncost, " gold per mutton, ", beefcost, "gold per beef, ", fowlcost, " gold per fowl and ", hamcost, " gold per ham.@");
            BuyMeat(muttoncost, beefcost, fowlcost, hamcost);
            UI_remove_answer("Buy");
        }

        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

