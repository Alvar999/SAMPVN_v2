//HO TRO GUILD
#include "ysi\y_hooks"


#define 		ADJUST_DIV_FAMILY0          (6033)
#define 		ADJUST_DIV_FAMILY1          (6034)
#define 		ADJUST_DIV_FAMILY2          (6035)
#define 		ADJUST_DIV_FAMILY3          (6036)
#define 		ADJUST_DIV_FAMILY4          (6037)
#define 		ADJUST_DIV_FAMILY5          (6038)
#define 		ADJUST_DIV_FAMILY           (6040)
#define 		ADJUST_0_FAMILY             (6041)
#define 		ADJUST_1_FAMILY             (6042)
#define 		ADJUST_2_FAMILY             (6043)
#define 		ADJUST_3_FAMILY             (6044)
#define 		ADJUST_NAME_FAMILY          (6045)
#define 		ADJUST_NAMEA_FAMILY         (6046)
#define 		ADJUST_RANK_FAMILY7         (6047)
#define 		ADJUST_RANK_FAMILY1         (6048)
#define 		ADJUST_RANK_FAMILY2         (6049)
#define 		ADJUST_RANK_FAMILY3         (6050)
#define 		ADJUST_RANK_FAMILY4         (6051)
#define 		ADJUST_RANK_FAMILY5         (6052)
#define 		ADJUST_RANK_FAMILY6         (6053)
#define 		ADJUST_RANK_FAMILY          (6054)
#define 		ADJUST_MOTD_FAMILY          (6055)
#define 		ADJUST_MOTD_FAMILY1         (6056)
#define 		ADJUST_MOTD_FAMILY2         (6057)
#define 		ADJUST_MOTD_FAMILY3         (6058)
#define 		TAOFAMILY                   (6059)
#define 		XEMFAMILY                   (6060)
#define 		XACNHANTAOFAMILY            (6061)
#define 		DIALOG_MEMBER_EDITDIVS      (6062)
#define 		DIALOG_MEMBER_EDITRANKS     (6063)
#define 		DIALOG_MEMBER_EDITDIV       (6064)
#define 		DIALOG_MEMBER_EDITRANK      (6065)
#define 		DIALOG_MEMBER_NAME          (6066)
#define 		DIALOG_MEMBER_DUTYCOL       (6067)
#define 		DIALOG_MEMBER_RADIOCOL      (6068)
#define 		DIALOG_KICKMEMBER           (6069)


//fuction
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_NPCFAMILY)
    {
        if(response)
        {
            new iGroupID = PlayerInfo[playerid][pLeader];
            new szTitle[64 + GROUP_MAX_NAME_LEN];
            if(listitem == 0)
            {
                ShowPlayerDialog(playerid,DIALOG_NOTHING,DIALOG_STYLE_MSGBOX,"Loi", "{FFFFFF}Tinh nang tam khoa","OK","");
                /*format(szTitle, sizeof szTitle, "Sua ten Group {%s}(%s)", Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
                ShowPlayerDialog(playerid, DIALOG_MEMBER_NAME, DIALOG_STYLE_INPUT, szTitle, "Chi dinh ten Group nay.", "Xac nhan", "Huy bo");*/
            }
            if(listitem == 1)
            {
                new
					szDialog[(GROUP_MAX_DIV_LEN + 8) * MAX_GROUP_DIVS];

                for(new i = 0; i != MAX_GROUP_DIVS; ++i) {
					format(szDialog, sizeof szDialog, "%s\n(%i) %s", szDialog, i + 1, ((arrGroupDivisions[iGroupID][i][0]) ? (arrGroupDivisions[iGroupID][i]) : ("{BBBBBB}(undefined){FFFFFF}")));
                }

                format(szTitle, sizeof szTitle, "Edit Group Divisions {%s}(%s)", Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
                ShowPlayerDialog(playerid, DIALOG_MEMBER_EDITDIVS, DIALOG_STYLE_LIST, szTitle, szDialog, "Lua chon", "Huy bo");
            }
            if(listitem == 2)
            {
                new
					szDialog[(GROUP_MAX_RANK_LEN + 8) * MAX_GROUP_RANKS];

                for(new i = 0; i != MAX_GROUP_RANKS; ++i) {
					format(szDialog, sizeof szDialog, "%s\n(%i) %s", szDialog, i, ((arrGroupRanks[iGroupID][i][0]) ? (arrGroupRanks[iGroupID][i]) : ("{BBBBBB}(undefined){FFFFFF}")));
                }

                format(szTitle, sizeof szTitle, "Edit Group Ranks {%s}(%s)", Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
                ShowPlayerDialog(playerid, DIALOG_MEMBER_EDITRANKS, DIALOG_STYLE_LIST, szTitle, szDialog, "Lua chon", "Huy bo");
            }
            if(listitem == 3)
            {
                format(szTitle, sizeof szTitle, "Sua mau Duty Nhom {%s}(%s)", Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
                ShowPlayerDialog(playerid, DIALOG_MEMBER_DUTYCOL, DIALOG_STYLE_INPUT, szTitle, "Enter a colour in hexadecimal format (for example, BCA3FF). This colour will be used to identify the group (i.e. name tag colour).", "Lua chon", "Huy bo");
            }
            if(listitem == 4)
            {
                format(szTitle, sizeof szTitle, "Sua mau Radio Nhom {%s}(%s)", Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
                ShowPlayerDialog(playerid, DIALOG_MEMBER_RADIOCOL, DIALOG_STYLE_INPUT, szTitle, "Enter a colour in hexadecimal format (for example, BCA3FF). This colour will be used for the group's in-character radio chat.", "Lua chon", "Huy bo");
            }
            if(listitem == 5)
            {
                new resultline[256];
			    format(resultline, sizeof(resultline), "MOTD : %s",arrGroupData[iGroupID][g_szGroupMOTD]);
				ShowPlayerDialog(playerid, ADJUST_MOTD_FAMILY, DIALOG_STYLE_LIST, "Thong Bao Family", resultline, "Lua chon", "Huy bo");
            }
            if(listitem == 6)
            {
                GetMember(playerid);
            }
            if(listitem == 7)
            {
                ShowPlayerDialog(playerid, DIALOG_KICKMEMBER,DIALOG_STYLE_INPUT,"Moi thanh vien ra nhom", "Nhap ten thanh vien trong guild ban can sut ra","Ok","");
            }
        }
    }
	if(dialogid == TAOFAMILY)
    {
        if(response)
        {
            if(listitem == 0)
            {
                ShowPlayerDialog(playerid, XACNHANTAOFAMILY, DIALOG_STYLE_MSGBOX, "{800080}Xac Nhan Tao Family",
                "{FFFFFF}Le Phi De Khoi Tao Family La : {40FFFF} 10.000 {FFFFFF}Credits\n\
				+Quyen Loi Cua Family:\n\
				*Thanh Vien Family Khong The Gay Sat Thuong Lan Nhau\n\
				*Khi Vao Game Co The Phat Hien Lan Nhau Bang Mau Ten\n\
				*Duoc Thuong Quyen Loi Uu Tien Tu Admin\n\
				*Co The Su Dung Thuoc Kich Thich Tang Cuong Khi War\n\
				*Khi Tan Cong Family Khac Se Duoc Diem Thuong De Nang Cap Family\n\
				Luu y : Family Khong Hoat Dong Tren 3 Ngay Se Bi Giai Tan ",
                "Chap Nhan", "Tu Choi");
            }
            if(listitem == 1)
            {
                new resultline[1024];
				for(new i = 1; i < sizeof(FamilyInfo); i++)
				{
					if(i == 0)
					{
					     i++;
					}
					switch(FamilyInfo[i][FamilyTaken])
					{
					     case 1: format(resultline, sizeof(resultline), "%s\n*%s  | Leader: %s", resultline, FamilyInfo[i][FamilyName], FamilyInfo[i][FamilyLeader]);
					     default: format(resultline, sizeof(resultline), "%s\n*Trong  | Leader: Trong", resultline);
					}
					ShowPlayerDialog(playerid, XEMFAMILY, DIALOG_STYLE_LIST, "Danh Sach Family", resultline, "Lua chon", "Huy bo");
				}
            }
        }
    }
	if(dialogid == XACNHANTAOFAMILY)
    {
        if(response)
        {
			new szDialog[128];
            if(PlayerInfo[playerid][pCredits] < 10000)
            {
                SendClientMessageEx(playerid, COLOR_CYAN, "[FAMILY]Ban Khong Du 10.000 Credits De Tao Family");
                return 1;
            }
            if(PlayerInfo[playerid][pFMember] != INVALID_FAMILY_ID)
            {
                SendClientMessageEx(playerid, COLOR_CYAN, "[FAMILY]Ban Dang La Mot Thanh Vien Family Nao Do");
                return 1;
            }
            CreateFamily(playerid);
            format(szDialog, sizeof(szDialog), "[FAMILY]{FFFFFF} Nguoi Choi %s Da Thanh Lap Mot Family Moi", GetPlayerNameEx(playerid), playerid);
            SendClientMessageToAllEx(COLOR_LIGHTBLUE, szDialog);
            ShowPlayerDialog(playerid, ADJUST_NAMEA_FAMILY, DIALOG_STYLE_INPUT, "Hay Chon Mot Cai Ten Moi", "Xin Dung Dat Ten Qua Nham Nhi", "Dieu Chinh", "Huy bo");
        }
    }
	if(dialogid == ADJUST_MOTD_FAMILY)
    {
        if(response)
        {
            new iGroupID = PlayerInfo[playerid][pLeader];
			new string[128];
            format(string, sizeof(string), "{FFFFFF}MOTD : {40FFFF}%s", arrGroupData[iGroupID][g_szGroupMOTD]);
            ShowPlayerDialog(playerid, ADJUST_MOTD_FAMILY1, DIALOG_STYLE_INPUT, "Chinh Sua Thong Bao", string, "Dieu Chinh", "Huy bo");
        }
    }
	if(dialogid == ADJUST_NAME_FAMILY)
    {
        if(response)
        {
            new szDialog[128];
            new titile[40];
            new family = PlayerInfo[playerid][pFMember];
            format(titile, sizeof(titile), "{40FFFF}%s", FamilyInfo[family][FamilyName]);
            format(szDialog, sizeof(szDialog), "{FFFFFF}Ten Family : {40FFFF}%s", FamilyInfo[family][FamilyName]);
            ShowPlayerDialog(playerid, ADJUST_NAMEA_FAMILY, DIALOG_STYLE_INPUT, titile, szDialog, "Dieu Chinh", "Huy bo");
        }
    }
	if(dialogid == ADJUST_NAMEA_FAMILY)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 40)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 40 ky tu.");
		        return 1;
		    }
		    strmid(FamilyInfo[family][FamilyName], inputtext, 0, strlen(inputtext), 100);
		    SaveFamilies();
		    SendClientMessageEx(playerid, COLOR_WHITE, "You've adjusted your family's name.");
		    format(szMessage, sizeof(szMessage), "Ban Da Doi Ten Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_DIV_FAMILY)
    {
        if(response)
        {
            new szDialog[128];
            if(listitem == 0)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}DIV 0 : {40FFFF}%s", FamilyDivisionInfo[family][0]);
                 ShowPlayerDialog(playerid, ADJUST_DIV_FAMILY1, DIALOG_STYLE_INPUT, "Adjust DIV 0", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 1)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}DIV 1 : {40FFFF}%s", FamilyDivisionInfo[family][1]);
                 ShowPlayerDialog(playerid, ADJUST_DIV_FAMILY2, DIALOG_STYLE_INPUT, "Adjust DIV 1", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 2)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}DIV 2 : {40FFFF}%s", FamilyDivisionInfo[family][2]);
                 ShowPlayerDialog(playerid, ADJUST_DIV_FAMILY3, DIALOG_STYLE_INPUT, "Adjust DIV 2", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 3)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}DIV 3 : {40FFFF}%s", FamilyDivisionInfo[family][3]);
                 ShowPlayerDialog(playerid, ADJUST_DIV_FAMILY4, DIALOG_STYLE_INPUT, "Adjust DIV 3", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 4)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}DIV 4 : {40FFFF}%s", FamilyDivisionInfo[family][4]);
                 ShowPlayerDialog(playerid, ADJUST_DIV_FAMILY5, DIALOG_STYLE_INPUT, "Adjust DIV 4", szDialog, "Dieu Chinh", "Huy bo");
            }
        }
    }
	if(dialogid == ADJUST_RANK_FAMILY)
    {
        if(response)
        {
            new szDialog[128];
            if(listitem == 0)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}Rank 0 : {40FFFF}%s", FamilyRankInfo[family][0]);
                 ShowPlayerDialog(playerid, ADJUST_RANK_FAMILY1, DIALOG_STYLE_INPUT, "Adjust Rank 0", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 1)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}Rank 1 : {40FFFF}%s", FamilyRankInfo[family][1]);
                 ShowPlayerDialog(playerid, ADJUST_RANK_FAMILY2, DIALOG_STYLE_INPUT, "Adjust Rank 1", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 2)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}Rank 2 : {40FFFF}%s", FamilyRankInfo[family][2]);
                 ShowPlayerDialog(playerid, ADJUST_RANK_FAMILY3, DIALOG_STYLE_INPUT, "Adjust Rank 2", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 3)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}Rank 3 : {40FFFF}%s", FamilyRankInfo[family][3]);
                 ShowPlayerDialog(playerid, ADJUST_RANK_FAMILY4, DIALOG_STYLE_INPUT, "Adjust Rank 3", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 4)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}Rank 4 : {40FFFF}%s", FamilyRankInfo[family][4]);
                 ShowPlayerDialog(playerid, ADJUST_RANK_FAMILY5, DIALOG_STYLE_INPUT, "Adjust Rank 4", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 5)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}Rank 5 : {40FFFF}%s", FamilyRankInfo[family][5]);
                 ShowPlayerDialog(playerid, ADJUST_RANK_FAMILY6, DIALOG_STYLE_INPUT, "Adjust Rank 5", szDialog, "Dieu Chinh", "Huy bo");
            }
            if(listitem == 6)
            {
                 new family = PlayerInfo[playerid][pFMember];
                 format(szDialog, sizeof(szDialog), "{FFFFFF}Rank 6 : {40FFFF}%s", FamilyRankInfo[family][6]);
                 ShowPlayerDialog(playerid, ADJUST_RANK_FAMILY7, DIALOG_STYLE_INPUT, "Adjust Rank 6", szDialog, "Dieu Chinh", "Huy bo");
            }
        }
    }
	if(dialogid == ADJUST_RANK_FAMILY1)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 10)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 10 ky tu.");
		        return 1;
		    }
		    format(FamilyRankInfo[family][0], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi Rank 0 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_RANK_FAMILY2)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 10)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 10 ky tu.");
		        return 1;
		    }
		    format(FamilyRankInfo[family][1], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi Rank 1 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_RANK_FAMILY3)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 10)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 10 ky tu.");
		        return 1;
		    }
		    format(FamilyRankInfo[family][2], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi Rank 2 Family Thanh %s.",inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_RANK_FAMILY4)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 10)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 10 ky tu.");
		        return 1;
		    }
		    format(FamilyRankInfo[family][3], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi Rank 3 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_RANK_FAMILY5)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 10)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 10 ky tu.");
		        return 1;
		    }
		    format(FamilyRankInfo[family][4], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi Rank 4 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_RANK_FAMILY6)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 10)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 10 ky tu.");
		        return 1;
		    }
		    format(FamilyRankInfo[family][5], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi Rank 4 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_RANK_FAMILY7)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 10)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 10 ky tu.");
		        return 1;
		    }
		    format(FamilyRankInfo[family][6], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi Rank 6 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_DIV_FAMILY1)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 16)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 16 ky tu.");
		        return 1;
		    }
		    format(FamilyDivisionInfo[family][0], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi DIV 0 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_DIV_FAMILY2)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 16)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 16 ky tu.");
		        return 1;
		    }
		    format(FamilyDivisionInfo[family][1], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi DIV 1 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_DIV_FAMILY3)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 16)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 16 ky tu.");
		        return 1;
		    }
		    format(FamilyDivisionInfo[family][2], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi DIV 2 Family Thanh %s.",inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_DIV_FAMILY4)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 16)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 16 ky tu.");
		        return 1;
		    }
		    format(FamilyDivisionInfo[family][3], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi DIV 3 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_DIV_FAMILY5)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 16)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 16 ky tu.");
		        return 1;
		    }
		    format(FamilyDivisionInfo[family][4], 16, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi DIV 4 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_MOTD_FAMILY1)
    {
        if(response == 1)
        {
            new szMessage[128];
            new iGroupID = PlayerInfo[playerid][pLeader];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 50)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 50 ky tu.");
		        return 1;
		    }
		    for(new sz = 0; sz < strlen(inputtext); sz++)
		    {
		        if(inputtext[sz] == ''')
		        {
					SendClientMessageEx(playerid, COLOR_GREY, "Co ky tu khong hop le khong the thay doi.");
					return 1;
		        }
		    }
		    format(arrGroupData[iGroupID][g_szGroupMOTD], 50, "%s", inputtext);
		    SaveGroup(iGroupID);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi MOTD Guild Thanh %s.",inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_MOTD_FAMILY2)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 50)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 50 ky tu.");
		        return 1;
		    }
		    format(FamilyMOTD[family][1], 50, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi MOTD 2 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
	if(dialogid == ADJUST_MOTD_FAMILY3)
    {
        if(response == 1)
        {
            new szMessage[128];
            new family = PlayerInfo[playerid][pFMember];
		    if(isnull(inputtext))
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Xin Hay Dien Thong Tin Vao" );
		        return 1;
		    }
		    if(strlen(inputtext) > 50)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "Khong Duoc Phep Dieu Chinh Tren 50 ky tu.");
		        return 1;
		    }
		    format(FamilyMOTD[family][2], 50, "%s", inputtext);
		    SaveFamily(family);
		    format(szMessage, sizeof(szMessage), "Ban Da Doi MOTD 3 Family Thanh %s.", inputtext);
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
        }
    }
    return 1;
}
stock CreateFamily(playerid) // Money
{
    for(new i = 0; i < sizeof(FamilyInfo); i++)
  	{
        if(i == 0)
   	    {
			i++;
  	    }
  	    if(FamilyInfo[i][FamilyTaken] == 0)
  	    {
			new sendername[MAX_PLAYER_NAME];
			new string[128];
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s",sendername);
			strmid(FamilyInfo[i][FamilyLeader], string, 0, strlen(string), 24);
			FamilyInfo[i][FamilyMembers] ++;
			FamilyInfo[i][FamilyTaken] = 1;
			FamilyInfo[i][FamilyLevel] = 1;
			PlayerInfo[playerid][pFMember] = i;
			PlayerInfo[playerid][pRank] = 6;
			PlayerInfo[playerid][pDivision] = 0;
			SaveFamily(i);
            return 1;
  	    }
  	}
  	return 0;
}
