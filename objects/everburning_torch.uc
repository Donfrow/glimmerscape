void Kill_Ice_Witch object#()()
{
	UI_kill_npc(-392);
}

void everburning_torch shape#(1489)()
{
if(event == DOUBLECLICK)
{
	if(gflags[ZAO_PAN_FINAL_TEST_CONT])
	{
		var target = UI_click_on_item();
		var object = target[1];
		var name = UI_get_npc_name(target[1]);
		if(name == "The Ice Witch")
		{
			script -392
			{
				actor frame STAND;
				wait 2;
				say "What is that...";
				wait 10;
				say "Aieee it burns!";
				actor frame KNEEL;
				wait 2;
				actor frame LIE;
				wait 2;
				call Kill_Ice_Witch;
			}
		}
	}
	else
	{
		AVATAR.say("@It just burns and burns!@");
	}
}
}

