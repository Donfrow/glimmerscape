// #autonumber 0xC00 - ORIGINAL ONE THAT STOPPED WORKING
#autonumber 0x0A00

#game "serpentisle"

/*
Test1234
KARMA BREAKDOWN:

Mainly caused by saying bad things, default value is 5000 and lowered by doing different things

CURRENT FILE LIST WHERE KARMA IS AFFECTED AND THE VALUE:
npc/Bugsy       - 10
npc/Krayg       - 150
npc/Gloria      + 150

COTTON COVE (MAINLY QUEST FOR PROPOSAL)

npc/olon            +- 15
npc/garth           +- 15   + 150
npc/gerth           +- 15
npc/columna         +- 15
npc/catherine       +- 15
npc/brawl           +- 15
npc/zulith          +- 15
npc/dewbert         - 250
npc/bugsy           - 50    -250    +100
npc/leon            +-200

*/

static var karma;
static var detonator_rocks_x;
static var detonator_rocks_y;
static var detonator_loc_x;
static var detonator_loc_y;
static var party_members;
static var party_members_count;

static var proposalsigs; // used to count the number of signatures on the proposal
static var badproposalsigs; // used to minus so if you get too many rejections it lets you know to give up
static var beggar_pouch; // used to determine if begger pouches added in final test
static var begger_pinecone; // used to determine if begger pinecones added in final test

static var avatarx; // avatar x coordinate
static var avatary; // avatar y coordinate
static var avatarz; // avatar z coordinate

static var avatar_sea_x; //avatar x coordinate for sea diving
static var avatar_sea_y; //avatar y coordinate for sea diving
static var avatar_sea_z; //avatar z coordinate for sea diving

static var salvage_scroll; // salvage scroll to control the salvage ship

static var avatar_bind_x; // avatar x coordinate for binding
static var avatar_bind_y; // avatar y coordinate for binding
static var avatar_bind_z; // avatar z coordinate for binding

static var avatar_dead_x; // avatar death x coordinate
static var avatar_dead_y; // avatar death y coordinate
static var avatar_dead_z; // avatar death z coordinate

static var sarahx; // sarah x coord for the script of Lord Brent finding the scroll
static var sarahy; // sarah y coord for the script of Lord Brent finding the scroll

static var targetx; // general targetx coordinate
static var targety; // general targety coordinate
static var targetz; // general targetz coordinate
static var targetmap; // general map number

static var object_ref; // generic object reference for use in script blocks
static var NPC;

static var tree_x; // generic tree_x loc for cutting down trees
static var tree_y; // generic tree_y loc for cutting down trees
static var tree_z; // generic tree_z loc for cutting down trees

static var tree_cut; // tree cut value

static var grape_x; // generic grape vine x location
static var grape_y; // generic grape vine y location
static var grape_z; // generic grape vine z location

static var chimney_x; // generic dirty chimney x location
static var chimney_y; // generic dirty chimney x location
static var chimney_z; // generic dirty chimney x location

static var rod_charges; // to make it unusable after 3 charges

static var black_sword_charges; // set to make it unusable after 5 uses until it is recharged
static var donals_bp_charges; // set to make it unusable after 5 uses until it is recharged

static var blinker_x; // blinker x value
static var blinker_y; // blinker y value

static var opened_grave_x; // opened graves for digging it up
static var opened_grave_y; 

static var bed_x;
static var bed_y;
static var bed_z;

static var donals_bp_charge;
static var black_sword_charge;

static var flower_shape;
static var flower_frame;

static var poo_x;
static var poo_y;

static var spell_check;

static var disenchant_stone_price;

static var itemDexMods;
static var trueDex;

/*
Include all constants
*/

#include "constants/constants.uc"

// SI-BG MERGE FILES
//#include "SI-BG-Merge/SI_Fixes_Spells_Minus_Serpent_Bond.uc"


/*

Functions

*/

#include "functions/scripting_functions.uc"



#include "functions/generic_functions.uc"
#include "functions/monster_functions.uc"
#include "functions/npc_functions.uc"
#include "functions/merchant_functions.uc"
#include "functions/sound_functions.uc"
#include "functions/sprite_functions.uc"
#include "functions/spawn_item_functions.uc"
#include "functions/avatar_death.uc"

#include "functions/encounter functions/lady_vox_encounter_functions.uc"


#include "eggs/egg functions/construct_orbs_first_time_functions.uc"
#include "eggs/testing_egg.uc"

// Object Functions
#include "objects/object_functions/orb_of_souls_functions.uc"
#include "objects/object_functions/orb_of_infinity_functions.uc"
#include "objects/object_functions/deadly_concoction_functions.uc"
#include "objects/object_functions/statue_functions.uc"
#include "objects/object_functions/hammer_functions.uc"
#include "objects/object_functions/wounded_man_functions.uc"
#include "objects/object_functions/reagent_abacus_functions.uc"
#include "objects/object_functions/focused_orb_functions.uc"
#include "objects/object_functions/chimney_functions.uc"
#include "objects/object_functions/surgical_tool_functions.uc"
#include "objects/object_functions/odd_material_functions.uc"
#include "objects/object_functions/portcullis_vertical_functions.uc"
#include "objects/object_functions/hammer_time_functions.uc"
#include "objects/object_functions/flux_capacitor_functions.uc"
#include "objects/object_functions/blinker_functions.uc"
#include "objects/object_functions/orb_of_focus_functions.uc"
//#include "objects/object_functions/large_lense_functions.uc"
#include "objects/object_functions/cuttable_tree_functions.uc"
#include "objects/object_functions/donals_bp_functions.uc"
#include "objects/object_functions/detonator_functions.uc"
#include "objects/object_functions/disenchanting_stone_functions.uc"
#include "objects/object_functions/stockade_man_functions.uc"
#include "objects/object_functions/steel_door_frozen_functions.uc"
#include "objects/object_functions/sextant_of_fate_functions.uc"
#include "objects/object_functions/dice_of_fate_functions.uc"
#include "objects/object_functions/gavel_of_fate_functions.uc"
#include "objects/object_functions/grave_functions.uc"
#include "objects/object_functions/baby_grave_functions.uc"


// Quest functions
#include "functions/quest functions/cotton_cove_quest_functions.uc"
#include "functions/quest functions/orb_construction_past_functions.uc"
#include "functions/quest functions/brentonia_dewtopia_war_functions.uc"
#include "functions/quest functions/dewtopia/prisoner_transport_functions.uc"


/*

Include creation of item usecode eggs:


*/

#include "eggs/eggs.uc"
#include "eggs/teleport_eggs.uc"
#include "eggs/blinker_eggs.uc"
#include "eggs/egg_morghrim_past_trigger.uc"
#include "eggs/egg_archibus_trigger.uc"
#include "eggs/destroy_infinity_eggs.uc"
#include "eggs/quest eggs/egg_trigger_end_game.uc"
#include "eggs/quest eggs/egg_start_of_game.uc"
#include "eggs/quest eggs/brentonia-dewtopia_war.uc"
#include "eggs/quest eggs/new ophidia/frozencavern_endgame.uc"

#include "eggs/end game eggs/egg_blindfold_test.uc"
#include "eggs/end game eggs/egg_sextant_test.uc"
#include "eggs/end game eggs/egg_slipper_test.uc"
#include "eggs/end game eggs/egg_dice_test.uc"

// Include eggs for items
#include "eggs/item eggs/black_sword_return_eggs.uc"
#include "eggs/item eggs/donals_bp_return_eggs.uc"

// Include item creation eggs
#include "eggs/item eggs/create items/egg_bloodspawn.uc"

// Include Karma eggs
#include "eggs/quest eggs/karma/karma_eggs.uc" // eggs used for the final good/evil karma test

/*

monster usecode eggs:

*/
#include "eggs/egg functions/monster_egg_talk.uc"
#include "eggs/monster_eggs.uc"

// Friendly goblins in southern mountain
#include "eggs/monster eggs/monster egg functions/goblin_egg_functions.uc"
#include "eggs/monster eggs/goblin_eggs.uc"
#include "eggs/monster eggs/smugglers_cove_eggs.uc"
#include "eggs/monster eggs/bandit_eggs.uc"
#include "eggs/monster eggs/pirate_eggs.uc"
#include "eggs/monster eggs/medina_ratmen_egg.uc"
#include "eggs/monster eggs/nude_dancer_eggs.uc"
#include "eggs/monster eggs/brentonia_homeless_eggs.uc"

#include "eggs/misc eggs/lady_vox_eggs.uc"
#include "eggs/misc eggs/illusionist_eggs.uc"
#include "eggs/misc eggs/siren_eggs.uc"

/*
Usecode eggs used in creating the orbs
*/
#include "eggs/construct_orb_eggs.uc"
#include "eggs/egg_construct_final_orb.uc"
#include "eggs/quest eggs/egg_construct_orbs_in_past.uc"
#include "eggs/quest eggs/new ophidia/theodora_house_exit.uc"

// Underwater spawn item eggs

#include "eggs/under water eggs/underwater_eggs.uc"

/*
QUEST EGG FUNCTIONS
*/

#include "functions/quest functions/cambray/cambray_destruction_egg_functions.uc"

/*
QUEST EGGS
*/

#include "eggs/quest eggs/cambray/spectral_tower_egg.uc"
#include "eggs/quest eggs/cambray/cambray_destruction_egg.uc"
#include "eggs/quest eggs/dewtopia/prisoner_transport_start_egg.uc"

#include "eggs/quest eggs/brentonia/brentonia_eggs.uc"
#include "eggs/quest eggs/kintore/kintore_eggs.uc"
#include "eggs/quest eggs/hensall/hensall_ambush.uc"
#include "eggs/quest eggs/hensall/hensall_eggs.uc"
#include "eggs/quest eggs/hensall/hensall_monster_eggs.uc"
#include "eggs/quest eggs/cotton cove/lady_dorsy_eggs.uc"
#include "eggs/quest eggs/misc/the_depths_beacon_eggs.uc"

#include "eggs/quest eggs/rosendale/toy_eggs.uc"
#include "eggs/quest eggs/rosendale/thug_eggs.uc"

// CONVO EGG TRIGGERS

#include "eggs/egg convo triggers/egg_liche_convo.uc"
#include "eggs/egg convo triggers/egg_goblin_convo.uc"
#include "eggs/egg convo triggers/egg_spider_queen.uc"
#include "eggs/egg convo triggers/egg_southwest_mainland_troll.uc"
#include "eggs/egg convo triggers/egg_abata_depths_convo.uc"
#include "eggs/egg convo triggers/egg_lechuck_convo.uc"

/*
Include Text of Scrolls

*/

#include "scrolls/goodscrolls.uc"
#include "scrolls/badscrolls.uc"

/*

Include Text of books

*/

#include "books/good_books.uc"
#include "books/books.uc"




/*

Include text of signs

*/

#include "signs/woodensigns.uc"
#include "signs/plaques.uc"
#include "signs/graves.uc"

/*

Include Objects

*/

//#include "objects/objects.uc"
#include "objects/unstable_moongate.uc"
#include "objects/flux_capacitor.uc"
#include "objects/reagent_abacus.uc"
#include "objects/lense.uc"
#include "objects/large_lense.uc"
#include "objects/focused_orb.uc"
#include "objects/hammer_time.uc"
#include "objects/knife.uc"
#include "objects/wanted_poster.uc"
#include "objects/fiery_gem.uc"
#include "objects/etheral_ring.uc"
#include "objects/charged_flux_capacitor.uc"
#include "objects/deadly_concoction.uc"
#include "objects/trap_door.uc"
#include "objects/ladder.uc"
#include "objects/ladder_top.uc"
#include "objects/hammer.uc"
#include "objects/igons_hammer.uc"
#include "objects/wounded_man.uc"
#include "objects/grape_vine.uc"
#include "objects/orb_of_souls.uc"
#include "objects/orb_of_infinity.uc"
#include "objects/orb_of_focus.uc"
#include "objects/chimney_sweeper.uc"
#include "objects/tree.uc"
#include "objects/glowing_orb.uc"
#include "objects/statue.uc" // karma test statue
#include "objects/statues.uc" // misc statues
#include "objects/mirror.uc"
#include "objects/weakened_orb_of_souls.uc"
#include "objects/ancient_scroll.uc"
#include "objects/words_of_power.uc"
#include "objects/trap_door_open.uc"
#include "objects/chimney.uc"
#include "objects/glass_counter.uc"
#include "objects/surgical_tools.uc"
#include "objects/odd_material.uc"
#include "objects/blinker.uc"
#include "objects/portcullis_vertical.uc"
#include "objects/cellar_door.uc"
#include "objects/cellar_door_open.uc"
#include "objects/cuttable_tree.uc"
#include "objects/donals_bp.uc"
#include "objects/fine_wine.uc"
#include "objects/tainted_wine.uc"
#include "objects/detonator.uc"
#include "objects/disenchanting_stone.uc"
#include "objects/stockade_man.uc"
#include "objects/white_dragonscale_cloak.uc"
#include "objects/bernards_lucky_amulet.uc"
#include "objects/headband_of_zao_pan.uc"
#include "objects/illusionist_mirror.uc"
#include "objects/rod_of_infinite_thought.uc"
#include "objects/gem_of_strength.uc"
#include "objects/steel_door_frozen.uc"
#include "objects/sextant_of_fate.uc"
#include "objects/dice_of_fate.uc"
#include "objects/gavel_of_fate.uc"
#include "objects/spider_eggs.uc"
#include "objects/troll_hide_vest.uc"
#include "objects/troll_hide_leggings.uc"
#include "objects/rain_barrel.uc"
#include "objects/shackled_man.uc"
#include "objects/grave.uc"
#include "objects/sealed_box.uc"
#include "objects/locket.uc"
#include "objects/baby_grave.uc"
#include "objects/dead_baby.uc"
#include "objects/lute.uc"
#include "objects/bouquet.uc"
#include "objects/lab_supplies.uc"
#include "objects/debris.uc"
#include "objects/golden_statue.uc"
#include "objects/butter_churn.uc"
#include "objects/milk_canister.uc"
#include "objects/carrot_top.uc"
#include "objects/black_sword.uc"
//#include "objects/bed.uc" // THIS APPEARS TO HAVE INTERMITTANT FUNCTIONALITY
#include "objects/donals_corrupted_bp.uc"
#include "objects/cleansed_black_sword.uc"
#include "objects/artifacts.uc" // Artifacts used in the bad test which you enter when you are good
#include "objects/everburning_torch.uc"
#include "objects/helm_of_ice.uc"
#include "objects/torture_rack.uc"
#include "objects/siren_shell.uc"
#include "objects/deepsea_harpoon.uc"
#include "objects/coffin.uc"
#include "objects/dive_machine.uc"
#include "objects/dust_of_the_forest.uc"
#include "objects/bandit_key.uc"
#include "objects/crystal_ball.uc"
#include "objects/shattered_beacon.uc"

// Groupables
#include "npc/groupables/sentri.uc"
#include "npc/groupables/markus.uc" // prisoner transport for Dewtopia

/*
Include NPC conversations
*/


// Main karma people
#include "npc/misc/vediovis.uc"
#include "npc/misc/fortuna.uc"

#include "npc/misc/corrupted_unicorn.uc"


// Misc NPCs on the mermaid area
#include "npc/misc/mermaids/paestum.uc"
#include "npc/misc/mermaids/capreae.uc"
#include "npc/misc/mermaids/persephone.uc"
#include "npc/misc/mermaids/drail.uc"
#include "npc/misc/mermaids/cornav.uc"


// Dewtopia
#include "npc/dewtopia/thomas.uc"
#include "npc/dewtopia/frederick.uc"
#include "npc/dewtopia/jeroan.uc"
#include "npc/dewtopia/ugly_woman.uc"
#include "npc/dewtopia/lord_dew.uc"
#include "npc/dewtopia/melinda.uc"
#include "npc/dewtopia/hector.uc"
#include "npc/dewtopia/florendo.uc"
#include "npc/dewtopia/john_the_pirate.uc"
#include "npc/dewtopia/dimitry.uc"
#include "npc/dewtopia/brunt.uc"
#include "npc/dewtopia/celena.uc"
#include "npc/dewtopia/brana.uc"
#include "npc/dewtopia/bedic.uc"
#include "npc/dewtopia/hectar.uc"
#include "npc/dewtopia/gruplinort.uc"
#include "npc/dewtopia/geth.uc"
#include "npc/dewtopia/bandits.uc"
#include "npc/dewtopia/zoo_keeper.uc"
#include "npc/dewtopia/camille.uc"  
#include "npc/dewtopia/sanala.uc"
#include "npc/dewtopia/hildar.uc"
#include "npc/dewtopia/mildred.uc"
#include "npc/dewtopia/rydan.uc"
#include "npc/dewtopia/temil.uc"
#include "npc/dewtopia/tolsar.uc"
#include "npc/dewtopia/sidara.uc"
#include "npc/groupables/rufus.uc"
#include "npc/dewtopia/yesserm.uc"
#include "npc/dewtopia/talendor.uc"
#include "npc/dewtopia/kilyne.uc"
#include "npc/dewtopia/chicky.uc"
#include "npc/dewtopia/orphan.uc"
#include "npc/dewtopia/orphan2.uc"
#include "npc/dewtopia/orphan3.uc"
#include "npc/dewtopia/patterson.uc"
#include "npc/dewtopia/lucille.uc"
#include "npc/dewtopia/prison_bot.uc"
#include "npc/dewtopia/prison_bot1.uc"
#include "npc/dewtopia/rivath.uc"
#include "npc/dewtopia/virath.uc"
#include "npc/dewtopia/junjun.uc"
#include "npc/dewtopia/liche.uc"
#include "npc/dewtopia/graethe.uc"
#include "npc/dewtopia/bandits1.uc"
#include "npc/dewtopia/shatner.uc"
#include "npc/dewtopia/dyson.uc"
#include "npc/groupables/skynet.uc"
#include "npc/dewtopia/picard.uc"
#include "npc/dewtopia/shira.uc" // watches the insane asylum in Dewtopia
#include "npc/dewtopia/galen.uc" // Healer outside of city near shelter
#include "npc/dewtopia/librarian.uc"
#include "npc/dewtopia/nakedwoman.uc"
#include "npc/dewtopia/nakedman.uc"
#include "npc/dewtopia/provider.uc"
#include "npc/dewtopia/guybrush.uc"
#include "npc/dewtopia/jonon.uc"
#include "npc/misc/pirate1.uc"
#include "npc/dewtopia/guardbonan.uc"
#include "npc/dewtopia/belandric.uc"
#include "npc/dewtopia/rynal.uc"
#include "npc/dewtopia/raltan.uc"

// Cambray (old temple of order area)
#include "npc/cambray/morrison.uc"
#include "npc/cambray/olivia.uc"
#include "npc/cambray/beck.uc"
#include "npc/cambray/mardin.uc"
#include "npc/cambray/tressa.uc"
#include "npc/cambray/venessa.uc"
#include "npc/cambray/xander.uc"
#include "npc/cambray/tobale.uc"
#include "npc/cambray/jasper.uc"
#include "npc/cambray/loretta.uc"
#include "npc/cambray/foucault.uc"


// New Ophidia - city in the icy north
#include "npc/new ophidia/aron.uc"
#include "npc/new ophidia/strehin.uc"
#include "npc/new ophidia/urstan.uc"
#include "npc/new ophidia/tasha.uc"
#include "npc/new ophidia/sophia.uc"
#include "npc/new ophidia/james.uc"
#include "npc/new ophidia/axell.uc"
#include "npc/new ophidia/theodora.uc"
#include "npc/new ophidia/tomasion.uc"

// Western forest of mainland

#include "npc/western forest/arges.uc"
#include "npc/western forest/kylith.uc" // Artemis Batbane's wife
#include "npc/groupables/artemis.uc"



// NORTHERN FOREST

#include "npc/northern forest/burtan.uc"
#include "npc/northern forest/wendy.uc"
#include "npc/northern forest/wendill.uc"
#include "npc/northern forest/bandits2.uc" // Northern Bandits
#include "npc/northern forest/esame.uc" // Northern Bandit Leader
#include "npc/northern forest/thern.uc"
#include "npc/northern forest/minerva.uc"
#include "npc/northern forest/dennen.uc"
#include "npc/northern forest/enkser.uc"
#include "npc/northern forest/ronak.uc"
#include "npc/groupables/rannick.uc" // Dewtopian knight at cave
#include "npc/northern forest/joanne.uc" //
#include "npc/northern forest/mertilda.uc" //
#include "npc/northern forest/forest_spirit.uc" //
#include "npc/northern forest/corrupt_forest_spirit.uc" //

// Goblins and prisoners in goblin camp

#include "npc/goblin camp/goblinking.uc"
#include "npc/goblin camp/murgle.uc"
#include "npc/goblin camp/jugral.uc"
#include "npc/goblin camp/goblinprisoner.uc"
#include "npc/groupables/bains.uc"
#include "npc/goblin camp/ratman.uc" // Ratman in the cave
#include "npc/goblin camp/manspider.uc"
#include "npc/goblin camp/victim.uc" // Victim in the cell with bains

/*
Dewtopia Trainees
*/
#include "npc/dewtopia/buckster.uc"
#include "npc/dewtopia/trainees/smithington.uc"
#include "npc/dewtopia/trainees/otoole.uc"
#include "npc/dewtopia/brian.uc"
#include "npc/dewtopia/trainees/timmons.uc"
#include "npc/dewtopia/angelica.uc"



/* Rosendale */

#include "npc/rosendale/igon.uc"
#include "npc/rosendale/tully.uc"
#include "npc/rosendale/darlessa.uc"
#include "npc/rosendale/dayne.uc"
#include "npc/rosendale/dryn.uc"
#include "npc/rosendale/jorletta.uc"
#include "npc/rosendale/garvis.uc"
#include "npc/rosendale/mordlon.uc"
#include "npc/rosendale/yarwyck.uc"
#include "npc/rosendale/bethany.uc"
#include "npc/rosendale/stark.uc"
#include "npc/rosendale/lynel.uc"
#include "npc/rosendale/marsh.uc"
#include "npc/rosendale/walter.uc"
#include "npc/rosendale/joy.uc"
#include "npc/rosendale/mathis.uc"

#include "npc/rosendale/maggie.uc"
#include "npc/rosendale/harris.uc"
#include "npc/rosendale/junior.uc"
#include "npc/rosendale/stone.uc"
#include "npc/rosendale/andy.uc"
//#include "npc/rosendale/ailiya.uc"

/*

DeathScorn Mountain and the fishing village

*/

#include "npc/deathsquall/glenthur.uc"
#include "npc/deathsquall/flanwald.uc"
#include "npc/deathsquall/lonebandit.uc"
#include "npc/deathsquall/zorphos.uc"
#include "npc/deathsquall/zorphoszombieson.uc"
#include "npc/deathsquall/felar.uc"
#include "npc/deathsquall/talzen.uc"
#include "npc/deathsquall/vela.uc"
#include "npc/deathsquall/jarvis.uc"
#include "npc/deathsquall/clenus_ghost.uc"
#include "npc/deathsquall/tricia_ghost.uc"
#include "npc/deathsquall/dugglesworth_ghost.uc"

/*

Kintore Island

*/

#include "npc/misc/polyphemus.uc"
#include "npc/kintore/elren.uc"
#include "npc/kintore/breeann.uc"
#include "npc/kintore/gloria.uc"
#include "npc/kintore/brene.uc"
#include "npc/kintore/gala.uc"
#include "npc/kintore/joth.uc"
#include "npc/kintore/zaroch.uc"
#include "npc/kintore/ashela.uc"
/*
Dark Monks
*/
#include "npc/kintore/karnax.uc"


/*

Bandit mountain

*/

#include "npc/misc/halinish.uc"
#include "npc/misc/alberto.uc"
#include "npc/misc/simon.uc"
#include "npc/groupables/tseramed.uc"

/*

As yet to be named island (dreamworld castle)

*/

#include "npc/cabele/kaie.uc"
#include "npc/cabele/bigglesworth.uc"
#include "npc/cabele/thanatos.uc"
#include "npc/cabele/adach.uc"
#include "npc/cabele/headless.uc"

/*

Dragon Isle - old fort in silver seed

*/

#include "npc/misc/coeus.uc"
#include "npc/misc/severilious.uc"

/*

Solusek Mining Company island

*/

#include "npc/solusek/siranush.uc"
#include "npc/solusek/gabbie.uc"
#include "npc/solusek/bignubble.uc"
#include "npc/solusek/gimblox.uc"
#include "npc/solusek/flyben.uc"
#include "npc/solusek/zabriana.uc"
#include "npc/solusek/bredin.uc"


#include "npc/solusek/rentrak.uc" // Gnomes on Solusek island
#include "npc/solusek/kartner.uc"
#include "npc/solusek/olive.uc"

/*

Brentonia

*/

#include "npc/brentonia/flicken.uc"
#include "npc/brentonia/krayg.uc"
#include "npc/brentonia/flinn.uc"
#include "npc/brentonia/standarr.uc"
#include "npc/brentonia/alayna.uc"
#include "npc/brentonia/celia.uc"
#include "npc/brentonia/caladin.uc"
#include "npc/brentonia/brendann.uc"
#include "npc/brentonia/luther.uc"
#include "npc/brentonia/shazzana.uc"
#include "npc/brentonia/templar.uc"
#include "npc/brentonia/rolin.uc"
#include "npc/brentonia/lord_brent.uc"
#include "npc/brentonia/countess_sarah.uc"
#include "npc/brentonia/alagnar.uc"
#include "npc/brentonia/telur.uc"
#include "npc/brentonia/rackon.uc"
#include "npc/brentonia/lucilla.uc"
#include "npc/brentonia/marsten.uc"
#include "npc/brentonia/nuggles.uc"
#include "npc/brentonia/student.uc"
#include "npc/brentonia/enrick.uc"
#include "npc/brentonia/jordell.uc"
#include "npc/brentonia/moniak.uc"
#include "npc/brentonia/lewis.uc"
#include "npc/brentonia/marpen.uc"

/*

Dante's Trading Post

*/ 

#include "npc/dantes/dante.uc"
#include "npc/dantes/amoir.uc"
#include "npc/dantes/ramil.uc"
#include "npc/dantes/gumdrop.uc"
#include "npc/dantes/lucid.uc"
#include "npc/dantes/pippens.uc"
#include "npc/dantes/klemens.uc"

/*

Cremetorium / Noxious Swamp / Crypts

*/

#include "npc/misc/renfry.uc"
#include "npc/misc/mummy.uc"
#include "npc/misc/Tulal.uc"

#include "npc/misc/jones.uc"
#include "npc/misc/marion.uc"
#include "npc/misc/buckles.uc"

#include "npc/misc/darsalik.uc"
#include "npc/misc/zao_pan.uc"

/*

Akakathen and friends

*/

#include "npc/misc/akakothen.uc"

#include "npc/misc/cheater.uc"


/*

Demon realm

*/

#include "npc/demon realm/cacus.uc"
#include "npc/demon realm/cerberus.uc"
#include "npc/demon realm/alastor.uc"

/*



Medina / Nautical Guild

*/

#include "npc/medina/ralnak.uc"
#include "npc/medina/deadeye.uc"
#include "npc/medina/draygan.uc"
#include "npc/medina/beryl.uc"
#include "npc/medina/devra.uc"
#include "npc/medina/ensorcio.uc"
#include "npc/medina/parrik.uc"
#include "npc/medina/vannel.uc"
#include "npc/medina/gunn.uc"
#include "npc/medina/isabella.uc"
#include "npc/medina/anderson.uc"
#include "npc/medina/livesey.uc"
#include "npc/medina/dockmaster.uc"
#include "npc/medina/darnella.uc"

// The ratmen and fairy
#include "npc/medina/equestrielle.uc"
#include "npc/medina/ratticus.uc"

/*

Cotton Cove

*/

#include "npc/cotton cove/olon.uc"
#include "npc/cotton cove/delphynia.uc"
#include "npc/cotton cove/catherine.uc"
#include "npc/cotton cove/gerth.uc"
#include "npc/cotton cove/garth.uc"
#include "npc/cotton cove/zulith.uc"
#include "npc/cotton cove/jefferson.uc"
#include "npc/cotton cove/columna.uc"
#include "npc/cotton cove/dewbert.uc"
#include "npc/cotton cove/caveman.uc"
#include "npc/cotton cove/leon.uc"
#include "npc/cotton cove/esmerelda.uc"
#include "npc/cotton cove/ruggs.uc"
#include "npc/cotton cove/larianna.uc"
#include "npc/cotton cove/bugsy.uc"
#include "npc/cotton cove/brawl.uc"
#include "npc/cotton cove/floyden.uc"
#include "npc/cotton cove/beastly_servant.uc"
#include "npc/cotton cove/annalyn.uc"
#include "npc/cotton cove/old_lady_dorsy.uc"
/*

Pirate headquarters

*/

#include "npc/misc/lechuck.uc"

/*
GROUPABLE CHARACTERS
*/

#include "npc/groupables/julia.uc"

/*
Exeter island
*/

#include "npc/exeter/turak.uc"
#include "npc/exeter/petra.uc"

/*
Hensall - The demon invaded town
*/

#include "npc/hensall/albon.uc"
#include "npc/hensall/walker.uc"
#include "npc/hensall/worley.uc"
#include "npc/hensall/nakentep.uc"
#include "npc/hensall/lee.uc"
#include "npc/hensall/ophelia.uc"

/*
 Start of game NPC's
*/

#include "npc/start/jonas.uc"
#include "npc/start/spectan.uc"
#include "npc/start/sentri1.uc"

/*

Various NPC's

*/

#include "npc/misc/avret.uc"
#include "npc/misc/zark.uc"
#include "npc/usecodetestnpc.uc"
#include "npc/misc/death.uc"
#include "npc/misc/karmatroll.uc"
#include "npc/misc/morghrim.uc"
#include "npc/misc/toban.uc"
#include "npc/cambray/melose.uc"
#include "npc/misc/sirenum.uc"
#include "npc/misc/benedict.uc"
#include "npc/cambray/lernaean.uc" // npc number 94
#include "npc/misc/lady_vox.uc"
#include "npc/misc/graplinosh.uc"
#include "npc/misc/burglemagoo.uc"
#include "npc/misc/lord_nagafen.uc"
#include "npc/misc/alar.uc"
#include "npc/misc/lord_of_flame.uc"
#include "npc/misc/fire_elemental_servant.uc"
#include "npc/misc/burned_soul.uc"
#include "npc/misc/avatar_of_fire.uc"
#include "npc/misc/test_npc.uc"
#include "npc/misc/ice witch/gwani_servant.uc"
#include "npc/misc/ice witch/ice_goblin_servant.uc"
#include "npc/misc/ice witch/ice_troll_servant.uc"
#include "npc/misc/ice witch/ice_witch.uc"
#include "npc/misc/the_illusionist.uc"
#include "npc/misc/erinon.uc"
#include "npc/misc/pained_unicorn.uc"
#include "npc/misc/evil_avatar.uc"
#include "npc/misc/skinless_man.uc"
#include "npc/misc/glumpleton.uc"
#include "npc/misc/henry_the_hobo.uc"
#include "npc/misc/lord_bedimwood.uc"
#include "npc/misc/plains_rider.uc"

#include "npc/misc/dupre.uc"

// End game fate NPC's
#include "npc/misc/end game/jester.uc"
#include "npc/misc/end game/blind_man.uc"
#include "npc/misc/end game/guardian_of_fate.uc"
#include "npc/misc/end game/fate_woman.uc"

// prisoners
#include "npc/misc/end game/crutches_man.uc"
#include "npc/misc/end game/jailed_death.uc"
#include "npc/misc/end game/akakothen_shade.uc"
#include "npc/misc/end game/goblin_prisoner.uc"

#include "npc/misc/end game/bark npcs/bark_npc.uc"

// the past
#include "npc/past/glenn.uc"
#include "npc/past/glenlorn.uc"
#include "npc/past/brenda.uc"
#include "npc/past/magnolie.uc"
#include "npc/past/travlen.uc"
#include "npc/past/morghrim_past.uc"

//Animals and such (lots from TFL)
#include "animals/cow.uc"
#include "animals/chicken.uc"

