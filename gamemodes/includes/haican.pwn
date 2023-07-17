

#include <a_samp>
#include <ysi\y_hooks>

#define DIALOG_BANCANSA 2602

#define MARIJUANA 18 // So luong Spawn
#define INVALID_FLOAT -1

#define THUHOACH_TIME 3 // 2s = 1 Can sa
#define TIME_RESPAWN_CANSA 20 // 15s se respawn lai can sa
#define TIME_CHEBIEN_CANSA 5 // 5s = 1 tui'

#define GIATUICANSA 5 // 5 kc 1 tui

enum marijuana_enum {
	marijuana_id,
	Text3D:marijuana_label,
	bool:marijuana_status,
	Float:marijuana_X,
	Float:marijuana_Y,
	Float:marijuana_Z,
}

new DynamicCP_Harvest[3]; // 0 = Che bien //                                                  1 = Ban

new bool:HarvestCan[MAX_PLAYERS] = false;
new Marijuana[MARIJUANA][marijuana_enum];
new Float:marijuna_pos[MARIJUANA][] = {
	{-752.0267,-155.4852,66.7585},
	{-779.7448,-148.6225,64.8706},
	{-786.3397,-153.7541,64.6450},
	{-783.9090,-160.2401,65.7670},
	{-790.3037,-164.8857,66.2199},
	{-788.8755,-169.3046,66.6728},
	{-784.7871,-171.7937,66.9977},
	{-781.5194,-176.4840,67.5919},
	{-775.8143,-174.9296,67.5188},
	{-759.2983,-147.2068,65.8696},
	{-750.8389,-140.3765,66.2484},
	{-734.7426,-141.6215,67.2484},
	{-725.9036,-154.6706,66.9533},
	{-730.0795,-167.1839,66.4559},
	{-744.2148,-170.5108,67.7431},
	{-763.8676,-172.7794,67.3950},
	{-777.9866,-167.1106,66.6121},
	{-778.8672,-156.8395,65.4396}
};

stock IsPlayerNearMarijuana(playerid, Float:range) {
	for(new i = 0 ; i < MARIJUANA; i ++) {
		if(Marijuana[i][marijuana_X] != INVALID_FLOAT && IsPlayerInRangeOfPoint(playerid, range, Marijuana[i][marijuana_X],Marijuana[i][marijuana_Y],Marijuana[i][marijuana_Z]+0.5)) {
			return i;
		}
	}
	return INVALID_FLOAT;
}

forward MarijuanaCreate(iMar);
public MarijuanaCreate(iMar) {
	Marijuana[iMar][marijuana_label] = CreateDynamic3DTextLabel("[{00cc00}Cay Can Sa{ffffff}]", -1, marijuna_pos[iMar][0],marijuna_pos[iMar][1],marijuna_pos[iMar][2]-0.2, 5);
	Marijuana[iMar][marijuana_id] = CreateDynamicObject(19473, marijuna_pos[iMar][0],marijuna_pos[iMar][1],marijuna_pos[iMar][2]-1.2, 0,0,0);

	Marijuana[iMar][marijuana_X] = marijuna_pos[iMar][0],
	Marijuana[iMar][marijuana_Y] = marijuna_pos[iMar][1],
	Marijuana[iMar][marijuana_Z] = marijuna_pos[iMar][2];

	Marijuana[iMar][marijuana_status] = false;
	printf("[MARIJUANA] Marijuana %d | X%f | Y%f | Z%f", iMar, Marijuana[iMar][marijuana_X],Marijuana[iMar][marijuana_Y],Marijuana[iMar][marijuana_Z]);
	return 1;
}

forward OnPlayerHarvestMarijuana(playerid, iMar);
public OnPlayerHarvestMarijuana(playerid, iMar) {

	// Player
	ClearAnimations(playerid);
	HarvestCan[playerid] = false;
	PlayerInfo[playerid][pCansa] ++; // Can sa + 1
	PlayerInfo[playerid][pGoiPot] ++; // goi pot + 1
	TogglePlayerControllable(playerid, true);
	SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Ban da nhan duoc 1 can sa !");
	SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: [/Cansa] de xem so luong !");
	// Marijuana Var
	Marijuana[iMar][marijuana_X] = INVALID_FLOAT; //
	DestroyDynamicObject(Marijuana[iMar][marijuana_id]);
	DestroyDynamic3DTextLabel(Marijuana[iMar][marijuana_label]);
	SetTimerEx("MarijuanaCreate", TIME_RESPAWN_CANSA*1000, 0, "d", iMar);
	// Debug
	printf("Destroy Marijuana %d", iMar);
	return 1;
}
forward OnPlayerCBCannabisss(playerid);
public OnPlayerCBCannabisss(playerid) {
	if(PlayerInfo[playerid][pGoiPot] >= 20) {
		PlayerInfo[playerid][pGoiPot] -= 20;
		PlayerInfo[playerid][pPot] ++;
		SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Ban nhan duoc 1 pot");
	}
	else {
		SetPVarInt(playerid, "DangCheBien", 0);
		TogglePlayerControllable(playerid, true); // Freeze player
		SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Ban da doi thanh cong");
		KillTimer(PlayerInfo[playerid][pChebienTime]);
	}
	return 1;
}
forward OnPlayerCBCannabis(playerid);
public OnPlayerCBCannabis(playerid) {
	if(PlayerInfo[playerid][pCansa] >= 2) {
		PlayerInfo[playerid][pCansa] -= 2;
		PlayerInfo[playerid][pTuicansa] ++;
		SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Ban da nhan 1 tui can sa!");
		SetPlayerCheckpoint(playerid, -692.0992,939.6012,13.6328, 3.0);
	}
	else {
		SetPVarInt(playerid, "DangCheBien", 0);
		TogglePlayerControllable(playerid, true); // Freeze player
		SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Ban da che bien thanh cong vui long di theo checkpoint de ban!");
		SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Neu khong co checkpoint su dung [/vitribancansa]!");
		SetPlayerCheckpoint(playerid, -692.0992,939.6012,13.6328, 3.0);
		KillTimer(PlayerInfo[playerid][pChebienTime]);
	}
	return 1;
}

hook OnGameModeInit() {
	new i = 0;
	while(i < MARIJUANA) {
		MarijuanaCreate(i);
		i ++;
	}

	CreateDynamicObject(1578, -734.9782, 1546.1810, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(2370, -734.8424, 1545.8629, 37.9039, 0.0000, 0.0000, -0.6999); //Shop_set_1_Table
	CreateDynamicObject(1578, -734.9782, 1546.8013, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(1578, -734.2282, 1546.8013, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(1578, -734.2282, 1546.1707, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(1578, -734.9782, 1545.5705, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(1578, -734.2282, 1545.5601, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green

	DynamicCP_Harvest[0] = CreateDynamicCP(-732.8764,1546.1532,38.9959, 1, .streamdistance = 2); // Che bien
	DynamicCP_Harvest[1] = CreateDynamicCP(-692.0992,939.6012 ,13.6328, 1, .streamdistance = 2); // Ban
	DynamicCP_Harvest[2] = CreateDynamicCP(-380.8940,1113.2659,19.6427, 1, .streamdistance = 2);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
	    if(HarvestCan[playerid] == true) { // Kiem tra neu nguoi choi dang thu hoach
		KillTimer(TimeHarvest[playerid]); // Dung timer.
		Marijuana[GetPVarInt(playerid, "_iMarijuana")][marijuana_status] = false; // Cay co the thu hoach
	    }
    	if(GetPVarInt(playerid, "DangCheBien") == 1) {
		KillTimer(PlayerInfo[playerid][pChebienTime]);
	    }
	    return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid) {
	if(checkpointid == DynamicCP_Harvest[0]) {// Che bien
		if(PlayerInfo[playerid][pCansa] >= 2) { // 2 can sa = 1 tui can sa
			if(GetPVarInt(playerid, "DangCheBien") == 0)
			{
			TogglePlayerControllable(playerid, false); // Freeze player
			SetPVarInt(playerid, "DangCheBien", 1);
			SendClientMessage(playerid, -1,"[{00b300}SAMPVN.NET{ffffff}]: Dang che bien!!!!");
			PlayerInfo[playerid][pChebienTime] = SetTimerEx("OnPlayerCBCannabis", TIME_CHEBIEN_CANSA*1000, 1, "i", playerid);
			}
		}
		else
			SendClientMessage(playerid, -1,"[{00b300}SAMPVN.NET{ffffff}]: Ban can phai co 2 can sa de co the che bien!");
	}
	if(checkpointid == DynamicCP_Harvest[1]) { // Ban can sa
		if(PlayerInfo[playerid][pTuicansa] > 0) {
			new string[128];
			format(string, 128, "\nTui can sa cua ban: %d\nGia tien $%d va /tui\nNhap so luong ban muon ban:", PlayerInfo[playerid][pTuicansa], GIATUICANSA);
			ShowPlayerDialog(playerid, DIALOG_BANCANSA, DIALOG_STYLE_INPUT, "Ban can sa", string,"Ban","Huy");
		}
		else
			SendClientMessage(playerid, -1,"[{00b300}SAMPVN.NET{ffffff}]: Ban can phai co tui can sa de buoc vao day!");
	}
	if(checkpointid == DynamicCP_Harvest[2]) {
		if(PlayerInfo[playerid][pGoiPot] >= 20) {
			if(GetPVarInt(playerid, "DangCheBien") == 0)
			{
			TogglePlayerControllable(playerid, false);
			SetPVarInt(playerid, "DangCheBien", 1);
			SendClientMessage(playerid, -1,"Dang doi pot xin vui long doi.........");
			PlayerInfo[playerid][pChebienTime] = SetTimerEx("OnPlayerCBCannabisss", TIME_CHEBIEN_CANSA*1000, 1, "i", playerid);
			}
		}
		else
			SendClientMessage(playerid, -1,"[{00b300}SAMPVN.NET{ffffff}]: Ban can phai co 20 Goi pot");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(dialogid == DIALOG_BANCANSA) {
		if(response) {
			if(strval(inputtext) > 0) {
				if(PlayerInfo[playerid][pTuicansa] >= strval(inputtext)) {
					new string[128];
					PlayerInfo[playerid][pTuicansa] -= strval(inputtext);
					GivePlayerCOIN(playerid, strval(inputtext)*GIATUICANSA);
					PlayerInfo[playerid][pWantedLevel] = 2;
					GivePlayerCOIN(playerid, strval(inputtext)*GIATUICANSA);
					format(string, 128, "[{00b300}SAMPVN.NET{ffffff}]: Ban da ban %d tui can va nhan duoc $%d ", strval(inputtext), strval(inputtext)*GIATUICANSA, strval(inputtext)*GIATUICANSA);
					SendClientMessage(playerid, -1, string);
				}
				else
					SendClientMessage(playerid, -1,"[{00b300}SAMPVN.NET{ffffff}]: So luong khong hop le! hay kiem tra lai so luong cua ban");
			}
			else
				SendClientMessage(playerid, -1,"[{00b300}SAMPVN.NET{ffffff}]: So luong can ban phai lon hon 0!");
		}
	}
	return 1;
}

CMD:haicansa(playerid) {
	new iMarijuana = IsPlayerNearMarijuana(playerid, 1);
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Vui long xuong xe"); //if(IsACop(playerid)
    if(IsACop(playerid)) return SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Ban la canh sat nen khong the hai can");
    if(PlayerInfo[playerid][pCansa] >= 20) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban da dat gioi han 20 can sa Hay Di Ban No /vitribancansa!");
    if(PlayerInfo[playerid][pLuoihai] <= 0) return SendClientMessageEx(playerid, COLOR_WHITE, "{ff0000}[!] {00ff00}Ban Khong Co Luoi Hai Hay Di Mua No Ngay Tai {ffff00}NPC");
	if(PlayerCuffed[playerid] >= 1 || PlayerInfo[playerid][pJailTime] > 0 || GetPVarInt(playerid, "Injured")) return SendClientMessageEx( playerid, COLOR_WHITE, "Ban khong the lam dieu do vao luc nay" );
	if(iMarijuana == INVALID_FLOAT) SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Ban khong dung gan cay nao de thu hoach ca!");
	else {
		if(Marijuana[iMarijuana][marijuana_status] == false) {
			if(HarvestCan[playerid] == false) {
			if(PlayerInfo[playerid][pLuoihai] >= 1){
					HarvestCan[playerid] = true; // Bat dau hai
					Marijuana[iMarijuana][marijuana_status] = true; // Chuyen trang thai tu chua bi hai thanh bi hai cua can sa
					TogglePlayerControllable(playerid, false); // Freeze nguoi choi lai.
					SetPVarInt(playerid, "_iMarijuana", iMarijuana);
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, 1, 0, 0, 1, 0); // Thuc hien thanh dong (RP)
					GameTextForPlayer(playerid, "~y~KHONG CO LENH NAY", 5000, 3);
					TimeHarvest[playerid] = SetTimerEx("OnPlayerHarvestMarijuana", THUHOACH_TIME*1000, 0, "ii", playerid, iMarijuana); // Timer thu hoach
                    SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ff00ff}]: Di theo checkpoint de Den Vi Tri Ban Can Sa Can Than Cops Bat");
                    PlayerInfo[playerid][pLuoihai] -= 1;
					SetPlayerCheckpoint(playerid, -687.6924,929.6696,13.6293, 3.0);
					CheckHack[playerid] = gettime() + 12;
					CP[playerid] = 252000;
				}
				else
					SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Can sa da day` ! Ban can di ban no ngay");
			}
			else
				SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Ban khong the thuc hien vao luc nay!");
		}
		else
			SendClientMessage(playerid, -1, "[{00b300}SAMPVN.NET{ffffff}]: Cay nay dang co nguoi thu hoach");
	}
	return 1;
}

CMD:cansa(playerid) {
	new string[32+11];
	format(string, 32+11, "Can sa : %d", PlayerInfo[playerid][pCansa]);
	SendClientMessage(playerid, -1, string);
	format(string, 32+11, "Tui can sa : %d", PlayerInfo[playerid][pTuicansa]);
	SendClientMessage(playerid, -1, string);
	return 1;
}

CMD:ktcansa(playerid, params[])
{
    new Player;
    if(sscanf(params, "u", Player))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /checkcansa [Player]");


    new szString[128];
	format(szString, sizeof(szString), "%s - Can sa: {FFD700}%s",GetPlayerNameEx(Player), number_format(PlayerInfo[Player][pCansa]));
	SendClientMessageEx(playerid, COLOR_CYAN, szString);
	return 1;
}
CMD:ktluoihai(playerid, params[])
{
    new Player;
    if(sscanf(params, "u", Player))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /checkluoihai [Player]");


    new szString[128];
	format(szString, sizeof(szString), "%s - Luoi Hai: {FFD700}%s",GetPlayerNameEx(Player), number_format(PlayerInfo[Player][pLuoihai]));
	SendClientMessageEx(playerid, COLOR_CYAN, szString);
	return 1;
}
