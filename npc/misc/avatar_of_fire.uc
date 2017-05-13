/*
Avatar of Fire, summoned after you kill Lord of Flame
*/

void Avatar_of_Fire object#(0x5d6) ()
	{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hail";
var bark_intro = "Hail";

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == SLEEP)
		{
			UI_item_say(item, "Zzzz");
			return;
		}
		else if (UI_get_schedule_type(item) == IN_COMBAT)
		{
		}
		else
		{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "");
			else if (n == 2)
				UI_item_say(item, "");
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
        call Avatar_of_Fire, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

say("The burning eyes of the woman stare back at you.");

converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("She nods at you as you depart.");
	break;
	
	case "Job" (remove):
	say("A cackling laugh comes from the woman. @My simple friend. I am the Avatar of Fire. I am the one who controls the burning passion of fire.@");
	say("@Sadly, my job now is to undue the damage done to the very flames of this world.@");
	add(["Controls", "Fire", "Undue damage"]);

	case "Controls" (remove):
	say("@I am the one who breathes fire into this world. I am the one whom creates the beings of fire. Though I am sad to say I had a lapse in judgement when I looked to aid Azechal.@");
	add(["Beings of fire", "Azechal"]);
	
	case "Beings of fire" (remove):
	say("@Of what would you like to know?@");
	Beings_Of_Fire_Convo();
	
	case "Azechal" (remove):
	say("The womans eyes appear to turn into flames. @Azechal sought to know the ways of flames. He tried so hard yet never accomplished a thing so I took it upon myself to aid the poor man.@");
	say("@This was an enormous mistake on my part.@");
	add(["Mistake"]);
	
	case "Mistake" (remove):
	say("@It would seem Azechal knew more about controlling the flames than it appeared. He was merely playing the part of a bumbling fool so that I would come before him.@");
	say("@When I came before him he used his magical knowledge to imprison me within the confines of the Plane of Fire.@");
	add(["Imprison", "Plane of Fire"]);
	
	case "Imprison" (remove):
	say("@When I came before Azechal he used his magic to capture me. While I was his prisoner he stole much of my knowledge of fire.@");
	say("@I managed to escape back to the Plane of Fire before he had aquired all of my knowledge.@");
	say("@Unfortunately after I escaped he used the knowledge he had stolen to seal the gateway I use to travel between the realms. That is until you extinguished his very life.@");
	add(["Knowledge", "Gateway"]);
	
	case "Knowledge" (remove):
	say("@Although he did not manage to steal all of my knowledge of fire, Azechal did steal enough to corrupt the purest creatures of flames, the fire elementals.@");
	say("@Luckily, for the both of us, he failed to do much else while in possession of the knowledge of fire.@");
	add(["Fire elementals"]);
	
	case "Fire elementals" (remove):
	say("A small flame falls from one of her eyes. @The fire elementals are pure fire, their very lifeblood is the flames.@");
	say("@Sadly, Azechal actions have twisted them into mindless creatures of destruction you have seen in your travels.@");
	say("@I have no doubt I can undue the damage Azechal has done. It is simply a question of time.@");
	
	case "Gateway" (remove):
	say("@I use a gateway between my home, the Plane of Fire, and the realms in which fire burns. It is this gateway Azechal sealed, preventing me from sending my Avatar to the different realms.@");
	add(["Avatar"]);
	add(["Realms"]);
	
	case "Avatar" (remove):
	say("@As the ruler of the Plane of Fire I cannot travel to this realm in my true form, and you cannot travel to mine in your form. I use Avatars so that I may exist in your realm.@");
	say("@It is what you speak to at this time.@");

	
	case "Realms" (remove):
	say("@As the ruler of the Plane of Fire I cannot travel to this realm in my true form, and you cannot travel to mine in your form. I use Avatars so that I may exist in your realm.@");
	say("@It is what you speak to at this time.@");
	say("She ponders for a moment. @The flames whisper to me that you are aware of such things... there is something about you I cannot quite grasp.@");
	add(["What about me?"]);
	
	case "What about me?" (remove):
	say("@I cannot say what it is about you for I do not even understand myself. Yet I feel you too have a connection to the planes, a connection that only an Avatar would possess.@");
	add(["Connection"]);
	
	case "Connection" (remove):
	say("@Every Avatar has an intrinsic connection with the planes, with the strongest connection being that of their home plane. I feel you have such a connection, yet it is different from any connection I have ever sensed.@");
	say("@I do not understand what it is about you but something about you is strange... strange even for those of us who traverse the planes.@");
	
	case "Plane of Fire" (remove):
	say("@There are many planes of existence. While this plane may be the one you exist in it is not the one I exist in. I exist in the Plane of Fire.@");
	
	case "Plane of Fire" (remove):
	say("@There are many planes of existence. While this plane may be the one you exist in it is not the one I exist in. I exist in the Plane of Fire.@");

	case "Fire" (remove):
	say("@The element you know as fire is my child. Each time you light a candle a new life is created. Each time a candle burns out a life is extinguished.@");
	say("@Such is the nature of fire.@");
	add(["New life", "Extinguished"]);
	
	case "New life" (remove):
	say("The woman stares at you coldly. @Although it may not seem like a life to you, I can assure you that each flame is a lifeforce in and of itself.@");
	
	case "Extinguished" (remove):
	say("@Everytime a flame becomes extinguished a life is lost. As the mother of fire I feel each time one of my children flicker out and disappear.@");
	say("@Yet this is the way of my children and they have lived their life, and served their purpose.@");
	
	case "Undue damage" (remove):
	say("A fiery rage seems to fill the woman. @I must undue the damage done to my children the fire elementals.@");
	
}
}



}
