/*
Joanne the lumberjack
*/

void Joanne_Greet()
{
UI_push_answers();
converse(["Passing through", "Staying"])
{
	case "Passing through" (remove):
	say("@Lovely. I am glad you stopped by to have a chat.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Staying" (remove):
	say("@Well that is lovely! I hope you enjoy it here.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}


void Joanne object#(0x5b8) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hail to you";
var bark_intro = "Hail";

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
				UI_item_say(item, "A hard days labour");
			else if (n == 2)
				UI_item_say(item, "A good days work");
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
        call Joanne, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@It is nice to see you again. I hope the world is still treating you well.@");
}
else
{
	say("@I have not seen you around. Are you just passing through or are you staying here?@");
	Joanne_Greet();
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("You are parted with a cheery wave. @I hope to see you again sometime.@");
	break;
		
	case "Name" (remove):
	say("A big smile greets your question. @I am Joanne.@");
	
	case "Job" (remove):
	say("The woman lets out a small chuckle. @I am a lumberjack here in the Northern Forest. And I know what you are thinking, why would a young woman choose to be a lumberjack?@");
	say("@And I have a simple answer to that. It is what I love to do.@");
	add(["Lumberjack", "Love"]);
	
	case "Lumberjack" (remove):
	say("@I cut down trees and sell them for those building various wooden goods. That could range from chairs and tables to walls and forts.@");
	say("@To be honest I do not really concern myself with what people build with the wood that I cut down. It is easier not to know.@");
	add(["Not to know"]);

	case "Not to know" (remove):
	say("@Well, the wood could be going for war machines such as catapolts or other weapons of death. Not knowing what the wood is used for helps me sleep at night.@");
	
	case "Love" (remove):
	say("Joanne blushes. @Well, not truely love of course. I just truely a job I relish in. I get to see all the different types of wildlife and spend lots of time outdoors.@");
	say("@I cannot think of anything else I would rather be doing. Not to mention the company I get to keep.@");
	add(["Company"]);
	
	case "Company" (remove):
	say("@There are several other lumberjacks and even an inn here in the Northern Forest. While there are not many suitors there are lots of friends.@");
	add(["Suitors", "Friends"]);
	
	case "Suitors" (remove):
	say("Joanne blushes and lets out a nervous laugh. @Like everyone else I sometimes crave the more intimate aspects of human contact but there is not much variety here.@");
	add(["Variety"]);
	
	case "Variety" (remove):
	say("@I do not mean to sound like a prude, but their is only one single person in the town and that is Wendill. He is a nice man but he is always nervous around me.@");
	say("@Other than that the only other possible bedmates I have are travellers staying at the inn, and one night relationships do not appeal to me.@");
	add(["Wendill"]);
	
	case "Wendill" (remove):
	if(gflags[PLAYED_FOR_WENDILL])
	{
		if(gflags[PLAYED_TERRIBLE])
		{
			say("Joanne sighs. @Wendill is a nice man but he could have chosen someone better than you to try to be romantic. But at least he finally made an attempt at courtship.@");
			say("@I am willing to give him a chance for the thought he put into it despite the poor execution brought about by you. The thought was very romantic at least.@");
		}
		else if (gflags[PLAYED_MEDIOCRE])
		{
			say("Joanne sighs. @Wendill is a nice man but he could have chosen someone a tad better than you to try and be romantic. But I am happy he finally made an attempt to woe me.@");
			say("@Despite the shortcomings I am willing to give him a chance for the thought he put into it. It was a very romantic gesture after all.@");
		}
		else if (gflags[PLAYED_GOOD])
		{
			say("Joanne smiles. @Wendill is a sweet man and his attempt at courtship was very sweet. While the musical performance was not great it was still very nice.@");
			say("@I am quite pleased to be spending time with a man who puts so much thought and effort into his love interest. I am special to be that woman.@");
		}
		else if (gflags[PLAYED_GREAT])
		{
			say("Joanne swoons. @Wendill is so romantic. I cannot believe he went through all the effort to get such a wonderful lute player all for me. Never in the world would I have expected such a thing.@");
			say("@He is just so sweet, he is just so caring. He makes me feel so special. No doubt I will be spending much of my time with him in the future.@");
		}
	}
	else
	{
		say("@Wendill is a fellow lumberjack who also helps his parents run the inn here in the forest. He is quite cute and I would like to get to know him better.@");
		say("@But he acts strange and nervous when he is around me. I think he knows that I fancy him but does not know how to reject me so he simply acts awkward.@");
	}
	
	case "Friends" (remove):
	say("@Everyone in town gets along with each other quite well. If someone is hurt and out of work while they recover we all pitch in to keep them from becoming broke.@");
	say("@Its one of the reasons I love it here so much. We care more about our friends and fellow lumberjacks than the profit from our labours.@");
	add(["Profit"]);
	
	case "Profit" (remove):
	say("@It can be quite profitable cutting down trees for a living. It is quite a bit of work but the money is rewarding.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@I expect our profits to begin to come in again soon with the Nautical Guild sailing again. No doubt many lands are eager to get their hands on our fine timber.@");
		say("@Even if the guild was still refusing to sail I would be content. As I mentioned I care more about the people than the profit.@");
	}
	else
	{
		say("@Though lately that is not the case. With the Nautical Guild refusing to sail it is difficult to get our timbers throughout the land.@");
		say("@Despite this setback we still make enough that we do not need to worry about money. As I mentioned I care more about the people than the profit.@");
	}
	
}

}
}

