//JOB Lay Vat Lieu Edit By Dang Nguyen
//Dangnguyen0793858086@gmail.com

#include <YSI\y_hooks>

#define    Time_LayVatLieuls  5
#define    Time_LayVatLieusf  5

new bool:onLayVatLieuX[MAX_PLAYERS];
new bool:onLayVatLieuS[MAX_PLAYERS];


CMD:layvatlieu(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid,5.0,1807.6226,-1625.6503,13.7148))
    {
    SetTimerEx("LayVatLieuls", Time_LayVatLieuls*1000, 0, "ii", playerid);
    SendClientMessageEx(playerid, COLOR_GREY, "{00FF00} Vui Long Cho 5 Giay De Lay Vat Lieu");
    TogglePlayerControllable(playerid, false);
    }
    if(IsPlayerInRangeOfPoint(playerid,5.0,-2169.2974,523.0876,35.1719))
    {
    SetTimerEx("LayVatLieusf", Time_LayVatLieusf*1000, 0, "ii", playerid);
    SendClientMessageEx(playerid, COLOR_GREY, "{00FF00} Vui Long Cho 5 Giay De Lay Vat Lieu");
    TogglePlayerControllable(playerid, false);
    }
	return 1;
}

//fuction
//============================================================================//
forward LayVatLieuls(playerid);
public LayVatLieuls(playerid)
{
    TogglePlayerControllable(playerid, true);
    PlayerInfo[playerid][pCash] -= 20000;
    SendClientMessageEx(playerid, COLOR_GREY, "{00FF00}Lay Vat Lieu Thanh Cong Hay Di Chuyen Den Vi Tri Tren Radar De Giao Vat Lieu");
    SetPlayerCheckpoint(playerid, 877.0151,-1567.8457,13.5391, 3.0);
    CheckHack[playerid] = gettime() + 5;
    onLayVatLieuX[playerid] = true;
	return 1;
}
forward LayVatLieusf(playerid);
public LayVatLieusf(playerid)
{
    TogglePlayerControllable(playerid, true);
    PlayerInfo[playerid][pCash] -= 20000;
    SendClientMessageEx(playerid, COLOR_GREY, "{00FF00}Lay Vat Lieu Thanh Cong Hay Di Chuyen Den Vi Tri Tren Radar De Giao Vat Lieu");
    SetPlayerCheckpoint(playerid, -1694.6700,943.5100,24.8906, 3.0);
    CheckHack[playerid] = gettime() + 5;
    onLayVatLieuS[playerid] = true;
	return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
    if(onLayVatLieuX[playerid]) // if it's true
    {
       if(IsPlayerInRangeOfPoint(playerid,5.0,877.0151,-1567.8457,13.5391))
       {
            PlayerInfo[playerid][pMats] += 20000;
	        SendClientMessageEx(playerid, COLOR_GREY, "{ff0000}[!] {ffffff}Ban Da Giao Hang Thanh Cong, Va Nhan Duoc 20,000 Vat Lieu.");
	        DisablePlayerCheckpoint(playerid);
	        onLayVatLieuX[playerid] = false;
	   }else return SendClientMessageEx(playerid, COLOR_GREY, "{ff0000}[!] He Thong Da Phat Hien Ban Bug Checkpoint Ban Qua Non !!!");
    }
    if(onLayVatLieuS[playerid]) // if it's true
    {
       if(IsPlayerInRangeOfPoint(playerid,5.0,-1694.6700,943.5100,24.8906))
       {
            PlayerInfo[playerid][pMats] += 20000;
	        SendClientMessageEx(playerid, COLOR_GREY, "{ff0000}[!] {ffffff}Ban Da Giao Hang Thanh Cong, Va Nhan Duoc 20,000 Vat Lieu.");
	        DisablePlayerCheckpoint(playerid);
	        onLayVatLieuX[playerid] = false;
	   }else return SendClientMessageEx(playerid, COLOR_GREY, "{ff0000}[!] He Thong Da Phat Hien Ban Bug Checkpoint Ban Qua Non !!!");
    }
    return 1;
}
