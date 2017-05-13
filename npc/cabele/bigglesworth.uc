/*
Bigglesworth, cook and stuff of the evil castle guy
*/

void BigglesworthAgataConvo()
{

UI_push_answers();

converse(["Deserve", "Punishment", "Nevermind"])
{

	case "Nevermind" (remove):
	say("He nods his head");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Deserve" (remove):
	say("@Agata was not nearly as cruel... I mean loving, as milord. She would not treat us servants as milord treated us.@");
	say("He looks you in the eye with extreme fear. @She dared to question milord.@");
	add(["Servants"]);
	
	case "Servants" (remove):
	say("@I am sorry. I meant servant. Milord feels only I am worthy to serve him... for now.@");
	
	case "Punishment" (remove):
	say("He begins to cry. @Poor Agata. Milord took him to his chamber and violated her in so many ways. I could hear her begging him to stop but he simply would not.@");
	say("@When he finally finished with her in his chambers he took her to his laboratory where I can only imagine the magic he used upon her.@");
	say("@After he was finished with her in his laboratory he took her to a hidden area of the castle which even I do not even know how to get into.@");
	say("He lowers his head. @I do not know what he did to her in there but I could still hear her screams for months on end. She was slowly driven mad by what milord did to her.@");
	add(["Chamber", "Laboratory", "Hidden area", "Madness"]);
	
	case "Chamber" (remove):
	say("@I dare not speak of one of his most private areas.@");
	
	case "Laboratory" (remove):
	say("He shutters. @I dare not speak of the messes I have had to clean up from milords laboratory. He does such cruel experiments upon those who do not submit to him.@");
	say("@Such horrible messes, such horrible sites I have been witness to in that room.@");
	
	case "Hidden area" (remove):
	say("@Milord has an area of the castle that only he knows how to enter. He does not even let me know where it is so I can clean it.@");
	say("@I know it to exist somewhere within the southwest portion of the castle... the horrible screams I have heard come from it. They are so much worse than those from his laboratory.@");
	
	case "Madness" (remove):
	say("@Lady Agata was a powerful sorceress but she was no match for milord. He beat her down, tortured her in ways I cannot even begin to imagine. He tortured her for so very long.@");
	say("@I could hear her slowly fall victim to madness at the hands of milord. One day I simply stopped hearing the screams. I am certain at that time milord finally put an end to her life.@");
	
}

}

void BigglesworthExcuseMe()
{

UI_push_answers();

converse(["Excuse me?"])
{
	case "Excuse me?" (remove):
	say("@I meant exactly as I said to you. Do not continue to ask about it. I have already said too much and I am as expendable as you are to milord.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}

void Bigglesworth object#(0x4bb) ()
{

	
var bark = "Do not bother milord";
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
				UI_item_say(item, "Dum dum dum");
			else if (n == 2)
				UI_item_say(item, "I serve to please");
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
        call Bigglesworth, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

UI_show_npc_face(item);

if(UI_get_item_flag(item, MET))
{
	say("@Why must you continue to pester me? Milord will not wait for me to get these chores done.@");
}
else
{
	say("@Please be brief. I have much work to do for milord.@");
	add(["Name"]);
}

add(["Job", "Bye"]);

converse([])
{

	case "Bye" (remove):
	say("@Do not dilly-dally. Milord has a low tolerance for such things.@");
	break;
	
	case "Name" (remove):
	say("The man looks at you nonchalantly. @If you must know am Bigglesworth.@");
	
	case "Job" (remove):
	say("@I do not know why I choose to indulge someone who wanders appears to be wandering around milords castle but I shall. I am the cook and servant of our Lord Thanatos.@");
	say("His composure completely changes to a cowering mass of a man. @It is such a wonderful experience to serve milord. I could not ask for a better lot in life. I live to please milord.@");
	add(["Lord", "Cook"]);	
	
	case "Lord" (remove):
	say("A large, almost fake smiles appears on his face. @Lord Thanatos is a wonderful but harsh ruler. He does reward those who serve him well.@");
	say("@I am so happy to be able to serve milord.@");
	add(["Harsh ruler", "Reward"]);
	
	case "Harsh ruler" (remove):
	say("@I did not mean that! I simply mispoke. Lord Thanatos is a lovely and kind ruler. I am so very lucky to be able to serve such a man.@");
	say("He shakes his head frantically. @Indeed, such a fine ruler. I simply wish I could serve him forever.@");
	
	case "Reward" (remove):
	say("@Lord Thanatos rewards those who are loyal to him. Never shall those who are loyal to him have anything to fear. Not at all. All those who are loyal are safe.@");
	add(["Safe"]);
	
	case "Safe" (remove):
	say("@All who serve milord have nothing to fear. Those who question him will fear for their lives. Those who milord punishes deserve it. Milord can do no wrong.@");
	add(["Punish"]);
	
	case "Punish" (remove):
	say("The man almost completely breaks down. @No, please do not make milord punish me. I have done nothing wrong. I love milord. Please, I beg of you, I have done nothing wrong!@");
	
	case "Cook" (remove):
	say("@I prepare the food for both milord and his lady. They do enjoy a fresh meal. I prepare for them only the finest meals. Milord and his lady only deserve the best.@");
	say("The man regains his composure for a brief moment and whispers in your ear. @Do not anger milord or his lady or they shall have me prepare you for dinner.@");
	BigglesworthExcuseMe(); // The expendable answer comes from this function regardless
	add(["Lady", "Expendable"]);
	
	case "Lady" (remove):
	say("@Lady Kaie is milords current lover. I do believe he will keep this one as she is so obidient and will not question a single thing he says.@");
	say("He mutters under his breath. @Unlike poor Agata.@");
	add(["Agata"]);
	
	case "Agata" (remove):
	say("He lowers his head and is silent for a moment. @Agata was a caring woman whom milord took to be his lover. She did not deserve what milord did to her.@");
	BigglesworthAgataConvo();
	
	case "Expendable" (remove):
	say("@Milord will not have a second thought at removing either of us from this world should he feel we are unworthy.@");
	
}

}


}