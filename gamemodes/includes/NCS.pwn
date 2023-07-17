// System - NANG CAP SUNG
//CRE: Dang Nguyen

#include "ysi\y_hooks"


#define MAX_LEVELGUN 8

stock GetLevelGun(level)
{
	new name[82];
	switch(level)
	{
		case 0: name = "{5fd7d7}Normal{ffffff}";
		case 1: name = "{800080}Rare{ffffff}";
		case 2: name = "{fff81f}Epic{ffffff}";
		case 3: name = "{ff6a00}Unique{ffffff}";
		case 4: name = "{9900FF}Super Unique{ffffff}";
        case 5: name = "{00ffff}Legendary{ffffff}";
		case 6: name = "{f00000}Mystic{ffffff}";
		case 7: name = "{FF0099}Mystic S{ffffff}";
		case 8: name = "{00FF00}SAMP{00ffff}VN{ffffff}";
	}
	return name;
}

SendDamage(playerid, damagedid, Float:amount, weaponid)
{
	if(GetPVarInt(damagedid, "IsInArena") >= 0) return 1;
   	if(GetPVarInt(damagedid, "EventToken") != 0) return 1;

	new Float:TotalDamage, Float:Health, Float:Armor;
   	new PlayerVar;
   	if(weaponid == 24) // Deagle\nM4a1\nAK-47\nMP5\nShotgun
   	{
   		PlayerVar = PlayerInfo[playerid][pDeagle];
   		if(PlayerVar == 0) TotalDamage = 40.00;
		if(PlayerVar == 1) TotalDamage = 42.00;
		if(PlayerVar == 2) TotalDamage = 44.00;
		if(PlayerVar == 3) TotalDamage = 46.00;
		if(PlayerVar == 4) TotalDamage = 48.00;
		if(PlayerVar == 5) TotalDamage = 50.00;
		if(PlayerVar == 6) TotalDamage = 52.00;
		if(PlayerVar == 7) TotalDamage = 54.00;
		if(PlayerVar == 8) TotalDamage = 56.00;
   	}
  	else if(weaponid == 34)
   	{
   		PlayerVar = PlayerInfo[playerid][pSniper];
   		if(PlayerVar == 0) TotalDamage = 40.00;
		if(PlayerVar == 1) TotalDamage = 42.00;
		if(PlayerVar == 2) TotalDamage = 44.00;
		if(PlayerVar == 3) TotalDamage = 46.00;
		if(PlayerVar == 4) TotalDamage = 48.00;
		if(PlayerVar == 5) TotalDamage = 50.00;
		if(PlayerVar == 6) TotalDamage = 52.00;
		if(PlayerVar == 7) TotalDamage = 54.00;
		if(PlayerVar == 8) TotalDamage = 56.00;
   	}
   	else if(weaponid == 27)
   	{
   		PlayerVar = PlayerInfo[playerid][pSpas12];
   		if(PlayerVar == 0) TotalDamage = 9.00;
		if(PlayerVar == 1) TotalDamage = 10.00;
		if(PlayerVar == 2) TotalDamage = 11.00;
		if(PlayerVar == 3) TotalDamage = 12.00;
		if(PlayerVar == 4) TotalDamage = 13.00;
		if(PlayerVar == 5) TotalDamage = 14.00;
		if(PlayerVar == 6) TotalDamage = 15.00;
		if(PlayerVar == 7) TotalDamage = 16.00;
		if(PlayerVar == 8) TotalDamage = 17.00;
   	}
   	else if(weaponid == 30)
   	{
   		PlayerVar = PlayerInfo[playerid][pM4];
   		if(PlayerVar == 0) TotalDamage = 9.00;
		if(PlayerVar == 1) TotalDamage = 12.00;
		if(PlayerVar == 2) TotalDamage = 13.00;
		if(PlayerVar == 3) TotalDamage = 14.00;
		if(PlayerVar == 4) TotalDamage = 15.00;
		if(PlayerVar == 5) TotalDamage = 16.00;
		if(PlayerVar == 6) TotalDamage = 17.00;
		if(PlayerVar == 7) TotalDamage = 18.00;
		if(PlayerVar == 8) TotalDamage = 20.00;
   	}
  	else if(weaponid == 31)
   	{
   		PlayerVar = PlayerInfo[playerid][pM4];
   		if(PlayerVar == 0) TotalDamage = 9.00;
		if(PlayerVar == 1) TotalDamage = 12.00;
		if(PlayerVar == 2) TotalDamage = 13.00;
		if(PlayerVar == 3) TotalDamage = 14.00;
		if(PlayerVar == 4) TotalDamage = 15.00;
		if(PlayerVar == 5) TotalDamage = 16.00;
		if(PlayerVar == 6) TotalDamage = 17.00;
		if(PlayerVar == 7) TotalDamage = 18.00;
		if(PlayerVar == 8) TotalDamage = 20.00;
   	}
  	else if(weaponid == 29)
   	{
   		PlayerVar = PlayerInfo[playerid][pMP5];
   		if(PlayerVar == 0) TotalDamage = 9.00;
		if(PlayerVar == 1) TotalDamage = 10.00;
		if(PlayerVar == 2) TotalDamage = 11.00;
		if(PlayerVar == 3) TotalDamage = 12.00;
		if(PlayerVar == 4) TotalDamage = 13.00;
		if(PlayerVar == 5) TotalDamage = 14.00;
		if(PlayerVar == 6) TotalDamage = 15.00;
		if(PlayerVar == 7) TotalDamage = 16.00;
		if(PlayerVar == 8) TotalDamage = 17.00;
   	}
   	else if(weaponid == 25)
   	{
   		PlayerVar = PlayerInfo[playerid][pShotgun];
   		if(PlayerVar == 0) TotalDamage = 11.00;
		if(PlayerVar == 1) TotalDamage = 12.50;
		if(PlayerVar == 2) TotalDamage = 13.10;
		if(PlayerVar == 3) TotalDamage = 14.50;
		if(PlayerVar == 4) TotalDamage = 15.20;
		if(PlayerVar == 5) TotalDamage = 16.10;
		if(PlayerVar == 6) TotalDamage = 17.20;
		if(PlayerVar == 7) TotalDamage = 18.50;
		if(PlayerVar == 8) TotalDamage = 19.00;
   	}
   	else if(weaponid == 28)
   	{
   		PlayerVar = PlayerInfo[playerid][pUzi];
   		if(PlayerVar == 0) TotalDamage = 8.00;
		if(PlayerVar == 1) TotalDamage = 9.00;
		if(PlayerVar == 2) TotalDamage = 10.00;
		if(PlayerVar == 3) TotalDamage = 11.00;
		if(PlayerVar == 4) TotalDamage = 12.00;
		if(PlayerVar == 5) TotalDamage = 13.00;
		if(PlayerVar == 6) TotalDamage = 14.00;
		if(PlayerVar == 7) TotalDamage = 15.00;
		if(PlayerVar == 8) TotalDamage = 16.00;
   	}
   	else if(weaponid == 33)
   	{
   		PlayerVar = PlayerInfo[playerid][pSniper];
   		if(PlayerVar == 0) TotalDamage = 30.00;
		if(PlayerVar == 1) TotalDamage = 32.00;
		if(PlayerVar == 2) TotalDamage = 34.00;
		if(PlayerVar == 3) TotalDamage = 36.00;
		if(PlayerVar == 4) TotalDamage = 38.00;
		if(PlayerVar == 5) TotalDamage = 40.00;
		if(PlayerVar == 6) TotalDamage = 42.00;
		if(PlayerVar == 7) TotalDamage = 44.00;
		if(PlayerVar == 8) TotalDamage = 46.00;
   	}
   	else TotalDamage = amount;
   	GetPlayerHealth(damagedid, Health);
   	GetPlayerArmour(damagedid, Armor);
   	if(Health > TotalDamage && Armor < 1)
	{
		SetPlayerHealth(damagedid, Health - TotalDamage);
	}
	if(Armor > TotalDamage)
	{
		SetPlayerArmour(damagedid, Armor - TotalDamage);
	}
	else
	{
	 	SetPlayerArmour(damagedid, 0);
	 	SetPlayerHealth(damagedid, (Health - TotalDamage) + Armor);
	}
	SendHistory(playerid, damagedid , TotalDamage , weaponid , PlayerVar);
	return 1;
}

SendHistory(playerid, playerid1 , Float:amount , weapon , Levelgun)
{
	new string[155], string1[155], Namex[MAX_PLAYER_NAME];
	GetWeaponName(weapon, Namex, MAX_PLAYER_NAME);
	format(string, 155, "[CHIEN DAU] {00FF00}+%.02f{ffffff} [{00FFFF}%s{FFFFFF}] [{FFFF00}%s{FFFFFF} (%s)] (%.02fm)", amount ,GetPlayerNameEx(playerid1), Namex, GetLevelGun(Levelgun),  GetDistanceBetweenPlayers(playerid, playerid1));
	format(string1, 155, "[CHIEN DAU] {FF0000}-%.02f{ffffff} [{00FF00}%s{FFFFFF}] [{FFFF00}%s{FFFFFF} (%s)] (%.02fm)", amount ,GetPlayerNameEx(playerid), Namex, GetLevelGun(Levelgun),  GetDistanceBetweenPlayers(playerid1, playerid));
	SendClientMessage(playerid, -1, string);
	SendClientMessage(playerid1, -1, string1);
	PlayerPlaySound(playerid, 17804, 0, 0, 0);
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[500];
	if(dialogid == DIALOG_NANGCAPSUNG && response)
	{
		new UpdateWeapons;
		if(listitem == 0)
		{
			if(PlayerInfo[playerid][pDeagle] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pDeagle] + 1) * 1000000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Deagle\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pDeagle]), GetLevelGun(PlayerInfo[playerid][pDeagle]+1));
			SetPVarInt(playerid, "GunID?", 24);
		}
		if(listitem == 1)
		{
			if(PlayerInfo[playerid][pM4] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pM4] + 1) * 1000000; // sam
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}M4A1\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pM4]), GetLevelGun(PlayerInfo[playerid][pM4]+1));
			SetPVarInt(playerid, "GunID?", 31);
		}
		if(listitem == 2)
		{
			if(PlayerInfo[playerid][pSniper] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pSniper] + 1) * 1000000; // sam
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Sniper\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pSniper]), GetLevelGun(PlayerInfo[playerid][pSniper]+1));
			SetPVarInt(playerid, "GunID?", 34);
		}
		if(listitem == 3)
		{
			if(PlayerInfo[playerid][pMP5] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pMP5] + 1) * 1000000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}MP5\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pMP5]), GetLevelGun(PlayerInfo[playerid][pMP5]+1));
			SetPVarInt(playerid, "GunID?", 29);
		}
		if(listitem == 4)
		{
			if(PlayerInfo[playerid][pShotgun] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pShotgun] + 1) * 1000000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}ShotGun\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pShotgun]), GetLevelGun(PlayerInfo[playerid][pShotgun]+1));
			SetPVarInt(playerid, "GunID?", 25);
		}
		if(listitem == 5)
		{
			if(PlayerInfo[playerid][pSpas12] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pSpas12] + 1) * 1000000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Spas12\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pSpas12]), GetLevelGun(PlayerInfo[playerid][pSpas12]+1));
			SetPVarInt(playerid, "GunID?", 27);
		}
		if(listitem == 6)
		{
			if(PlayerInfo[playerid][pAK] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pAK] + 1) * 1000000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}AK-47\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pAK]), GetLevelGun(PlayerInfo[playerid][pAK]+1));
			SetPVarInt(playerid, "GunID?", 30);
		}
		if(listitem == 7)
		{
			if(PlayerInfo[playerid][pUzi] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pUzi] + 1) * 1000000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Micro Uzi\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pUzi]), GetLevelGun(PlayerInfo[playerid][pUzi]+1));
			SetPVarInt(playerid, "GunID?", 28);
		}
		if(listitem == 8)
		{
			if(PlayerInfo[playerid][pRifle] >= 7) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pRifle] + 1) * 1000000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Coin : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Rifle\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pRifle]), GetLevelGun(PlayerInfo[playerid][pRifle]+1));
			SetPVarInt(playerid, "GunID?", 33);
		}
		SetPVarInt(playerid, "PriceUp?", UpdateWeapons);
		ShowPlayerDialog(playerid, DIALOG_NANGCAPSUNG1, DIALOG_STYLE_MSGBOX, "Nang Cap Vu Khi", string, "Nang", "Huy");
	}
	if(dialogid == DIALOG_NANGCAPSUNG1)
	{
		if(response)
		{
			new gunid = GetPVarInt(playerid, "GunID?") , price = GetPVarInt(playerid, "PriceUp?");
			if(price > PlayerInfo[playerid][pCOIN]) return SendClientMessage(playerid, -1, "Ban khong co du Coin de nang cap vu khi");
			if(100000 > PlayerInfo[playerid][pMats]) return SendClientMessage(playerid, -1, "Ban Khong Du Vat Lieu De Nang Cap Vu Khi");
			if(gunid == 24)
			{
                new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pDeagle] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Deagle Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pDeagle]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [Deagle %s > Deagle %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pDeagle]-1), GetLevelGun(PlayerInfo[playerid][pDeagle]));
                }
			}
			if(gunid == 34)
			{
                new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pSniper] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Sniper Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pSniper]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [Sniper %s > Sniper %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pSniper]-1), GetLevelGun(PlayerInfo[playerid][pSniper]));
                }
			}
			if(gunid == 31)
			{
                new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pM4] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}M4A1 Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pM4]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [M4A1 %s > M4A1 %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pM4]-1), GetLevelGun(PlayerInfo[playerid][pM4]));
                }
			}
			if(gunid == 29)
			{
				new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pMP5] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}MP5 Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pMP5]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [MP5 %s > MP5 %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pMP5]-1), GetLevelGun(PlayerInfo[playerid][pMP5]));
                }
			}
			if(gunid == 25)
			{
                new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pShotgun] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}ShotGun Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pShotgun]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [SHOTGUN %s > SHOTGUN %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pShotgun]-1), GetLevelGun(PlayerInfo[playerid][pShotgun]));
                }
			} // pS9mm
			if(gunid == 27)
			{
                new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pSpas12] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Spas12 Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pSpas12]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [SPAS-12 %s > SPAS-12 %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pSpas12]-1), GetLevelGun(PlayerInfo[playerid][pSpas12]));
                }
			}
			if(gunid == 30)
			{
                new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pAK] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}AK-47 Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pAK]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 100000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [AK %s > AK %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pAK]-1), GetLevelGun(PlayerInfo[playerid][pAK]));
                }
			}
			if(gunid == 28)
			{
                new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pUzi] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Micro Uzi Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pUzi]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 100000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [Micro Uzi %s > Micro Uzi %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pUzi]-1), GetLevelGun(PlayerInfo[playerid][pUzi]));
                }
			}
			if(gunid == 33)
			{
                new rand = random(99);
                if(rand >= 0 && rand <= 20)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[Nang Cap Vu Khi That Bai]{ff00ff} Ban Duoc Den Bu (200,000) Coin");
                PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCOIN] += 200000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pRifle] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}Nang Cap Vu Khi{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Rifle Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pRifle]++;
				PlayerInfo[playerid][pCOIN] -= price;
				PlayerInfo[playerid][pMats] -= 100000;
				format(string, sizeof string, "{00ff00}[Nang Cap Vu Khi Thanh Cong]{ffffff} : [Rifle %s > Rifle %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pRifle]-1), GetLevelGun(PlayerInfo[playerid][pRifle]));
                }
			}
			SendClientMessage(playerid, -1, string);
		}
		else
		{
			DeletePVar(playerid, "GunID?");
			DeletePVar(playerid, "PriceUp?");
		}
	}
	return 1;
}

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	SendDamage(playerid, damagedid, amount, weaponid);
	return 1;
}
IsAblePedAnimation(playerid)
{
    if(GetPVarInt(playerid, "PlayerCuffed") != 0 || GetPVarInt(playerid, "Injured") == 1 || GetPVarInt(playerid, "IsFrozen") == 1)
	{
   		SendClientMessage(playerid, COLOR_GRAD2, "ban khong the lam dieu do vao thoi diem nay!");
   		return 0;
	}
    if(IsPlayerInAnyVehicle(playerid) == 1)
    {
		SendClientMessage(playerid, COLOR_GRAD2, "Doi Hoi Ban Phai O Ben Ngoai Chiec Xe");
		return 0;
	}
	return 1;
}
PlayAnim(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}
