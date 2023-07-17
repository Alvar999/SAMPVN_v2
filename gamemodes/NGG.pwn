#define SERVER_GM_TEXT "[SAMPVN]"

#include <a_samp>
#include <a_mysql>
#include <a_actor>
#include <streamer>
#include <yom_buttons>
#include <ZCMD>
#include <dini>
#include <037-compat>
#include <easydialog>
#include <sscanf2>
#include <foreach>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <YSI\y_ini>
#include <SimpleINI>
#include <mxini>

//
#if defined SOCKET_ENABLED
#include <socket>
#endif
#include "./includes/ngg.pwn"
#include "./includes/haican.pwn"
#include "./includes/NCS.pwn"
#include "./includes/CUSTOMWEAPON.pwn"
#include "./includes/Trucker.pwn"
#include "./includes/FlyMode.pwn"
#include "./includes/jobvatlieu.pwn"
#include "./includes/skinsung.pwn"
#include "./includes/telecrashzone.pwn"

main() {}

public OnGameModeInit()
{
	print("Dang chuan bi tai gamemode, xin vui long cho doi...");
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}
public OnPlayerExitedMenu(playerid)
{
    TogglePlayerControllable(playerid,1); // unfreeze the player when they exit a menu
    return 1;
}
public OnPlayerObjectMoved(playerid,objectid)
{
    return 1;
}
public OnPlayerRequestSpawn(playerid)
{
    return 1;
}
public OnPlayerSelectedMenuRow(playerid, row)
{
    return 1;
}
public OnPlayerEnterRaceCheckpoint(playerid)
{
    return 1;
}
public OnPlayerLeaveRaceCheckpoint(playerid)
{
    return 1;
}
public OnRconCommand(cmd[])
{
    return 0;
}
public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    return 1;
}
public OnVehicleStreamOut(vehicleid, forplayerid)
{
    return 1;
}
