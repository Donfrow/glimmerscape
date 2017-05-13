// Cotton Cove Garth

void GarthSign()
{
    UI_push_answers();
    UI_add_answer("They are taxed without representation");
    UI_add_answer("It's a swell thing to do");
    UI_add_answer("I will kill you if you do not");
    UI_add_answer("Be nice!");
    converse
    {
        if (response == "They are taxed without representation")
        {
            say("@I was under the impression they were taxed so that they could rely on our assistance incase of a goblin attack or some such occurrence.@");
            say("@I did not realize the town was using their taxes for our own needs. Of course I will sign!@");
            gflags[GARTH_YES] = true;
            karma = karma + 15;
            proposalsigs = proposalsigs + 1;
            HaveEnoughSigs();
			KarmaGoodSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "It's a swell thing to do")
        {
            say("@That is all well and good, but I do not think we should have to deal with more ruckus because it's simply a swell thing to do. I am sorry but I will not sign until you can give me a good reason to.@");
            UI_remove_answer("It's a swell thing to do");
        }
        else if (response == "I will kill you if you do not")
        {
            say("@Intimidation is the new tactics I see. I will not give into such bullying. I will not sign. Ever.@");
            say("@By the way... if you plan to use intimidation I suggest that in the future you hire a thug who can actually intimidate someone...@");
            gflags[GARTH_NO] = true;
            karma = karma - 15;
			KarmaBadSprites();
            badproposalsigs = badproposalsigs -1;
            HaveEnoughSigs();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Be nice!")
        {
            say("@I am sure it would be a nice thing to do, but I am unsure as to why I should do the right thing. I will not sign until I get a better reason to do so.@");
            UI_remove_answer("Be nice!");
        }
    }
}



void Garth object#(0x431) ()
	{

var grape_count = UI_count_objects(PARTY, 377, ANY, 19);
var grape_pay = grape_count*3;
var carrot_count = UI_count_objects(PARTY, 377, ANY, 18);
var carrot_pay = carrot_count*4;
	
var bark = "How may I help you?";
var bark_intro = "Hail,";
	
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
				UI_item_say(item, "It is not the best growing season");
			else if (n == 2)
				UI_item_say(item, "The grapes look delicious");
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
        call Garth, TALK;
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



if (grape_count > 0)
{
    UI_add_answer("Give grapes");
}
if (carrot_count > 0)
{
    UI_add_answer("Give carrots");
}

if (gflags[CHIMNEY_CLEANED])
{
    UI_add_answer("Chimney cleaned");
}
if (gflags[TALKED_TO_COLUMNA])
{
    UI_add_answer("Dewbert is not your son");
}

if (UI_get_item_flag(item, MET)) 
	{
		say("@I am glad to see you hast recovered well.@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
	}
else
	{

	say("@Ah it is the sailor who was brought to Catherine. It is good to see you up and about.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

        SignProposal(); // Sign the proposal


		converse
		{

	if (response == "Bye")
			{
			say("@May good fortune bless you.@");			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Garth, and please, do not confuse me with my brother Gerth.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I grow various fruits and vegetables and sell them. If you would like to buy some or do some menial labour simply ask.@");
			UI_remove_answer("Job");
			UI_add_answer("Buy");
			UI_add_answer("Menial labour");
			}		
		else if (response == "Buy")
            {
                if (UI_get_schedule_type(item) == TEND_SHOP)
                {
                say("@And what would you like to purchase?@");
                var applecost = 5;
                var bananacost = 5;
                var carrotcost = 7;
                var grapecost = 7;
                var pumpkincost = 10;
                var onioncost = 3;
                BuyVeggies(applecost, bananacost, carrotcost, grapecost, pumpkincost, onioncost);
                //BuyVeggies(var applecost = 5, var bananacost = 5, var carrotcost = 7, var grapecost = 7, var pumpkincost = 10, var onioncost = 2);
                }
                else
                {
                    say("@I am sorry but I am currently not open.@");
                }

            }
        else if (response == "Menial labour")
        {
            say("@If you desire some coin you can pick some of my fruits and vegetables for me. I will pay you 3 gold per bundles of grapes and 4 gold per bundle of carrots.@");
            say("@I could also use my chimney sweeped out. I have been meaning to do it but I have been unable to do so. I will pay you 30 gold for it.@");
            UI_remove_answer("Menial labour");
        }
        else if (response == "Give grapes")
        {
            say("@Thank you for helping gather my grapes. I see that you have brought me ", grape_count, " grapes. Here is ", grape_pay, " gold coins.@");
            UI_remove_party_items(grape_count, 377, ANY, 19);
            UI_add_party_items(grape_pay, SHAPE_GOLD, ANY, ANY);
            UI_remove_answer("Give grapes");
        }
        else if (response == "Give carrots")
        {
            say("@Thank you for helping gather my carrots. I see that you have brought me ", carrot_count, " bundles of carrots. Here is ", carrot_pay, " gold coins.@");
			UI_remove_party_items(carrot_count, 377, ANY, 18);
			UI_add_party_items(carrot_pay, SHAPE_GOLD, ANY, ANY);
			UI_remove_answer("Give carrots");
        }
        else if (response == "Chimney cleaned")
        {
            say("@Thank you for cleaning the chimney. It is good that it is finally done. Here is your payment.@");
            UI_add_party_items(30, SHAPE_GOLD, ANY, ANY);
            gflags[CHIMNEY_CLEANED] = false;
			UI_remove_answer("Chimney cleaned");
        }
        else if (response == "Dewbert is not your son")
        {
            if (gflags[TALKED_TO_GARTH])
            {
            say("@I am sad to hear you say that. I have had my suspicians that he was not my son but I did not want to deal with the reality of the situation.@");
            say("@You must have a keen intellect to have learned of this. I thank you for making me face the truth.@");
            }
            else
            {
            say("@I am sad to hear you say that. I have had my suspicians that he was not my son but I did not want to deal with the reality of the situation.@");
            say("@I thank you for making me face the truth.@");
            gflags[TALKED_TO_GARTH] = true;
            UI_set_npc_prop(AVATAR, INTELLIGENCE, 2); // increases your int by 2 for doing this quest
            karma = karma + 150;
			KarmaGoodSprites();
            }
            UI_remove_answer("Dewbert is not your son");
            
        }
        else if (response == "Sign proposal")
        {
            if(gflags[GARTH_YES])
            {
                say("@You have already gotten my signature.@");
            }
            else if (gflags[GARTH_NO])
            {
                say("@Do not continue to pester me about this. You have already lost my vote on the subject.@");
            }
            else
            {
            say("@Why should I sign this proposal?@");
            GarthSign();
            }
            UI_remove_answer("Sign proposal");
        }
		
		}
	UI_remove_npc_face(item);
}	
	}

