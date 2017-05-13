void Ailiya object#(0x5ef) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Good day to you";
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
				UI_item_say(item, "I do hope tourism picks up");
			else if (n == 2)
				UI_item_say(item, "There is much paperwork to be done");
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
        call Harris, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("Harris glances up from what he was doing. @Ah, it is you again.@");
add(["Job", "Bye"]);
}
else
{
say("The man does a quick glance at you. @I do not believe we have met before.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

if(gflags[HEARD_OF_THUGS])
{
	add(["Thugs"]);
}

converse([])
{
	case "Bye" (remove):
	say("@I should return to my work.@");
	break;
	
	case "Name" (remove):
	say("The man looks up from his work and extends his hand to you. @I apologize for my rudeness. I am Harris.@");
	
	case "Job" (remove):
	say("@My job, my wonderfully busy job. There is always so much to do in my job that I rarely even get a day off to myself.@");
	say("He shakes his head. @My apologies, I tend to ramble when my train of thought is interrupted. I am the mayor of Rosendale.@");
	add(["Mayor", "Rosendale"]);
	
	case "Mayor" (remove):
	say("@I am the one in charge of all the managerial duties here in Rosendale. This ranges from keeping the city clean to appointing guards.@");
	say("He sighs. @It used to be so much simpler when the tourists were visiting on a regular basis.@");
	add(["Tourist", "Managerial duties", "Guards"]);
	
	case "Tourist" (remove):
	say("@Rosendale is quite an attractive destination to visit because of the Galleria. Many travel great distances to see the works that our resident artisan makes.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@Unfortunately the recent pirate threat had greatly reduced the number of people visiting the town. Thankfully with that now out of the way the tourists can once again start visiting the Galleria.@");
		say("@Hopefully it does not take too long for that to start happening.@");
	}
	else
	{
		say("@The Nautical Guild has placed a ban on all non-essential sailing in order to combat a growing pirate threat. This has greatly placed a damper on the tourism in this fair city@");
		say("@While I am sure we are not the only place affected by such a ban it does end up having on my job as mayor. I do hope it is resolved soon.@");
	}
	add(["Pirates", "Nautical Guild"]);
	
	case "Pirates" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@A bunch of mangy sea dogs if you ask me. I have heard rumour that they have been dealt a fatal blow. If so, I shall shed no tears for the likes of them.@");

	}
	else
	{
		say("@Pirates are nothing more than mangy dogs at sea. The whole lot of them needs to be put down.@");
	}
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild runs all the legitimate ships that sail the seas. Their services are a great help to our tourism industry, that is when they do not have a ban on sailing.@");

	case "Managerial duties" (remove):
	say("@As mayor I perform many different yet all equally important functions here in Rosendale. This ranges from keeping the city streets clean to ensuring that there is law and order.@");
	say("He shakes his head. @As of late my main concern is to try to keep the city running with minimal cost. Until tourism picks back up it will be hard times here in Rosendale.@");
	add(["Law and order", "Minimal cost"]);
	
	case "Law and order" (remove):
	say("He shrugs. @While I am technically the final arbiter in all things law and order for all intense and purpose I have left those duties on the shoulders of the local sheriff Dryn.@");
	add(["Dryn"]);
	
	case "Dryn" (remove):
	say("@Dryn is the sheriff here in Rosendale. I appointed him to the position when I became overwhelmed with my other duties.@");	
	
	case "Minimal cost" (remove):
	say("He laughs. @If one has never had the duty of keeping a town or city in good running order it is impossible to fully understand the drastic costs associated with it.@");
	say("@That being said, Rosendale is far costlier to run than your average city as it must remain in good working order in order to attract tourists.@");
	say("@On top of that most of the costs involved in running the city are mainly financed through the gold that the tourists bring in. I am sure you can therefore see the situation I am in.@");
	add(["Good working order", "Situation"]);
	
	case "Good working order" (remove):
	say("@The city must be kept clean and crime free in order to attract tourists to the Galleria. Who would want to visit and spend gold in a decrepit and dilapidated city?@");
	
	case "Situation" (remove):
	say("@I would think it is plainly obvious. How can I keep the city in good running order to attract tourists without the tourists bringing in gold?@");
	say("@At least there is the quarry to help the finances.@");
	add(["Quarry"]);
	
	case "Quarry" (remove):
	say("@The quarry is in the mountains to the west. It contains some of the hardest rock one will ever find.@");
	say("@Most of the rock is used to create the statues in the Galleria as it is too expensive to ship out but occassionally some orders for small creates of it will be made.");
	if(gflags[LECHUCK_DEAD])
	{
	}
	else
	{
		say("He sighs. @But I suppose the Nautical Guild needs to be sailing for that.@");
	}
	
	case "Guard" (remove):
	say("@In my capacity as mayor it is my duty to ensure the safety of those who live and visit Rosendale. Frankly, I do not have the time to deal with such things at this time which is why I have delegated nearly all the power to the town sheriff.@");
	add(["Town sheriff"]);
	
	case "Town sheriff" (remove):
	say("@I have appointed a man named Dryn as the sheriff.@");
	add(["Dryn"]);
	
	case "Rosendale" (remove):
	say("@Rosendale is a fine city located on an island north east of Brentonia. It is best known as the home of the Great Galleria of Rosendale.@");
	say("He shakes his head slightly. @But surely you know this. How else would you have gotten here?@");
	
	case "Thugs" (remove):
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@I am glad to hear that the thug issue has been dealt with. I knew I made a good move in appointing Dryn as sheriff.@");
	}
	else
	{
		say("@Several people have mentioned rumours of thugs to me. My best advice is to speak to Dryn about such matters.@");
	}
	
	say("@I do not know anything about the beatings personally but I heard that Dryn is looking into it and taking the stories very seriously.@");
	add(["Dryn"]);
	

	

	

}
}
else if (event == DEATH)
{
	

}


}