state("gta_sa")
{
	int 	globalGameTimer : 0x77CB84;
	int 	gameState	: 0x88D4C0;
	byte 	playerInMenu	: 0x7A67A4;
}

startup
{
	// How often script checks game values
	refreshRate = 20;
}

exit
{
	// Making sure timer doesn't stop after exiting game or if game crashes
	timer.IsGameTimePaused = false;
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
