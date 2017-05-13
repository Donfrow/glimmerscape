/*

Good quality scrolls

*/

void GoodScrolls shape#(797) ()
{

var quality = get_item_quality();

book_mode();

	if (quality == 50)
/*

Scroll in invisible chest to confirm Camille is a bandit

*/
		{
		say("Geth, I have learned the following information since my last report:");
		say("");
		say("Brunt seem to be suffering from some sort of dementia due to the elixer he takes.");
		say("");
		say("To combat this Bedic the castle healer provides Brunt with a potion to calm his madness. Perhaps I can switch what he receives.");
		say("");
		say("Celena is working more hours by the iron gates. She is an easy target and will be easily slayed if she gets in the way.");
		say("");
		say("Lord Dew seems to be taking a shine to me. Perhaps I can convince him to have Brunt take a break due to his madness.");
		say("");
		say("I shall update you as soon as possible on any new developments.");
		say("");
		say("Camille");
		}
	else if (quality == 51)
		{
		say("From the Desk of Gelvin");
		say("");
		say("");
		say("The Plains Bandits have arrived. They demand I supply them with food lest the murder my wife and I.");
		say("");
		say("I will not give into such thuggery. I will fight them if they dare try and hurt the apple of my eye. Bring it on I say, foul beasts, you are worse than goblins!");
		gflags[GELVIN] = true;
		}
	else if (quality == 52)
		{
		say("Stay here and ensure that the animals stay put. I am going to investigate the inn to the South with several of your underlings to see if it will be an easy target.");
		say("");
		say("Gruff");
		}
	else if (quality == 53)
		{
		say(".. . . .. ..");
		}
	else if (quality == 54)
		{
		say("TEST");
		}
	else if (quality == 55)
		{
		say("The Boars Rest");
		say("");
		say("");
		say("I believe that we should approach Dewtopia and request to join the empire. The lands are getting much more dangerous than I would like.");
		say("");
		say("I will have a letter drawn up requesting to join. The taxes that we shalt have to pay shall be far worth it for the extra guards which we will receive.");
		}
	else if (quality == 56)
		{
		say("For your incompetence you and your two companions art to be stationed at the Southern Mountains of Dewtopia until I see fit to allow you to sail again.");
		say("");
		say("");
		say("- Captain");
		}
	else if (quality == 57)
		{
		say("OFFICIAL NAUTICAL GUILD MEMBERSHIP");
		say("");
		say("");
		say("Nautical Guild member JONON of DEWTOPIA officially sanctions the holder of this scroll as a JUNIOR MEMBER of the Nautical Guild.");
		say("");
		say("As a Junior Member of the Nautical Guild it is your duty to uphold the code of the Nautical Guild. This code can be found at the Nautical Guild headquarters located at 1600 Pennsylvania Avenue, Wash Island.");
		say("");
		say("");
		say("OFFICAL SEAL OF THE NAUTICAL GUILD ENSURES THIS DOCUMENTS AUTHENTICITY");
		say("");
		say(" ___________");
		say(" \\_________//");
		say(" ~~~~~~~~~~");

		}

	else if (quality == 58)
		{
		say("Our insider hath confirmed the escape took place. Jesse and Bains should arrive in due time.");
		say("");
		say("Our ships will remain anchored off shore for the time being. I hath put Pippens and Swabbie on goblin watch.");
		say("");
		say("");
		say("Jesse and Bains still hath not arrived. I am weary about staying here much longer for goblin activity hath been increasing as of late.");
		}
	else if (quality == 59) // Scroll found on the Provider
		
		{
		say("Loading COMMAND.COM");
		say("");
		say("CYBERDYNE SYSTEMS");
		say("SERIES 800 MODEL 101");
		say("VERSION 2.4");
		say("LOG GENERATED");
		say("");
		say("USERNAME DYSON");
		say("VAR RESET_AFTER_BREAKOUT = UI_REVERT_SCHEDULE");
		say("VAR BREAKOUT = UI_SET_SCHEDULETYPE(PRISONBOT, 0, SLEEP)");
		say("VAR BREAKOUT_TIME = 1200HRS");
		say("CALL BREAKOUT");
		say("");
		say("DAMAGE INFLICTED TO CPU");
		say("");
		say("GOTO:RESET_AFTER_BREAKOUT");
		say("RESET_AFTER_BREAKOUT IS NOT DEFINED");
		say("VERIFY DISABLE");
		say("DEL SCHEDULE");
		say("");
		say("UNABLE TO CALL CORE FUNCTIONS");
		say("");
		say("PROVIDE.COM LOADED");
		gflags[READ_LOG] = true;
		}

	else if (quality == 60) // Scroll about the mining company leaving (found in desk at the fishing village)
		{
		say("Glenthur,");
		say("");
		say("I must inform you that the Solusek Mining Company is ceasing its operations in DeathScorn Mountains.");
		say("");
		say("I am afraid that certain actions I may have to take will be in direct violation of company orders. You have provided valuable resources and I hope that your village continues to prosper. ");
		say("");
		say("I shall try to keep in touch.");
		say("");
		say("");
		say("Flanwald");
		}

	else if (quality == 61) // Scroll in the old broken building of the mining company 
		{
		say("To:");
		say("Foreman Flanwald of DeathScorn Mountains");
		say("");
		say("From:");
		say("Solusek Mining Company Head Office");
		say("");
		say("");
		say("We have read your reports and come to the decision to abandon the operation. The losses of the fighters hath become to great since the breach you reported.");
		say("");
		say("You art to salavage any of the remaining equipment but until that is done keep the miners working. After the equipment is safe you can order the full evacuation of the miners. Upon completion you can return to the head office for reassignment.");
		say("");
		say("Gabbie Mardoddle");
		}
	
	else if (quality == 62) // Scroll inside the old mountains of freedom starting point
		{
		say("Supervisor Report");
		say("");
		say("The mining is coming along nicely. The new shifts seem to be working better than thought. We are making far more progress than those deeper in.");
		say("");
		say("Note to self - Keep an eye on Grondak. He may be stealing from the store rooms.");
		}

	else if (quality == 63)
		{
		say("To:");
		say("Solusek Mining Company");
		say("");
		say("From:");
		say("Foreman Flanwald, DeathScorn Mountains");
		say("");
		say("I write this deep within the mountain, near the breach point. The majority of the fighters hath left the mountain leaving the miners are unprotected.");
		say("I cannot in good conscience wait until all the equipment is removed before ordering a full evacuation if the situation worsens.");
		say("");
		say("The front lines are breaching. I am ordering the evacuation. To hell with orders.");
		say("");
		say("Flanwald");
		}

	else if (quality == 64)
		{
		say("Gabbie,");
		say("");
		say("I beseech you, let me out of here! The orbs presence is beggining to effect me and not just the chamber itself. I do not know how much longer I can survive down here.");
		say("");
		say("Djarn");
		}

	else if (quality == 65)
		{
		say("To: Gabbie Mardoddle");
		say("");
		say("From: Northern Expeditionary Recovery Party");
		say("");
		say("Ms. Mardoddle, it is my duty to report that the current situtation is grim. The iceflows have become increasingly rapid and we have yet to make contact with the intial expeditionary party.");
		say("");
		say("We have discovered the camp of the cyclops and it appears the first party did mange to acquire the orb. It is my belief, given the current weather, that that intial party may have become trapped in the ice after acquring the orb.");
		say("");
		say("We will continue to search the iceflows for any sign of the original party.");
		say("");
		say("Captain Lucid");
		}
	else if (quality == 66)
		{
		say("Captain Bignubble, please pay this fellow the bounty which we have placed on Flanwalds head.");
		say("");
		say("Gabbie");
		}
	else if (quality == 67)
		{
		say("Deed to Vessel: Siren's Lure");
		say("");
		say("Shipwright: Elren of Kintore");
		say("");
		say("This deed declares that the holder is the owner of the vessel @Siren's Lure@ and has all the rights and responsibilities it bears, therein.");
		}
	else if (quality == 68)
		{
		say("From the Desk of Gabbie Mardoddle, Solusek Mining Company");
		}
	else if (quality == 69)
		{
		say("From the Desk of Gabbie Mardoddle, Solusek Mining Company");
		say("");
		say("To: Artemis Batbane");
		say("");
		say("Artemis, I urgently require your assistance at one of the digs. Please follow the bearer of this letter to the operation right away.");
		say("");
		say("Gabbie Mardoddle");
		say("");
		say("OFFICIAL SEAL OF THE SOLUSEK MINING COMPANY");
		}
    else if (quality == 70)
    {
        say("OPERATING CODE");
        say("UNIT T-850");
        say("");
        say("INPUT INTO UNIT");
    }
    else if (quality == 71)
    {
        say("Ensure that the sailors are not expecting it. I will send enough men to overpower the docks so that their fleet is crippled. After that it should be a matter of fighting on land and we can rid the world of the Nautical Guild.");
        say("");
        say("As well, do ensure that Deadeye does not live much longer. He is too troublesome and I am afraid a sly character could get the information out of him.");
        say("");
        say("LeChuck");
        gflags[BAD_MAYOR] = true;
    }
    else if (quality == 72)
    {
        say("I will have it arranged. I will place the kegs in the proper spot so that a direct hit will inflict severe damage. After this the guild will be unable to put up much of a fight.");
        say("");
        say("I ask of you to rid this cursed island of the vermin known as the ratmen after you have finished off with the guild. It would be most appreciated.");
        say("");
        say("Parrik");
        gflags[BAD_MAYOR] = true;
    }
    else if (quality == 73)
    {
        say("Constructing the Orb of Infinity");
        say("");
        say("The Orb of Souls, Persuasion, Transfiguration, Chaos and Focus must be placed in a box shape with one of the orbs within the centre.");
        say("");
        say("The flux capacitor is then used upon the Orb of Focus to allow for a channeling of energy.");
        say("");
        say("The Hammer of Divinity is then used to crack the Orb of Focus during the incantation.");
        say("");
        say("If all goes well the five minor orbs should lose their power and the Orb of Infinity should be created in the centre.");
    }
    else if (quality == 74)
    {
        
        gflags[CONSTRUCT_ORB1] = true;
        say("CONSTRUCT_ORB1 gflag is now set to true");
        gflags[FIND_ORB_SACRIFICE] = true;
        say("FIND_ORB_SACRIFICE now set to true");
        //UI_move_object(192, [2349, 1423, 0]);
        gflags[RESTORED_SOUL_ORB] = true;
        say("RESTORED SOUL ORB NOW TRUE");
        gflags[GO_TO_PAST] = true;
        say("GO TO PAST NOW TRUE");
        //gflags[IN_PAST] = true;
        say("IN PAST IS NOW TRUE");
        gflags[FREE_SIRENUM] = true;
        say("FREE SIRENUM NOW TRUE");
        
        say("Setting flags to false");
        gflags[TOBAN_FAIL_1] = false;
        gflags[TOBAN_DRANK_WINE] = false;
        gflags[SIRENUM_FREE] = false;
        
        gflags[ANGRY_TRESSA] = true;
        gflags[HYDRA_HYSTERIA] = true;
        gflags[TRANSPORT_PRISONER] = true;
        gflags[KNIGHT] = true;
        
        gflags[FINAL_ORB_CONSTRUCTION] = true;
		gflags[HENSALL_FREED] = true;
        gflags[BURY_HANNAH] = true;
		gflags[PLAY_FOR_WENDILL] = true;
		gflags[LUTE_LEVEL_5] = true;
		
		//gflags[IN_GOOD_TEST] = true;
		gflags[SPOKE_WITH_DONAL_1] = true;
		gflags[LEFT_KARMA_TEST] = true;
		//gflags[ENTER_GOOD_MIRROR] = true;
		
		gflags[CURED_PAINED_UNICORN] = true;
		gflags[RESCUED_TRAPPED_MAN] = true;
		gflags[HELPED_MAN_IN_DESTROYED_HOUSE] = true;
		
		gflags[ZAO_PAN_FINAL_TEST_CONT] = true;

    }
    else if (quality == 75)
    {
        say("Last Will and Testament of Tinak.");
        say("");
        say("I, Tinak, being but a humble villager do not much to pass onto my son Turak save for the ancient family heirloom.");
        say("");
        say("I leave the Ring of Ssra, which has come through our bloodline for many generations.");
        say("");
        say("Turak, do not believe this ring is but a mere trinket for it is not. This ring shall grant you increased magical power when reciting incantations provided you activate it with the secret incantation.");
		say("");
		say("I shall ensure that you are told this before my passing for I do not feel comfortable writing it down.");
		say("");
		say("I trust you will find this most useful in the field of study which you have chosen.");
        say("");
        say("You have made your father proud.");
    }
    else if (quality == 76)
    {
        gflags[DEBRIS_FELL] = false;
    }
    else if (quality == 77)
    {
        say("Lord Dew, my liege, my lover");
        say("");
        say("I think that I will require slightly more coin to continue raising our little bastard of a son in secret. I hath managed to fool Garth into thinking it is his but a stranger nearly caught me in a slip up.");
        say("");
        say("I hate living in this rancid little town and raising him without the aid of your servants. If you do not want the world to know about your illegitimate son I suggest that you increase the gold you art paying me.");
        say("");
        say("I expect this increase to be effective right.");
        say("");
        say("Columna");
        gflags[READ_DEWBERT_SCROLL] = true;
    }
    else if (quality == 78)
    {
        say("Let Them Join The City!");
        say("");
        say("The signatories below declare that they wish to use their citizenship status to allow the outer village to officially join Cotton Cove:");
        say("");
        if (gflags[GARTH_YES])
        {
            say("Garth of Cotton Cove");
            say("");
        }
        if (gflags[GERTH_YES])
        {
            say("Gerth of Cotton Cove");
            say("");
        }
        if (gflags[COLUMNA_YES])
        {
            say("Columna of Cotton Cove");
            say("");
        }
        if (gflags[OLON_YES])
        {
            say("Olon of Cotton Cove");
            say("");
        }
        if (gflags[CATHERINE_YES])
        {
            say("Catherine of Cotton Cove");
            say("");
        }
        if (gflags[ZULITH_YES])
        {
            say("Zulith of Cotton Cove");
            say("");
        }
        if (gflags[BRAWL_YES])
        {
            say("Brawl of Cotton Cove");
        }
    }
    else if (quality == 79)
    {
        say("SETTING FLAG 0-2000 TO FALSE");
        var n = 0;
        while (n < 2000)
        {
            gflags[n] = false;
            n = n+1;
        }
        gflags[PROPOSAL_PASSED] = false;
		proposalsigs = 0;
		beggar_pouch = 0;
    }
    else if (quality == 80)
    {
        say("Resolution to Increase the Size of Cotton Cove");
        say("");
        say("I, mayor Flogbotsworth of Cotton Cove, do pass a mayorly decree that the village located outside of Cotton Cove shall hereby be incorporated into the town.");
        say("");
        say("This resolution is effective immediately.");
        say("");
        say("Mayor Flogbotsworth");
    }
    else if (quality == 81)
    {
        say("The passage between the towers is not holding up against the tides well. It is slowly filling with water and I fear in time it will be rendered unsafe for travel.");
        say("");
        say("I suggest a better approach would be to construct a bridge between the towers so the tavern passage can be retired.");
        say("");
        say("In the mean time we may have to use the front entrance to the crypts to transport the bodies.");
    }
    else if (quality == 82)
    {
        say("Dearest Alayna");
        say("");
        say("I cannot tell you how sorry I am for leaving you to work on the outpost. I was going to use the extra gold I would earn to buy you a wonderful necklace from Krayg, but now I am fated to never see you again.");
        say("");
        say("If you are reading this my dearest it means I am not longer of this world.");
        say("");
        say("Please do not take the anger that I deserve out on the bearer of this note. The bearer knows kindness in their heart for taking the time out to delivery it to you and does not deserve your anger which is meant for me.");
        say("");
        say("Forgive me, my love.");
        say("");
        say("Jonua");
    }
    else if (quality == 83)
    {
        say("Oh woe is me why do I continue to live on? Oh woe is me.");
        say("");
        say("I continue this suffering, oh wow is me. Such a terrible world. Why oh world has this happened to me.");
        say("");
        say("Oh where are those whom I love? Oh to the world beyond they wander, leaving me an eternity of torment.");
        say("");
        say("I care not for guests. An adventurer came to me and sought to know about the Orb of Souls. Help him I will not, let him suffer as I have!");
        say("");
        say("The adventurer continues to pester me, I would ignore the fool but it seems that this person has somehow aquired the Orb of Souls. Should I aid him? I know not...");
        say("");
        say("I will help the fool restore the Orb, but I shall not tell him of the temple in the mountains by Akakothen's castle. The fool shall wander aimlessly in search of knowledge to reconstruct the Orb of Infinity.");
		say("");
		say("Though, is the temple in the mountains even still around, is it still untocuehd? It has been so long since I have ventured there. I must be cautious however, a frozen woman, an ice witch, has taken up residence east of the temple. I do hope she has not entered the temple. There is so much to do and plan, but I have eternity...");
        say("");
        say("Perhaps, perhaps I have made my decision too quickly. Perhaps the adventurer could use the Orb on my dear wife for me... oh how I am torn. What should I do?");
		gflags[MORGHRIM_SCROLL_READ] = true;
    }
    else if (quality == 84)
    {
        say("The Orb seems to possess the power to create gold, yet it is very unstable once created. Before it can continue the result must be stable, lest the whole process is useless.");
    }
    else if (quality == 85)
    {
        say("It seems that the by combining the focusing orb along with the orb which seems to generate chaos nearly bends time itself. Perhaps if this can be harnessed then I could prevent the unrest before it begins...");
    }
    else if (quality == 86)
    {
        say("Morghrim appears to be unwilling to give his soul for the research. Alas, I require a willing soul which I can trust for this. I must change his mind lest my research be foiled. Perhaps if he were to think his wife in danger...");
    }
    else if (quality == 87)
    {
        say("Jacob,");
        say("");
        say("We have grown in numbers far faster than I anticipated. I believe we can take the MageLord out at this time, however I fear we will still suffer heavy losses due to those still loyal to the fool.");
        say("");
        say("As you are still close to the MageLord perhaps you could persuade him to give himself up. I doubt his arrogance will allow for it but if we are to strike soon I still fear we will have heavy losses. I hope you can convince him but I do not expect it.");
        say("");
        say("Conrad");
    }
    else if (quality == 88)
    {
        say("Erinon, I hope this letter finds you before the MageLord sends you off on a suicide mission.");
        say("");
        say("I know not how well our attempts to overthrow the despot are currently going but I know that we are currently a worry to him. I constantly hear him muttering about the unrest. If only he would let go of his pride and ask forgiveness from his subjects. Surely we would forgive him if he felt remorse for his deeds.");
        say("");
        say("Regardless, from what I have seen I suspect that he is clueing in to your unrest. I have overheard him talking about sending you on a mission from which you will not return. I do not know what the mission is but I suspect it will be clear once he tells you.");
		say("");
		say("It is my suggestion that, should this letter reach you in time, you accept the mission and simply ignore the orders and set up in the underground. He will surely suspect you are dead and you will then be able to fully dedicate yourself to the cause. Good luck.");
        say("");
        say("Long live the underground!");
        
    }
    else if (quality == 89)
    {
        say("It appears that the energy modules for the mechanical men cannot focus the maximum charge.");
        say("");
        say("Nugrin has supplied me with a unique ore which is able to focus the power from the energy unit into a fine beam. I believe this substance will allow the correct wavelength to be absorbed by the energy matrix. The only problem I can see with this is the current design will not be able to accomodate the new material and have to be scrapped.");
    }
    else if (quality == 90)
    {
        say("Tralunka Dookendadee Moogadeemoosh");
    }
    else if (quality == 91)
    {
		var name = UI_get_npc_name(AVATAR);
        say("Greetings ", name);
        say("");
        say("I foresaw that you would be seeking aid in your journey. Within this chest you will find an artifact known as a blinker.");
        say("");
        say("This artifact shall help you in your quest.");
        say("");
        say("Esmerelda");
    }
    else if (quality == 92)
    {
        say("My dearest Sarah");
        say("");
        say("Every breath you take");
        say("Every move you make");
        say("Every bond you break");
        say("Every step you take");
        say("I'll be watching you");
        say("");
        say("Every single day");
        say("Every word you say");
        say("Every game you play");
        say("Every night you stay");
        say("I'll be watching you");
        say("");
        say("Oh, cant you see");
        say("You belong to me");
        say("How my poor heart aches");
        say("With every step you take");
        say("");
        say("Every breath you take");
        say("Every move you make");
        say("Every bond you break");
        say("Every step you take");
        say("I'll be watching you");
        say("");
        say("Since you've gone I been lost without a trace");
        say("I dream at night I can only see your face");
        say("I look around but its you I cant replace");
        say("I feel so cold and I long for your embrace");
        say("I keep crying baby, baby, please...");
        say("");
        say("Oh, can't you see");
        say("You belong to me");
        say("How my poor heart aches");
        say("With every breath you take");
        say("");
        say("Every move you make");
        say("Every vow you break");
        say("Every smile you fake");
        say("Every claim you stake");
        say("I'll be watching you");
        say("");
        say("Every move you make");
        say("Every step you take");
        say("I'll be watching you");
        say("");
        say("I'll be watching you");
        say("I'll be watching you");
        say("I'll be watching you");
        say("I'll be watching you...");
        say("");
        say("Lord Dew");
    }
    else if (quality == 93)
    {
        say("Here lies Donal Ultor, Vicar of light");
        say("");
        say("Blessed be those who walk the path of light");
    }
    else if (quality == 94) // Dewtopia Prisoner transport scroll
    {
		say("Office of the Dewtopian Guard");
		say("");
		say("The bearer of this note shall not be impeded on a diplomatic mission of deliverence of one (1) prisoner to the jail in Brentonia.");
		say("");
		say("Should anyone impede this traveller they will be in direct violation of treaty number 32513 between the kingdom of Dewtopia and Brentonia and will be subject to penalty.");
    }
    else if (quality == 99)
    {
		say("Morghrim,");
		say("");
		say("I trust you to hold this and keep an eye on it while I conduct my studies. If there is any change to the way the orb reacts you must tell me immediately.");
    }
	else if (quality == 95)
	{
		say("Theodora,");
		say("");
		say("I beg of you to stop the constant unprotected relations with the trappers and visitors of the town. While it is a simple cure for those infected I have made it quite clear that it will be with you for life.");
		say("");
		say("During the off season those you infect are not a burden but during the busy season it can become quite the distraction while having to deal with far more serious issues.");
		say("");
		say("While it is not my place to tell you to change your lifestyle, at least inform your partners of the potential for infection.");
		say("");
		say("James");
	}
	else if (quality == 96)
	{
		say("To whomever may read this,");
		say("");
		say("I am Duncan, trapper of the Frigid Plains, and this is the compendium of my last days in this world for I have found myself trapped in this forsaken hole, slowy freezing and starving to death.");
		say("");
		say("How did my last days end up as such? It is quite pathetic really. I discovered some stairs in amongst the frozen trees which lead into an underground cavern. Foolishly I decided to investigate it alone. Little did I know the stairs would collapse, trapping me.");
		say("");
		say("For some time I tried to crawl back up, but it cannot be done. I have yelled endlessly for help, but my yells go unheard. I have tried to open the steel door to no avail, the door is frozen shut. If I could melt the ice perhaps I would stand a chance, but I do not. I have no choice but to accept that my death shall come slowly and painfully as I starve and freeze, trapped in an icy cavern.");
		say("");
		say("");
		say("I hope that you, my dear reader, have a way out lest you end up with the same fate as I.");
		say("");
		say("Duncan");
	}
	else if (quality == 97)
	{
		say("Are you ready to meet your destiny?");
	}
	else if (quality == 98)
	{
		say("@Reseting all gflags below 1200@");
		var x = 2;
		while (x < 1200)
		{
			gflags[x] = false;
			x = x + 1;
		}
	}

	else if (quality == 100)
	{
		say("PLAN 4B8271 - GUARD TOWER");
		say("");
		say("Purpose and scope:");
		say("");
		say("Create nearby guard tower to defend inn known as The Boar's Rest in case of attack");
		say("");
		say("Number of labourers involved in construction: 3");
		say("");
		say("NOTES:");
		say("");
		say("Expected to be completed by mid-summer should supplies arrive on time");
	}
	else if (quality == 101)
	{
		say("Here lies the remains of the crew of the Galent.");
		say("");
		say("Proud members of the Nautical Guild the crew of the Galent gave their lives while doing what they loved.");
	}
	else if (quality == 102)
	{
		say("Slightly to the south of the old dock there is a large bush by the mountains. Behind this bush you will find a hidden entrance into the caves. It is in here where I found the deposit of bloodmoss.");
		say("");
		say("Floyden");
	}
	else if (quality == 102)
	{
		say("Tasty, ever so tasty.");
	}
	else if (quality == 103)
	{
		say("Basement castle set");
		gflags[BASEMENT_OF_CASTLE] = true;
	}
	else if (quality == 104)
	{
		say("Darnella's Salvage and Baked Goods");
		say("");
		say("This document indicates that the holder releases Darnella's Salvage and Baked Goods of all liability in the event of injury or death as a result of a salvage dive.");
		say("");
		say("Furthermore, should the issuee bring action against the issuer in relation to injury sustained during salvage the issuee shall pay the issuer 5000 gold coins.");
	}
	else if (quality == 105)
	{
		say("To: Captain Vannel, Nautical Guild");
		say("");
		say("RE: The Whipplestick");
		say("");
		say("Vannel, it is with regret to inform you that the Nautical Guild supply ship 'The Whipplestick' was involved in a pirate ambush off the shores of Dewtopia.");
		say("");
		say("Guybrush Threepwood of the Dewtopian Light Station reports the ship encountered pirate activity at aproximately 91 South 102 East. Guybrush indicates the ship was sunk as opposed to taken captive by the pirates.");
		say("");
		say("On a personal note, I offer my deepest sympathies to you as I know your son was first mate aboard the vessel. I hope you are able to take solice in the fact that he perished at sea rather than taken captive by pirates.");
		say("");
		say("Your friend,");
		say("");
		say("1st lieutenant Donrak");
		gflags[LEARN_OF_SUNK_SHIP] = true;
		// ACTUAL POSSITION IS 82 S 112 E
	}
	else if (quality == 106)
	{
		say("Clenus,");
		say("");
		say("I regret to inform you that I was unable to convince Lord Dew to part with his healers in order to visit you on the island. I begged him but I was unable to change his mind.");
		say("");
		say("However after describing Patrick's symptoms to the healers I have been told that the child should be locked up right away as he may suffer the same afflication that infected your uncle Grus.");
		say("");
		say("I know that Tricia will be against this course of action but until something further can be done it is in the best interest of all those involved that the child be prevented from causing any harm.");
		say("");
		say("I will see what I can do about sending one of Brentonia's healers but until you hear back from me be careful around the child.");
		say("");
		say("Stay safe,");
		say("Ensilo");
	}
	else if (quality == 107)
	{
		say("Note to self: Dig up more corpses");
	}
	else if (quality == 108)
	{
		var name = UI_get_npc_name(AVATAR);
		say(name, ", as I fear I may have gone too quickly here is what we need to perform out task:");
		say("");
		say("At the altar north of the old Archibald mansion here on the island, bring with you 5 minor orbs and the 3 artifacts.");
		say("");
		say("From there, place the orbs on the pillars in a box shape, with one in the center. The order in which they are placed should not matter. From here use the flux capacitor on the Orb of Focus. Once this is done, take the Hammer of Divinity and crack the Orb of Focus. As for the ring, hopefully the mere presence of it is all we need.");
		say("");
		say("After this is completed the words of power shall be spoken and with any luck we will have the Orb of Infinity.");
		say("");
		say("- Zorphos");
	}
	else if (quality == 109)
	{
		say("OFFICIAL DECREE OF BRENTONIA");
		say("");
		say("This note, bearing the signature of Tonidra of the Inner Circle of Brentonia, is an official decree declaring that project 1337 to be paid in full by the Brentonian Mint.");
		say("");
		say("Upon receiving this note, the official caretaker of the Brentonian mint shall take steps to relinquish funds for this project. The bearer of this note shall not receive the funds directly. These funds shall be distributed through official channels. This note is to be used as an official declartion to begin this distribution.");
		say("");
		say("Tonidra of Brentonia");
	}
	else if (quality == 110)
	{
		say("Notice of Ownership of Skimmer 135A");
		say("Owner: Toban");
		say("");
		say("This scroll indicates ownership of the skimmer 135A, in charge of Toab of Deathsquall. The bearer of this note has permissions and privileges for using skimmer 135A.");
	}
	else if (quality == 254)
	{
		say("FLAG SETTING SCROLL");
		//gflags[GOOD_TRANSPORT_RELEASE] = true;
		gflags[BAD_TRANSPORT_RELEASE] = true;
	}
	// SCRIPT TO QUALITY 100 FROM HERE
	else
		{
		say("Generic Unused Scroll");
		}


}







