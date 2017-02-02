/**
 * GTA San Andreas Loading Times Removal
 *							(GTASA LoadRemoval)

 * @game	   Grand Theft Auto: San Andreas
 * @category   Load Time Removal
 * @author     Karolis Vaikutis <speedrun.com/user/Blantas>
 * @version    1.0
 * @link       https://github.com/Blantas/san-andreas-loadremoval-for-livesplit

 * @supported  1.00 EU/US
               1.01 EU/US
			   1.01 PL(?)
               3.00 STEAM
			   newsteam_r2
			   
 * @todo	   Detect if game has focus.
			   Add support for German (1.0 and 1.01) versions.	   
 */

/**
 * San Andreas 1.0
 * Both EU and US versions are almost the same.
 */
	
state("gta_sa", "1.00_EU")
{
	int 	globalGameTimer : 0x77CB84;
	int 	gameState		: 0x88D4C0;
	byte 	playerInMenu	: 0x7A67A4;
	int 	versionCheck 	: 0x4245BC; 
}

state("gta_sa", "1.00_US")
{
	int 	globalGameTimer : 0x77CB84;
	int 	gameState		: 0x88D4C0;
	byte 	playerInMenu	: 0x7A67A4;
	int 	versionCheck 	: 0x42457C;
}

/**
 * San Andreas 1.01
 * Both EU and US versions are almost the same.
 */
 
state("gta_sa", "1.01_EU")
{
	int 	globalGameTimer : 0x77f204;
	int 	gameState		: 0x88FC80;
	byte 	playerInMenu	: 0x7a8e24;
	int 	versionCheck 	: 0x42533C;
}

state("gta_sa", "1.01_US") 
{
	int 	globalGameTimer : 0x77f204;
	int 	gameState		: 0x88FC80;
	byte 	playerInMenu	: 0x7a8e24;
	int 	versionCheck 	: 0x4252FC;
}

/**
 * Probably 1.01 Polish version
 * If anyone can confirm this, please contact me.
 * Detecting version by looking for 38079 doesn't seem to work at all.
*/

state("gta_sa", "1.01_PL") 
{
	int 	globalGameTimer : 0x7f7b38;
	int 	gameState		: 0x900F30;
	byte 	playerInMenu	: 0x7E0D1C;
	int 	versionCheck 	: 0x0;
}

/**
 * San Andreas 3.00
 * Detecting version by checking 0x45EC4A value doesn't seem to work always.
 * Currently available only using a downgrader.
*/

state("gta-sa", "3.00_STEAM")
{
	int 	globalGameTimer : 0x80f538;
	int 	gameState		: 0x9187F0;
	byte 	playerInMenu	: 0x83315C;
	int 	versionCheck 	: 0x45EC4A;
}

state("testapp", "3.00_STEAM")
{
	int 	globalGameTimer : 0x80f538;
	int 	gameState		: 0x9187F0;
	byte 	playerInMenu	: 0x83315C;
	int 	versionCheck 	: 0x45EC4A;
}

/**
 * San Andreas newsteam_r2
 * Current version available in steam.
 * Steam version available since December 9th 2014
*/

state("gta-sa", "newsteam_r2")
{
	int 	globalGameTimer : 0x80FD74;
	int 	gameState		: 0x919020;
	byte 	playerInMenu	: 0x7FAF2C;
	int 	versionCheck 	: 0x0;
}

startup
{
	// How often script checks game values
	refreshRate = 20;
	
	// Version name, (module size, address to check while identifying version)
	vars.gameVersions = new Dictionary<string,List<int>> {
		{"1.00_US",		new List<int> {18313216, 	0x42457C}},
		{"1.00_EU",		new List<int> {18313216, 	0x4245BC}},
		{"1.01_US", 	new List<int> {34471936, 	0x4252FC}},
		{"1.01_EU",		new List<int> {34471936, 	0x42533C}},
		{"1.01_PL",		new List<int> {9621504, 	0x0		}},
		{"3.00_STEAM",	new List<int> {9691136, 	0x45EC4A}},
		{"newsteam_r2",	new List<int> {9981952, 	0x0		}}
	};
}

init
{
	vars.enabled = true;
	version = "";

	int compareWithValue = 38079;
	
	// Getting process module size
	int gameSize = modules.First().ModuleMemorySize;
	
	print("[GTASA LoadRemoval] Game proccess has been found. Module: " + game.ProcessName + ". Size: " + gameSize + ".");
	
	// Identifying game module version
	foreach (var item in vars.gameVersions) 
	{
		if(gameSize == item.Value[0] || memory.ReadValue<int>(modules.First().BaseAddress + (int)item.Value[1]) == compareWithValue) 
		{
			version = item.Key;
			print("[GTASA LoadRemoval] Game version identified: " + item.Key + ".");
		}
	}
	
	// If version wasn't identified
	if(version == "")
	{
		version = "unknown (" + gameSize + ")";
		print("[GTASA LoadRemoval] Game version was not identified.");
		vars.enabled = false;
	}
} 

exit 
{
	// Making sure timer doesn't stop after exiting game or if game crashes
	timer.IsGameTimePaused = false;
}

update
{
	// To prevent isLoading from being run if game version wasn't detected.
	if(!vars.enabled) return false;
}

isLoading
{
	// Checking game state (9 -> when gta.dat was loaded)
	if(current.gameState != 9) return false;
	
	// Checking if PAUSE MENU is active
	if(current.playerInMenu != 0) return false;
	
	// Comparing previous and current global timer values
	return current.globalGameTimer == old.globalGameTimer;
}
