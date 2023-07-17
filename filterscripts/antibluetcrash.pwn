#include <a_samp>
#define COLOR_WHITE 0xFFFFFFF
public OnFilterScriptInit()
{
	print("\n=====================================");
 	print(" ANTI BULLET-CRASHER BY IMADDY LOADED");
 	print(" VK: http://vk.com/alexander_bochkarev");
	print("=====================================\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

stock BadFloat(Float:x)
{
	if(x >= 10.0 || x <= -10.0)
		return true;

	return false;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if( hittype == BULLET_HIT_TYPE_PLAYER && (BadFloat(fX) || BadFloat(fY) || BadFloat(fZ)) )
	{
        SendClientMessage(playerid, COLOR_WHITE, "Ban da bi kick khoi server ly do Bullet-Crash.");
		Kick(playerid); // CRASHER DETECTED
	    return 0;
	}

	return true;
}
