/*
Jones the archeologist
*/

void Unearth_Staircase()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("@Excellent! Take a pickaxe from my supplies and start to work on clearing the rubble. If I am working at the site I will drop whatever I am doing to join you.@");
	gflags[UNEARTH_STAIRCASE] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;	
	
	case "No" (remove):
	say("@A shame you should decline such a thing. I suppose I will unearth it in time.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}

void Jones object#(0x5be) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hail to you";
var bark_intro = "Hail";

var time = UI_game_hour();

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
				UI_item_say(item, "Such a wonderful find");
			else if (n == 2)
				UI_item_say(item, "Interesting");
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
        call Jones, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@Returned have you? I knew the thrill of archaeology could not keep you away.@");
}
else
{
	say("The man eyes you. @Please, do not touch anything in the ruins.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("Jones tips his hat to you. @Keep on searching the past.@");
	break;
		
	case "Name" (remove):
	say("The man tips his hat to you. @Jones.@");
	
	case "Job" (remove):
	say("A hearty laugh escapes the man. @You must ask such a thing? Look around you. Do you not see the care and thought put into the work around these ruins?@");
	say("@No, of course not. Most people only see people pillaging that of the past. It pains me when I see such actions as an archaeologist. Sadly, it is the way of the world.@");
	add(["Ruins", "Pillaging", "Archaelogist"]);
	
	case "Ruins" (remove):
	say("@Have you not seen the ruins scattered across the lands? I am certain you have for they are quite difficult to miss. These were once homes, outposts and other structures of the Ophidian Empire.@");
	say("@Now all these structures are are ruins being destroyed by the ravages of time. It is quite sad really.@");
	add(["Ophidian Empire", "Ravages of time"]);
	
	case "Ophidian Empire" (remove):
	say("Jones appears puzzled. @How could you not have heard of the Ophidian Empire? They were the first civilization to rise in Desporia and they were the first civilization to fall in Desporia.@");
	say("@They are a look into the history of our species. A look into the history of man. They were once so great and now they are but piles of rubble with anything of value long ago taken by looters.@");
	
	case "Ravages of time" (remove):
	say("@Time has not been a kind mistress for what remains of the Ophidian Empire. What remains of their civilization has been ravaged but weather, generations of pillaging, and generations of wars.@");
	say("@Noone has cared for the ruins of our most important ancestors. All people have cared about is what could our ancestors do for them at that moment.@");
	say("Jones sighs. @Be it destroying their buildings for supplies or land, or taking anything of value from the ruins. So much knowledge has been lost because of this.@");
	
	case "Pillaging" (remove):
	say("It is clear Jones is angry at the thought of this. @So many over the years have taken anything of value from the ruins. Pillaging anything that could make them any amount of coin.@");
	say("@In fact, such people care so little for history that they would even destroy objects of no monetary value in order to reach something that would sell for a single coin.@");
	say("@I simply cannot fathom such acts of wanton destruction.@");
	add(["Destory"]);
	
	case "Destory" (remove):
	say("@It is very sad. If an ancient pitcher or vase was in the way of something that looks to be of value the pillagers would simply toss the objects out of the way, forever losing a piece of history as it shattered.@");
	say("@Some people would even destroy such ancient artifacts for fun. I cannot understand such thinking. What could possibly be fun about smashing objects from the dawn of civilization?@");
	add(["Dawn of civilization"]);

	case "Dawn of civilization" (remove):
	say("@Indeed, the dawn of civilization. Many of these ruins date back to when mankind first started to live together in an orderly society.@");
	say("@It is for this reason why we must take such care of them. We must learn why our ancestors did what they did.@");
	
	case "Archaelogist" (remove):
	say("@I study the past. I study how the past affects us today. In fact, I am very lucky to have found a site that has not been disturbed by much of man since it was originally abandoned.@");
	say("@Sadly, so many other sites are not as lucky.@");
	add(["Site", "Abandoned"]);
	
	case "Site" (remove):
	say("@I have been working alongside my wife at unearthing the remains of this site for many months. From the artifacts I have recovered I believe some sort of artisan used to live or work here.@");
	say("@Thankfully it is located so close to the Noxious Swamp that many of the would be looters and pillagers were either too afraid to be near such a place or simply never knew it existed.@");
	add(["Artisan", "Wife", "Noxious Swamp"]);
	
	case "Artisan" (remove):
	say("@I have found many broken statues and other artifacts that would indicate that the previous inhabitant of this site worked at creating statues and other objects.@");
	say("@It is my suspician that the cliental of this particular artisan was the wealthy as many of the artifacts are finely made and encrusted with gems or gold.@");
	say("@I have also uncovered the remains of what appears to be a pure gold statue.@");
	add(["Golden statue"]);
	
	case "Golden statue" (remove):
	if(gflags[BROKE_STATUES_GOOD])
	{
		say("@It was unfortunate that you broke the statues which were still in one piece but mistakes happen. Even I have broken priceless artifacts in the past.@");
		say("@Perhaps one day I will uncover another statue that is still in one piece.@");
	}
	else if (gflags[BROKE_STATUES_BAD])
	{
		say("@It was unfortunate that the statues we found in the basement were destroyed by time. Perhaps one day I will uncover another statue that is still in one piece.@");
	}
	else
	{
		say("@I imagine it looked quite marvelous when it was still in one piece. A pure golden statue in the shape of armor glistening in the sun. Such an object must have been worth a fortune.@");
		say("@It is my hope that eventually I will be able to find a statue still in one piece.@");
	}
	
	case "Wife" (remove):
	say("@My wife Marion works along side me when our son Buckles is asleep. She is such a lovely woman to help me with such intense work.@");
	add(["Buckles"]);
	
	case "Buckles" (remove):
	say("@Buckles is but a small boy. He can be a handful at times but he seems to enjoy living out here, even without other children around.@");
	
	case "Noxious Swamp" (remove):
	say("@A short distance to the south east lies the edge of the Noxious Swamp. The swamp has claimed many lives of those who have tried to make their way through it.@");
	say("@Some say the swamp itself comes alive to slay those who travel into it but I do not believe such tales. In fact, one day I would like to make my way through it myself to investigate the crypts.@");
	add(["Crypts"]);
	
	case "Crypts" (remove):
	say("@The great Ophidian crypts lay at the end of the swamp. It is rumoured to hold the remains of many important Ophidians and it would be a wonderful archaeological site.@");
	say("Jones sighs. @It is far too dangerous to navigate with a small child though, so it will be many years before I am able to investigate it myself.@");
	
	case "Abandoned" (remove):
	say("@I do not yet know why or when this site was abandoned. It is my hope that the objects I unearth will help solve this mystery. Though I believe I have learned what this site used to be.@");
	say("Jones eyes gleam as he begins to tell you about the site. @It seems this site was once the home to some sort of artist. I have found many statues and other glass items in my excavations.@");
	say("@It is also my believe that this person was quite wealthy as many of the relics have gems or gold encrusted on them.@");
	if(gflags[JONES_BASEMENT])
	{
	}
	else
	{
		say("@In fact, I have begun unearthing an old staircase to what i believe to be the storage room. Unfortunately my wife is not strong enough to help me break the rocks that block it.@");
		if(time >= 6 && time <= 17) // within the itme when Jones loiters around the site
		{
			say("Jones eyes you up. @You look like you could do some physical labour... will you help me unearth the staircase?@");
			Unearth_Staircase();
			if(gflags[UNEARTH_STAIRCASE])
			{
				break;
			}
		}
		else
		{
			say("Jones eyes you up. @You look like you could do some physical labour. Will you help me unearth the staircase when I am working at the site?@");
			Unearth_Staircase();
			if(gflags[UNEARTH_STAIRCASE])
			{
				break;
			}
		}
	}
	
}

}
}

