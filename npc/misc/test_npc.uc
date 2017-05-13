/*
Test_NPC
*/

void AvatarTest()
{
AVATAR.say("Test");
}

void Test_NPC object#(0x58a) ()
	{

if(event == DOUBLECLICK)
{
UI_si_path_run_usecode(-394, [1170, 1904, 0],SCRIPTED,  -394, AvatarTest, 0);
}

}

