//cre by dang nguyen

#include <YSI\y_hooks>

#define    DIALOG_LAYHANGTRUCKER         (17519)
#define    Time_LayHang  8

new bool:onTruckerX[MAX_PLAYERS];
new bool:Trucker_Lock = false;

stock ResetTruck()
{
Trucker_Lock= False;
}
stock MoTruck()
{
Trucker_Lock=True;
}
//===========================================================================//

//================================ CMD =======================================//
CMD:khoatrucker(playerid, params[]) // Lenh khoa job
{
    if(PlayerInfo[playerid][pAdmin] >= 1338)
    {
        if(!Trucker_Lock)
        {
            new string[128];
            Trucker_Lock = true;
            format(string, sizeof(string), "[JOB SYSTEM]: {FFAF00}Admin %s Da khoa Trucker vi het gio lam viec, vui long quay lai vao sang mai.", GetPlayerNameEx(playerid));
            SendClientMessageToAllEx(COLOR_WHITE, string);
        }
        else
        {
            new string[128];
            format(string, sizeof(string), "[JOB SYSTEM]: {FFAF00}Admin %s Da mo khoa Trucker hay quay tro lai cong viec.", GetPlayerNameEx(playerid));
            SendClientMessageToAllEx(COLOR_WHITE, string);
            Trucker_Lock = false;
        }
    }
    return 1;
}
CMD:layhang(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1749.3955,-1756.6125,13.5370)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o noi lay hang Trucker.");
	if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(IsATruckerCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
             SetTimerEx("LayHangTime", Time_LayHang*1000, 0, "ii", playerid);
	         SendClientMessageEx(playerid, COLOR_GREY, "{00FF00} Vui Long Doi 10 Giay De Hang Chat Len Xe");
	         TogglePlayerControllable(playerid, false);
	    }
	    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong lai chiec xe tai cho hang hoa yeu cau!");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai Nguoi dua hang!");
	if(Trucker_Lock) //Them vao duoi cmd:layhang
    {
        SendClientMessageEx(playerid, COLOR_GREY, "Trucker Da Bi Khoa Tam Quay Lai Sau.");
    }
	return 1;
}
//============================================================================//

hook OnPlayerEnterCheckpoint(playerid)
{
    if(onTruckerX[playerid]) // if it's true
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(IsATruckerCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
          if(IsPlayerInRangeOfPoint(playerid,5.0,37.1972,-1755.9374,13.3091))
          {
			PlayerInfo[playerid][pCOIN] += 20000;
	        SendClientMessageEx(playerid, COLOR_GREY, "{ff0000}[!] {ffffff}Ban Da Giao Hang Thanh Cong, Va Nhan Duoc 20,000 Coin.");
	        DisablePlayerCheckpoint(playerid);
	        onTruckerX[playerid] = false;
          }else return SendClientMessageEx(playerid, COLOR_GREY, "{ff0000}[!] He Thong Da Phat Hien Ban Bug Checkpoint Ban Qua Non !!!");
	    }
	    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong lai chiec xe tai cho hang hoa yeu cau!");
    }
    return 1;
}
forward LayHangTime(playerid);
public LayHangTime(playerid)
{
    TogglePlayerControllable(playerid, true);
    SendClientMessageEx(playerid, COLOR_GREY, "{00FF00}Lay Hang Thanh Cong Vi Tri Giao Hang Duoc Danh Dau Tren Radar");
    SetPlayerCheckpoint(playerid, 637.1972,-1755.9374,13.3091, 3.0);
    CheckHack[playerid] = gettime() + 5;
    onTruckerX[playerid] = true;
	return 1;
}
