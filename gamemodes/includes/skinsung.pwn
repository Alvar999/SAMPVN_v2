//TRANG BI SKIN SUNG
#include "ysi\y_hooks"

stock GetSkinM4(skinm4)
{
	new name[82];
	switch(skinm4)
	{
		case 0: name = "";
		case 1: name = "{00ffff}M4 PhanTom Blue{ffffff}";
		case 2: name = "";
	}
	return name;
}
stock GetSkinM4Reg(skinm4reg)
{
	new name[82];
	switch(skinm4reg)
	{
		case 0: name = "";
		case 1: name = "{FF0000}M4 Reg Dragon{ffffff}";
		case 2: name = "";
	}
	return name;
}
stock GetSkinM4Blue(skinm4blue)
{
	new name[82];
	switch(skinm4blue)
	{
		case 0: name = "";
		case 1: name = "{00ffff}M4 Blue Dragon{ffffff}";
		case 2: name = "";
	}
	return name;
}
stock GetSkinDe(skinde)
{
	new name[82];
	switch(skinde)
	{
		case 0: name = "{bfbfbf}Chua So Huu{ffffff}";
		case 1: name = "{af00ff}Deagle Dragon{ffffff}";
		case 2: name = "{bfbfbf}Chua Trang Bi{ffffff}";
	}
	return name;
}
stock GetSkinMP5(skinmp5)
{
	new name[82];
	switch(skinmp5)
	{
		case 0: name = "{bfbfbf}Chua So Huu{ffffff}";
		case 1: name = "{5fffff}MP5 Blue Trantics{ffffff}";
		case 2: name = "{bfbfbf}Chua Trang Bi{ffffff}";
	}
	return name;
}
stock GetSkinSniper(skinsniper)
{
	new name[82];
	switch(skinsniper)
	{
		case 0: name = "{bfbfbf}Chua So Huu{ffffff}";
		case 1: name = "{ff5f00}Sniper King Dom{ffffff}";
		case 2: name = "{bfbfbf}Chua Trang Bi{ffffff}";
	}
	return name;
}
stock GetSkinShotGun(skinshotgun)
{
	new name[82];
	switch(skinshotgun)
	{
		case 0: name = "{bfbfbf}Chua So Huu{ffffff}";
		case 1: name = "{ff00df}Shotgun Merry Christmas{ffffff}";
		case 2: name = "{bfbfbf}Chua Trang Bi{ffffff}";
	}
	return name;
}
stock GetSkinSpas12(skinspas12)
{
	new name[82];
	switch(skinspas12)
	{
		case 0: name = "{bfbfbf}Chua So Huu{ffffff}";
		case 1: name = "{00ff87}Spas12 Blue Trantics{ffffff}";
		case 2: name = "{bfbfbf}Chua Trang Bi{ffffff}";
	}
	return name;
}
stock GetSkinAK(skinak)
{
	new name[82];
	switch(skinak)
	{
		case 0: name = "{bfbfbf}Chua So Huu{ffffff}";
		case 1: name = "{FF0000}AK-47 Phoenix Reg{ffffff}";
		case 2: name = "{bfbfbf}Chua Trang Bi{ffffff}";
	}
	return name;
}
stock GetSkinUzi(skinuzi)
{
	new name[82];
	switch(skinuzi)
	{
		case 0: name = "{bfbfbf}Chua So Huu{ffffff}";
		case 1: name = "{af5fff}Micro SMG/UZI Hellowen{ffffff}";
		case 2: name = "{bfbfbf}Chua Trang Bi{ffffff}";
	}
	return name;
}
stock GetSkinRifle(skinrifle)
{
	new name[82];
	switch(skinrifle)
	{
		case 0: name = "{bfbfbf}Chua So Huu{ffffff}";
		case 1: name = "{00ff00}Rifle Venom Green{ffffff}";
		case 2: name = "{bfbfbf}Chua Trang Bi{ffffff}";
	}
	return name;
}

CMD:levelgun(playerid, params[])
{
    new string[1000];
    format(string, sizeof string, "\n{00ffff}Deagle{FFFFFF} : (%s) | Trang Phuc : (%s)\n{00ffff}M4{FFFFFF} : (%s) | Trang Phuc : (%s%s%s)\n{00ffff}MP5{FFFFFF} : (%s) | Trang Phuc : (%s)\n{00ffff}AK-47{FFFFFF} : (%s) | Trang Phuc : (%s)\n{00ffff}Sniper{FFFFFF} : (%s) | Trang Phuc : (%s)\n{00ffff}ShotGun{FFFFFF} : (%s) | Trang Phuc : (%s)\n{00ffff}Spas12{FFFFFF} : (%s) | Trang Phuc : (%s)\n{00ffff}Micro SMG/Uzi{FFFFFF} : (%s) | Trang Phuc : (%s)\n{00ffff}Country Rifle{FFFFFF} : (%s) | Trang Phuc : (%s)", GetLevelGun(PlayerInfo[playerid][pDeagle]), GetSkinDe(PlayerInfo[playerid][pSkinDE]), GetLevelGun(PlayerInfo[playerid][pM4]), GetSkinM4(PlayerInfo[playerid][pSkinM4]), GetSkinM4Reg(PlayerInfo[playerid][pSkinM4Reg]), GetSkinM4Blue(PlayerInfo[playerid][pSkinM4Blue]), GetLevelGun(PlayerInfo[playerid][pMP5]), GetSkinMP5(PlayerInfo[playerid][pSkinMP5]), GetLevelGun(PlayerInfo[playerid][pAK]), GetSkinAK(PlayerInfo[playerid][pSkinAK]), GetLevelGun(PlayerInfo[playerid][pSniper]), GetSkinSniper(PlayerInfo[playerid][pSkinSniper]), GetLevelGun(PlayerInfo[playerid][pShotgun]), GetSkinShotGun(PlayerInfo[playerid][pSkinShotGun]), GetLevelGun(PlayerInfo[playerid][pSpas12]), GetSkinSpas12(PlayerInfo[playerid][pSkinSpas12]), GetLevelGun(PlayerInfo[playerid][pUzi]), GetSkinUzi(PlayerInfo[playerid][pSkinUzi]), GetLevelGun(PlayerInfo[playerid][pRifle]), GetSkinRifle(PlayerInfo[playerid][pSkinRifle]));
    ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Thong Tin Vu Khi", string, "Dong Lai", "");
    SendClientMessageEx(playerid, COLOR_GREY, "{FFFFFF}SU DUNG: {00FF00}/skinsung{FFFFFF} De Lay Va Cat Skin Sung");
    return 1;
}
