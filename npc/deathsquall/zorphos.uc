/*
Zorphos inside the mountain house of DeathScorn island
*/

void ZorphosBlinkerConvo()
{
UI_push_answers();
converse(["Blinker"])
{
	case "Blinker" (remove):
	say("@A blinker is a rather common artifact but it is quite useful. It allows one to travel from one place to another once they have visited it.@");
	say("@Although it only has the ability to store one location of your choosing the real magic is its ability to bind itself to various locations which will be important in your travels.@");
	UI_add_party_items(1, BLINKER, ANY, ANY);
	add(["Store location", "Bind", "Nevermind"]);

	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Store location" (remove):
	say("@A blinker has somewhat of a 'magical memory' if you will. This memory allows you to bind one location which you can teleport yourself to when desired.@");
	say("@Although it only stores one location you can change this as many times as you desire.@");
	
	case "Bind" (remove):
	say("@By binding I essentially mean that a blinker saves a location's coordinates. You can then use the blinker to open a doorway to these coordinates as desired.@");
	say("@When using the blinker at a location you wish for it to 'remember' simply use it and bind yourself to the area. This area will remain the same until you replace it with new location.@");
	
}
}

void ZorphosScrollConvo()
{
UI_push_answers();
converse(["Shatter", "Channel", "Wear", "Incantation", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Shatter" (remove):
	if(gflags[HAS_ARTIFACTS])
	{
		say("@The Hammer of Divinity makes perfect sense now. It seems that when the Orb of Focus is filled to the brim with energy it takes a sudden release to fuse the orbs together.@");
		say("@Apparantly, through all of Akakothen's research, he learned that the Hammer of Divinity was the only object capable of doing such a thing.@");
	}
	else
	{
		say("@It would seem that the Orb of Focus needs to be shattered when it is full of energy. This sudden release has enough strength to fuse the orbs together.@");
		say("@Yet, it does not actually describe what it is he used to shatter the Orb of Focus. It is obviously needs to be a unique artifact but there is not much lead on what that object is.@");
	}	

	case "Channel" (remove):
	if(gflags[HAS_ARTIFACTS])
	{
		say("@The use of the Flux Capacitor makes quite a bit of sense now. It seems that even though the Orb of Focus is able to centralize energy, to fill it to the brim requires additional methods.@");
		say("@It seems the channeling properties of the Flux Capacitor fill this missing piece, allowing for an extremely large portion of energy to be stored in the Orb of Focus.@");
	}
	else
	{
		say("@The scroll makes mention of channeling energy into the Orb of Focus. It seems that even though the Orb of Focus is able to centralize energy, to fill it to the brim requires additional methods.@");
		say("@Quite a few portions of the scroll mention the use of an object to channel energy into the orb yet there is no clear description of what Akakothen used to do so.@");
	}
	
	case "Wear" (remove):
	if(gflags[HAS_ARTIFACTS])
	{
		say("@The ring is a perculiar object. The scroll mentions several times how this artifact must be worn to unleash inner strength. It seems the ring is a conduit of sorts for ones magical energies.@");
		say("@Apparantly, without the ring, even Akakothen was not skilled enough to use his magic to bind the orbs together.@");
	}
	else
	{
		say("@This is quite an interesting portion of the scroll. It mentions several times how Akakothen must be certain to wear his article of amplification.@");
		say("He thinks deeply. @It is odd he never mentions what this 'article of amplification' is but it is quite clear that it allows ones magical ability to be stronger than usual.@");
	}
	
	case "Incantation" (remove):
	say("@I will not pretend to know how he came up with it or what exactly it does but it seems quite important in the creation process.@");
	say("@From what the scroll indicates without the use incantation the process is either extremely unstable or does not even work.@");
	say("Zorphos laughs. @I guess it goes to show the magical genius that Akakothen was.@");
}
}

void ZorphosArtifactConvo()
{
UI_push_answers();

converse(["Flux capacitor", "Hammer of Divinity", "Ring", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Flux capacitor" (remove):
	if(gflags[DECIPHERED_SCROLL])
	{
		say("@Now that I have an artifact to go with what the scroll describes it makes perfect sense. It would seem the flux capacitor acts like a lightening rod of sorts.@");
		say("@It seems to allow a user to attract magical energy and 'charge' it within it for a short period of time and release it into another magical object.@");
		say("@Not only that, but it seems to be able to channel energy more efficiently into the Orb of Focus, allowing for the charge needed to bind the orbs together.@");
	}
	else
	{
		say("@It is quite a strange object. It almost seems like it is able to channel energy into something.@");
		say("He scratches his chin. @It is quite odd. I am not sure why something like this would be needed when the Orb of Focus already does the same thing.@");
	}
	
	case "Hammer of Divinity" (remove):
	if(gflags[DECIPHERED_SCROLL])
	{
		say("@Now that I have an artifact to go with what the scroll describes it makes perfect sense. It would seem the Hammer of Divinity is the only thing capable of damaging the minor orbs.@");
		say("@From what the scroll indicates it appears that the Orb of Focus needs to be cracked, unleashing the catalyst of energy needed to bind the orbs together.@");
	}
	else
	{
		say("@The Hammer of Divinity is quite odd to me. I see nothing particularly special about it but there must be some reason Akakothen deemed it so important.@");
	}
	
	case "Ring" (remove):
	if(gflags[DECIPHERED_SCROLL])
	{
		say("@With the ring the context of the scroll makes quite a bit of sense. You see the scroll described an object to unleash inner strength.@");
		say("@It would seem this ring is actually a conduit that amplifies a magic users ability. Without the ring it appears even Akakothen magic was not strong enough to bind the orbs together.@");
	}
	else
	{
		say("@It would seem that the ring was quite important to Akakothen, though I see nothing instrinsicly special about it. I am quite unsure of what to make of it.@");
	}
	
}

}

void ZorphosMinorOrbConvo()
{
UI_push_answers();

var soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var focus_orb = UI_count_objects(PARTY, ORB_OF_FOCUS, ANY, ANY);
var persuasion_orb = UI_count_objects(PARTY, ORB_OF_PERSUASION, ANY, ANY);
var transfiguration_orb = UI_count_objects(PARTY, ORB_OF_TRANSFIGURATION, ANY, ANY); 
var chaos_orb = UI_count_objects(PARTY, ORB_OF_CHAOS, ANY, ANY);

converse(["Orb of Souls", "Orb of Focus", "Orb of Persuasion", "Orb of Chaos", "Orb of Transfiguration", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Orb of Souls" (remove):
	if(soul_orb > 0)
	{
		say("@It is excellent that you have managed to aquire this orb. We are one step closer to creating the Orb of Infinity.@");
	}
	else
	{
		say("@The Orb of Souls is an orb which effects every living being in terms of the afterlife.@");
		say("@It is said that if it were in the hands of a capable magic user they would be able to slay any foe in the blink of an eye, and torment them for eternity.@");
	}
	
	case "Orb of Focus" (remove):
	if(focus_orb > 0)
	{
		say("@It is excellent that you have managed to aquire this orb. We are one step closer to recreating the Orb of Infinity.@");
	}
	else
	{
		say("@It is my belief that the Orb of Focus acts somewhat like a conduit, channeling energy from the different planes of existence into a focus-able force usable for strong magic.@");
		say("@I used to think it quite laughable that such an item could exist but as I furthered my research I eventually learned how foolish I was to think such a thing.@");
	}

	case "Orb of Persuasion" (remove):
	if(persuasion_orb > 0)
	{
		say("@It is excellent that you have managed to aquire this orb. We are one step closer to recreating the Orb of Infinity.@");
	}
	else
	{
		say("@The Orb of Persuasion is like a charming individual only one hundred times stronger. The use of this orb completely negates the will of the person it is used on.@");
		say("@A strong mage would be able to use this orb to force his or her will onto others with mere suggestion. Imagine, causing kingdoms to go to war for no reason other than a suggestion.@");
		say("@Luckily there are few mages of such skill level to successfully use the orb. If an unskilled mage were to try it they would probably only get funny looks.@");
	}
	
	case "Orb of Chaos" (remove):
	if(chaos_orb > 0)
	{
		say("@It is excellent that you have managed to aquire this orb. We are one step closer to recreating the Orb of Infinity.@");
	}
	else
	{
		say("@The Orb of Chaos is such an unstable orb that is actually warps the very land it resides in. The mere presence of the orb is enough to completely change a landscape.@");
		say("@Luckily for Desporia it would seem that as long as the orb is on the move it has little effect.@");
	}

	case "Orb of Transfiguration" (remove):
	if(transfiguration_orb > 0)
	{
		say("@It is excellent that you have managed to aquire this orb. No doubt it would be extremely dangerous in the hands of the goblins.@");
		say("@Not only have you helped save the lands from those brutes but we are one step closer to recreating the Orb of Infinity.@");
	}
	else
	{
		say("@The Orb of Transfiguration allows a skilled wielder to join any objects together. This could be solid matter or living beings alike.@");
		say("@It is imperative that we get such a powerful artifact out of the hands of the goblins or else they could become unstoppable.@");
	}
	
}

}

void ZorphoseFirstSteps()
{
UI_push_answers();



converse(["Minor orbs", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Minor orbs" (remove):
	say("He stares you at for a moment. @It was my understanding that you have read my book on the subject. But I suppose I shall indulge you.@");
	say("@The Orb of Infinity is comprised of five minor orbs, each with their own unique power.@");
	say("@These orbs are known as the Orb of Souls, the Orb of Focus, the Orb of Persuasion, the Orb of Chaos and the Orb of Transfiguration.@");
	if(gflags[TALK_TO_CYCLOPS])
	{
		say("@As I mentioned previously, the cyclops Polyphemus on the island of Kintore is quite knowledgable in regards to the orbs.@");
	}
	else
	{
		say("@While I cannot offer much insight as to where they are I can give you a lead. I helped a cyclops by the name of Polyphemus on the island of Kintore.@");
		say("@He seems to be quite knowledgable in regards to the orbs. I would have gotten the information from him myself but I had more pressing matters to attend to at the time.@");
		say("@Regardless, let him know that you are a friend of mine and I am certain he will aid you.@");
		gflags[TALK_TO_CYCLOPS] = true;
	}
	ZorphosMinorOrbConvo();
	add(["Cyclops"]);
	
	case "Cyclops" (remove):
	say("@The cyclops are an ancient race dating back to the time of the Ophidians. Polyphemus indicated that his kind protected the orbs after the downfall of Akakothen.@");
	say("@I have no reason to doubt him as he was quite knowledgable on the subject and he would have no reason to lie to me.@");
}

}

void ZorphosSecondSteps()
{
UI_push_answers();

var soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var persuasion_orb = UI_count_objects(PARTY, ORB_OF_PERSUASION, ANY, ANY);

if(gflags[HAS_ARTIFACTS])
{
}
else
{
	add(["Artifacts"]);
}
if(gflags[DECIPHERED_SCROLL])
{
}
else
{
	add(["Scroll"]);
}
converse(["Nevermind"])
{

	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Artifacts" (remove):
	if(gflags[ARTIFACT_LOCS])
	{
		say("As you relate how Akakothen described the objects Zorphos scratches his chin. @This flux capacitor sounds like an object I have seen in the Brentonian museum.@");
		say("@In regards to the hammer I seem to recall Lord Dew in Dewtopia having a collection with some sort of ancient hammer. This may be what we seek.@");
		say("@As to the ring... this I am uncertain. This could be anywhere. What he describes does somewhat sound like a Kissme however.@");
		add(["Kissme"]);
		// Since you have spoken to Akakothen, there is no need to ask Zorphos about where he is.
		gflags[KILL_BASEMENT_OF_CASTLE_CONVO] = true;
	}
	else
	{
		say("@I know that certain artifacts were used, but I do not know how many of them or how they were used. We need to somehow find out what they were and how they were used.@");
		say("@Unfortunately for us I have no leads in regards to this. It may be possible that this knowledge is lost to the ages.@");
		add(["Lost"]);
	}
	
	case "Kissme" (remove):
	say("@Kissme's are creatures that are said to 'sparkle and glitter'. They supposedly live in mountain ranges. Perhaps you should read about them.@");
	
	case "Lost" (remove):
	if(gflags[DECIPHERED_SCROLL])
	{
		say("@The scroll which you aquired from Brentonia does in fact make mention of the artifacts. Sadly it is quite degraded and its information limited.@");
		say("@It does however outline what parts two of the artifacts play in the construction of the orb. Unforetunately the references to the artifacts themselves are so vague they could be anything.@");
	}
	else
	{
		say("@There are so many references to important items in Ophidian history that I have no way to ascertain which artifacts are needed for our goal.@");
	}
	say("@I fear Akakothen himself may be the only lead we have in ascertaining what the artifacts are.@");
	add(["Akakothen"]);
	
	case "Akakothen" (remove):
	say("@Lore has it that Akakothen is doomed to walk the place where he finally fell. Yet, this could only be stories meant to scare children as he was not a loved ruler.@");
	if(gflags[BASEMENT_OF_CASTLE])
	{
		say("@Luckily you were able to speak with his long dead servant. It is now my belief that he fell in his very castle, the ruins which lie to in the frozen northlands. I believe what remains of them is on the eastern half of that frozen wasteland.@");
		say("@If I recall it is around 42 north, 70 east.@");
	}
	else
	{

		say("He sighs. @And even if that is true history never actually recorded where Akakothen eventually met his demise and anyone who would know is long since dust.@");
		say("@The only possible way I can think of to find this out would be to awaken an Ophidian high priest.@");
	}
	add(["High priest"]);

	case "High priest" (remove):
	say("@The high priests of the Ophidian empire were the spiritual leaders of their people and as such were important figures when a leader passed on.@");
	say("@When a high priest passed on they were laid to rest in the Ophidian crypts, which is now only accessable through the Noxious Swamp.@");
	say("@Due to the danger of the swamps few attempt to venture there.@");
	if(gflags[BASEMENT_OF_CASTLE])
	{
		say("@It is a good thing you made it back and were able to convince the undead in that place to help you. It is a true testament to the power of the orbs.@");
		if(gflags[AQUIRED_LENS])
		{
		
		}
		else
		{
			say("@Although we know his resting place I am not certain his ghost will be willing to help us anyway. We will need a way to convince him.@");
			add(["Convince"]);
		}
	}
	else
	{
		say("@If you were able to make your way through the swamp and awaken a high priest it is possible that you may be able to find the resting place of Akakothen.@");
		if(soul_orb > 0)
		{
			say("@Fortunately you have already aquired the Orb of Souls as I am fairly certain this is the only thing capable of awakening one who died so long ago.@");
		}
		else
		{
			say("He narrows his eyes. @I suspect you will need to find the Orb of Souls in order to even awaken a high priest as it is most likely the only thing capable of performing such a feat.@");
		}
		if(gflags[AQUIRED_LENS])
		{
			say("@Luckily, you have already constructed a focusing lens. So that, with the use of the Orb of Persuasion, should convince Akakothen to aid us.@");
		}
		else
		{
			say("@Though if you do manage to find Akakothen I am not certain his ghost will be willing to help us anyway. We will need a way to convince him.@");
			add(["Convince"]);
		}
	}
	
	case "Convince" (remove):
	say("@My guess is the only way we would be able to convince him to part with some of his knowledge would be to use the Orb of Persuasion on him.@");
	if(persuasion_orb >0)
	{
		say("Zorphos grins widely. @Luckily, you have already aquired this orb.@");
		say("@However, and do not take this personally, I doubt you are skilled enough to focus the orb successfully on him.@");
	}
	else
	{
		say("He chuckles. @Of course we need to find the orb first.@");
		say("@Though, even when we do find the orb, and do not take this personally, I doubt you are skilled enough to focus the orb successfully on him.@");
	}
	say("@But fear not, I have a contact who may be able to help us get around this issue.@");
	add(["Contact"]);
	
	case "Contact" (remove):
	if(gflags[TALK_TO_AVRET])
	{
		say("@As I mentioned previously I have an old aquaintance by the name of Avret who lives on an island south of Brentonia.@");
		say("@If there is anyone who would be able to find a way to help focus the Orb of Persuasion it would be him.@");
	}
	else
	{
		say("@A have an old acquaintance by the name of Avret who lives on an island south of Brentonia. He has quite the ability to solve conundrums such as this.@");
		say("@I have no doubt that he would be able to come up with a solution to our predicament. Seek him out and ask for his assistance in regards to this issue.@");
		gflags[TALK_TO_AVRET] = true;
	}
	say("@Once you have discovered a solution to this problem you must use the orb on Akakothen. Hopefully this will give you an idea of where to begin searching for these artifacts.@");

	
	case "Scroll" (remove):
	say("@My sources tell me that a scroll was recently unearthed pertaining to the Orb of Infinity and brought for examination in Brentonia, eventually meant for display in its museum.@");
	say("@Unfortunately for us it takes some time before ancient documents are actually put on display in the museum so until then we would have no access to it.@");
	say("@It may be possible to barter one item for another as the museum prides itself on its wide variety of historical artifacts but I do not know what would be needed to trade for it.@");
	gflags[AQUIRE_ALAGNAR_SCROLL] = true;
		

}
}

void OrbQuestSteps()
{
UI_push_answers();
converse(["First steps", "Second steps","Nevermind"])
{

	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "First steps" (remove):
	say("@The first steps is quite simple, at least in terms of what is required.@");
	say("A snort-like sound eminates from Zorphos. @We need to gather up all of the minor orbs.@");
	ZorphoseFirstSteps();
	
	case "Second steps" (remove):
	if(gflags[AQUIRED_ALAGNAR_SCROLL] && gflags[AQUIRED_ARTIFACTS])
	{
		say("@We have already completed the second steps. We now possess the artifacts used in the orbs creation and the process in which it was done.@");
	}
	else
	{
		say("@The second steps are a bit more abstract. My research has revealed that there were certain artifacts that were used in the creation of the orb.@");
		say("@Unfortunately that is all I know about them. I currently have no leads on how to use them or what they are.@");
		say("@I have also heard of a scroll which may infact be notes taken by Akakothen himself which outlines the procedures he used to construct the Orb of Infinity.@");
		ZorphosSecondSteps();
	}
	

}

}

void StartOrbQuest()
{


    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    
    converse
    {
        if (response == "Yes")
        {
            say("@Thank you! We shall get along well.@");
            gflags[ON_MAIN_QUEST] = true;
            UI_clear_answers();
			UI_pop_answers();
			break;
        }
        else if (response == "No")
        {
            say("@Than leave me be.@");
           	UI_clear_answers();
			UI_pop_answers();
			break;
        }
    }
    
}

void ZorphosConstruct()
{
UI_push_answers();

converse(["Location", "What about the ring?", "That is it?", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@But of course.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

    case "Location" (remove):
	say("@There is an old Dark Monk sacrificial ground in the northern part of the mountain, just north of the old Archibald mansion. I believe we can use this as our location to construct the orb.@");
	say("@Head to this location and begin the process. I still have several items which I must prepare but by the time you arrive I should be ready.@");

    case "What about the ring?" (remove):
	say("@I have not yet figured out the purpose of the ring, other than it was in the possession of Akakothen when the Orb was originally constructed.@");
	say("@I hope that the mere presence of the ring is all that is required.@");

    case "That is it?" (remove):
	say("@I will be speaking an incantation while you break the Orb of Focus. I may not possess the magical ability of Akakothen but I believe I do possess enough control for the process.@");

	
}
	
}









































// START OF FUNCTION FOR NPC ITSELF

void Zorphos object#(0x41b) ()
{

var bark = "Hail";
var bark_intro = "Hail";
	
var has_persuasion_orb = UI_count_objects(PARTY, ORB_OF_PERSUASION, ANY, ANY);
var has_focus_orb = UI_count_objects(PARTY, ORB_OF_FOCUS, ANY, ANY);
var has_chaos_orb = UI_count_objects(PARTY, ORB_OF_CHAOS, ANY, ANY);
var has_transfiguration_orb = UI_count_objects(PARTY, ORB_OF_TRANSFIGURATION, ANY, ANY);
var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);

var has_hammer = UI_count_objects(PARTY, HAMMER_OF_DIVINITY, ANY, ANY);
var has_flux = UI_count_objects(PARTY, FLUX_CAPACITOR, ANY, ANY);
var has_ring = UI_count_objects(PARTY, RING, ANY, ANY);

var ancient_scroll = UI_count_objects(PARTY, ANCIENT_SCROLL, ANY, ANY); // Ancient scroll from Brentonia

var has_blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
		}
		else if (gflags[ORBS_IN_PLACE]) //Stop the barks when orb if being made
		{
		}
		else
		{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "I must discover its secrets");
			else if (n == 2)
				UI_item_say(item, "Blasted orbs!");
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
        call Zorphos, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{

UI_show_npc_face(item);

if(gflags[ZORPHOS_CREATE_ORB])
{
	say("@Hurry to the altars north of the old Archibald mansion so that we can start recreating the Orb of Infinity! I will meet you there! Hurry now!@");
}
else if(gflags[NICE_ZORPHOS])
{

say("@You again I see.@");
add(["Job", "Bye", "Orb of Infinity"]);

if (has_persuasion_orb > 0 && has_focus_orb > 0 && has_chaos_orb > 0 && has_transfiguration_orb > 0 && has_focus_orb >0)
{
	if(gflags[HAS_ALL_ORBS])
	{
	}
	else
	{	
		add(["Minor orbs recovered"]);
	}
}

if(has_ring > 0 && has_flux > 0 && has_hammer > 0)
{
	if(gflags[HAS_ARTIFACTS])
	{
	}
	else
	{
		add(["Artifacts recovered"]);
	}
}

if(ancient_scroll > 0)
{
	if(gflags[DECIPHERED_SCROLL])
	{
	}
	else
	{
		add(["Scroll recovered"]);
	}
}

if(gflags[ON_MAIN_QUEST])
{
	add(["Recreate the orb"]);
	if(gflags[BASEMENT_OF_CASTLE] && !gflags[KILL_BASEMENT_OF_CASTLE_CONVO])
	{
		add(["Akakothen's resting place"]);
	}
}

if(gflags[TALKED_TO_ZOMBIE_SON])
{
	add(["Sons words"]);
	if(has_chaos_orb > 0 || gflags[ZORPHOS_SON_CONVO_KILL])
	{
		remove(["Sons words"]);
	}
}

converse([])
{

	case "Bye" (remove):
	say("@I look forward to your return.@");
	break;
	
	case "Job" (remove):
	say("He looks at you for a moment as if wondering what to say. @I still continue my research about the Orb of Infinity.@");
	add(["Orb of Infinity"]);
	
	case "Orb of Infinity" (remove):
	if(gflags[ON_MAIN_QUEST])
	{
		say("@As I mentioned I have learned much about the Orb of Infinity since I completed my book on the subject.@");
		say("@It is imperative that we recreate the Orb of Infinity so that we can stop the effects of the minor orbs on our very world.@");
	}
	else
	{
		say("@Since I wrote my book on the Orb of Infinity my research has led me to the conclusion that the Orb of Infinity did infact once exist, and the minor orbs are a result of it.@");
		say("@I have also uncovered that the minor orbs have an effect on the very fabric of our world and the only way to undue this is to recreate the Orb of Infinity and destroy it.@");
		add(["Recreate the orb"]);
	}
	add(["Effects"]);
	
	case "Effects" (remove):
	say("@Each of the orbs have a power of their own, though as of late my research has been into the Orb of Souls, as this power is having an effect on our very world.@");
	say("@The easiest example is the Orb of Souls. Through my research I have learned that when we die we no longer pass onto the next realm. In fact, we are stuck in a state of limbo.@");
	say("@If you have ever encountered the walking dead you would know what I mean. Their current state is a result of the Orb of Souls.@");
	add(["Current state"]);
	
	case "Current state" (remove):
	say("@As I mentioned most of my research as of late has been focused on the Orb of Souls. Unfortunately what I have discovered about this orb is quite disturbing.@");
	say("@It seems that since the Orb of Souls creation, and as long as it exists, when one dies their essence is unable to fully pass from the land of the living.@");
	say("@Some continue to wander the land in the form of ghosts or other undead, unable to communicate, while the essence of others simply remain in a state of unlife and undeath.@");
	say("@Essentially all those who die seem to currently exist in a state of limbo, rendering communication with them impossible.@");
	say("@However, it is my belief that if one were to possess the Orb of Souls this barrier could be broken and communication possible.@");
	say("@I have been unable to test this hypothesis but my theory is quite sound.@");
	say("@In fact my poor son, Dantelak, is unfortunately stuck in such a state ever since the Dark Monks of Kintore used him for a twisted sacrifice.@");
	say("@I managed to recover what was left of him but sadly he is but a walking, mindless corpse.@");
	if(gflags[ON_MAIN_QUEST])
	{
		say("@However, given his current state he may infact be of us to us.@");
	}
	else
	{
		say("@However, given his current state he may infact be of use to me on my current mission to recreate the orb.");
		add(["Recreate the orb"]);
	}
	add(["State of limbo", "Use"]);
	
	case "State of limbo" (remove):
	say("@It is my belief all those who have passed on since the creation of the Orb of Souls cannot fully pass onto the realm of the dead.@");
	say("@Imagine, thousands of years worth of spirits and souls all floating in a state of nothingness.@");	
	
	case "Use" (remove):
	say("@It is possible that in the twisted state he is in he has an affinity with the minor orbs or at least possesses some knowledge of them.@");
	if(gflags[ON_MAIN_QUEST])
	{
		if(has_soul_orb > 0)
		{
			say("@If you were to try speaking to him now that you possess the Orb of Souls perhaps we could learn something we do not yet know.@");
		}
		else
		{
			say("@When you recover the Orb of Souls you should try speaking to him. Perhaps we could learn something we do not yet know.@");
		}
	}
	else
	{
		say("@When I recover the Orb of Souls I hope to use it to open a line of communication. Perhaps then I can learn something more about the orbs.@");
	}
	gflags[TALK_TO_ZOMBIE_SON] = true;
	
	case "Recreate the orb" (remove):
	if(gflags[ON_MAIN_QUEST])
	{
		if(gflags[HAS_ALL_ORBS] && gflags[DECIPHERED_SCROLL] && gflags[HAS_ARTIFACTS]) // ALL CONDITIONS MET
		{
			say("@We are extremely close to recreating the orb. Head to the area in the mountains I mentioned so that we may recreate the orb!@");
			break;
		}
		else if(gflags[HAS_ALL_ORBS]) // POSSESS ALL THE ORBS - DO YOU HAVE THE OTHER OBJECTS?
		{
			say("@I am still quite shocked that you managed to recover all of the minor orbs so quickly. I have no doubt we will soon complete the task at hand.@");
			if(gflags[DECIPHERED_SCROLL])
			{
				say("He laughs. @Not to mention you have already recovered the scroll outlining the creation process. All we need now is to recover the three artifacts.@");
			}
			else if(gflags[HAS_ARTIFACTS])
			{
				say("He laughs. @Not to mention you have already recovered the artifacts. All we need now is to recover the ancient scroll.@");
			}
			else
			{
				say("@All we need now is to recover the artifacts and the ancient scroll.@");
			}
			ZorphosSecondSteps();
		}
		else if(gflags[DECIPHERED_SCROLL] && gflags[HAS_ARTIFACTS]) //HAS ARTIFACTS BUT NO SCROLL
		{
			say("@I am quite amazed at your ability to locate artifacts that many devote a lifetime to seeking. Hopefully you are able to retrieve the orbs as quickly.@");
			ZorphoseFirstSteps();
		}
		else if (gflags[DECIPHERED_SCROLL]) // ONLY RECOVERED SCROLL - NOTHING ELSE
		{
			say("@I am pleased you have managed to recover the scroll I sought. It has been more useful but there are still steps we need to do before our task can be completed.@");
			OrbQuestSteps();
		}
		else if (gflags[HAS_ARTIFACTS]) // ONLY RECOVERED ARTIFACTS - NOTHING ELSE
		{
			say("@I am pleased you have managed to recover the artifacts used in the orbs creation but there are still steps we need to do before our task can be completed.@");
			OrbQuestSteps();
		}
		else
		{
			say("@As I mentioned previously there are several steps which must be done in order to recreate the Orb of Infinity.@");
			OrbQuestSteps();
		}
	}
	else
	{	
		say("@As I have learned more throughout my research I have come to the conclusion that it must be destroyed. However, to do this I must gather the orbs.@");
		say("@Unfortunately I am unable to do this myself as I am not physically capable of fending of the beasts I would encounter on such a quest.@");
		say("He eyes you up. @You, on the other hand, look quite capable. Would you help me recreate the Orb of Infinity?@");
		StartOrbQuest();
		if (gflags[ON_MAIN_QUEST]) // This is if you say yes
		{
			say("@There are many steps which we will need to do in order to recreate the Orb of Infinity. I am afraid it will be no easy task.@");
			OrbQuestSteps();
			if(blinker > 0 || gflags[RECEIVED_BLINKER])
			{
			}
			else
			{
				say("@One more thing. I noticed that you do not possess a blinker. As you no doubt face a large amount of traveling I wish to give it to you.@");
				ZorphosBlinkerConvo();
				gflags[RECEIVED_BLINKER] = true;
			}
		}
		else // If you say no to StartOrbQuest it will then kill this convo overall
		{
			break;
		}
	}
	
	case "Akakothen's resting place" (remove):
	say("As you relate the tale of the Ophidian high priest and the ancient servant Zorphos runs his hands through his beard. @It sounds as if Akakothen fell in the basement of his castle.@");
	say("@I am not archelogist, but I believe the ruins of the great Ophidian castle is in the Frigid Plains, on the eastern half of that frozen chunk of ice. I believe it is somewhere around 42 north, 70 east.@");
	say("@I suggest you head to this location and see if you can find an entrance to the old castle to investigate this further.@");
	
	case "Minor orbs recovered" (remove):
	gflags[HAS_ALL_ORBS] = true;
	if(gflags[HAS_ALL_ORBS] && gflags[DECIPHERED_SCROLL] && gflags[HAS_ARTIFACTS])
	{
		gflags[ZORPHOS_CREATE_ORB] = true;
		gflags[CONSTRUCT_ORB1] = true;
		say("@Excellent! With all of the needed objects recovered and the knowledge gleamed from the scroll I feel we are ready to recreate the Orb of Infinity!@");
		say("@There is an old dark monk sacrificial ground here on the island just north of the old Archibald mansion which will be perfect for our needs.@");
		say("He hands you a scroll. @I have outlined the process in this scroll in the event I explained everything to quickly for you. Head there now and I shall meet you there!@");
		//Add scroll
		UI_add_party_items(1, 797, 109 ,9);
		break;
	}
	else
	{
		say("@It is excellent that you have managed to recover all of the minor orbs so quickly. At this rate we will soon be ready to recreate the Orb of Infinity!@");
	}
	
	case "Artifacts recovered" (remove):
	if(gflags[DECIPHERED_SCROLL])
	{
		say("Zorphos' eyes light up. @Amazing, simply amazing. These artifacts, together with the context of the scroll, make perfect sense.@");
	}
	else
	{
		say("Zorpho's eyes light up. @Amazing, simply amazing. Hopefully the scroll I mentioned makes use of how these artifacts actually play a part in the creation of the orb.@");
		say("@Regardless, we are one step closer to the creation of the orb.@");
	}
	ZorphosArtifactConvo();
	gflags[HAS_ARTIFACTS] = true;
	if(gflags[HAS_ALL_ORBS] && gflags[DECIPHERED_SCROLL] && gflags[HAS_ARTIFACTS])
	{
		gflags[ZORPHOS_CREATE_ORB] = true;
		gflags[CONSTRUCT_ORB1] = true;
		say("He laughs. @My apologies, I tend to ramble on. We have managed to recover all the objects needed to recreate the orb and gained the knowledge needed for its creation.@");
		say("@There is an old dark monk sacrificial ground here on the island just north of the old Archibald mansion which will be perfect for our needs.@");
		say("He hands you a scroll. @I have outlined the process in this scroll in the event I explained everything to quickly for you. Head there now and I shall meet you there!@");
		break;
	}
	
	case "Scroll recovered" (remove):
	say("Zorphos looks shocked. @I am not going to question you as to how you managed to get the scroll but suffice to say I am glad you were able to do so.@");
	say("As he takes the scroll from you he begins to examine it. @Interesting, indeed very interesting. This scroll offers quite a bit of insight into the creation of the Orb of Infinity.@");
	if(gflags[HAS_ARTIFACTS])
	{
		say("He scratches his chin. @It would seem that the artifacts you recovered play an important role in the creation of the orb.@");
	}
	else
	{
		say("He scratches his chin. @It would seem that the artifacts we are seeking play an important rule in the creation of the orb.@");
	}
	say("He points out portions of the scroll to you. @It would seem that each artifacts has a use, one to shatter, one to channel, and one to wear.@");
	say("@Not only that, but it also mentions an incantation that Akakothen seems to have come up with which helps the binding process.@");
	gflags[DECIPHERED_SCROLL] = true;
	// Remove the scroll
	UI_remove_party_items(1, ANCIENT_SCROLL, ANY, ANY);
	ZorphosScrollConvo();
	if(gflags[HAS_ALL_ORBS] && gflags[DECIPHERED_SCROLL] && gflags[HAS_ARTIFACTS])
	{
		gflags[CONSTRUCT_ORB1] = true;
		gflags[ZORPHOS_CREATE_ORB] = true;
		say("He laughs. @My apologies, I tend to ramble on. We have managed to recover all the objects needed to recreate the orb and gained the knowledge needed for its creation.@");
		say("@There is an old dark monk sacrificial ground here on the island just north of the old Archibald mansion which will be perfect for our needs.@");
		say("He hands you a scroll. @I have outlined the process in this scroll in the event I explained everything to quickly for you. Head there now and I shall meet you there!@");
		break;
	}
	
	case "Sons words" (remove):
	say("You relate what Zorphos' son told you. @Interesting. It appears my theory on the matter was correct. Perhaps those who mine refer to the Solusek Mining Company.@");
	gflags[ZORPHOS_SON_CONVO_KILL] = true;
	add(["Solusek Mining Company"]);
	
	case "Solusek Mining Company" (remove):
	say("@The Solusek Mining Company is a company which runs almost all the mines here in Desporia. In fact, they recently had an operation here but it was abandoned for reasons I am unaware of.@");
	say("@Regardless I suggest you investigate them on Solusek Island to see if you can learn anything about the Orb of Chaos.@");
	
	
} // End converse nice zorphos


} // End if nice zorphos

else 
{
UI_show_npc_face(item);
if(UI_get_item_flag(MET))
{
	say("@Did I not tell you to go away?@");
	add(["Job", "Bye"]);
}
else
{
	say("A rather stern looking man stares at you. @What do you want?@");
	add(["Name", "Job", "Bye"]);
	UI_set_item_flag(MET);
}
converse([])
{
	case "Bye" (remove):
	say("@That is right, you go away now.@");
	break;
	
	case "Name" (remove):
	say("He balks at you. @I am so sick of people asking me that. Zorphos, do you hear me? Zorphos!@");
	
	case "Job" (remove):
	say("@I research ancient and powerful artifacts. Now if you do not have anything to talk to me about be on your way.@");
	if(gflags[READ_ORB_BOOK])
	{
		add(["Orb of Infinity"]);
	}
	
	case "Orb of Infinity" (remove):
	say("@That is right. I am the author of the most well known book in regards to the Orb of Infinity and no, I do not give autographs.@");
	add(["Need information"]);
	
	case "Need information" (remove):
	say("You explain that you do not wish to pester him and are only looking for information as he scoffs at you. @And why should I help you?@");
	add(["Goblins and orb"]);
	
	case "Goblins and orb" (remove):
	if(gflags[GOBLINS_DEFEATED])
	{
		say("As you relate the tale of your raid on the goblin camp and how you retrieved the Orb of Transfiguration he stares at you in awe.");
	}
	else
	{
		say("As you relate your findings about the goblins of the mainland and their possession of the Orb of Transfiguration as he stares at you in awe.");
	}
	say("@Such news is most troubling. I have learned much since I first published my book in regards to the minor orbs and the Orb of Infinity.@");
	add(["Learn"]);
	
	case "Learn" (remove):
	say("@I have come to the conclusion the five minor orbs do indeed exist and at one point the Orb of Infinity itself also existed.@");
	say("@There is much to discuss. Please, give me a moment to collect myself.@");
	gflags[NICE_ZORPHOS] = true;
	script (-27)
	{
		say "Most troubling";
	}
	break;
}
}
}

}