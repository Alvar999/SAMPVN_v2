							// HE THONG XO SO

#include <a_samp>
#include <YSI\y_hooks>

#define    DIALOG_MUAVESO     (9776)
#define    DIALOG_TIENCUOC     (9765)

enum SoXo{
	DacBiet,
	GiaiNhat,
	GiaiNhi,
	GiaiBa[10],
	GiaiTu[10],
	GiaiNam[10],
	GiaiSau[10],
};
new PlayerXS[SoXo];

CMD:muaveso(playerid, params[])
{
	new string[5012];
	new year,month,day;
	getdate(year, month, day);
	format(string, sizeof(string), "\nHe thong xo so trung thuong {00ff00}%d/%s%d/%s%d{FFFFFF}\nHien tai so lan mua ve so cua ban trong ngay hom nay : %d lan\nNeu ban muon choi xo so trung thuong vui long nhap con so may man cua ban vao o ben duoi:", day, ((month < 10) ? ("0") : ("")), month, (year < 10) ? ("0") : (""), year, PlayerInfo[playerid][pSoLanMuaVeSo]);
	if(!isnull(string))
	{
		strdel(string, 0, 1);
		ShowPlayerDialog(playerid, DIALOG_MUAVESO, DIALOG_STYLE_INPUT, "GTAVNS | XO SO", string, "Mua ngay", "Huy bo");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new string[5012];
    new year,month,day;
	getdate(year, month, day);
    if(dialogid == DIALOG_MUAVESO && response == 1)
	{
		if(strfind(inputtext, "%", true) != -1) {
		    format(string, sizeof(string), "He thong xo so trung thuong {00ff00}%d/%s%d/%s%d{FFFFFF}\nHien tai so lan mua ve so cua ban trong ngay hom nay : %d lan\nNeu ban muon choi xo so trung thuong vui long nhap con so may man cua ban vao o ben duoi:", day, ((month < 10) ? ("0") : ("")), month, (year < 10) ? ("0") : (""), year, PlayerInfo[playerid][pSoLanMuaVeSo]);
			ShowPlayerDialog(playerid, DIALOG_MUAVESO, DIALOG_STYLE_INPUT, "GTAVNS | XO SO", string, "Mua ngay", "Huy bo");
		}
		if(strfind(inputtext, "c", true) != -1) {
			format(string, sizeof(string), "He thong xo so trung thuong {00ff00}%d/%s%d/%s%d{FFFFFF}\nHien tai so lan mua ve so cua ban trong ngay hom nay : %d lan\nNeu ban muon choi xo so trung thuong vui long nhap con so may man cua ban vao o ben duoi:", day, ((month < 10) ? ("0") : ("")), month, (year < 10) ? ("0") : (""), year, PlayerInfo[playerid][pSoLanMuaVeSo]);
			ShowPlayerDialog(playerid, DIALOG_MUAVESO, DIALOG_STYLE_INPUT, "GTAVNS | XO SO", string, "Mua ngay", "Huy bo");
		}
		new veso = strval(inputtext);
		if(PlayerInfo[playerid][pVeSo] == 0)
		{
		    if(veso >= 0 && veso < 100)
		    {
		        if(veso < 0)
		        {
		            SendClientMessageEx(playerid, -1, "Ban khong the mua con so nay duoc vui long thu lai (/muaveso).");
					return 1;
				}
				else{
				    PlayerInfo[playerid][pVeSo] = veso;
				    format(string, sizeof(string), "Ban da mua thanh cong {00ff00}%d{FFFFFF} , bay gio ban vui long nhap so tien cuoc vao con so may man nay!.", veso);
		            SendClientMessageEx(playerid, -1, string);
                    ShowPlayerDialog(playerid, DIALOG_TIENCUOC, DIALOG_STYLE_INPUT, "GTAVNS | XO SO", "Ban vui long nhap so tien cuoc cho con so may man ban vua mua: ", "Dat cuoc", "Huy bo");
				}
		    }else SendClientMessageEx(playerid, -1, "Ban khong the mua con so nay duoc vui long thu lai (/muaveso).");
		}else SendClientMessageEx(playerid, -1, "Ban da mua ve so truoc do , khong the mua tiep tuc.");

	}

	if(dialogid == DIALOG_TIENCUOC && response == 1)
	{
		if(strfind(inputtext, "%", true) != -1) {
		    return ShowPlayerDialog(playerid, DIALOG_TIENCUOC, DIALOG_STYLE_INPUT, "GTAVNS | XO SO", "Ban vui long nhap so tien cuoc cho con so may man ban vua mua (0 ~ 9999KC): ", "Dat cuoc", "Huy bo");
		}
		if(strfind(inputtext, "c", true) != -1) {
			return ShowPlayerDialog(playerid, DIALOG_TIENCUOC, DIALOG_STYLE_INPUT, "GTAVNS | XO SO", "Ban vui long nhap so tien cuoc cho con so may man ban vua mua (0 ~ 9999KC): ", "Dat cuoc", "Huy bo");
		}
		new tiencuoc = strval(inputtext);
		if(PlayerInfo[playerid][pVeSo] != 0)
		{
		    if(PlayerInfo[playerid][pnDP] >= tiencuoc)
		    {
			    if(tiencuoc > 0 && tiencuoc < 9999)
			    {
			        if(tiencuoc < 0)
			        {
			            SendClientMessageEx(playerid, -1, "So tien dat cuoc cua ban khong hop le.");
			            ShowPlayerDialog(playerid, DIALOG_TIENCUOC, DIALOG_STYLE_INPUT, "GTAVNS | XO SO", "Ban vui long nhap so tien cuoc cho con so may man ban vua mua (0 ~ 9999KC): ", "Dat cuoc", "Huy bo");
						return 1;

					}
					else{
					    PlayerInfo[playerid][pTienCuoc] = tiencuoc;
					    format(string, sizeof(string), "Ban da mua thanh cong {00ff00}%d{FFFFFF} voi gia {ff0000}%d{FFFFFF} Chuc ban may man !!!.", PlayerInfo[playerid][pVeSo], PlayerInfo[playerid][pTienCuoc]);
			            SendClientMessageEx(playerid, -1, string);
						PlayerInfo[playerid][pSoLanMuaVeSo] += 1;
						return 1;
					}
			    }else SendClientMessageEx(playerid, -1, "So tien dat cuoc cua ban khong hop le.");
		    }else SendClientMessageEx(playerid, -1, "Ban khong du tien de cuoc con so nay!.");
		}else SendClientMessageEx(playerid, -1, "Ban chua mua ve so , khong the dat tien cuoc duoc.");
	}
    return 1;
}

CMD:testquayso(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 99999)
	{
	    new giai6[5], giai5[5], giai4[5], giai3[5], giai2, giai1, giaidacbiet;
		giai6[1] = random(99);
		giai6[2] = random(99);
		giai6[3] = random(99);
		giai6[4] = random(99);
		giai5[1] = random(99);
		giai5[2] = random(99);
		giai5[3] = random(99);
		giai4[1] = random(99);
		giai4[2] = random(99);
		giai3[1] = random(99);
		giai3[2] = random(99);
		giai2 = random(99);
		giai1 = random(99);
		giaidacbiet = random(99);

		PlayerXS[GiaiSau][1] = giai6[1];
		PlayerXS[GiaiSau][2] = giai6[2];
		PlayerXS[GiaiSau][3] = giai6[3];
		PlayerXS[GiaiSau][4] = giai6[4];

		PlayerXS[GiaiNam][1] = giai5[1];
		PlayerXS[GiaiNam][2] = giai5[2];
		PlayerXS[GiaiNam][3] = giai5[3];

		PlayerXS[GiaiTu][1] = giai4[1];
		PlayerXS[GiaiTu][2] = giai4[2];

		PlayerXS[GiaiBa][1] = giai3[1];
		PlayerXS[GiaiBa][2] = giai3[2];

		PlayerXS[GiaiNhi] = giai2;
		PlayerXS[GiaiNhat] = giai1;
		PlayerXS[DacBiet] = giaidacbiet;

		SendClientMessageToAllEx(COLOR_YELLOW, "[GTAVNS.COM] KET QUA XO SO , DA DUOC BAT DAU {00ff00}(/xemxoso)." );

		foreach(new i: Player)
		{
		    SetPVarInt(i, "QuaySoTime", 15);
			SetTimerEx("QuaySo_", 1000, 0, "d", i);
		}
	}else SendClientMessageEx(playerid, -1, "Ban khong the su dung lenh nay!.");
	return 1;
}

CMD:xemxoso(playerid, params[])
{
    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], str5[1280], str6[1280],str7[1280], str8[1280], str9[1280], str10[1280], str11[1280], str12[1280], str13[1280], str14[1280], str15[1280], str16[1280], str17[1280], name[1280];
	format(str1, sizeof(str), "{ffffff}GIAI 6  : {00ff00}%d\t\t%d\t\t%d\t\t%d{ffffff}", PlayerXS[GiaiSau][1], PlayerXS[GiaiSau][2], PlayerXS[GiaiSau][3], PlayerXS[GiaiSau][4]);
    format(str2, sizeof(str), "GIAI 5  : {ff4da6}%d\t\t%d\t\t%d{ffffff}", PlayerXS[GiaiNam][1], PlayerXS[GiaiNam][2], PlayerXS[GiaiNam][3]);
    format(str3, sizeof(str), "GIAI 4  : {ff9900}%d\t\t%d{ffffff}", PlayerXS[GiaiTu][1], PlayerXS[GiaiTu][2]);
    format(str4, sizeof(str), "GIAI 3  : {ffff00}%d\t\t%d{ffffff}", PlayerXS[GiaiBa][1], PlayerXS[GiaiBa][2]);
    format(str5, sizeof(str), "GIAI 2  : {ff0000}%d{ffffff}", PlayerXS[GiaiNhi]);
    format(str5, sizeof(str), "GIAI 1  : {ff0000}%d{ffffff}", PlayerXS[GiaiNhat]);
    format(str6, sizeof(str), "-> GIAI DAC BIET : \t\t{cc33ff}%d{ffffff}", PlayerXS[DacBiet]);
    format(str7, sizeof(str), "_________________________________________________________________");
    format(str8, sizeof(str), "Ve so cua ban la : %d (%dKC)", PlayerInfo[playerid][pVeSo], PlayerInfo[playerid][pTienCuoc]);
    format(str9, sizeof(str), "_________________________________________________________________");
    format(str10, sizeof(str), "GIAI DAC BIET : Bao gom 2 chu so, quay 1 lan | Gia tri giai thuong : {cc33ff}x10${ffffff}");
    format(str11, sizeof(str), "GIAI 1 : Bao gom 2 chu so, quay 1 lan | Gia tri giai thuong : {00ff00}x7${ffffff}");
    format(str12, sizeof(str), "GIAI 2 : Bao gom 2 chu so, quay 1 lan | Gia tri giai thuong : {ff4da6}x6${ffffff}");
    format(str13, sizeof(str), "GIAI 3 : Bao gom 2 chu so, quay 2 lan | Gia tri giai thuong : {ff9900}x5${ffffff}");
    format(str14, sizeof(str), "GIAI 4 : Bao gom 2 chu so, quay 2 lan | Gia tri giai thuong : {ffff00}x4${ffffff}");
    format(str15, sizeof(str), "GIAI 5 : Bao gom 2 chu so, quay 3 lan | Gia tri giai thuong : {ff0000}x3${ffffff}");
    format(str16, sizeof(str), "GIAI 6 : Bao gom 2 chu so, quay 4 lan | Gia tri giai thuong : {ff0000}x2${ffffff}");
    format(str17, sizeof(str), "_________________________________________________________________");
    format(str, sizeof(str), "%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s", str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11,str12,str13,str14,str15,str16,str17);
    format(name, sizeof(name), "{ffffff}XO SO HANG NGAY!");
	ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, name, str, "Dong y", "Huy bo");

	return 1;
}

task QuaySo[600000]()
{
	new giai6[5], giai5[5], giai4[5], giai3[5], giai2, giai1, giaidacbiet;
	giai6[1] = random(99);
	giai6[2] = random(99);
	giai6[3] = random(99);
	giai6[4] = random(99);
	giai5[1] = random(99);
	giai5[2] = random(99);
	giai5[3] = random(99);
	giai4[1] = random(99);
	giai4[2] = random(99);
	giai3[1] = random(99);
	giai3[2] = random(99);
	giai2 = random(99);
	giai1 = random(99);
	giaidacbiet = random(99);

	PlayerXS[GiaiSau][1] = giai6[1];
	PlayerXS[GiaiSau][2] = giai6[2];
	PlayerXS[GiaiSau][3] = giai6[3];
	PlayerXS[GiaiSau][4] = giai6[4];

	PlayerXS[GiaiNam][1] = giai5[1];
	PlayerXS[GiaiNam][2] = giai5[2];
	PlayerXS[GiaiNam][3] = giai5[3];

	PlayerXS[GiaiTu][1] = giai4[1];
	PlayerXS[GiaiTu][2] = giai4[2];

	PlayerXS[GiaiBa][1] = giai3[1];
	PlayerXS[GiaiBa][2] = giai3[2];

	PlayerXS[GiaiNhi] = giai2;
	PlayerXS[GiaiNhat] = giai1;
	PlayerXS[DacBiet] = giaidacbiet;

	SendClientMessageToAllEx(COLOR_YELLOW, "[GTAVNS.COM] KET QUA XO SO , DA DUOC BAT DAU {00ff00}(/xemxoso)." );
	
	foreach(new i: Player)
	{
	    SetPVarInt(i, "QuaySoTime", 15);
		SetTimerEx("QuaySo_", 1000, 0, "d", i);
	}
}

forward QuaySo_(playerid);
public QuaySo_(playerid)
{
    SetPVarInt(playerid, "QuaySoTime", GetPVarInt(playerid, "QuaySoTime")-1);

    if(GetPVarInt(playerid, "QuaySoTime") > 0) SetTimerEx("QuaySo_", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "QuaySoTime") <= 0)
    {
        DeletePVar(playerid, "QuaySoTime");
        DeletePVar(playerid, "QuaySo_");
        XOSO_GIAIDACBIET(playerid);
        XOSO_GIAI1(playerid);
        XOSO_GIAI2(playerid);
        XOSO_GIAI3_1(playerid);
        XOSO_GIAI3_2(playerid);
        XOSO_GIAI4_1(playerid);
        XOSO_GIAI4_2(playerid);
        XOSO_GIAI5_1(playerid);
        XOSO_GIAI5_2(playerid);
        XOSO_GIAI5_3(playerid);
        XOSO_GIAI6_1(playerid);
        XOSO_GIAI6_2(playerid);
        XOSO_GIAI6_3(playerid);
        XOSO_GIAI6_4(playerid);
        
        foreach(new i: Player)
		{
	        SetPVarInt(i, "ResetXoSoTime", 30);
			SetTimerEx("ResetXoSo", 1000, 0, "d", i);
		}
        return 1;
    }
    return 1;
}

forward ResetXoSo(playerid);
public ResetXoSo(playerid)
{
    SetPVarInt(playerid, "ResetXoSoTime", GetPVarInt(playerid, "ResetXoSoTime")-1);

    if(GetPVarInt(playerid, "ResetXoSoTime") > 0) SetTimerEx("ResetXoSo", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "ResetXoSoTime") <= 0)
    {
        DeletePVar(playerid, "ResetXoSoTime");
        DeletePVar(playerid, "ResetXoSo");
        
        PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
		
		PlayerXS[GiaiSau][1] = 0;
		PlayerXS[GiaiSau][2] = 0;
		PlayerXS[GiaiSau][3] = 0;
		PlayerXS[GiaiSau][4] = 0;

		PlayerXS[GiaiNam][1] = 0;
		PlayerXS[GiaiNam][2] = 0;
		PlayerXS[GiaiNam][3] = 0;

		PlayerXS[GiaiTu][1] = 0;
		PlayerXS[GiaiTu][2] = 0;

		PlayerXS[GiaiBa][1] = 0;
		PlayerXS[GiaiBa][2] = 0;

		PlayerXS[GiaiNhi] = 0;
		PlayerXS[GiaiNhat] = 0;
		PlayerXS[DacBiet] = 0;
        return 1;
    }
    return 1;
}

stock XOSO_GIAIDACBIET(playerid)
{
    new string[1280];
    new giai = PlayerXS[DacBiet];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 10;
	    format(string, sizeof(string), "Chuc mung ban da trung giai DAC BIET : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 10);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "{FF0000}%s{FFFFFF} vua trung giai {cc33ff}dac biet{FFFFFF} voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 10);
		SendClientMessageToAllEx(COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI1(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiNhat];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 7;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 1 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 7);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		
		format(string, sizeof(string), "{FF0000}%s{FFFFFF} vua trung giai {ff0000}1{FFFFFF} voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 10);
		SendClientMessageToAllEx(COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI2(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiNhi];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 6;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 2 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 6);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI3_1(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiBa][1];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 5;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 3 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 5);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI3_2(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiBa][2];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 5;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 3 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 5);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI4_1(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiTu][1];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 4;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 4 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 4);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI4_2(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiTu][2];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 4;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 4 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 4);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI5_1(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiNam][1];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 3;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 5 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 3);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI5_2(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiNam][2];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 3;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 5 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 3);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI5_3(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiNam][3];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 3;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 5 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 3);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI6_1(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiSau][1];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 2;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 6 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 2);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI6_2(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiSau][1];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 2;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 6 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 2);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI6_3(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiSau][1];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 2;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 6 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 2);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}

stock XOSO_GIAI6_4(playerid)
{
    new string[1280];
    new giai = PlayerXS[GiaiSau][1];
    if(PlayerInfo[playerid][pVeSo] == giai)
	{
	    PlayerInfo[playerid][pnDP] += PlayerInfo[playerid][pTienCuoc] * 2;
	    format(string, sizeof(string), "Chuc mung ban da trung giai 6 : voi con so {00ff00}%d{ffffff} va nhan duoc {006600}%dKC{ffffff}", PlayerInfo[playerid][pTienCuoc] * 2);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		PlayerInfo[playerid][pVeSo] = 0;
		PlayerInfo[playerid][pTienCuoc] = 0;
	}
	return 1;
}
