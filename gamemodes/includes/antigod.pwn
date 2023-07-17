#include <YSI\y_hooks>

hook OnPlayerConnect(playerid)
{
        SetPVarInt(playerid, "LastHP", 0);
        SetPVarInt(playerid, "LastHP1", 0);
        SetPVarInt(playerid, "last_anim", 0);
        return true;
}

hook OnPlayerDisconnect(playerid)
{
        DeletePVar(playerid, "LastHP");
        DeletePVar(playerid, "LastHP1");
        DeletePVar(playerid, "last_anim");
        return true;
}

hook OnPlayerUpdate(playerid)
{
        new Float: health, Float: armour;
        GetPlayerHealth(playerid, health);
        GetPlayerArmour(playerid, armour);
        new HP = floatround(health +armour, floatround_floor);
        if (GetPlayerTeam(playerid) == 255)
        {
                new anim_id = GetPlayerAnimationIndex(playerid);
                if (anim_id != GetPVarInt(playerid, "last_anim"))
                {
                        if (1071 <= anim_id <= 1086 || 1170 <= anim_id <= 1179 || 1240 <= anim_id <= 1243)
                        {
                        if (HP == GetPVarInt(playerid, "LastHP1") && HP == GetPVarInt(playerid, "LastHP"))
                            {
                                new animlib[32], animname[32];
                                GetAnimationName(anim_id, animlib, sizeof(animlib), animname, sizeof(animname));
                                new name[MAX_PLAYER_NAME];
                                GetPlayerName(playerid, name, sizeof(name));
                                new string[128];
                                format(string, sizeof(string), "%s(%d) Hacking God De Nghi Kick Khoi SERVER Hoac Banned", name, playerid);
                     			ABroadCast(COLOR_YELLOW , string, 2);
                                // Kick(playerid); / Ban(playerid); / send message to admins etc...
                                }
								else
								{
                                        SetPVarInt(playerid, "LastHP1", HP);
                                }
                        }
                        SetPVarInt(playerid, "last_anim", anim_id);
                }
        }
        if (HP != GetPVarInt(playerid, "LastHP"))
        {
                SetPVarInt(playerid, "LastHP", HP);
        }
        return true;
}
