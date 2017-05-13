
void Maggie object#(0x5ee) ()
{
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Ahoy to you";
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
				UI_item_say(item, "Quite slow on the docks as of late");
			else if (n == 2)
				UI_item_say(item, "The sea air is good for my bones");
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
        call Maggie, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("Maggie beams a smile at you. @Ahoy there again. Good to sea the sea has not yet claimed ya.@");
add(["Job", "Bye"]);
}
else
{
say("You look at a rather old looking woman only to have your stare broken when she yells at you. @Now that ye have had a good looksy perhaps you can say something?@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

if(gflags[HEARD_OF_THUGS])
{
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
	}
	else
	{
		add(["Thugs"]);
	}

}

converse([])
{
	case "Bye" (remove):
	say("@May the waters be treating ye well.@");
	break;
	
	case "Name" (remove):
	say("The woman does a small curtsy while smiling. @Now that is there now better now. I knew yer tongue was not be tied. I be Maggie.@");
	
	case "Job" (remove):
	say("An almost shrieking cackle assaults your ears. @Why I be the dock master here in Rosendale, not that we be having much ships sailing here lately.@");
	say("@Other than ye self of course.@");
	add(["Rosendale", "Dockmaster", "Myself"]);
	
	case "Rosendale" (remove):
	say("@Rosendale be a mighty fine city if I do say so meself. Fur being a rather small hunk of land it has got quite the resources and attractions on these shores.@");
	say("@In fact I would go as fur as to say that this here island is the quiantest little land mass in all the lands. I would rather be here than even Medina working fur the Nautical Guild.@");
	add(["Resources", "Attraction", "Nautical Guild"]);
	
	case "Resources" (remove):
	say("She looks at you cock-eyed. @What are ye? Some sort 'o illiterate? Never read a geography book in yur life?@");
	say("@Well if ye have ever bothered to read a geography book ye would know that we have some rock on this island.@");
	say("Suddenly your ears are filled with a hacking cough and Maggie spits on the ground. @'Cuse me. The sea air tends to bring up that there flem. As I was saying we gots some nice rock on this island.@");
	say("@Now this ain't no 'inary rock. Nope, this rock be quite hard it be the hardest ye will ever find. It is so heavy infact that few ships will even ship it out since it be so expensive ta do so!@");
	add(["Rock"]);
	
	case "Rock" (remove):
	say("@Now I ain't no geologist but I do know that dis der rock be in the mountains to the west and that it be mighty hard to mine. Those poor fellas who mine it must be quite strong to do such work.@");
	add(["Fellas"]);
	
	case "Fellas" (remove):
	say("@I am not sure dur names but they certainly do have rippling muscles.@");
	if(female)
	{
		say("She nudges you. @What I would do to have a night with one 'er them. They can mine me anyday. Yeee dog.@");
	}
	
	case "Attraction" (remove):
	say("@What are ye? Simple? The attraction in Rosendale be the Galleria! It has some fine sculptors made by a local artisan. They 'er quite well done from what I seen but I ain't no critic.@");
	add(["Sculptors"]);
	
	case "Sculptors" (remove):
	say("@A feller by the name 'o Igon does that werk. He is quite a nice looking catch if ya ask me@");
	
	case "Nautical Guild" (remove):
	say("She looks at you puzzled. @How can ya not know the Nautical Guild? Ye be a member ain't ya?@");
	say("Her eyes go up and down, obviously judging you. @But it ain't my place to judge who they let join our ranks.");
	
	case "Dockmaster" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@I be the one who takes all the notes and werks with those who be sailing into town. It was a bit slow as 'er late due to the pirates but that now be dealt with@");
	}
	else
	{
		say("@I be the one who takes all the notes and werks with those who be sailing into town, not that there be much 'o that with the pirate menace.@");
	}
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@Overall it be good work and I be content with where I be in life.@");
	}
	else
	{
		say("@Overall it be good work and I be content with where I be in life except fer that annoying Jorletta. She just does not know how ta leave me alone.@");
		add(["Jorletta"]);
	}
	add(["Pirates"]);
	
	case "Jorletta" (remove):
	say("She shakes her head. @She used ta be a fine girl but now she be an annoying brat.@");
	say("@She constantly pesters me fer a boat to get out of Rosendale and thinks if she whines enough I will give 'er what she wants. I ain't her daddy though.@");
	add(["Daddy"]);
	
	case "Daddy" (remove):
	say("@Her daddy be the mayor of Rosendale, a Mr. Harris. He must not 'o given 'er enough love as a child or something.@");
		
	case "Pirates" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@Them folks who think it was a swell way 'o living were robbing others all over the sea. The Nautical Guild put a ban on sailing 'till that threat was dealt with.@");
		say("@Luckily those pests are now brought under control and we be allowed ta sail again. None too soon too as this town be so dependant on visitors. I cannot wait ta see more new faces.@");
	}
	else
	{
		say("@Them folks who think it be a swell way 'o living ta be robbing others on the see are becoming such a threat that the Nautical Guild has now gone and banned sailing.@");
		say("@In all my years they never managed to do that, but I guess they finally did. I just be waiting until the guild will allow us ta sail again. That should pickup tourism in this town.@");
	}
	
	case "Myself" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@The Nautical Guilds ban on sailing as 'o late has put a real damper on people visiting. Now that the ban be lifted I look forward ta seeing new faces, with ye being tha first.@");
	}
	else
	{
		say("@Ye be one of the few who have gone and sailed to Rosendale in some time. I 'spose you have some sort 'o business here to be allowed to do that which I will not press ya for.@");
		say("@But I will say be nice ta see a new face.@");
	}
	
	
	case "Thugs" (remove):
	say("@Aye, I heard them rumours about a group 'o thugs attackin' poor Marsh. A crying shame what this town be coming to. I hope they be brought to justice soon.@");	

}
}
else if (event == DEATH)
{
	

}


}