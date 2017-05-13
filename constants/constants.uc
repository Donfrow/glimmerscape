



enum axes
{
	X = 1,	//horizontal axis (numbered from west to east)
	Y = 2,	//vertical axis (numbered from north to south)
	Z = 3	//lift axis (numbered from ground to sky)
};

enum tf // declaring true and false
{
	TRUE = 15,
	FALSE = 8
};

enum directions
{
    NORTH = 0,
    EAST = 2,
    SOUTH = 4,
    WEST = 6
};

enum factions
{
    FRIENDLY = 1,
    NEUTRAL = 0,
    HOSTILE = 2

};

enum stats
{
    STRENGTH     = 0,
    DEXTERITY    = 1,
    INTELLIGENCE = 2,
    HEALTH       = 3,
    COMBAT       = 4,
    MANA         = 5,
    MAX_MANA     = 6,
    TRAINING     = 7,
    EXPERIENCE   = 8,
    FOODLEVEL    = 9
};

enum npc_frames
{
	STAND		= 0,
	WALK_1		= 1,
	WALK_2		= 2,

	USE			= 3,	//general use motion

	SWING_1		= 4,	//start of one-handed swing, arm up over shoulder
	SWING_2		= 5,	//middle of one-handed swing, arm out to the side
	SWING_3 	= 6,	//end of one-handed swing, arm out to the front

	SWING_2H_1 	= 7,	//start of 2-handed swing, arms up over shoulder
	SWING_2H_2 	= 8,	//middle of 2-handed swing, arms out to the side
	SWING_2H_3	= 9,	//end of 2-handed swing, arms out to the front

	SIT			= 10,	//sitting down
	LEAN		= 11,	//leaning down
	KNEEL		= 12,	//kneeling on one knee
	LIE			= 13,	//lying down
	CAST_1		= 14,	//both arms high in the air (casting motion)
	CAST_2		= 15	//both arms stretched out (casting motion)
};



enum events
{
	PROXIMITY		= 0,	//Object is on-screen or nearby
							//This is called repeatedly, with a random delay between each call
	DOUBLECLICK		= 1,	//Object is double-clicked on
	SCRIPTED		= 2,	//Function is called from inside a sript{} block (very common)
	EGG				= 3,	//Object is an egg that just hatched (triggered by egg activation conditions)
	WEAPON			= 4,	//Object was wielded and 'swung' in combat
							//This is mainly used with 'weapon-like' objects - e.g. smokebombs and fishing rods - that have more advanced 'attack' behaviour.

	READIED			= 5,	//Object was worn or readied in inventory - used by items like the Ring of Invisibility
	UNREADIED		= 6,	//Object was taken off or put away in inventory

	DEATH			= 7,	//NPC has just been killed (SI-only)
	STARTED_TALKING	= 9,	//NPC starts conversation with you (has TALK schedule and has reached the Avatar)
							//This is SI-only - BG uses event 1 for this, both for conversations triggered by doubleclick and by the TALK schedule

	//The following events are set manually in usecode, which means they're arbitrary programmer conventions rather than recognised game states.
	PATH_SUCCESS	= 10,	//Set with calls to UI_path_run_usecode, to indicate a successful pathfind to the target object
	PATH_FAILURE	= 11	//Set with calls to UI_set_path_failure, to indicate an interrupted pathfind (e.g. when the player moves the Avatar manually)
	//In particular, I switched to SI values for these events because si_tournament flag
	//also works in BG now
};

enum schedules
{
	IN_COMBAT		= 0,	//renamed to not conflict with COMBAT, the NPC stat property.
	PACE_HORIZONTAL	= 1,	//Walk horizontally until you hit a wall, then turn around. (Patrolling on the cheap.)
	PACE_VERTICAL	= 2,	//Same as above, but vertically.
	TALK			= 3,	//NPC runs to the Avatar to talk to them. When they get within a certain distance of where the Avatar was when this schedule was set, a doubleclick event is triggered on the NPC. At this point the schedule must be changed.
	DANCE			= 4,
	EAT				= 5,
	FARM			= 6,	//Waves farm implements around.
	TEND_SHOP		= 7,	//This is really just a more specific version of LOITER, used for narrowing down schedule barks.
							//See BAKE, SEW and BLACKSMITH for more specific examples of shop behaviour.
	MINE			= 8,
	MINER			= 8,
	HOUND			= 9,
	STANDTHERE		= 10,	//renamed to not conflict with STAND, the NPC animation frame
	LOITER			= 11,	//Hangs around a certain point, within 10 units or so
	WANDER			= 12,	//Roams nearby a certain point (as much as a 320x200 screen away)
	BLACKSMITH		= 13,
	SLEEP			= 14,
	WAIT			= 15,	//Similar to STAND, except that they will never leave the WAIT schedule until it is manually changed:
							//their preset schedule list is overridden.
	MAJOR_SIT		= 16,
	GRAZE			= 17,
	BAKE			= 18,
	SEW				= 19,
	SHY				= 20,	//Tries to keep out of the Avatar's way - will half-heartedly flee until out of a certain range.
	LAB				= 21,
	THIEF			= 22,	//??
	WAITER			= 23,
	SPECIAL			= 24,	//??
	KID_GAMES		= 25,	//Tag! Thou art it! And so forth.
	TAG				= 25,
	EAT_AT_INN		= 26,	//same as Eat, only with different barks.
	DUEL			= 27,
	SPAR			= 27,
	PREACH			= 28,
	PATROL			= 29,	//This tells the AI to follow a particular set of patrol waypoints
	DESK_WORK		= 30,
	FOLLOW_AVATAR	= 31	//That most noble of pursuits. Like WAIT, this completely overrides the NPC's schedule list.
};


enum party_members
{
	PARTY		= -357	//Used by several intrinsics (e.g. UI_count_objects) that would otherwise take a single NPC
						//Not supported by several other intrinsics that you'd really like it to (e.g. UI_get_cont_items)

};
enum inv_slots
{
	RIGHT_HAND		= 1,
	WEAPON_HAND		= 1,
	BOTH_HANDS		= 1,	//For two-handed items

	LEFT_HAND		= 2,
	SHIELD_HAND		= 2,
	OFF_HAND		= 2,

	NECK			= 3,
	CLOAK			= 3,

	RIGHT_FINGER	= 6,
	LEFT_FINGER		= 7,
	GLOVES			= 6,

	HEAD			= 9,
	BELT			= 11
};
enum misc
{
    MASK_NONE = 0x00,
    MASK_NPC = 0x04
};


// FLAGS

enum flags
{
    INVISIBLE             = 0,
    ASLEEP              = 1,
    CHARMED               = 2,
    CURSED              = 3,
    DEAD                  = 4,
    IN_PARTY            = 6,
    PARALYZED             = 7,
    PARALYSED           = 7,
    POISONED              = 8,
    PROTECTION          = 9,
    ON_MOVING_BARGE       = 10,
    OKAY_TO_TAKE        = 11,
    MIGHT                 = 12,
    NO_SPELL_CASTING    = 13,
    CANT_DIE              = 14,
    DANCING             = 15,
    DONT_MOVE             = 16,
    BG_DONT_RENDER      = 16,
    SI_ON_MOVING_BARGE    = 17,
    TEMPORARY           = 18,
    SAILOR                = 20,
    OKAY_TO_LAND        = 21,
    BG_DONT_MOVE          = 22,
    DONT_RENDER         = 22,
    IN_DUNGEON            = 23,
    CONFUSED            = 25,
    IN_MOTION             = 26,
    MET                 = 28,
    SI_TOURNAMENT         = 29,
    SI_ZOMBIE           = 30,
    POLYMORPH             = 32,
    TATTOOED            = 33,
    READ                  = 34,
    PETRA               = 35,
    FREEZE                = 37,
    NAKED               = 38,
	MILKED = 39,
	BLINKER_DISABLED = 40
};

// Misc NPC from early code
enum npc
{

BRUNT = -250, // Royal Mint Guard
BRANA = -252, // Lady Brana - Dew's Slut
GETH = -283, // Bandit Leader
GRUP = -282, // Goblin
CAMILLE = -254, // Camille the bandit spy in Castle Dew
SANALA = -292 // Sanala the innocent cook
};

/*

Shapes

*/
enum shapes
{
    MAGIC_HELM = 383,
	DONALS_BP = 419,
	IGONS_HAMMER = 508,
    CRESTED_HELM = 542,
    CURVED_HEATER = 545,
    MAGIC_SWORD = 547,
    LIGHTNING_WHIP = 549,
    FIRE_SWORD = 551,
    MAGIC_AXE = 552,
    PLATE_ARMOR = 573,
    PLATE_LEGS = 576,
    GAUNTLETS = 580,
    BOOTS = 587,
    AXE = 601,
    MAGIC_BOW = 606,
    BOW = 597,
    ONE_HAND_SWORD = 599,
    WHIP = 622,
	SHAPE_GOLD = 644,
	SHAPE_GOLD_NUGGET = 645,
	SHAPE_GOLD_BAR = 646,
 	KEY = 641,
 	MAGIC_SHIELD = 663,
 	MAGIC_ARMOR = 666,
 	MAGIC_LEGS = 686,
 	STOCKS = 708,
	MAGIC_SCROLL = 715,
 	MALE_GOBLIN_SHAPE = 725,
 	FEMALE_GOBLIN_SHAPE = 744,
 	MAGIC_GAUNTLETS = 835,
 	REAGENTS = 842,
 	ODD_METAL = 1118,
    WISDOM_EYE = 1158,

 	VORTEX_CUBE = 1262,
	ORB_OF_PERSUASION = 1376,
	ORB_OF_TRANSFIGURATION = 1377,
	ORB_OF_CHAOS = 1380,
	ORB_OF_INFINITY = 1379,
	ORB_OF_SOULS = 1378,
	ORB_OF_FOCUS = 1381,
	ANCIENT_SCROLL = 1383,
	MINING_CO_SEAK = 1384,
	GOOD_SCROLL = 797,
	MOLTEN_CLOAK = 1370,
	AKAKOTHEN_SHAPE = 1387,
	HAMMER_OF_DIVINITY = 1373,
	LENS = 1374,
	BREAKABLE_LOCKPICK = 1375,
	SPENT_ORB = 1382,
	FLUX_CAPACITOR = 1385,

	FOCUSED_ORB_PERSUASION = 1386,
    LECHUCKS_BEARD = 1372,
    FIERY_GEM = 1371,
    FIERY_NECKLACE = 1390,
    RING = 1391,
   	CHARGED_FLUX_CAPACITOR = 1392,
   	CONCOCTION = 1394,
   	TRAP_DOOR = 1395,
   	TRAP_DOOR1 = 1396,
   	LADDER = 1397,
   	LADDER_TOP = 1399,
   	BUCKET_OF_NAILS = 1401,
   	PLANT_TOP = 1402,
   	GLOWING_ORB = 1405,
   	BEGGAR_POUCH = 1407,
   	WEAKENED_SOUL_ORB = 1411,
   	GLASS_COUNTER = 1413,
   	LENSE_PIECE = 1415,
   	SWIRLING_MASS = 1416,
   	CHARRED_REMAINS = 1417,
   	WARPED_WOOD = 1418,
    BLINKER = 1419,
    CELLAR_DOOR = 1423,
    CELLAR_DOOR_OPEN = 1424,
    CUTTABLE_TREE = 1425,
    WOODCUTTERS_AXE = 1426,
    ZULITH_WINE = 1427,
    ROOFIE = 1428,
    DETONATOR = 1429,
    DETONATOR_EXPLOSIVES = 1430,
    DISENCHANTING_STONE = 1434,
    STOCKADE_MAN = 1435,
    WORDS_OF_POWER = 1436,
	WHITE_DRAGON_SCALE = 1439,
	WHITE_DRAGONSCALE_CLOAK = 1440,
	SILVERLEAF_LOG = 1442,
	GEM_OF_STR = 1448,
	FROZEN_DOOR = 1449,
	SEXTANT_OF_FATE = 1451,
	SLIPPERS_OF_FATE = 1452,
	ZAO_PAN_HEADBAND = 1453,
	GAVEL_OF_FATE = 1456,
	HENSALL_MEDALLION = 1464,
	TALZEN_LOCKET = 1471,
	BOUQUET = 1478,
	LAB_SUPPLIES = 1479,
	GOLDEN_STATUE = 1480,
	MILK_CANISTER = 1481,
	DONALS_CORRUPTED_BP = 1483,
	SCORCHED_CROWN = 1487,
	EVERBURNING_TORCH = 1489,
	SIREN_SHELL = 1492,
	DEEPSEA_HARPOON = 1493,
	SHATTERED_ORB = 1496,
	HEADS = 1500,
	DUST_OF_THE_FOREST = 1512,
	WOOD_DUST,
	BODY_PARTS = 799,
	PICK = 624,
	BOOK_STATUE = 1514,
	MR_FRUMPS = 1515,
	MINING_SUPPLIES = 1516,
	BANDIT_KEY = 1517,
	SCROLL1 = 797
};


/*

Constant Flags for gflags

*/
const int AVATAR = -356;
const int ANY = -359;
//const int IN_COMBAT = 0;

const int FRAME_ANY = -359;
const int QUALITY_ANY = -359;


//Sprite effects
const int ABIG_BLAST= 1;
const int CLOUDS= 3;
const int MEDIUM_BLAST= 4;
const int SMALL_BLAST= 5;
const int TELEPORT= 7;
const int DEATH_VORTEX= 8;
const int POOF= 9;
const int FIREWORKS= 12;
const int GREEN_BUBBLES= 13;
const int CIRCLE_BARRIER= 15;
const int LIGHTNING= 17;
const int BLUE_BEADS= 18;
const int PURPLE_BUBBLES= 21;
const int MUSIC	= 24;
const int BLUE_LIGHTNING = 40;
const int RED_LIGHTNING = 41;
const int YELLOW_LIGHTNING = 42;
const int GREEN_LIGHTNING = 43;



// BLINKER FLAGS - 100-120;


const int VISITED_CASTLE = 100; // set in eggs/blinker_eggs.uc
const int VISITED_DEATHSQUALL = 101; // set in eggs/blinker_eggs.uc
const int VISITED_DEWTOPIA = 102; // set in eggs/blinker_eggs.uc
const int VISITED_BRENTONIA = 103; //set in eggs/blinker_eggs.uc
const int VISITED_SOLUSEK = 104; //set in eggs/blinker_eggs.uc
const int VISITED_KINTORE = 105; //set in eggs/blinker_eggs.uc
const int VISITED_MEDINA = 106; //set in eggs/blinker_eggs.uc
const int VISITED_CAMBRAY = 107; //set in eggs/blinker_eggs.uc
const int VISITED_ROSENDALE = 108; //set in eggs/blinker_eggs.uc
const int VISITED_NEW_OPHIDIA = 109; //set in eggs/blinker_eggs.uc
const int VISITED_HENSALL = 110; //set in eggs/blinker_eggs.uc
const int VISITED_GOBLIN_CAMP = 1325; //set in eggs/blinker_eggs.uc -- formerly 111, updated just in case a conflict due to report it wasn't firing
const int VISITED_NORTHERN_FOREST = 112; //set in eggs/blinker_eggs.uc

// DUG UP GRAVE ITEM FLAGS - 121-150;
const int DUG_GRAVE_1 = 121;
const int DUG_GRAVE_2 = 122;
const int DUG_GRAVE_3 = 123;
const int DUG_GRAVE_4 = 124;
const int DUG_GRAVE_5 = 125;
const int DUG_GRAVE_6 = 126;
const int DUG_GRAVE_7 = 127;
const int DUG_GRAVE_8 = 128;
const int DUG_GRAVE_9 = 129;
const int DUG_GRAVE_10 = 130;


//151-199 UNUSED

//Learn to play the lute 200-215
const int LUTE_LEVEL_1 = 200; // set in npc/dewtopia/florendo.uc
const int LUTE_LEVEL_2 = 201; // set in npc/dewtopia/florendo.uc
const int LUTE_LEVEL_3 = 202; // set in npc/dewtopia/florendo.uc
const int LUTE_LEVEL_4 = 203; // set in npc/dewtopia/florendo.uc
const int LUTE_LEVEL_5 = 204; // set in npc/dewtopia/florendo.uc
const int LUTE_LEVEL_6 = 205; // set in npc/dewtopia/florendo.uc
const int LEARNING_LUTE = 206; // set in npc/dewtopia/florendo.uc
const int PLAY_FOR_WENDILL = 207; // set in npc/northernforest/wendill.uc
const int PLAYED_FOR_WENDILL = 208; 
const int PLAYED_TERRIBLE = 209;
const int PLAYED_TERRIBLE_KARMA = 210;
const int PLAYED_MEDIOCRE = 211;
const int PLAYED_MEDIOCRE_KARMA = 212;
const int PLAYED_GOOD = 213;
const int PLAYED_GOOD_KARMA = 214;
const int PLAYED_GREAT = 215;
const int PLAYED_GREAT_KARMA = 216;
const int TELL_WENDILL = 217; //set in objects/lute.uc

//218-229 UNUSED

/*
Misc quest and such constants for gflags in Cotton Cove 230-300
*/

const int ROOF_FIXED1 = 230;  // Fix the mayor roof quest in cotton cove
const int ROOF_FIXED2 = 231;  // Fix the mayor roof quest in cotton cove
const int ROOF_FIXED3 = 232;  // Fix the mayor roof quest in cotton cove
const int ROOF_FIXED4 = 233;
const int ROOF_FIXED5 = 234;
const int ROOF_IS_FIXED = 235; // after all roof tiles have been fixed
const int PAID_FOR_ROOF = 236; // has been paid
const int COVE_HARPY_DEAD = 237; // after killing the one harpy in cotton cove cave
const int COVE_PAID_FOR_HARPY = 238; // paid for killing the harpy's
const int CHIMNEY_CLEANED = 239; // cleaned the chimney on garth's house
const int PAID_DEBT = 240; // paid the debt to the guard so you can now pass
const int READ_DEWBERT_SCROLL = 241; // Read lord dews scroll in his room about columnas kid being his
const int TALKED_TO_COLUMNA = 242; // talked to columna and realize about the baby
const int TALKED_TO_GARTH = 243; // talked to garth about the son - used so you can't get constant int upgrades
const int MEAN_TO_BUGSY = 244; // mean to bugsy so he won't talk to you again. 


	//COTTON COVE PROPOSAL SIGNATURES YAY OR NAY

	const int CATHERINE_YES = 250;
	const int CATHERINE_NO = 251;
	const int ZULITH_YES = 252;
	const int ZULITH_NO = 253;
	const int COLUMNA_YES = 254;
	const int COLUMNA_NO = 255;
	const int GARTH_YES = 256;
	const int GARTH_NO = 257;
	const int GERTH_YES = 258;
	const int GERTH_NO = 259;
	const int OLON_YES = 260;
	const int OLON_NO = 261;
	const int BRAWL_YES = 262;
	const int BRAWL_NO = 263;

//Complete the quest signatures for the proposal

const int GET_SIGS = 264;
const int PROPOSAL_PASSED = 265;
const int ENOUGH_SIGS = 266;
const int PROPOSAL_FAILED = 267;
const int TOLD_LEON = 268;
const int RETURNED_KITE = 269;
const int FAKE_RESOLUTION_PASSED = 270;
	
	//HELP ANALYN FIND HER HUSBAND
	const int RACK_MAN_GOOD = 271; // set in torture_rack.uc
	const int RACK_MAN_BAD = 272; // set in torture_rack.uc
	const int HELP_ANNALYN = 273; // set in npc/annalyn.uc
	const int DEFEATED_ANNALYN_WITCH = 274; // set in eggs/quest eggs/cotton cove/lady_dorsy_eggs.uc
	const int GOT_KEY_OUT = 275; // set in eggs/quest eggs/cotton cove/lady_dorsy_eggs.uc
	const int MEAN_TO_RACKMAN = 276; // set in objects/torture_rack.uc
	const int RACKMAN_DEAD = 277; // set in objects/torture_rack.uc
	



// Esmerelda fortune teller constants 301-315

const int MET_MORGHRIM = 301; // set in npc/misc/morghrim.uc
const int GYPSY1 = 302;
const int GAVE_GLOWING_ORB = 303;


//316-347 UNUSED


// Dewtopian Quests 351-450
const int KILL_DYSON_TEXT = 348; // set in npc/dewtopia/hectar.uc
const int GOT_RYDAN_INFO = 349; //set in npc/dewtopia/rydan.uc
const int SLAY_BANDITS = 350;
const int ACCUSED = 351;
const int SLAY_GRUPLINORT = 352;
const int GETH_SLAIN = 353;
const int GRUPLINORT_SLAIN = 354;
const int KILL_HECTAR_SPEACH = 355;
const int RYDAN_INFO = 356; // set in npc/dewtopia/rydan.uc
const int FED_BEGGER = 357;

	// Brunts Exilir Quests
	const int POTION_QUEST = 358;
	const int HAS_POTION = 359; // set in npc/dewtopia/bedic.uc
	const int KILL_POTION_QUEST = 360;
	const int BEDIC_INSULT = 361; // set in npc/dewtopia/bedic.uc
	const int KILL_BRUNT = 362;
	const int GAVE_BRUNT_POTION = 363; // set in npc/dewtopia/brunt.uc


	
const int GETH_AND_GRUP_DEAD = 364;
const int KILL_SLAY_QUEST_DIALOG = 365;
const int ENTER_SUGAR_CAVES = 366;
const int KNIGHT = 367; // KNIGHT OF DEWTOPIA
const int GOBLIN_SCROLL = 368;
const int GOBLIN_INTELLIGENCE = 369;
const int GOBLIN_BASE = 370; // set in npc/dewtopia/hectar.uc
const int GOBLINS_DEFEATED = 371; // set in npc/dewtopia/hectar.uc


	//Salana innocence quest / catch Camille

	const int CAMILLE_ACCUSED = 372;
	const int OPERATIVE_IN_CASTLE = 373;
	const int BRUNT_QUESTIONED = 374; // set in npc/dewtopia/brunt.uc
	const int RUMORS = 375; // set in npc/dewtopia/sanala.uc and one of the dewtopian farmer UC
	const int RUMORS1 = 376; // set in npc/dewtopia/hectar.uc
	const int DOG_BARK = 377;
	const int CAMILLE_CAUGHT = 378;
	const int PROOF_OF_CAMILLE = 379;

	//Sugar caves breakout quest

	const int GET_POWDER = 380;
	const int MAKE_POWDER = 381;
	const int HAVE_POWDER = 382;
	const int MET_BROTHER = 383;
	const int BROTHER_DEAD = 384;


	//Jesse Bains jail escape


	const int READ_JAIL_BREAK_BOOK = 385;
	const int TALKED_TO_BAINS = 386; // bains.uc
	const int READ_INN_LOG = 387;
	const int ASK_WENDY = 388;


	// Provider bot logs - Subset of Jesse Bains Jail Escape

	const int READ_LOG = 389;
	const int TALK_TO_DYSON = 390;
	const int TALK_TO_YESSERM = 391; //set in npc/dewtopia/dyson
	const int DYSON_GUILTY = 392;
	const int KILLED_BAINS = 393;
	const int DYSON_ESCAPE = 394;
	const int DYSON_GUILTY1 = 395;
	const int STOP_DYSON_EGG = 396;
	const int BOT_JOINABLE = 397;


	//Investigate the ruined house and find Graethe - CAN ONLY FINISH IF YOU BECOME A KNIGHT OF DEWTOPIA

	const int READ_BOOK = 398;
	const int FIND_GRAETHE = 399;
	const int JESTER = 400;
	const int FOUND_GRAETHE = 401;
	const int READ_SCROLL = 402;
	const int LICHE = 403;
	const int HINT_TO_LOOK_AT_HOUSE = 404;
	const int RUFUS_JOIN = 405;
	const int RANNICK_JOIN = 406;


	
	// Prisoner Transport
	const int TRANSPORT_PRISONER_KILL_FLAG = 407; // set in prisoner_transport_start_egg
	const int TRANSPORT_PRISONER = 408; // set in prisoner_transport_functions
	const int GOOD_TRANSPORT_RELEASE = 409; // set in prisoner_transport_functions
	const int BAD_TRANSPORT_RELEASE = 410; // set in prisoner_transport_functions
	const int KILL_MARKUS = 411;
	
	
	
	
	
	
//451-500 UNUSED	
	
	
	
	
	
// QUEST - Free Sirenum from Toban 501-515

const int FREE_SIRENUM = 501;     // set in npc/melose.uc
const int MAKE_CONCOCTION_FLAG = 502; // set in npc/ensorcio.uc
const int TOBAN_FAIL_1 = 503; // set in npc/toban.uc
const int TOBAN_DRANK_WINE = 504; // set in npc/toban.uc
const int SIRENUM_FREE = 505; // set in npc/toban.uc
const int GET_MELOSE_REWARD = 506; // set in npc/toban.uc and set to false in npc/melose.uc
	
	
// 516-530 UNUSED
	
	
//QUEST - Cambray destruction - Lernaean the Hydra and Tressa 531-560

const int FIND_BLOODLINE = 531; // set in npc/lernaean
const int MARDIN_TALK = 532; // set in npc/cambray/beck.uc used in npc/cambray/mardin.uc
const int ZARKANE_DAUGHTER = 533; // set in npc/cambray/mardin used in npc/cambray/tressa.uc
const int ENTRY_TO_ZARKANE_HOUSE = 534; // set in npc/cambray/foucault.uc
const int ZARKANE_EXPERIMENT_INFO = 535; // set in the npc/lernaean.uc
const int CONVINCE_HYDRA = 536; // set in npc/cambray/foucault.uc
const int ANGRY_TRESSA = 537; // npc/cambray/tressa.uc
const int END_HYDRA = 538; // set in functions\quest functions\cambray\spectral_tower_egg_functions.uc
const int KNOCK_OUT_AVATAR_HYDRA = 539; // set in functions\quest functions\cambray\cambray_destruction_egg_functions.uc
const int HYDRA_NO_TALK = 540; // set in functions\quest functions\cambray\cambray_destruction_egg_functions.uc
const int NICE_TRESSA = 541; //set in functions\quest functions\cambray\cambray_destruction_egg_functions.uc
const int HYDRA_HYSTERIA = 542; // set in functions\quest functions\cambray\cambray_destruction_functions.uc
const int HYDRA_HYSTERIA_KILL_EGG = 544; // Set un functions\quest functions\cambray\cambray_destruction_functions.uc	
	

	

// 561-599 UNUSED
	
	
// QUEST - Hensall destruction and redemption 600-615

const int HENSALL_FREED = 600; // set in objects/shackled_man.uc
const int ON_HENSALL_QUEST = 601; // set in npc/hensall/walker.uc
const int BURY_HANNAH = 602; // set in npc/hensall/lee.uc
const int HANNAH_BURIED_GOOD = 603; // set in objects/baby_grave.uc
const int HANNAH_BURIED_BAD = 604; // set in objects/baby_grave.uc
const int HANNAH_BURIED = 605; // set in objects/baby_grave
const int HENSALL_AMBUSH = 606; // set in eggs/quest eggs/hensall/hensall_ambush.uc
	
	
// 616-630 UNUSED
	
	
//QUEST - Brentonia lines - Uncover the conspiracy and pay for the homeless shelter 631-650

const int BRENTONIA_SAVED = 631; // set somewhere in brentonia quest line
const int CONFIRM_SUSPICIONS_BRENTONIA = 632; // set in npc/brentonia/moniak.uc
const int BRENTONIA_TRAITORS_DEAD = 633; // set in eggs/quest eggs/brentonia_eggs.uc

const int FIND_BRENTONIAN_COURIER = 634; // set in npc/brentonia/lewis.uc
const int PAID_LEWIS_DEBT = 635; // set in npc/brentonia/telur.uc
const int PAID_RONAK_GOLD = 636; // set in npc/northern forest/ronak.uc
const int KILL_RONAK = 637; // set in npc/northern forest/ronak.uc
const int PAID_LEWIS_DEBT_CONVOKILLER = 638; // set in npc/brentonia/lewis.uc
	
	
//651-675 UNUSED
	
	
	
//MEDINA 676-690
    
const int LECHUCK_DEAD = 676; // After returning his living beard
const int GET_KEY_FROM_DEADEYE = 677; // set by an egg by going near lechuck's fortress
const int FREE_DEADEYE = 678;

const int GOT_KEY_FROM_DEADEYE = 679;   // Makes him mean to you after you get the key from him
const int FREE_DEADEYE_JAILOR_TEXT = 680; // set in npc/medina/deadeye.uc - makes it so freeing him is an option at the start without going through the text
const int FREE_DEADEYE_KILLFLAG = 681; // prevents you from getting another lockpick


const int BAD_MAYOR = 1323; //set in scrolls/goodscrolls.uc - formerly 682
const int KILL_VANNEL = 1324; // set in npc/medina/parrik.uc - formerly 683

const int LEARN_OF_SUNK_SHIP = 684; // set in scrolls/goodscroll
	
//  "The Depths" CONSTANTS
const int LEARN_OF_DEPTHS = 691; // set in books/good_books.uc
	
	
//NEW OPHIDIA 692-710
const int LEARN_OF_VOX = 692; // set in npc/new ophidia/axell.uc
const int VOX_DEAD = 693; //
const int VOX_DEBRIS_HOLE = 694; // set in functions\encounter functions\lady_vox_encounter_functions.uc
const int VOX_CLOAK = 695; // set in npc/new ophidia/axell.uc

// NEW OPHIDIA STD QUEST CONSTANTS

const int THEODORA_MEET = 696; // set in npc/new ophidia/theodora.uc
const int KILL_THEODORA_MEET = 697; // set in npc/new ophidia/theodora.uc
const int HAD_RELATIONS = 698; // set in npc/new ophidia/theodora.uc
const int KILL_THEODORA_EGG = 699;  // set in eggs/quest eggs/new ophidia/theodora_house_exit.uc
const int KILL_JAMES_TALK = 700; // set in npc/new ophidia/james.uc"
const int ACCUSED_THEODORA = 701; // set in npc/new ophidia/theodora.uc
	

//711-730 UNUSED	
	
	
//KINTORE 731-745

const int JOTH_WIFE = 731; // set in npc/kintore/joth.uc"
const int LEARNED_OF_JOTH_WIFE = 732; // set in eggs/quest eggs/kintore/kintore_eggs.uc
const int JOTH_LIE = 733; // set in npc/kintore/joth.uc
const int JOTH_TRUTH = 734; // set in npc/kintore/joth.uc
const int PAID_FOR_KARNAX = 735; // set in npc/kintore/gala.uc
const int MET_ASHELE = 736; // set in eggs/quest eggs/kintore/kintore_eggs.uc
	
	
	
	
//745-765 UNUSED
	
	
	
	
	
//ZAO PAN 766-785

const int ZAO_PAN_TEACH = 766; // set in npc/misc/zao_pan.uc
const int ZAO_PAN_RETRIEVE_CROWN = 767; // set in npc/misc/zao_pan.uc
const int ZAO_PAN_FINAL_TEST = 768; // set in npc/misc/zao_pan.uc
const int ZAO_PAN_TESTS_COMPLETE = 769; // set in npc/misc/zao_pan.uc
const int AVATAR_OF_WIND_APPEARED = 1322; // set in npc/misc/zao_pan.uc (formerly 770, removed for bug reason)
const int SPOKE_TO_DARSALIK = 771; // set in npc/misc/darsalik.uc
const int TOLD_ABOUT_DARSALIK = 772; // set in npc/misc/zao_pan.uc
const int NOT_TOLD_ABOUT_DARSALIK = 773; // set in npc/misc/zao_pan.uc
const int ZAO_PAN_FINAL_TEST_CONT = 774; // set in npc/misc/zao_pan.uc	

	//LORD OF FLAME AND ICE WITCH CONSTANTS - NEEDED FOR ZAO PAN
	// Get the ice dragon blood to make the ever burning torch
	const int RETRIEVE_BLOOD = 775; // set in npc/misc/lord_of_flame.uc
	const int RETRIEVED_BLOOD = 776; // set in npc/misc/lord_of_flame.uc

	// Get the pheonix egg to make the helm of ice
	const int RETRIEVE_EGG = 777; // set in npc/misc/icewitch/icewitch.uc
	const int RETRIEVED_EGG = 778; // set in npc/misc/icewitch/icewitch.uc
	
const int SECOND_TEST_PROMPT = 779; // set in npcmisc/zao_pan.uc	
	
//786-799 UNUSED	
	
	
// KARMA CONSTANTS 800-900

// KARMA CONSTANTS - SO YOU CANNOT RECEIVE MULTIPLE THINGS FOR SAME KARMA VALUES


const int BAD1 = 800;
const int BAD2 = 801;
const int BAD3 = 802;
const int BAD4 = 803;
const int BAD5 = 804;
const int BAD6 = 805;
const int GOOD1 = 806;
const int GOOD2 = 807;
const int GOOD3 = 808;
const int GOOD4 = 809;
const int GOOD5 = 810;
const int GOOD6 = 811;



// GOOD KARMA TEST CONSTANTS

const int KARMA_TROLL_KILL = 812;

// INITIAL KARMA MIRROR ENTRY

const int KARMA_TEST_GOOD = 813;
const int KARMA_TEST_EVIL = 814;
const int LEFT_KARMA_TEST = 815;
	

// FINAL KARMA TESTS

const int SPOKE_WITH_ARTHIS_1 = 816; // set in eggs/item eggs/black_sword_return_eggs.uc
const int ENTER_GOOD_MIRROR = 817; // set in objects/black_sword.uc
const int IN_GOOD_TEST = 818; // set in objects/mirror.uc
const int IN_BAD_TEST = 819; // set in objects/mirror.uc
const int FINISHED_CORRUPT_GOOD_TEST = 820; // set in objects/eggs/quest eggs/karma_eggs.uc

const int SPOKE_WITH_DONAL_1 = 821; //  set in eggs/item eggs/donals_bp_return_eggs.uc
const int ENTER_BAD_MIRROR = 822; // set in objects/donals_bp.uc
const int CURED_PAINED_UNICORN = 823; // set in objects/donals_bp.uc
const int RESCUED_TRAPPED_MAN = 824;
const int HELPED_MAN_IN_DESTROYED_HOUSE = 825; // 
const int ASK_UNICORN_ABOUT_CHAINS = 826; // set in npc/misc/skinless_man.uc
const int PARRIK_ATTACK = 827; // set in npc/medina/parrik.uc
const int FINISHED_CORRUPT_BAD_TEST = 828; // set in objects/eggs/quest eggs/karma_eggs.uc


	
	
	
// BANDIT CAVE CONSTANTS 901-915

const int SIMON_GAVE_KEY = 901;
const int ATTACK_SIMON = 902;
const int SIMON_DEAD = 903;
const int FREED_TSERAMED = 904;
const int TSERAMED_PARTY = 905; // 1955 and 1956 used above

// PLAINS RIDER CONSTANTS 916-920 
const int LEARN_OF_PLAINSRIDER = 916; //set in npc/solusek/bredin.uc
const int KILL_PLAINSRIDER = 917; // set in npc/solusek/bredin.uc
const int KILL_PLAINSRIDER_HECTAR = 918; // set in npc/dewtopia/hectar.uc
const int PLAINSRIDER_DEAD = 919; // set in npc/solusek/bredin.uc
	
//921-930 UNUSED	
	
	
	
// ISLE OF ACHELOUS AND RELATED QUESTS 931-960


const int DRAIL_SHIP_DESTROY = 931; // set in npc/misc/mermaids/drail.uc
const int READ_SIREN_DIARY = 932; // set in books/good_books.uc
const int CAPREAE_DIARY_CONVO = 933; // set in npc/misc/mermaids/capreae.uc
const int TRICK_CAPREAE = 934; // set in npc/misc/mermaids/persephone.uc
const int TRICKED_CAPREAE = 935; // set in npc/misc/mermaids/capreae.uc
const int ENTER_CORINAV_SHRINE = 936; // set in npc/misc/mermaids/capreae.uc
const int HELPED_CORINAV_FISH = 937; // set in npc/misc/corinav.uc
const int HELP_CORINAV_FISH = 938; // set in npc/misc/corinav.uc
const int TOLD_ON_CAPREAE = 939; // set in npc/misc/corinav.uc
const int FISH_SPAWN_FIXED = 940; // set in eggs/quest eggs/misc/the_deapths_beacon_eggs.uc
const int LEARN_OF_SMUGGLERS = 941; // set in npc/misc/mermaids/capreae.uc
const int SMUGGLERS_DEAD = 942; // set in npc/misc/mermaids/capreae.uc
const int SMUGGLER_LEADER_TRIGGER = 943; // set in eggs/misc_eggs/siren_eggs.uc
	
	
	
	
	
//970-975 UNUSED
	
	
// ROSENDALE QUESTS

const int HEARD_OF_THUGS = 961; // set in multiple rosendale NPC's
const int ROSENDALE_THUGS_KILLED = 962; // set in npc/rosendale/dryn.uc
const int CAPTURE_ROSENDALE_THUGS = 963; // set in npc/rosendale/dryn.uc
const int GOT_ROSENDALE_INN_ROOM = 964; // set in npc/rosendale/mathis.uc
const int THUGS_ENGAGED = 965; // set in eggs/quest eggs/rosendale/thug_eggs.uc 

const int LEARNED_OF_STARKS_TOY = 966; // set in npc/rosendale/stark.uc and bethany.uc
const int RETRIEVED_STARKS_TOY = 967; // set in npc/rosendale/stark.uc
const int RETRIEVED_STARKS_TOY_BAD = 968; //set in npc/rosendale/stark.uc
const int RETRIEVED_STARKS_TOY_GOOD = 969; //set in npc/rosendale/stark.uc
const int PICKED_UP_TOY = 970; //set in eggs/quest eggs/rosendale/toy_eggs.uc

const int SELL_PICKS = 971; //set in npc/rosendale/marsh.uc or andy.uc -- used to sell picks

const int PICK_DELIVERY = 972; //set in npc/rosendale/harris.uc 
const int PICK_DELIVERY_IN_PROGRESS = 973; //set in npc/rosendale/harris.uc 
const int PICKED_UP_ROSENDALE_SUPPLIES = 974; //set in npc/solusek/bredin.uc 
const int PICK_DELIVERY_COMPLETED = 975; //set in npc/rosendale/harris.uc 




//DEATHSQUALL ISLAND 976-1000

const int STOPPED_GRAVEROBBER = 976; // set in npc/deathsquall/vela.uc
const int GRAVEROBBER = 977; // set in npc/deathsquall/vela.uc
const int ACCUSE_GRAVEROBBER = 978; //set in npc/deathsquall/jarvis.uc
const int RETURN_LOCKET_GOOD = 979; // set in npc/deathsquall/talzen.uc
const int RETURN_LOCKET_BAD = 980; // set in npc/deathsquall/talzen.uc

const int TOLD_MERTILDA_JOB = 981; // set in npc/northern forest/mertilda.uc




//MISC QUESTS 1000-1100

	//Jones By Noxious Swamp
	const int JONES_BASEMENT = 1000; // set in npc/misc/jones.uc
	const int UNEARTH_STAIRCASE = 1001; // set in npc/misc/jones.uc
	const int BROKE_STATUES_GOOD = 1002; // set in objects/golden_status.uc
	const int BROKE_STATUES_BAD = 1003; // set in objects/golden_status.uc

	//Return Floydens supplies (by Cotton Cove)
	const int RETURNED_FLOYDEN_SUPPLIES = 1004; // set in npc/cotton cove/floyden.uc
	const int RETRIEVE_FLOYDEN_SUPPLIES = 1005;  // set in npc/cotton cove/floyden.uc

	//Erinon quests deep in Northern Mountain Range
	const int KILL_SPIDER_QUEEN = 1006; // set in npc/misc/erinon.uc
	const int KILLED_SPIDER_QUEEN = 1007; // set in npc/misc/erinon.uc
	const int GAVE_GLENN_SCROLL = 1008; // set in npc/misc/erinon.uc
	const int RECEIVED_GLENN_SCROLL = 1009; // set in npc/misc/erinon.uc
	
	// Southern Goblins
	const int LEARN_OF_CROWN = 1010; // set in graplinosh.uc
	const int CROWN_RETURNED = 1011; // set in graplinosh.uc
	const int FIGHT_FOR_CROWN = 1012; // set in lord_nagafen.uc

	// Illusionist constants
	const int GOT_WAND = 1013; // set in eggs/misceggs/illusionist_eggs.uc"
	const int RECHARGE_WAND = 1014; // set in objects/rod_of_infinite_thought.uc"
	const int DID_NOT_CHEAT_TO_GET_HERE = 1015; // set in eggs/misceggs/illusionist_eggs.uc"
	const int KNOW_OF_ROD = 1016; // set in books/good_books.uc"

	//Bandit Knowledge
	const int BANDIT_STRUCTURE = 1017;
	const int BANDIT_STRUCTURE1 = 1018;
	const int BANDIT_STRUCTURE2 = 1019;
	const int BANDIT_SCROLL = 1020;
	const int BANDIT_SCROLL1 = 1021;
	const int BANDITS_DEFEATED = 1022;

	//Bedinwood forest constants
	const int ORB_USED_ON_BEDIMWOOD = 1025; // set in objects/dust_of_the_forest.uc
	const int SLAY_BEDIMWOOD = 1026; // set in npc/northern forest/forest_spirit.uc
	const int MADE_FOREST_POWDER = 1027; //set in npc/northern forest/forest_spirit.uc
	const int FREED_FOREST_SPIRIT = 1028; // set in objects/dust_of_the_forest.uc
	const int STATUE_BROKEN = 1029; // set in objects/igons_hammer.uc
	const int RETRIEVE_NOTEBOOK = 1030; //set in npc/misc/lord_bedimwood.uc
	const int PROVIDED_NOTEBOOK = 1031; //set in npc/misc/lord_bedimwood.uc


	
	

// MISC CONSTANTS - So spread out cannot group them with the correct areas 1101-1130

const int TOLD_HECTAR = 1101; // set in npc/dewtopia/hectar.uc
const int LEARN_OF_SENTRI = 1102; // set in eggs/eggs.uc
const int SELL_LOGS = 1103; // set in npc/northern forest/wendill.uc
const int RUFUS = 1104;
const int TALENDOR = 1105;
const int GELVIN = 1106;
const int PIRATE_SCROLL = 1107;
const int NORTHERN_BANDITS_DEAD = 1108;
const int READ_GEOGRAPHY_BOOK = 1109; // Read the geography book and got the map
const int SOLD_SHIELD = 1110; // sold the Shield of Valor
const int BLINKER_BOUND = 1111;

const int ORB_ON_VICTIM = 1112; // victim.uc // used orb of transifiguration on the victim
const int KILL_VICTIM = 1113; // victim.uc
const int PAST_SCROLL = 1114; // scroll from the past in glenn.uc

const int DEBRIS_FELL = 1115; // used for the collapsing debris in exeter
const int ON_ROOF = 1116; // used for avatar getting on the roof using the ladder

const int AVRET_SEEK = 1117; // set in npc/misc/avret.uc

//1131-1145 UNUSED

//MERCHANT PURCHASE CONSTANTS 1146-1170
const int BOUGHT_ELRON_BOAT = 1146;

//1171-1180 UNUSED

// CONSTANTS SO YOU CANNOT GET MULTIPLE ITEMS 1181-1199

const int RECEIVED_BLINKER = 1181;





/*

MAIN PLOT-LINE - ORB OF INFINITY QUEST 1200-1399

*/

const int ON_MAIN_QUEST = 1200; // Flags with a zorphos convo that lets you be on the main quest
const int ASK_OF_SCROLL = 1201; // Sets to ask for the ancient scroll for Zorphos, set in zorphos.uc
const int GOT_SCROLL_FROM_ALAGNAR = 1203; // to kill asking for scroll. set in alagnar.uc
const int CONCOCTION_DEATH = 1204; // set in deadly_concotion.uc - used to prevent blinker from working when in deaths realm.
const int MORGHRIM_SCROLL_READ = 1205; // set in goodscrolls.uc
const int SPAWN_ORB_BOOK = 1206;
const int READ_LICHE_SCROLL = 1207; // Read the scroll in the liches nightstand
const int TALK_TO_YESSERM_ABOUT_ORB = 1208; // Talk to Yesserm about the Orb of Transfiguration
const int READ_ORB_BOOK = 1209; // Read the Orb of Infinity book that is spawned in the Dewtopian Library
const int NICE_ZORPHOS = 1210; // After letting Zorphos know the orb of transfiguration is in the hands of the goblins, he will work with you after this more kindly. A result of opening dialog made available by reading book quality 11
const int TALK_TO_CYCLOPS = 1211; // Set after talking to Zorphos and he suggests you seek out the cyclops to learn more about the minor orbs npc/deathsquall/zorphos.uc
const int TALK_TO_CYCLOPS2 = 1212; // after talking with cyclops on kintore island he lets you talk to another one on the mainland npc/misc/polphemus.uc

const int POLYPHEMUS_FRIEND = 1300; // set in npc/misc/polyphemus

const int SEE_MONKS_ABOUT_ORB = 1213; // After learning the dark monks took it from cyclops on the island - this allows you to talk to kintore people about it as well as makes the key spawnable on the south-east portion of island
const int ORB_OF_SOULS_SPAWNABLE = 1214; // After talking with karnax about the orb this will let it be spawned within the dark monk head quarters
const int TALK_TO_ZOMBIE_SON = 1215; // Allows you to ask the zombie son about the missing orbs
const int TALKED_TO_ZOMBIE_SON = 1216; // After talking to the zombie son with the orb of souls on your person

const int IN_PAST = 1217; // Set in the Focused Orb to prevent the blinker from working
const int LEARN_OF_WORDS = 1218; // set in good_books.uc quality 30
const int MORGHRIM_TELEPORT_ESCAPE = 1219; // set in egg_morghrim_past_trigger.uc
const int MORGHRIM_KNOCK_OUT = 1220; // set in egg_morghrim_past_trigger.uc
const int SEARCHED_MORGHRIM = 1221; // set in morghrim_past.uc
const int LEARNED_WORDS = 1222; // set in objects/words_of_power.uc
const int DONE_IN_PAST = 1223; // set in orb_of_focus.uc to prevent you from going to the past again





	/*
	
	SUB-QUEST FLAGS USED IN THE ORB OF INFINITY QUEST

	*/

	/*
	SOLUSEK PORTION (ORB OF CHAOS)
	*/
	const int FLANWALD_BOUNTY = 1224;
	const int FLANWALD_KEY = 1225;
	const int PAID_ZAB = 1226; // If the player has already paid 50 gold and they do not have enough money on them they can avoid going through the same info again
	const int PAID_ZAB2 = 1227 ; // For the 2nd part of the information about where the orb of chaos is so you don't have to repay


	/*
	GOBLIN PORTION (ORB OF TRANSFIGURATION)
	*/
	const int MAN_SPIDER_HAS_ORB = 1228;

	/*
	ORB OF PERSUASION
	*/

	const int TALK_TO_COEUS = 1229; 
	const int ENABLE_FULL_COEUS_TALK = 1230; // enables the user to learn that the dragon has the orb
	const int DRAGON_HAS_ORB = 1231; // Allows the user to talk to the dragon in the cave about the orb
	const int SEARCH_FOR_ARTEMIS = 1232; // Allows user to ask questions to people around the world about Artemis Batbane
	const int FAKE_SCROLL = 1233; // Allows user to ask Brene in Kintore about making a fake scroll
	const int SEV_KILLED_ART = 1234; // In the usecode egg for sev attacking artemis
	const int KILL_SEV_ORB_TALK = 1235; // Lets you no longer talk to sev about the ORB_OF_FOCUS
	
	
	/*
	ORB OF FOCUS
	*/
	
	const int GOT_KEY = 1236;
	
	
	
	/*
	AFTER GETTING ALL ORBS
	*/
	
	const int HAS_ALL_ORBS = 1237;
	const int TOLD_ZORPHOS_YOU_HAVE_ORBS = 1301; // set in npc/zorphos.uc
	const int TALK_TO_SERVANT = 1238; // set in objects/orb_of_souls.uc
	const int BASEMENT_OF_CASTLE = 1239; // set in npc/misc/Tulal.uc
	const int KILL_BASEMENT_OF_CASTLE_CONVO = 1312; // set in npc/deathsquall/zorphos.uc
	const int TALKED_TO_AKAKOTHEN1 = 1240; // After talking to Akakothen the first time
	const int TALK_TO_AVRET = 1241; // Talk to avret to learn how to focus orb of persuasion - flag set in zorphos
	const int LENSE = 1242; // flag set to true in Avret
	const int ORB_ON_AK = 1243; // Used the orb of persuasion on akakothen - set to true in the focus orb object usecode, this flag is used to trigger conversation trees in npc/misc/akakothen.uc
    const int QUEST_FOR_MOLTEN_CLOAK = 1244;  // To get the scroll from Alagnar in exchange for molten cloak
    const int GAVE_MOLTEN_CLOAK = 1245; // Used to kill text to get the molten cloak from alagnar
    const int MAKE_NECKLACE = 1246; // Used to get the ratmen to make necklace and ask them about the ring
    const int GOT_RING = 1247;
    const int ARTIFACT_LOCS = 1248;
    const int HAS_ARTIFACTS = 1249;
    const int HAS_SCROLL = 1250;
    const int DECIPHERED_SCROLL = 1251;
    const int CONSTRUCT_ORB = 1252;
    const int CONSTRUCT_ORB1 = 1253;




    /*
    Making the orb (1st time)
    */
    const int SOUL_ORB_IN_PLACE = 1254;
    const int TRANSFIG_ORB_IN_PLACE = 1255;
    const int CHAOS_ORB_IN_PLACE = 1256;
    const int FOCUS_ORB_IN_PLACE = 1257;
    const int PERSUASION_ORB_IN_PLACE = 1258;

    const int RECREATE_ORBS = 1259;
    const int FLUX_IN_PLACE = 1260;
    const int ALL_IN_PLACE = 1261; // After checking if all of the other parts are in place
    const int STOP_ORB_FLAGS = 1262; // stops the user from being able to recreate orbs again
    const int FAILED_FIRST_ORB = 1263; // failed to make the orb the first time - in egg usecode for the orb construction
    const int READ_ZORPHOS_BOOK = 1264; // From reading his book - in books usecode
    const int GOT_SCYTHE = 1265; // SO you can't get multiple death scythes - in Death's usecode
    const int TALK_TO_TURAK = 1266; // Lets you talk to turak about the ring - in Death's usecode
    const int DROPPED_SCROLL = 1267; // Prevents multiple scrolls from dropping - in Turak's usecode

    // From making the orb more
    
    const int FIND_MORGHRIM = 1268; // set in npc/death.uc
    const int NICE_MORGHRIM = 1269; // set in npc/morghrim.uc
    const int FIND_ORB_SACRIFICE = 1270; // morghrim.uc
    const int RESTORED_SOUL_ORB = 1271; // objects.uc
    const int GO_TO_PAST = 1272; // a scroll or something

    const int ORBS_IN_PLACE = 1273;
    const int USED_FLUX_ON_ORB = 1274;
    
	
	//In the past

	const int LENSE_PIECE_ON = 1275;
	const int CUBE_ON = 1276;
	const int PAST_MADE_FOCUS_ORB = 1277;  // set in odd_material
	const int PAST_MADE_CHAOS_ORB = 1278; // set in odd_material
	const int GLENLORN_TELEPORT_FLAG = 1279; // set in odd_material functions
	const int KILL_BRENDA_TRAVLEN_TALK = 1280; // make it so they don't do there random mumblings - set in odd material functions Path_Avatar_In_Past function then set to false in Glenlorn_Convo in same file
	
	
	// Final Orb construction
	
    const int SOUL_ORB_IN_PLACE1 = 1281;
    const int TRANSFIG_ORB_IN_PLACE1 = 1282;
    const int CHAOS_ORB_IN_PLACE1 = 1283;
    const int FOCUS_ORB_IN_PLACE1 = 1284;
    const int PERSUASION_ORB_IN_PLACE1 = 1285;
    const int ORBS_IN_PLACE1 = 1286;
    const int FINAL_ORB_CONSTRUCTION = 1287;
    const int FLUX_USED_FINAL = 1288; // set in flux_capacitor.uc
	const int DEATH_DEAD = 1289; // set in objects/object functions/hammer_of_divinity_functions.uc

	// Orb of Infinity Destruction
	
	const int FINAL_ICE_AREA = 1290; // set in eggs/destroy_infinity_eggs.uc
	const int IN_ICE_STAIRS = 1291; // set in eggs/teleport_eggs.uc
	const int AT_FATE = 1292; // set in objects/object functions/orb_of_infinity_functions
	const int PASSED_SLIPPERS_TEST = 1293; // set in eggs/end game eggs/egg_blindfold_test.uc
	const int ON_SLIPPERS_TEST = 1294; // set in eggs/end game eggs/egg_blindfold_test.uc
	const int USED_SEXTANT = 1295; // set in objects/sextant_of_fate.uc
	const int SLIPPERS_PATHING_ON = 1296; // set in end game eggs/egg_blindfold_test.uc
	const int DICE_ROLLED = 1297; // set in objects/dice_of_fate.uc
	const int DICE_PATH1 = 1298; // set in eggs/end game eggs/egg_dice_test.uc
	const int DICE_PATH2 = 1299; // set in eggs/end game eggs/egg_dice_test.uc
	
	//1300 used for POLYPHEMUS_FRIEND
	//1301 used for TOLD_ZORPHOS_YOU_HAVE_ORBS
	
	const int SECOND_STEPS = 1302; // set in npc/zorphos.uc
	const int AQUIRE_ALAGNAR_SCROLL = 1303; // set in npc/deathsquall/zorphos.uc
	const int AQUIRED_ALAGNAR_SCROLL = 1304; //set in npc/deathsquall/zorphos.uc
	const int AQUIRED_ARTIFACTS = 1305; //set in npc/zorphos.uc
	const int AQUIRED_LENS = 1306; // set in npc/misc/avret.uc
	const int ZORPHOS_CREATE_ORB = 1307; // set in npc/deathsquall/zorphos.uc
	const int ZORPHOS_DEAD = 1309;
	const int ZORPHOS_SON_CONVO_KILL = 1310; // set in npc/deathsquall/zorphos and unset in deathsquall/zorphoszombieson
	const int DEATH_WEAK_ORB = 1311; // set in objects/charged_flux_capacitor.uc

	
// MAGICAL ITEM CONSTANTS - SET AND UNSET IN THE ITEMS 1400-1499

// White dragonscale cloak
const int MANA30 = 1400;
const int MANA29 = 1401;

// Bernards lucky amulet
const int DEX30 = 1402;
const int DEX29 = 1403;

// Headband of Zao Pan
const int HEADBAND_DEX30 = 1404;
const int HEADBAND_COMBAT30 = 1405;

const int RECHARGE_BLACK_SWORD = 1406; // set in objects/black_sword.uc
const int RECHARGE_DONALS_BP = 1407; // set in objects/donals_bp.uc
	
	

/*
BRENTONIA AND DEWTOPIA WAR GFLAGS - Includes some flags that lead up to it 1500-1599
*/


const int CHEATING_SLUT = 1500;
const int SLUT_JAILED = 1501;
const int GAVE_LOVE_LETTER = 1502;
const int AT_WAR = 1503;

// MISC CONSTANTS FOR FIXING STUFF

const int ENDGAME_FOREST_HINT = 1313; // Set in the death NPC but believe it's a function of the hammer of divinity, as it's a convo tree from a scripted sequence
const int RONAK_FULLY_PAID = 1314; // set in npc/northern forest/ronak.uc
const int PREVENT_RETRIGGER_BRENTONIANTRAITORS = 1315; // set in eggs/quest eggs/brentonia/brentonia_eggs.uc
const int RECEIVED_LORDOFFLAMEKEY = 1316; // set in npc/misc/burned_soul.uc
const int WEARING_BERNARDS_AMULET = 1317; // set in objects/bernards_lucky_amulet.uc
const int WEARING_DRAGONSCALE_CLOAK = 1318; // set in objects/white_dragonscale_cloak.uc
const int WEARING_ZAOPAN_HEADBAND = 1319; // set in objects/headband_of_zao_pan.uc
const int BAINS_IN_PARTY = 1320; // set in npc/groupables/bains.uc
const int SARAH_LETTER = 1321; // set in npc/dewtopia/lord_dew.uc
// 1322 is TAKEN for zao pan AVATAR_OF_WIND_APPEARED, this was done because of reports Zao Pan was allowing training before completing, which means this flag had to be getting set, somewhere. Never tracked it down so I changed the value.
// Note, formerly 770. Appears to have been used by gauntlets of quickness SI flag.
// 1323 is TAKEN for BAD_MAYOR = 1323 set in scrolls/goodscrolls.uc - formerly 682, used due to potential conflict that I couldn't track down
// 1324 is TAKEN for KILL_VANNEL = 1324 set in npc/medina/parrik.uc - formerly 683, used due to potential conflict that I couldn't track down
// 1325 is TAKEN for  VISITED_GOBLIN_CAMP = 1325 set in eggs/blinker_eggs.uc -- formerly 111, changed due to potential conflict

