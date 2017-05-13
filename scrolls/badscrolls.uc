

void badscrolls shape#(707) ()
{

var quality = get_item_quality();

book_mode();

/*

Scroll in Gruplinorts chest to give to Yesserm

*/

	if (quality == 51) // Griplinorts scroll
		{
		say("uAljmoozhaaomokooonuhaaanukn");
		say("Yunmupni Aklapow Bomb Mooga mooo");
		say("Olpasor hunah lknopqer");
		say("fkalnarp nerf potonomianfa");
		say("fiaoof fiiop Appod Dew opalfl");
		say("Faoikn muggaq chumplon");
		}
/*
Scroll given by Graethe
*/

	else if (quality == 52)
		{
		say("Whoever this scroll may find itself with I emplore you to give this scroll to Hector in Dewtopia.");
		say("");
		say("I am Graethe, Knight of Dewtopia.");
		say("I came to the Southern Mountains to investigate the tales of the liche. Little did I know I would soon become his food.");
		say("The Jester, JunJun, is a servant of the vile liche. He attacked me by surprise and now I find myself imprisoned here.");
		say("");
		say("In my many days as a prisoner I have learned that the liche is aiding the goblin hordes. He is providing them with magical knowledge that would normally be unknown to them in exchange for goblins to feast upon.");
		say("");
		say("I believe this is how they have been becoming more intelligent and cunning. I do not know how much the liche has taught them but it is enough to have caused the goblin plague Dewtopia is currently suffering.");
		say("");
		say("I have also heard the liche muttering about an orb some sort. If you can figure out what this is about, perhaps it can aid Dewtopia.");
		say("");
		say("The Dewtopian Guard must be made aware of this or Dewtopia risks falling to this new breed of goblin. I emplore you to deliver this message with haste!");
		say("");
		say("");
		say("Hector, if you receive this note please check on Mulgrath, for I fear without me to guard him the goblins will attempt to siege his home.");
		gflags[READ_SCROLL] = true;
		}

	else if (quality == 53) // scroll in bandit camp
		{
		say("Jugral Nuflieera");
		say("uAljmoozhaaomokooonuhaaanukn");
		say("Yunmupni Aklapow Bomb Mooga mooo");
		say("Olpasor hunah lknopqer");
		say("fkalnarp nerf potonomianfa");
		say("fiaoof fiiop Appod Dew opalfl");
		say("Faoikn muggaq chumplon");
		}

	else if (quality == 54) // The liches scroll
		{
		say("It would seem the goblins have become cunning enough to pilfer my Orb of Transfiguration without me noticing it until now.");
		say("");
		say("It is a shame for them to have betrayed me after all the help I have given them. I shall slaughter the next group of goblin delegates that comes to me for this insolence.");
		gflags[READ_LICHE_SCROLL] = true;
		}

	else if (quality == 55) // Scroll on body to let player know to search under rocks for key to dark monk place
		{
		say("I will hide my key under some rocks near the lakehouse. If they shake me down and search the house they will never find it.");
		
		}
	else if (quality == 56)
		{
		say("Last Will and Testament of Djarn");
		say("");
		say("I write this in haste, I do not believe I can last much longer under the orbs influence.");
		say("");
		say("I leave my only true possession of any value to my estranged wife Gloria.");
		say("");
		say("Gloria, if you art ever need of coin you should be able to exchange this necklace at any fine jeweller. I hope that you do not have to do this, but I would rather you live with some coin than in clothes made of rags.");
		say("");
		say("Forgive me for leaving you for this job my dear!");
		say("");
		say("To the holder of this note: I beseech you to return my necklace to my wife. She runs the Inn within Kintore.");
		}
	else if (quality == 57)
		{
		say("I have left the orb under the protection of the manspider creation. It serves us well and is fiercly loyal.");
		say("");
		say("Anyone who dares attempt to take the orb will be made into a meal for our servant.");
		gflags[MAN_SPIDER_HAS_ORB] = true;
		}
	// CANNOT USE 67 AS IT IS QUALITY FOR A BOAT
	else if (quality == 58)
	{
		gflags[NICE_ZORPHOS] = true;
		gflags[CONSTRUCT_ORB1] = true;
		gflags[RECREATE_ORBS] = true;
	}
	else if (quality == 59)
	{
	}
	else if (quality == 60)
	{
		var x = 100;
		while (x < 1400)
		{
			gflags[x] = false;
			x = x + 1;
			if(x == 1399)
			{
				say("X finished");
			}
		}
	}
	else
	{
		say("And Bingo was his namo");
	}


}







