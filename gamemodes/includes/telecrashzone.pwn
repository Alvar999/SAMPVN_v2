#include <YSI\y_hooks>



CMD:crashzone(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], name[MAX_PLAYER_NAME];
		if(sscanf(params, "s[124]", name)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /crashzone [player name]");

		new tmpName[24], query[512];

		mysql_escape_string(name, tmpName);

		SetPVarString(playerid, "OnCrashZoneAccount", tmpName);

		format(string, sizeof(string), "Bat dau dich chuyen %s...", tmpName);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);

		format(query,sizeof(query),"UPDATE `accounts` SET `CrashZone`=1 WHERE `Username` = '%s'", tmpName);
		mysql_function_query(MainPipeline, query, false, "OnCrashZoneAccount", "i", playerid);
	}
	return 1;
}


forward OnCrashZoneAccount(index);
public OnCrashZoneAccount(index)
{
	new string[128], name[24];
	GetPVarString(index, "OnCrashZoneAccount", name, 24);

	if(mysql_affected_rows(MainPipeline)) {
		format(string, sizeof(string), "Ban da bo tu thanh cong nguoi choi %s's .", name);
		SendClientMessageEx(index, COLOR_WHITE, string);

		format(string, sizeof(string), "AdmCmd: %s da duoc dich chuyen offline boi %s", name, GetPlayerNameEx(index));
		Log("logs/admin.log", string);
	}
	else {
		format(string, sizeof(string), "Da co mot van de say ra khi dich chuyen %s's.", name);
		SendClientMessageEx(index, COLOR_WHITE, string);
	}

	DeletePVar(index, "OnCrashZoneAccount");

	return 1;
}


forward TimeTeleportCrashZone(playerid);
public TimeTeleportCrashZone(playerid)
{
					SetPlayerPos(playerid, 1826.76, -1538.57, 13.25);
					SetPlayerFacingAngle(playerid, 255.08);
					SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da duoc admin dich chuyen ra khoi khu vuc crash zone.");
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerVirtualWorld(playerid, 0);
					PlayerInfo[playerid][pVW] = 0;
					PlayerInfo[playerid][CrashZone] = 0;
}
