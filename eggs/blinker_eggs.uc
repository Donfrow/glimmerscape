void Blinker_Bind ()
{
    var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
    var loc = UI_get_object_position(AVATAR);

    var bark = "The blinker vibrates...";

    if (blinker > 0)
    {
        UI_sprite_effect(56, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(84);
        script AVATAR
        {
            say bark;
        }
    }
}
void Visited_Castle object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if(blinker > 0)
{
	if(gflags[VISITED_CASTLE])
	{
	}
	else
	{
		gflags[VISITED_CASTLE] = true;
		Blinker_Bind();
	}
}
}

void Visited_Rosendale object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if(blinker > 0)
{
	if(gflags[VISITED_ROSENDALE])
	{
	}
	else
	{
		gflags[VISITED_ROSENDALE] = true;
		Blinker_Bind();
	}
}
}

void Visited_New_Ophidia object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if(blinker > 0)
{
	if(gflags[VISITED_NEW_OPHIDIA])
	{
	}
	else
	{
		gflags[VISITED_NEW_OPHIDIA] = true;
		Blinker_Bind();
	}
}
}

void Visited_Northern_Forest object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if(blinker > 0)
{
	if(gflags[VISITED_NORTHERN_FOREST])
	{
	}
	else
	{
		gflags[VISITED_NORTHERN_FOREST] = true;
		Blinker_Bind();
	}
}
}

void Visisted_Hensall object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if(blinker > 0)
{
	if(gflags[VISITED_HENSALL])
	{
	}
	else
	{
		gflags[VISITED_HENSALL] = true;
		Blinker_Bind();
	}
}
}

void Visited_Goblins object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if(blinker > 0)
{
	if(gflags[VISITED_GOBLIN_CAMP])
	{
	}
	else
	{
		gflags[VISITED_GOBLIN_CAMP] = true;
		Blinker_Bind();
	}
}
}

void Visited_DeathSquall object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if(blinker >0)
{
	if(gflags[VISITED_DEATHSQUALL])
	{
	}
	else
	{
		gflags[VISITED_DEATHSQUALL] = true;
		Blinker_Bind();
	}
}
}

void Visited_Dewtopia object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if (blinker>0)
{
	if(gflags[VISITED_DEWTOPIA])
	{
	}
	else
	{
		gflags[VISITED_DEWTOPIA] = true;
		Blinker_Bind();
	}
}
}

void Visited_Brentonia object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if (blinker > 0)
{
	if(gflags[VISITED_BRENTONIA])
	{
	}
	else
	{
		gflags[VISITED_BRENTONIA] = true;
		Blinker_Bind();
	}
}
}

void Visited_Solusek object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if (blinker > 0)
{
	if(gflags[VISITED_SOLUSEK])
	{
	}
	else
	{
		gflags[VISITED_SOLUSEK] = true;
		Blinker_Bind();
	}
}
}

void Visited_Kintore object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if (blinker > 0)
{
	if(gflags[VISITED_KINTORE])
	{
	}
	else
	{
		gflags[VISITED_KINTORE] = true;
		Blinker_Bind();
	}
}
}

void Visited_Medina object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if (blinker > 0)
{
	if(gflags[VISITED_MEDINA])
	{
	}
	else
	{
		gflags[VISITED_MEDINA] = true;
		Blinker_Bind();
	}
}
}

void Visited_Cambray object#()()
{
var blinker = UI_count_objects(PARTY, BLINKER, ANY, ANY);
if (blinker > 0)
{
	if(gflags[VISITED_CAMBRAY])
	{
	}
	else
	{
		gflags[VISITED_CAMBRAY] = true;
		Blinker_Bind();
	}
}
}