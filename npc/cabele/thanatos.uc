/*
Thanatos, cannibal ruler on the island
*/

void ThanatoseVisitor()
{

UI_push_answers();

converse(["Visitor", "Loyal subject"])
{

	case "Visitor" (remove):
	say("He nods his head. @But of course you are. I have no doubt in my mind you are looking to become a loyal subject of my kingdom.@");
	say("@As such is the case I shall forgive your foolishness.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Loyal subject" (remove):
	say("He shakes his head. @I must have damaged your mind so much that you are a drooling fool. I suppose I can forgive you as you at least still remember who your lord is.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Thanatos object#(0x453) ()
	{

var bark = "Another loyal subject";
var bark_intro = "Hail";
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

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
				UI_item_say(item, "Hmmmm ahhhh");
			else if (n == 2)
				UI_item_say(item, "Delicious");
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
        call Thanatos, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

UI_show_npc_face(item);

if(UI_get_item_flag(item, MET))
{
	say("@It is good to see my loyal subject continues to seek guidance from his lord.@");

}
else
{
	say("@Another loyal subject has come to meet his great lord. Your lord greets you my loyal subject.@");
	add(["Name"]);
}

add(["Job", "Bye"]);

converse([])
{

	case "Bye" (remove):
	say("@Continue to be a loyal subject and your great lord shall reward you with your life.@");
	break;
	
	case "Name" (remove):
	say("The man shakes his head. @Have you forgotten who you serve already? Lord Thanatos, and do not forget again lest you end up on my bad side.@");
	
	case "Job" (remove):
	say("@I am the Lord of Cabele and rightful heir to all the glory that comes with it. You should know this as one of my loyal subjects... or are you merely a visitor to my kingdom?@");
	ThanatoseVisitor();
	add(["Cabele", "Lord", "Heir"]);
	
	case "Cabele" (remove):
	say("@You should know that my great kingdom rises out of the water on the island of Cabele. It is where all greatness stems from, and it is where my greatness does as well.@");
	say("He shakes his head and mutters. @I must have done too many experiments on this one.@");
	
	case "Lord" (remove):
	say("@I am the lord of all those who come to my kingdom. All must bow down and accept my greatness or face being sent to the stocks for their insolence.@");
	add(["Kingdom"]);
	
	case "Kingdom" (remove):
	say("@My kingdom is already greater than all those of Desporia. All shall soon know the greatness of the Kingdom of Cabele and the greatness of its ruler Lord Thanaos.@");
	say("A smug grin appears on his face. @No doubt all the women will soon be clamouring to be next to their lord to be his lady, his queen.@");
	add(["Lady"]);
	
	case "Lady" (remove):
	if(female)
	{
		say("He runs his hand across your cheek. @I know you beg to be with me. I know your body shakes at the sight of your great lord however Kaie is already my lady, my queen.@");
		say("The mans tongue licks his lips. @That does not mean I will not choose to take you one day my lovely little olive.@");
	}
	else
	{
		say("@Kaie is my lady, my chosen queen. She is such a loyal woman. She is so excellent to her lord.@");
	}
	add(["Kaie"]);
	
	case "Kaie" (remove):
	say("@Lady Kaie is such a loyal woman. She would not dare question her master, her lord. She will do anything her lord commands of her. She will not dare to challenge any of my desires.@");
	add(["Question"]);
	
	case "Question" (remove):
	if(female)
	{
		say("He chuckes. @I will forgive your questioning of my queen. I know that you wish you could be the one I ravage again and again.@");
	}
	else
	{
		say("He snarls at you. @You would not be questioning my choice of ladys now would you? No... you would not be.@");
	}
	
	case "Heir" (remove):
	say("@Such a lovely subject, always wanting to hear the tale of their greatest leaders. Alas, I do not have the time to tell you the great tale of my destiny at this time.@");
	say("The man looks into your eyes. @I know you will not forget that I am destined to inherit the entire lands of Desporia. You will be glad that you did not resist me when that times arrives.@");
}


} // End event talk

}