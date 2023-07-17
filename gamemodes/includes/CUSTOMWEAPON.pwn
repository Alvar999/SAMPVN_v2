////////////////////////////////////////Sung Custom Loc 6 Cay Deagle , M4 , MP5 , SNIPER , SPAS12 , SHOTGUN , /////////////////////////////////////////////////////////////////////
//////////////////////////////////////////CRE BY DANG NGUYEN DEP TRAI NHAT THE GIOI :V/////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////Facebook Dang Nguyen///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include <a_samp>
#include <YSI\y_hooks>


hook OnPlayerUpdate(playerid)
{
   CustomM4(playerid);
   CustomMP5(playerid);
   CustomDe(playerid);
   CustomSniper(playerid);
   CustomShotGun(playerid);
   CustomSpas12(playerid);
   CustomAK(playerid);
   CustomUzi(playerid);
   CustomRifle(playerid);
   CustomM4Reg(playerid);
   CustomM4Blue(playerid);
   return 1;
}
CMD:dndzspas12(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 3 ] == 27)
	    {
	        SetPlayerAttachedObject(playerid, 7, -4004, 6, 0, 0.024, 0.000999, 0, 0, 0, 1.138, 1.5, 1.246);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}
CMD:takespas12customdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takespas12customdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinSpas12] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) Spas12, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) Spas12 cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takespas12custom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setspas12customdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setspas12customdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinSpas12] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) Spas12, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) Spas12 cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setspas12custom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
forward CustomSpas12(playerid);
public CustomSpas12(playerid)
{
   if(PlayerInfo[playerid][pSkinSpas12] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][3] == 27 && GetPlayerWeapon( playerid ) == 27)
	   {
	      RemovePlayerAttachedObject(playerid, 7);
	      SetPlayerAttachedObject(playerid, 7, -4004, 6, 0, 0.024, 0.000999, 0, 0, 0, 1.138, 1.5, 1.246);
	      }else RemovePlayerAttachedObject(playerid, 7);
      }
  }
  /////////Shot Gun
CMD:dndzshotgun(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 3 ] == 25)
	    {
	        SetPlayerAttachedObject(playerid, 6, -4005, 6, -0.022, -0.039999, -0.046999, -1.1, 2.6, 3.9, 1.099, 1.5, 1.325);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}
CMD:takeshotguncustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takesungcustomshotgun [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinShotGun] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) ShotGun, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) ShotGun cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takeshotguncustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setshotguncustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /makeshotgunskin [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinShotGun] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) ShotGun, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) ShotGun cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setshotguncustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
forward CustomShotGun(playerid);
public CustomShotGun(playerid)
{
   if(PlayerInfo[playerid][pSkinShotGun] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][3] == 25 && GetPlayerWeapon( playerid ) == 25)
	   {
	      RemovePlayerAttachedObject(playerid, 6);
	      SetPlayerAttachedObject(playerid, 6, -4005, 6, -0.022, -0.039999, -0.046999, -1.1, 2.6, 3.9, 1.099, 1.5, 1.325);
	      }else RemovePlayerAttachedObject(playerid, 6);
      }
  }
  //DE
CMD:takedecustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takedeagleskin [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinDE] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) Deagle, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) Deagle cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takedeaglecustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setdecustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setdeaglecustom [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinDE] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) Deagle, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) Deagle cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setdecustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
forward CustomDe(playerid);
public CustomDe(playerid)
{
   if(PlayerInfo[playerid][pSkinDE] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][2] == 24 && GetPlayerWeapon( playerid ) == 24)
	   {
	      RemovePlayerAttachedObject(playerid, 4);
	      SetPlayerAttachedObject(playerid, 4, -4003, 6, 0, -0.012, 0, 0, 0, 0, 1.328, 1.46, 1.086);
	      }else RemovePlayerAttachedObject(playerid, 4);
      }
  }
//sniper
CMD:takesnipercustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takesungcustomxxx [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinSniper] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) Sniper, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) Sniper cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takesnipercustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setsnipercustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setsnipercustom [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinSniper] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) Sniper, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) Sniper cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setsnipercustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}

CMD:dndzsniper(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 6 ] == 34)
	    {
	        SetPlayerAttachedObject(playerid, 3, -4002, 6, -0.064999, -0.044998, -0.060998, 0, 0, 4.8, 1.128, 1.5, 1.15);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}

forward CustomSniper(playerid);
public CustomSniper(playerid)
{
   if(PlayerInfo[playerid][pSkinSniper] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][6] == 34 && GetPlayerWeapon( playerid ) == 34)
	   {
	      RemovePlayerAttachedObject(playerid, 3);
	      SetPlayerAttachedObject(playerid, 3, -4002, 6, -0.064999, -0.044998, -0.060998, 0, 0, 4.8, 1.128, 1.5, 1.15);
	      }else RemovePlayerAttachedObject(playerid, 3);
      }
  }
//m4
CMD:takem4customdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takesungcustomxxx [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinM4] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) M4a1, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) M4a1 cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takem4a1custom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setm4customdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setsungcustomxxx [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinM4] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) M4a1, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) M4a1 cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setm4a1custom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}

CMD:dndzm4(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 5 ] == 31)
	    {
	        SetPlayerAttachedObject(playerid, 2, -4000, 6, 0.022, -0.050999, 0.043999, 0, 9.19999, 2.10001, 1.341, 1.5, 1.441);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}

forward CustomM4(playerid);
public CustomM4(playerid)
{
   if(PlayerInfo[playerid][pSkinM4] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][5] == 31 && GetPlayerWeapon( playerid ) == 31)
	   {
	      RemovePlayerAttachedObject(playerid, 2);
	      SetPlayerAttachedObject(playerid, 2, -4000, 6, 0.022, -0.050999, 0.043999, 0, 9.19999, 2.10001, 1.341, 1.5, 1.441);
         }else RemovePlayerAttachedObject(playerid, 2);
      }
  }
//mp5
CMD:takemp5customdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takesungcustomxxx [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinMP5] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) MP5, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) MP5 cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takemp5custom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setmp5customdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setsungcustommp5 [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinMP5] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) MP5, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) MP5 cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setmp5custom.log.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:dndzmp5(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 4 ] == 29)
	    {
	        SetPlayerAttachedObject(playerid, 1, -4001, 6, -0.131, -0.02, -0.048999, -4, 0, -0.399999, 1.5, 1.5, 1.463);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}

forward CustomMP5(playerid);
public CustomMP5(playerid)
{
   if(PlayerInfo[playerid][pSkinMP5] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][4] == 29 && GetPlayerWeapon( playerid ) == 29)
	   {
	      RemovePlayerAttachedObject(playerid, 1);
	      SetPlayerAttachedObject(playerid, 1, -4001, 6, -0.131, -0.02, -0.048999, -4, 0, -0.399999, 1.5, 1.5, 1.463);
          }else RemovePlayerAttachedObject(playerid, 1);
      }
}
//ak-47
CMD:dndzak47(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 5 ] == 30)
	    {
	        SetPlayerAttachedObject(playerid, 7, -4006, 6, 0.007999, -0.007, -0.04, 0, 0, 0.299999, 1.081, 1.34, 1.194);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}
CMD:takeakcustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takeakcustomdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinAK] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) AK, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) AK cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takeakcustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setakcustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setakcustomdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinAK] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) AK, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) AK cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setakcustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
forward CustomAK(playerid);
public CustomAK(playerid)
{
   if(PlayerInfo[playerid][pSkinAK] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][5] == 30 && GetPlayerWeapon( playerid ) == 30)
	   {
	      RemovePlayerAttachedObject(playerid, 8);
          SetPlayerAttachedObject(playerid, 8, -4006, 6, 0.007999, -0.007, -0.04, 0, 0, 0.299999, 1.081, 1.34, 1.194);
	      }else RemovePlayerAttachedObject(playerid, 8);
      }
}

//uzi
CMD:dndzuzi(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 4 ] == 28)
	    {
	        SetPlayerAttachedObject(playerid, 7, -4007, 6, -0.052, -0.010001, -0.026, 3.4, 0.999988, -1.90001, 1.457, 1.5, 1.26);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}
CMD:takeuzicustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takeuzicustomdndz[player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinUzi] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) UZI, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) UZI cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takeuzicustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setuzicustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setuzicustomdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinUzi] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) Uzi, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) Uzi cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setUzicustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
forward CustomUzi(playerid);
public CustomUzi(playerid)
{
   if(PlayerInfo[playerid][pSkinUzi] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][4] == 28 && GetPlayerWeapon( playerid ) == 28)
	   {
	      RemovePlayerAttachedObject(playerid, 9);
          SetPlayerAttachedObject(playerid, 9, -4007, 6, -0.052, -0.010001, -0.026, 3.4, 0.999988, -1.90001, 1.457, 1.5, 1.26);
	      }else RemovePlayerAttachedObject(playerid, 9);
      }
  }


//uzi
CMD:dndzrifle(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 6 ] == 33)
	    {
	        SetPlayerAttachedObject(playerid, 10, -4008, 6, -0.051999, -0.010999, 0.006999, 0, 0, -0.399999, 1.084, 1.109, 1.066);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}
CMD:takeriflecustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takeriflecustomdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinRifle] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) Rifle, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) Rifle cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takeriflecustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setriflecustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setriflecustomdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinRifle] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) Rifle, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) Rifle cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setriflecustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
forward CustomRifle(playerid);
public CustomRifle(playerid)
{
   if(PlayerInfo[playerid][pSkinRifle] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][6] == 33 && GetPlayerWeapon( playerid ) == 33)
	   {
	      RemovePlayerAttachedObject(playerid, 5);
          SetPlayerAttachedObject(playerid, 5, -4008, 6, -0.051999, -0.010999, 0.006999, 0, 0, -0.399999, 1.084, 1.109, 1.066);
	      }else RemovePlayerAttachedObject(playerid, 5);
      }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
//m4
CMD:takem4regcustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takem4regcustomdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinM4Reg] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) M4 REG DRAGON, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) M4 REG DRAGON cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takem4regcustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setm4regcustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setm4regcustomdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinM4Reg] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) M4 REG DRAGON, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) M4 REG DRAGON cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setm4regcustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}

CMD:dndzm4reg(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 5 ] == 31)
	    {
	        SetPlayerAttachedObject(playerid, 2, -4010, 6, -0.033, -0.012999, -0.015, 0, 0, 0.8, 1.269, 1.5, 1.199);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}

forward CustomM4Reg(playerid);
public CustomM4Reg(playerid)
{
   if(PlayerInfo[playerid][pSkinM4Reg] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][5] == 31 && GetPlayerWeapon( playerid ) == 31)
	   {
	      RemovePlayerAttachedObject(playerid, 2);
	      SetPlayerAttachedObject(playerid, 2, -4010, 6, -0.033, -0.012999, -0.015, 0, 0, 0.8, 1.269, 1.5, 1.199);
         }else RemovePlayerAttachedObject(playerid, 2);
      }
  }
  
//M4 BLUE
//m4
CMD:takem4bluecustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takem4bluecustomdndz [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinM4Blue] = 0;
		  format(string, sizeof(string), "* Ban da take (SKIN) M4 BLUE DRAGON, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da take (SKIN) M4 BLUE DRAGON cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/takem4bluecustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}
CMD:setm4bluecustomdndz(playerid ,params[])
{
  if (PlayerInfo[playerid][pAdmin] >= 99999)
  {
	  new string[128], Player;
	  if(sscanf(params, "ud", Player)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setsungcustomxxx [player]");
	  if(IsPlayerConnected(Player))
	  {
		  PlayerInfo[Player][pSkinM4Blue] = 1;
		  format(string, sizeof(string), "* Ban da set (SKIN) M4 BLUE DRAGON, cho %s thanh cong.",GetPlayerNameEx(Player));
		  SendClientMessageEx(playerid, COLOR_WHITE, string);
		  format(string, sizeof(string), "%s da set (SKIN) M4 BLUE DRAGON cho %s's thanh cong ", GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
		  Log("logs/setm4bluecustom.log", string);
	  }
  }
  else
  {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
  }
  return 1;
}

CMD:dndzm4blue(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
	    if(PlayerInfo[playerid][pGuns][ 5 ] == 31)
	    {
	        SetPlayerAttachedObject(playerid, 2, -4011, 6, -0.033, -0.012999, -0.015, 0, 0, 0.8, 1.269, 1.5, 1.199);
	    }
	    else
	    {
	        SendClientMessage(playerid, -1, "Ban khong co vu khi");
	    }
    }else return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay");
    return 1;
}

forward CustomM4Blue(playerid);
public CustomM4Blue(playerid)
{
   if(PlayerInfo[playerid][pSkinM4Blue] == 1)
   {
	   if(PlayerInfo[playerid][pGuns][5] == 31 && GetPlayerWeapon( playerid ) == 31)
	   {
	      RemovePlayerAttachedObject(playerid, 2);
	      SetPlayerAttachedObject(playerid, 2, -4011, 6, -0.033, -0.012999, -0.015, 0, 0, 0.8, 1.269, 1.5, 1.199);
         }else RemovePlayerAttachedObject(playerid, 2);
      }
  }


  
