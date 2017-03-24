/**
 * GTA San Andreas Loading Times Removal
 *							(GTASA LoadRemoval)

 * @game	   Grand Theft Auto: San Andreas
 * @category   Load Time Removal
 * @author     Karolis Vaikutis <speedrun.com/user/Blantas>
 * @version    1.2.1
 * @link       https://github.com/Blantas/san-andreas-loadremoval-for-livesplit

 * @supported  1.00 EU/US
               1.01 EU/US
			   1.01 PL(?)
               3.00 STEAM
			   newsteam_r2
			   
 * @todo	   Add support for German (1.0 and 1.01) versions.	   
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
	byte	hasFocus		: 0x4D621C;
	
	byte	codePause		: 0x77CB48;
	byte	userPause		: 0x77CB49;
	
	float	ms_fTimeStep	: 0x77Cb5C;
	
	byte	loadingModels	: 0x565538;
	byte	loadingScene	: 0x5654BD;
}

state("gta_sa", "1.00_US")
{
	int 	globalGameTimer : 0x77CB84;
	
	int 	gameState		: 0x88D4C0;
	byte 	playerInMenu	: 0x7A67A4;
	byte	hasFocus		: 0x4D621C;
	
	byte	codePause		: 0x77CB48;
	byte	userPause		: 0x77CB49;
	
	float	ms_fTimeStep	: 0x77Cb5C;
	
	byte	loadingModels	: 0x565538;
	byte	loadingScene	: 0x5654BD;
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
	byte	hasFocus		: 0x4D88B8;
	
	byte	codePause		: 0x77F1C8;
	byte	userPause		: 0x77F1C9;
	
	float	ms_fTimeStep	: 0x77F1DC;
	
	byte	loadingModels	: 0x567BB8;
	byte	loadingScene	: 0x567B3D;
}

state("gta_sa", "1.01_US") 
{
	int 	globalGameTimer : 0x77f204;
	
	int 	gameState		: 0x88FC80;
	byte 	playerInMenu	: 0x7a8e24;
	byte	hasFocus		: 0x4D88B8;
	
	byte	codePause		: 0x77F1C8;
	byte	userPause		: 0x77F1C9;
	
	float	ms_fTimeStep	: 0x77F1DC;
	
	byte	loadingModels	: 0x567BB8;
	byte	loadingScene	: 0x567B3D;
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
	byte	hasFocus		: 0x54B5B4;
	
	byte	codePause		: 0x7F7AF9;
	byte	userPause		: 0x7F7AFA;
	
	float	ms_fTimeStep	: 0x7F7B10;
	
	byte	loadingModels	: 0x5DAF00;
	byte	loadingScene	: 0x5DAE99;
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
	byte	hasFocus		: 0x54DB20;
	
	byte	codePause		: 0x80F4F9;
	byte	userPause		: 0x80F4FA;
	
	float	ms_fTimeStep	: 0x80F510;
	
	byte	loadingModels	: 0x5DA8C4;
	byte	loadingScene	: 0x5DA859;
}

state("testapp", "3.00_STEAM")
{
	int 	globalGameTimer : 0x80f538;
	int 	gameState		: 0x9187F0;
	byte 	playerInMenu	: 0x83315C;
	byte	hasFocus		: 0x54DB20;
	
	byte	codePause		: 0x80F4F9;
	byte	userPause		: 0x80F4FA;
	
	float	ms_fTimeStep	: 0x80F510;
	
	byte	loadingModels	: 0x5DA8C4;
	byte	loadingScene	: 0x5DA859;
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
	byte	hasFocus		: 0x54DB20;
	
	byte	codePause		: 0x80FD39;
	byte	userPause		: 0x80FD3A;
	
	float	ms_fTimeStep	: 0x80FD50;
	
	byte	loadingModels	: 0x5DD100;
	byte	loadingScene	: 0x5DD099;
}

startup
{
	// How often script checks game values
	refreshRate = 20;
	
	// Version name, (module size, address to check while identifying version, version number)
	vars.gameVersions = new Dictionary<string,List<int>> {
		{"1.00_US",		new List<int> {18313216, 	0x42457C,	38079}},
		{"1.00_EU",		new List<int> {18313216, 	0x4245BC,	38079}},
		{"1.01_US", 	new List<int> {34471936, 	0x4252FC,	38079}},
		{"1.01_EU",		new List<int> {34471936, 	0x42533C,	38079}},
		{"1.01_PL",		new List<int> {9621504, 	0x0		,	0}},
		{"3.00_STEAM",	new List<int> {9691136, 	0x45EC4A,	0}},
		{"newsteam_r2",	new List<int> {9981952, 	0x7fff20,	0}}
	};
}

init
{
	vars.enabled = true;
	version = "";

	// Getting process module size
	int gameSize = modules.First().ModuleMemorySize;
	
	print("[GTASA LoadRemoval] Game proccess has been found. Module: " + game.ProcessName + ". Size: " + gameSize + ".");
	
	// Identifying game module version
	foreach (var item in vars.gameVersions) 
	{
		if(gameSize == item.Value[0] || (memory.ReadValue<int>(modules.First().BaseAddress + (int)item.Value[1]) == item.Value[2] && item.Value[2] != 0)) 
		{
			version = item.Key;
			print("[GTASA LoadRemoval] Game version identified: " + item.Key + ".");
			break;
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
	
	// Checking if game window has focus (helps detecting alttabing)
	if(current.hasFocus != 1 || (current.hasFocus == 1 && old.hasFocus == 0)) return false;
	
	// Checking if PAUSE MENU is active
	if(current.playerInMenu != 0) return false;
	
	// Checking if player paused the game (Not needed, because ^ PAUSE MENU check is already used, but wouldn't hurt being careful)
	if(current.userPause == 1) return false;
	
	// Checking if codePause? (Not needed, used only while checking game CD for audio)
	if(current.codePause == 1) return false;
	
	// Checking if game is loading requested models
	if(current.loadingModels == 1) return true;
	
	// Checking if game is loading scene
	if(current.loadingScene == 1) return true;
	
	// Checking if fTimeStep values aren't normal (useful to detect lag)(game recalculates gametime if value is >= 3)
	if(current.ms_fTimeStep < 1.0 || old.ms_fTimeStep < 1.0 || current.ms_fTimeStep >= 2.5 || old.ms_fTimeStep >= 2.5) return false;
	
	// Comparing previous and current global timer values
	return current.globalGameTimer == old.globalGameTimer;
}