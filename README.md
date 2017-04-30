# san-andreas-loadremoval-for-livesplit [1.3](https://github.com/Blantas/san-andreas-loadremoval-for-livesplit/releases)

| Total downloads        | Latest release           |
| ------------- |:-------------:|
| [![All Releases](https://img.shields.io/github/downloads/Blantas/san-andreas-loadremoval-for-livesplit/total.svg?maxAge=86400)](https://github.com/Blantas/san-andreas-loadremoval-for-livesplit/releases)      | [![latest release](https://img.shields.io/github/release/Blantas/san-andreas-loadremoval-for-livesplit.svg)](https://github.com/Blantas/san-andreas-loadremoval-for-livesplit/releases) <br> [![Github Releases](https://img.shields.io/github/downloads/Blantas/san-andreas-loadremoval-for-livesplit/latest/total.svg)](https://github.com/Blantas/san-andreas-loadremoval-for-livesplit/releases) |

An asl script to remove loading times in GTA: San Andreas for [livesplit](http://livesplit.github.io).

# How it works

An asl script tracks a few memory values of the game. When all of them meet specific condition, script asssumes that loading is being done and game is paused. Currently the script is checking for:

* if LoadAllRequestedModels() function is active (happens when game is loading all models which are in requested_models_to_load array);
* if LoadScene() function is active (probably not needed since it calls LoadAllRequestedModels());
* ingame timer hasn't changed because of:
  * a photo taken with a camera being saved to a harddrive;
  * cutscene data being loaded or deleted;
  * game rebuilding player's model;
  * shopping data of items to buy being loaded (reading from shopping.dat);
  * something related to Trip Skip happens (probably not needed since it calls LoadScene() and LoadAllRequestedModels()).
  
The livesplit timer doesn't get paused if you alttab of the game or if you exit the game.

# Support

Discussion thread on speedrun.com: http://www.speedrun.com/gtasa/thread/ojs05

The current version supports only:

|           | 1.0 EU | 1.0 DE | 1.0 US | 1.01 EU | 1.01 DE | 1.01 PL? | 1.01 US | 2.0 | [3.0 STEAM](https://steamcommunity.com/app/12120/discussions/0/34096318964479523/) | r1 STEAM | [r2 STEAM](http://store.steampowered.com/app/12120/) | [WinStore](https://www.microsoft.com/en-us/store/p/grand-theft-auto-san-andreas/9wzdncrfj1zn) |
|-----------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Supported |    ✓   |    ?<sup>1</sup>   |    ✓   |    ✓    |    ?<sup>1</sup>   |      ✓      |    ✓    |     |  ✓  |             |      ✓      |      ✓      |

<sup>1</sup> This version is probably supported but not tested.

To-do:
* Confirm if German versions work fine (1.0 DE, 1.01 DE).
* Add support for 2.00 version.
* Detect loading during initial loading screen.
* Rewrite asl script as a dll and add some adjustable settings to control lag detection.

Known bugs:
* ?

# Demo:

[![Preview](https://j.gifs.com/66v8xl.gif)](https://www.youtube.com/watch?v=SZ18yIhLc6w)
