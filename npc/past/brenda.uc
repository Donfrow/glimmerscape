// Brenda in the past

void Past_Objects()
{
    UI_push_answers();
    UI_add_answer("Wisdom's Eye");
    UI_add_answer("Vortex Cube");
    UI_add_answer("Nevermind");
    
    converse
    {
        if (response == "Wisdom's Eye")
        {
            say("@As I have mentioned Wisdom's Eye is a large lense. It supposedly focuses the energies which one places into it. This focus would allow for great artifacts to be made...@");
			say("@But I also believe we can use parts of it to make an artifact as well.@");
            say("@If you decide to aid me you can retrieve it from infront of the castle. It has a barrier to protect it however, so you will need to dispell the barrier before you can take it.@");
            say("@I will also admit that I am unsure if it can actually be moved. If you are unable to move it perhaps you should try to chisel several pieces off the eye itself.@");
            UI_remove_answer("Wisdom's Eye");
            UI_add_answer("Make an artifact");
        }
        else if (response == "Vortex Cube")
        {
            say("@The Vortex Cube is one of the objects of power that the @guidance@ of the eye put an end too.@");
            say("@The object itself is actually a small cube which releases magical energy into the space around it.@");
			say("@If the eye had not put an end to the research into the cube I believe that one could use it to tear open this plane of existence and have instant travel between two points, like a portal.@");
            say("@If you decide to aid me you can retrieve it in the castle.@");
            UI_remove_answer("Vortex Cube");
        }
        else if (response == "Make an artifact")
        {
            say("@One of the notes I recovered belonged to Mircle, a great mage. He had the idea that they could use a piece of Wisdom's Eye to create a smaller version of it.@");
			say("@Sadly, this was deemed unwise and he never had the chance to test his theory.@");
            say("@I believe we could continue his work if you retrieve Wisdom's Eye, or at least some pieces of the Eye.@");
			say("@If you cannot retrieve the eye itself perhaps though could remove several shards from it. I lack the precision tools needed do to this however.@");
            say("@Just think... if you can retrieve the Eye or several shards of it we could continue Mircle's work!");
            UI_remove_answer("Make an artifact");
        }
        else if (response == "Nevermind")
        {
            say("@If that is what you wish. Also, we will need some sort of material capable of binding the artifacts. If you come across anything, bring it to me as well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Brenda object#(0x50c) ()
{

var metal = UI_count_objects(PARTY, ODD_METAL, ANY, ANY);
var vortex_cube = UI_count_objects(PARTY, VORTEX_CUBE, ANY, ANY);
var lense_piece = UI_count_objects(PARTY, LENSE_PIECE, ANY, ANY);
// var eye = UI_count_objects(PARTY, WISDOM_EYE, ANY, 1); - Removed as you cannot move the eye

var bark = "What?";
var bark_intro = "Hail";

if (gflags[KILL_BRENDA_TRAVLEN_TALK])
{
}
else
{	
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
				UI_item_say(item, "What was that?");
			else if (n == 2)
				UI_item_say(item, "They are jealous");
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
        call Brenda, TALK;
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

if(UI_is_dead(-228)) // After the orbs are created
{

if (UI_get_item_flag(item, MET))
	{
		say("@You try my patience Avatar.@");
		UI_remove_answer("Name");
		UI_add_answer("Orbs");
	}
else
	{
    	say("@You shouldn't be seeing this text");
        UI_set_item_flag(item, MET, true);
	}
	
	converse
	{
	   if(response == "Name")
        {
            say("@Why is this showing?@");
            UI_remove_answer("Name");
        }
        else if (response == "Bye")
        {
            say("@Be on thy way before I decide I should strike you down.@");
            break;
        }
        else if (response == "Job")
        {
            say("@My job now is of no concern to you. Be on thy way or I shall strike you down where you stand.@");
            UI_remove_answer("Job");
        }
        else if (response == "Orbs")
        {
            say("@Yes, I did take the orbs. They would not even exist if not for me telling you what to do... and I do believe I thanked you already by sparing your life.@");
            UI_remove_answer("Orbs");
            UI_add_answer("Why keep them");
        }
        else if (response == "Why keep them")
        {
            say("@Few see Glenlorn's prophecies for more than mad ramblings, but if they are true the orbs shall bring great destruction. If that is to pass, what better person to possess them than I?");
            say("@In fact, I must be dead before I shall give them up.@");
            UI_remove_answer("Why keep them");
        }
    }

}
else  // Before the orbs are created
{

if (metal >= 2 && vortex_cube >= 1 && lense_piece >= 2)
{
    UI_add_answer("I have the objects");
}

if (UI_get_item_flag(item, MET))
	{
		say("@Why is it you have the urge to continue to bother me?");
		UI_remove_answer("Name");
	}
else
	{
    	say("@You are not an Ophidian...@");
        UI_set_item_flag(item, MET, true);
	}

    converse
    {

        if (response == "Bye")
        {
            say("@Leave me like everything else have.@");			
            break;
        }
		else if (response == "Name")
        {
			say("@Why do you want to know my name? But no matter. The Seer has said someone would seek me who was not of Ophidian blood and I should be kind. I am Brenda.@");
			UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I possess no job. The blasted Ophidians have cast me out. They claim I dare to practice in magics that that blasted eye says should not be practiced.@");
            UI_remove_answer("Job");
            UI_add_answer("Ophidians");
            UI_add_answer("Magic");
            UI_add_answer("Eye");
        }
        else if (response == "Ophidians")
        {
            say("@A blasted smug people they are. I came from far away to learn with the supposed great Ophidian mages. Little did I know they dared not practice magic that one would find useful or interesting.@");
            UI_remove_answer("Ophidians");
        }
        else if (response == "Magic")
        {
            say("@Such a shame. They could become so much better than what they are if they would just ignore that blasted eye.@");
            UI_remove_answer("Magic");
        }
        else if (response == "Eye")
        {
            say("@You are truely not an Ophidian if you do not know of Wisdom's Eye. In fact I would wager you are not from anywhere near here if you have not heard of the eye. But I shall indulge you.@");
            say("@Wisdom's Eye is the great artifact of the Ophidian Empire. It is said it was passed down to the Ophidians from the great Nameless entity.@");
            say("@It is not actually an eye, more like a large lense that one can look into for guidance. Yet since the Ophidians got the eye they wilt do nothing unless the eye shows them it is acceptable to do.@");
			say("@A pox on that I say.@");
            UI_remove_answer("Eye");
            UI_add_answer("Acceptable");
            UI_add_answer("Nameless");
        }
        else if (response == "Acceptable")
        {
            say("@If one looks into the eye it said to show great wisdom. Now the Ophidians look into the eye to see if it is wise for them to embrace their ideas.@");
            say("@Of course, if the eye shows it as unwise they will quickly give up on their research. How is it possible to learn great magics and create great artifacts if one will not even experiment?@");
			say("@Let me tell you this. I have wonderful ideas for objects of great power, yet I cannot do it thanks to them banishing me for daring to speak out against that blasted eye.@");
            UI_remove_answer("Acceptable");
            UI_add_answer("Objects of Power");
        }
        else if (response == "Nameless")
        {
            say("@It is said to have been an entity of great power and force. I believe it is a bunch of tall tales myself.@");
            UI_remove_answer("Nameless");
        }
        else if (response =="Objects of Power")
        {
            say("@Before the days of the eye the great mages of the Ophidian Empire would create powerful objects.@");
			say("@However when the eye came these artifacts were left incomplete and their research destroyed.@");
            say("@I have managed to obtain several of the research notes that escaped the destruction, however the objects themselves were placed within the city on display.@");
			say("@Seeing as how I am exiled I cannot even get into the city to retrieve them... but I bet you could...@");
            UI_remove_answer("Objects of Power");
            UI_add_answer("Retrieve them");
        }
        else if (response == "Retrieve them")
        {
            say("@With the notes I possess and you not being removed from the city on sight, you could retrieve them and we could finish what was began so long ago!@");
			say("@In fact, now would be a good time to retrieve them as most of the city is on the annual pilgrimage.@");
            UI_remove_answer("Retrieve them");
            UI_add_answer("Objects");
            UI_add_answer("Pilgrimage");
        }
        else if (response == "Pilgrimage")
        {
            say("@The Ophidians have an annual festival where they go to the mainland to seek out wisdom from the Nameless entity. It is quite insane if you ask me.@");
            UI_remove_answer("Pilgrimage");
        }
        else if (response == "Objects")
        {
            say("@If you were to bring me Wisdom's Eye and the Vortex Cube we could finish what the great mages began!@");
            Past_Objects();
            UI_remove_answer("Objects");
        }
        else if (response == "I have the objects")
        {
            say("@I am almost sad to learn that you managed to destroy Wisdom's Eye. No matter, the artifacts shall be greater than that trinket ever was.@");
			say("@Now you must go to the site where Wisdom's Eye was bestowed upon the Ophidians. The foolish nobles have locked it however, so you will need get the key before you can enter.@");
			say("@As well, you will have to figure out how to bind the objects together yourself as I have been unable to find information regarding this.@");
            UI_remove_answer("I have the objects");
            UI_add_answer("Enter");
            UI_add_answer("Key");
            UI_add_answer("Bind");
        }
        else if (response == "Enter")
        {
            say("@You will have to search out a stairway in the forest which leads into the caverns. It have become overgrown and rotting since it was forbidden to enter so it may be difficult to spot.@");
			say("@If you travel to the west you should encounter a large rock. The stairway can be found nearby that.@");
            say("@Beware however as the caverns used to be a place of study and experimentation of the Ophidian mages.@");
			say("@In fact one mage refused to give up his experiments and inhabits the cavern as a twisted and souless abomination. If you come across him, I beg you to slay him.@");
            UI_remove_answer("Enter");
        }
        else if (response == "Key")
        {
            say("@No doubt it is kept in the castle someplace. I do not suspect it will be well hidden as most Ophidians would dare not go against the word of Wisdom's Eye.@");
            UI_remove_answer("Key");
        }
        else if (response == "Bind")
        {
            say("@What I have learned is the magical pillers there act as a conduit for the magical energies all around us.@");
			say("@They always have an affect on objects within the area however certain magical words can increase their power.@");
            say("@I have come up with an incantation to do this. Speak the incantation once you sense the binding has begun.@");
            UI_remove_answer("Bind");
            UI_add_answer("Incantation");
            UI_add_answer("Then what?");
        }
        else if (response == "Incantation")
        {
            say("@The incantation is 'Tralunka Dookendadee Moogadeemoosh'.@");
            UI_remove_answer("Incantation");
        }
        else if (response == "Then what?")
        {
            say("@I cannot be certain what will happen once the incantation is spoken but I believe the magical energy which is trapped within the objects will be unleashed and amplified.@");
			say("@It is this you must capture within the material you find.@");
            UI_remove_answer("Then what?");
        }
    }

    }	
	UI_remove_npc_face(item);
}
}
