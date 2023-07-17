/*
    =MINERAL WORK=
    xD        xD
         ||
        ____
        !!!!
*/
#include <a_samp>
#include <zcmd>
#define KSDIALOG  1001
#define DIALOG_NOTHING  1002
#define CHESUNGKS 1003
#define MAXKS 200 // MAX 200

enum pInfo
{
    pCanXang,
    pMayKhoan,
    pMayQuet,
    Float:pXang,
    pFe, // sat
    pCu, // dong
    pAg, // vang
}
new PlayerInfo[MAX_PLAYERS][pInfo];
enum Ksi
{
    SetRsKS,
    Settimers,
    kKhoi,
    Text3D:TextXang,
    MayKhoan,
    SatKS,
    KSLoai,
    KObj,
    Float:Khp,
    playeridks,
    Ksid,
    RespawnTime,
    Text3D:KText,
    KsCheck,
    Khaithac,
    Float:kX,
    Float:kY,
    Float:kZ,
}
new KSInfo[MAXKS][Ksi];
new SetKhaiThac[MAX_PLAYERS];
new PlayerKhaiThac[MAX_PLAYERS];
new ZKhaiThac[MAX_PLAYERS];
new CuopKhoangSan[MAX_PLAYERS];
new CuopKSTime[MAX_PLAYERS];

stock strfindex(string[],sub[],bool:ignorecase=false,pos=0) {
    if(pos < 0 || pos >= 2147483647) {
        printf("[strfind] Out of search position boundaries - Pos %d - string %s - sub %s", pos, string, sub);
        return -1;
    }
    return strfind(string, sub, ignorecase, pos);
}
stock GetPlayerNameEx(playerid) {

    new
        sz_playerName[MAX_PLAYER_NAME],
        i_pos;

    GetPlayerName(playerid, sz_playerName, MAX_PLAYER_NAME);
    while ((i_pos = strfindex(sz_playerName, "_", false, i_pos)) != -1) sz_playerName[i_pos] = ' ';
    return sz_playerName;
}
stock BomXang(playerid)
{
   new i;
   i = PlayerKhaiThac[playerid];
   if (IsPlayerInRangeOfPoint(playerid, 7.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
   {
          PlayerInfo[playerid][pXang] = 100*PlayerInfo[playerid][pMayKhoan];
          PlayerInfo[playerid][pCanXang] -= 1;
          ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
   }
   else
   {
          SendClientMessage(playerid, -1, "{AA3333}[KHOANG SAN]{FFFF00} Ban da khong o gan may khoan");
   }
   return 1;
}
forward CuopKS(playerid,ksid);
public CuopKS(playerid,ksid)
{
    new playerks = KSInfo[ksid][playeridks];
    new string[129];
    KillTimer(SetKhaiThac[playerks]);
    KSInfo[ksid][Khaithac] = 0;
    format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}{FFFF00} {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[ksid][Ksid],KSInfo[ksid][Khp]);
    Update3DTextLabelText(KSInfo[ksid][KText], -1, string);
    DestroyObject(KSInfo[ksid][MayKhoan]);
    DestroyObject(KSInfo[ksid][kKhoi]);
    Delete3DTextLabel(KSInfo[ksid][TextXang]);
    ZKhaiThac[playerks] = 0;
    PlayerKhaiThac[playerks] = 0;
    CuopKhoangSan[playerid] = 0;
    SendClientMessage(playerid, -1, "Ban da cuop thanh cong [ su dung /khaithac de khai thac khoang san do]");
    SendClientMessage(playerks, -1, "Khoang san ban da bi cuop");
    playerks = -1;
    return 1;
}
forward RespawnKS(playerid);
public RespawnKS(playerid)
{
     new i;
     i = PlayerKhaiThac[playerid];
     if(KSInfo[i][RespawnTime] >= 1)
     {
          KSInfo[i][Settimers] = SetTimerEx("RespawnKS",60000,0,"d", playerid);
          KSInfo[i][RespawnTime] -= 1;
          return 1;
     }
     else if(KSInfo[i][RespawnTime] <= 0)
     {
            new string[128];
            //new Float:X,Float:Y,Float:Z;
          //  GetPlayerPos(playerid, X,Y,Z);
            KSInfo[i][Ksid] = i;
            KSInfo[i][KsCheck] = 1;
            KSInfo[i][Khp] = 5000;
            KSInfo[i][SetRsKS] = 0;
            KSInfo[i][RespawnTime] = 0;
           // KSInfo[i][RespawnTime] = 0;
            KSInfo[i][KObj] = CreateObject(3931,KSInfo[i][kX],KSInfo[i][kY],KSInfo[i][kZ],0,0,0,100);
            format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[i][Ksid], KSInfo[i][Khp]);
            KSInfo[i][KText] = Create3DTextLabel(string, -1, KSInfo[i][kX],KSInfo[i][kY],KSInfo[i][kZ], 8 , 0);
         //   KSInfo[i][kX] = X;
           // KSInfo[i][kY] = Y;
            //KSInfo[i][kZ] = Z;
            KillTimer(KSInfo[i][Settimers]);
            printf("respawn ks id : %d X %f Y %f Z %f",i,KSInfo[i][kX],KSInfo[i][kY],KSInfo[i][kZ]);
            i = -1;
            return 1;
     }
     return 1;
}
forward UPDATEHP(playerid);
public UPDATEHP(playerid)
{
    new string[128];
    new Float:randomks = random(20);
    new Float:randomfuel = random(2);
    new i;
    i = PlayerKhaiThac[playerid];
    if(!IsPlayerInRangeOfPoint(playerid, 7.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
    {
        SendClientMessage(playerid, -1, "{008000}[KHAI THAC]{ffffff} Ban da di xa nen bi dung khai thac");
        DestroyObject(KSInfo[i][MayKhoan]);
        DestroyObject(KSInfo[i][kKhoi]);
        Delete3DTextLabel(KSInfo[i][TextXang]);
        KSInfo[i][Khaithac] = 0;
        ZKhaiThac[playerid] = 0;
        PlayerKhaiThac[playerid] = 0;
        format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[i][Ksid], KSInfo[i][Khp]);
        Update3DTextLabelText(KSInfo[i][KText], -1, string);
        KillTimer(SetKhaiThac[playerid]);
        return 1;
    }
    if(KSInfo[i][Khp] >= randomks)
    {
      if(PlayerInfo[playerid][pXang] >= randomfuel)
      {
         new string1[129];
         KSInfo[i][Khp] -= randomks + PlayerInfo[playerid][pMayKhoan] * 5;
         PlayerInfo[playerid][pXang] -= randomfuel;
         format(string1, sizeof(string1), "May khoan cua {008000}%s{ffffff}\n Xang con lai{ff4d4d}%0.2f", GetPlayerNameEx(playerid), PlayerInfo[playerid][pXang]);
         Update3DTextLabelText(KSInfo[i][TextXang], -1, string1);
         format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}{FFFF00}Nguoi khai thac : %s {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[i][Ksid],GetPlayerNameEx(playerid), KSInfo[i][Khp]);
         Update3DTextLabelText(KSInfo[i][KText], -1, string);
         SetKhaiThac[playerid] = SetTimerEx("UPDATEHP", 1000, 0, "d", playerid);
      }
      else if(PlayerInfo[playerid][pXang] <= 0)
      {
         SendClientMessage(playerid, -1, "{008000}[KHAI THAC]{ffffff} May xang ban da het xang");
         DestroyObject(KSInfo[i][MayKhoan]);
         DestroyObject(KSInfo[i][kKhoi]);
         Delete3DTextLabel(KSInfo[i][TextXang]);
         KSInfo[i][Khaithac] = 0;
         ZKhaiThac[playerid] = 0;
      //   PlayerKhaiThac[playerid] = 0;
         format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[i][Ksid], KSInfo[i][Khp]);
         Update3DTextLabelText(KSInfo[i][KText], -1, string);
         KillTimer(SetKhaiThac[playerid]);
      }
    }
    else if(KSInfo[i][Khp] <= randomks)
    {
       if (IsPlayerInRangeOfPoint(playerid, 5.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
       {
        SendClientMessage(playerid, -1, "{008000}[KHAI THAC]{ffffff} Ban da khai thac xong");
        DestroyObject(KSInfo[i][MayKhoan]);
        DestroyObject(KSInfo[i][KObj]);
        Delete3DTextLabel(KSInfo[i][KText]);

        Delete3DTextLabel(KSInfo[i][TextXang]);
        KSInfo[i][Khp] = 0;
        // KSInfo[i][kX] = 0;
      //  KSInfo[i][kY] = 0;
        new Float:x,Float:y,Float:z;
        GetObjectPos(KSInfo[i][KObj], x,y,z);
       // KSInfo[i][kX] = x;
        //KSInfo[i][kY] = y;
        //KSInfo[i][kZ] = z;
        KSInfo[i][Khaithac] = 0;
   //     KSInfo[i][KsCheck] = 0;
        ZKhaiThac[playerid] = 0;
        DestroyObject(KSInfo[i][kKhoi]);
        KillTimer(SetKhaiThac[playerid]);
        GiveKhoangsan(playerid);
        KSInfo[i][RespawnTime] = 15;
        KSInfo[i][SetRsKS] = 1;
        KSInfo[i][Settimers] = SetTimerEx("RespawnKS",60000,0,"d", playerid);
        return 1;
       }
       else
       {
         SendClientMessage(playerid, -1, "{FFFF00}[KHAI THAC]{ffffff} Ban da di qua xa nen khong nhan duoc gi ca nhe'");
         DestroyObject(KSInfo[i][KObj]);
         DestroyObject(KSInfo[i][MayKhoan]);
         Delete3DTextLabel(KSInfo[i][KText]);
         Delete3DTextLabel(KSInfo[i][TextXang]);
         DestroyObject(KSInfo[i][kKhoi]);
         KSInfo[i][Khp] = 0;
     //    KSInfo[i][kX] = 0;
       //  KSInfo[i][kY] = 0;
        // KSInfo[i][kZ] = 0; // treo 3p
         KSInfo[i][Khaithac] = 0;
         new Float:x,Float:y,Float:z;
         GetObjectPos(KSInfo[i][KObj], x,y,z);
     //    KSInfo[i][KsCheck] = 0;
         KillTimer(SetKhaiThac[playerid]);
         ZKhaiThac[playerid] = 0;
         KSInfo[i][RespawnTime] = 15;
         KSInfo[i][SetRsKS] = 1;
         KSInfo[i][Settimers] = SetTimerEx("RespawnKS",60000,0,"d", playerid);
        }
    }
    return 1; //
}
forward GiveKhoangsan(playerid);
public GiveKhoangsan(playerid)
{
    new string[129];
    new i;
    i = PlayerKhaiThac[playerid];
    new randomsat=random(3);
    DestroyObject(KSInfo[i][KObj]);
    format(string, sizeof(string), "{FFA500}[KHOANG SAN]{FFFFFF} Ban nhan duoc %d sat tu khoang san", KSInfo[i][SatKS]+randomsat);
    SendClientMessage(playerid,-1, string);
    PlayerInfo[playerid][pFe] += randomsat;
    return 1;
}
public OnFilterScriptInit()
{
    print("MINERAL WORK by Omatter xD");
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == KSDIALOG)
    {
        if(response)
        {
            if(listitem == 0)
            {
                ShowPlayerDialog(playerid, CHESUNGKS, DIALOG_STYLE_LIST, "Ban muon che tao gi", "M4/150 Sat\nSniper/250 Sat\nSpas/180 Sat", "CHON", "HUY");
            }
            if(listitem == 1)
            {
               SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Tim noi co khoang san va /khaithac");
            }
            if(listitem == 2)
            {
               if(GetPlayerMoney(playerid) >= 10000000*2)
               {
                  SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Ban da mua thanh cong may khoan VIP voi gia 10000000 SAD , Ban duoc tang 1 can xang");
                  PlayerInfo[playerid][pMayKhoan] = 2;
                  GivePlayerMoney(playerid, -10000000*2);
                  PlayerInfo[playerid][pCanXang] = 1;
               }
               else SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Ban khong du 1000 Coin de mua may VIP");
            }
            if(listitem == 3)
            {
               if(GetPlayerMoney(playerid) >= 10000000)
               {
                  SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Ban da mua thanh cong may khoan VIP voi gia 10m , Ban duoc tang 1 can xang");
                  PlayerInfo[playerid][pMayKhoan] = 1;
                  GivePlayerMoney(playerid, -10000000);
                  PlayerInfo[playerid][pCanXang] = 1;
               }
               else SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Ban khong du 10m de mua may KHOAN");
            }
            if(listitem == 4)
            {
               if(GetPlayerMoney(playerid) >= 5000)
               {
                  SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Ban da bom xang thanh cong [ - 5000 ] Coin");
                  GivePlayerMoney(playerid, -5000);
                  PlayerInfo[playerid][pXang] = 100*PlayerInfo[playerid][pMayKhoan]; // 100 x 1 hoac 100 x 200
                  PlayerInfo[playerid][pCanXang] += 1;
               }
               else SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Ban khong du 5000 Coin de bom xang");
            }
            if(listitem == 5)
            {
               if(GetPlayerMoney(playerid) >= 50000)
               {
                  SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Ban da mua may quet thanh cong [ - 50000]");
                  GivePlayerMoney(playerid, -50000);
                  PlayerInfo[playerid][pMayQuet] += 1;
               }
               else SendClientMessage(playerid, -1, "{FFFF00}[KS]{ffffff}Ban khong du 50000 ");
            }
        }
    }
    // dialog
    if(dialogid == CHESUNGKS)
    {
        if(response)
        {
            if(listitem == 0)
            {
                if(PlayerInfo[playerid][pFe] >= 150)
                {
                    SendClientMessage(playerid, -1, "{FFFF00}[CHESUNG]{ffffff}Ban da che tao thanh cong M4 voi so sat 150");
                    PlayerInfo[playerid][pFe] -= 150;
                    GivePlayerWeapon(playerid, 31 , 1);
                }
                else
                {
                    SendClientMessage(playerid, -1, "Ban khong co du so sat de che tao");
                }
            }
            if(listitem == 1)
            {
                if(PlayerInfo[playerid][pFe] >= 250)
                {
                    SendClientMessage(playerid, -1, "{FFFF00}[CHESUNG]{ffffff}Ban da che tao thanh cong Sniper voi so sat 250");
                    PlayerInfo[playerid][pFe] -= 250;
                    GivePlayerWeapon(playerid, 34 , 1);
                }
                else
                {
                    SendClientMessage(playerid, -1, "Ban khong co du so sat de che tao");
                }
            }
            if(listitem == 2)
            {
                if(PlayerInfo[playerid][pFe] >= 180)
                {
                    SendClientMessage(playerid, -1, "{FFFF00}[CHESUNG]{ffffff}Ban da che tao thanh cong Spas-12 voi so sat 180");
                    PlayerInfo[playerid][pFe] -= 180;
                    GivePlayerWeapon(playerid, 27 , 1);
                }
                else
                {
                    SendClientMessage(playerid, -1, "Ban khong co du so sat de che tao");
                }
            }
        }
    }
}
public OnPlayerDeath(playerid)
{
    if(CuopKhoangSan[playerid] == 1)
    {
       SendClientMessage(playerid, -1 , "Ban cuop khoang san that bai");
       KillTimer(CuopKSTime[playerid]);
       return 1;
    }
    if(ZKhaiThac[playerid] == 1)
    {
        new i;
        new string[129];
        i = PlayerKhaiThac[playerid];
        KillTimer(SetKhaiThac[playerid]);
        KSInfo[i][Khaithac] = 0;
        format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}{FFFF00} {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[i][Ksid],KSInfo[i][Khp]);
        Update3DTextLabelText(KSInfo[i][KText], -1, string);
        DestroyObject(KSInfo[i][MayKhoan]);
        DestroyObject(KSInfo[i][kKhoi]);
        ZKhaiThac[playerid] = 0;
        PlayerKhaiThac[playerid] = 0;
        SendClientMessage(playerid, -1, "BAN DA CHET NEN KHAI THAC BI HUY");
    }
    return 1;
}
CMD:editks(playerid, params[])
{
    new name[32], ksid , soluong;
    new string[300];
    if(sscanf(params, "s[32]dd", name, ksid , soluong))
    {
        SendClientMessage(playerid, -1, "Edit Door : /editks [name] [ks id] [ so luong]");
        SendClientMessage(playerid, -1, "[HUONG DAN SU DUNG] : Health [ edit mau] , Loai[edit kieu ks 1 la nho - 2 vua - 3 to]  ");
        SendClientMessage(playerid, -1, "[HUONG DAN SU DUNG] : Tao [ Tao] , Xoa [ xoa ] , Sat [ chinh so luong give sat cuc ks ] , goto [ ksid ] 0 0 ");
        return 1;
    }
    if(strcmp(name, "goto", true) == 0)
    {
        if(KSInfo[ksid][KsCheck] == 1)
        {
            SetPlayerPos(playerid,KSInfo[ksid][kX],KSInfo[ksid][kY],KSInfo[ksid][kZ]);
            format(string, sizeof(string), "{AA3333}[KHOANG SAN]{FFFF00} Ban da tele den Khoang San id [ %d ] ",ksid);
            SendClientMessage(playerid, -1, string);
            return 1;
        }
        else
        {
            SendClientMessage(playerid, -1, "{AA3333}[KHOANG SAN]{FFFF00}id khong ton tai");
        }
    }
    if(strcmp(name, "Sat", true) == 0)
    {
        if(KSInfo[ksid][KsCheck] == 1)
        {
            KSInfo[ksid][SatKS] = soluong;
            format(string, sizeof(string), "{AA3333}[KHOANG SAN]{FFFF00} Ban da chinh so luong sat cua ks %d thanh %d ",ksid,soluong);
            SendClientMessage(playerid, -1, string);
            return 1;
        }
        else
        {
            SendClientMessage(playerid, -1, "{AA3333}[KHOANG SAN]{FFFF00}id khong ton tai");
        }
    }
    if(strcmp(name, "Tao", true) == 0)
    {
        for (new i=0; i<MAXKS; i++)
        {
            if(KSInfo[i][KsCheck] == 0)
            {
                new Float:X,Float:Y,Float:Z;
        //        new Float:oX,Float:oY,Float:oZ;
                GetPlayerPos(playerid, X,Y,Z);
                Z = Z-1;
                KSInfo[i][Ksid] = i;
                KSInfo[i][KsCheck] = 1;
                KSInfo[i][Khp] = 5000;
                KSInfo[i][KObj] = CreateObject(3931,X,Y,Z,0,0,0,100);
           //     GetObjectPos(KSInfo[i][KObj],X,Y,Z);
                format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[i][Ksid], KSInfo[i][Khp]);
                KSInfo[i][KText] = Create3DTextLabel(string, -1, X,Y,Z, 8 , 0);
                KSInfo[i][kX] = X;
                KSInfo[i][kY] = Y;
                printf("y = %f ",KSInfo[i][kY]);
                KSInfo[i][kZ] = Z;
                KSInfo[i][SetRsKS] = 0;
                KSInfo[i][KSLoai] = 2;
                return 1;
            }
        }
    }
    if(strcmp(name, "Xoa", true) == 0)
    {
        DestroyObject(KSInfo[ksid][KObj]);
        Delete3DTextLabel(KSInfo[ksid][KText]);
        KSInfo[ksid][Khp] = 0;
        KSInfo[ksid][kX] = 0;
        KSInfo[ksid][kY] = 0;
        KSInfo[ksid][kZ] = 0;
        KSInfo[ksid][SetRsKS] = 0;
        KSInfo[ksid][Khaithac] = 0;
        KSInfo[ksid][KsCheck] = 0;
    }
    if(strcmp(name, "Health", true) == 0)
    {
        if(KSInfo[ksid][KsCheck] == 1)
        {
            new string1[129];
            KSInfo[ksid][Khp] = soluong;
            format(string, sizeof(string), "{AA3333}[KHOANG SAN]{FFFF00} Ban da chinh health cua ks %d thanh %d", ksid , soluong);
            SendClientMessage(playerid, -1, string);
            format(string1, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[ksid][Ksid], KSInfo[ksid][Khp]);
            Update3DTextLabelText(KSInfo[ksid][KText], -1, string1);
        }
        else
        {
            SendClientMessage(playerid, -1, " ID Khong ton tai");
        }
    }
    if(strcmp(name, "Loai", true) == 0)
    {
        if(KSInfo[ksid][KsCheck] == 1)
        {
            if(soluong == 1)
            {
                new Float:X,Float:Y,Float:Z;
                GetPlayerPos(playerid, X,Y,Z);
                Z = Z-1;
                KSInfo[ksid][KSLoai] = soluong;
                DestroyObject(KSInfo[ksid][KObj]);
                KSInfo[ksid][KObj] = CreateObject(3930,X,Y,Z,0,0,0,100);
                format(string, sizeof(string), "{AA3333}[KHOANG SAN]{FFFF00}Ban da chinh type cua khoang san %d thanh loai nho", ksid);
                SendClientMessage(playerid, -1, string);
                Delete3DTextLabel(KSInfo[ksid][KText]);
                format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[ksid][Ksid], KSInfo[ksid][Khp]);
                KSInfo[ksid][KText] = Create3DTextLabel(string, -1, X,Y,Z, 8 , 0);
                KSInfo[ksid][kX] = X;
                KSInfo[ksid][kY] = Y;
                KSInfo[ksid][kZ] = Z;
            }
            if(soluong == 2)
            {

                new Float:X,Float:Y,Float:Z;
                GetPlayerPos(playerid, X,Y,Z);
                Z = Z-1;
                DestroyObject(KSInfo[ksid][KObj]);
                KSInfo[ksid][KSLoai] = soluong;
                KSInfo[ksid][KObj] = CreateObject(3931,X,Y,Z,0,0,0,100);
                format(string, sizeof(string), "{AA3333}[KHOANG SAN]{FFFF00} Ban da chinh type cua khoang san %s thanh loai vua", ksid);
                SendClientMessage(playerid, -1, string);
                Delete3DTextLabel(KSInfo[ksid][KText]);
                format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[ksid][Ksid], KSInfo[ksid][Khp]);
                KSInfo[ksid][KText] = Create3DTextLabel(string, -1, X,Y,Z+1, 8 , 0);
                KSInfo[ksid][kX] = X;
                KSInfo[ksid][kY] = Y;
                KSInfo[ksid][kZ] = Z;
            }
            if(soluong == 3)
            {
                new Float:X,Float:Y,Float:Z;
                GetPlayerPos(playerid, X,Y,Z);
                Z = Z-1;
                DestroyObject(KSInfo[ksid][KObj]);
                KSInfo[ksid][KSLoai] = soluong;
                KSInfo[ksid][KObj] = CreateObject(900,X,Y,Z,0,0,0,100);
                format(string, sizeof(string), "{AA3333}[KHOANG SAN]{FFFF00} Ban da chinh type cua khoang san %s thanh loai to", ksid);
                SendClientMessage(playerid, -1, string);
                Delete3DTextLabel(KSInfo[ksid][KText]);
                format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[ksid][Ksid], KSInfo[ksid][Khp]);
                KSInfo[ksid][KText] = Create3DTextLabel(string, -1, X,Y,Z+3, 8 , 0);
                KSInfo[ksid][kX] = X;
                KSInfo[ksid][kY] = Y;
                KSInfo[ksid][kZ] = Z;
            }
        }
        else
        {
            SendClientMessage(playerid, -1, " ID Khong ton tai");
        }
    }
    return 1;
}
CMD:dungkhaithac(playerid, params[])
{
   if(ZKhaiThac[playerid] == 1)
   {
      for (new i = 0; i < MAXKS; i++)
      {
            new string[128];
            if (IsPlayerInRangeOfPoint(playerid, 2.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
            {
                     SendClientMessage(playerid, -1, "{008000}[KHAI THAC]{ffffff} Ban da dung khai thac");
                     DestroyObject(KSInfo[i][MayKhoan]);
                     DestroyObject(KSInfo[i][kKhoi]);
                     Delete3DTextLabel(KSInfo[i][TextXang]);
                     KSInfo[i][Khaithac] = 0;
                     ZKhaiThac[playerid] = 0;
                     PlayerKhaiThac[playerid] = 0;
                     format(string, sizeof(string), "Khoang san ID :{008000} %d {ffffff}\n Health{ff4d4d}%0.2f", KSInfo[i][Ksid], KSInfo[i][Khp]);
                     Update3DTextLabelText(KSInfo[i][KText], -1, string);
                     KillTimer(SetKhaiThac[playerid]);
            }
      }
   }
   return 1;
}
CMD:cuopkhoangsan(playerid, params[])
{
    if(PlayerInfo[playerid][pMayKhoan] == 0) return SendClientMessage(playerid, -1, "Ban khong co may khoan ");
    if(PlayerInfo[playerid][pXang] <= 0) return SendClientMessage(playerid, -1, "May khoan ban khong du xang hay den bom xang");
    if(ZKhaiThac[playerid] == 1) return SendClientMessage(playerid, -1, "Ban dang khai thac roi khong the cuop khoang san");
    if(CuopKhoangSan[playerid] == 1) return SendClientMessage(playerid, -1, "Ban dang khai thac roi khong the cuop khoang san");
    for (new i=0; i<MAXKS; i++)
    {
        if (IsPlayerInRangeOfPoint(playerid, 5.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
        {
            if(KSInfo[i][Khaithac] == 1)
            {
                 SendClientMessage(playerid, -1, "[KS] Ban dang cuop khoang san , se hoan thah trong 30s ");
                 CuopKSTime[playerid] = SetTimerEx("CuopKS",30000,0,"d",i,playerid);
                 CuopKhoangSan[playerid] = 1;
                 return 1;
            }
            else
            {
                 SendClientMessage(playerid,-1,"Khoang san nay khong duoc khai thac");
                 return 1;
            }
        }
        else
        {
             SendClientMessage(playerid,-1,"Ban khong dung gan khoang san");
        }
        return 1;
    }
    return 1;
}
CMD:khaithac(playerid, params[])
{
    new string[129];
    if(PlayerInfo[playerid][pMayKhoan] == 0) return SendClientMessage(playerid, -1, "Ban khong co may khoan ");
    if(PlayerInfo[playerid][pXang] <= 0) return SendClientMessage(playerid, -1, "May khoan ban khong du xang hay den bom xang");
    if(ZKhaiThac[playerid] == 1) return SendClientMessage(playerid, -1, "Ban da khai thac roi khong the khai thac nua");
    for (new i=0; i<MAXKS; i++)
    {
        if(KSInfo[i][KSLoai] == 1 || KSInfo[i][KSLoai] == 2)
        {
            if (IsPlayerInRangeOfPoint(playerid, 2.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
            {
                if(KSInfo[i][SetRsKS] >= 1) return SendClientMessage(playerid, -1,"Khoang san nay dang rs");
                if(KSInfo[i][Khaithac] == 0)
                {
                    new Float:X,Float:Y,Float:Z;
                    GetPlayerPos(playerid, X,Y,Z);
                    Z = Z-1;
                    format(string, sizeof(string), "May khoan cua {008000}%s{ffffff}\n Xang con lai{ff4d4d}%0.2f", GetPlayerNameEx(playerid), PlayerInfo[playerid][pXang]);
                    KSInfo[i][TextXang] = Create3DTextLabel(string, -1, X,Y,Z+1, 8 , 0);
                    KSInfo[i][MayKhoan] = CreateObject(361,X,Y,Z+1,0,0,0,100);
                    KSInfo[i][kKhoi] = CreateObject(18716,X,Y,Z-4,0,0,0,100);
                    SetKhaiThac[playerid] = SetTimerEx("UPDATEHP", 1000, 0, "d", playerid);
                    KSInfo[i][Khaithac] = 1;
                    ZKhaiThac[playerid] = 1;
                    KSInfo[i][playeridks] = playerid;
                    PlayerKhaiThac[playerid] = i;
                    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
                    return 1;
                }
                else
                {
                    SendClientMessage(playerid, -1, "{AA3333}[KHOANG SAN]{FFFF00} Khoang san nay da co nguoi khai thac");
                    return 1;
                }
            }
        }
        else if(KSInfo[i][KSLoai] == 3)
        {
             if (IsPlayerInRangeOfPoint(playerid, 7.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
             {
                if(KSInfo[i][SetRsKS] >= 1) return SendClientMessage(playerid, -1,"Khoang san nay dang rs");
                if(KSInfo[i][Khaithac] == 0)
                {
                    new Float:X,Float:Y,Float:Z;
                    GetPlayerPos(playerid, X,Y,Z);
                    Z = Z-3;
                    format(string, sizeof(string), "May khoan cua {008000}%s{ffffff}\n Xang con lai{ff4d4d}%0.2f", GetPlayerNameEx(playerid), PlayerInfo[playerid][pXang]);
                    KSInfo[i][TextXang] = Create3DTextLabel(string, -1, X,Y,Z, 8 , 0);
                    KSInfo[i][MayKhoan] = CreateObject(361,X,Y,Z+2,0,0,0,100);
                    KSInfo[i][kKhoi] = CreateObject(18716,X,Y,Z-4,0,0,0,100);
                    SetKhaiThac[playerid] = SetTimerEx("UPDATEHP", 1000, 0, "d", playerid);
                    KSInfo[i][Khaithac] = 1;
                    ZKhaiThac[playerid] = 1;
                    PlayerKhaiThac[playerid] = i;
                    return 1;
                }
                else
                {
                    SendClientMessage(playerid, -1, "{AA3333}[KHOANG SAN]{FFFF00} Khoang san nay da co nguoi khai thac");
                    return 1;
                }
             }
        }
    }
    return 1;
}
/*CMD:khaithac(playerid, params[])
{
    if(ZKhaiThac[playerid] == 1) return SendClientMessage(playerid, -1, "Ban da khai thac roi khong the khai thac nua");
    for (new i=0; i<MAXKS; i++)
    {
       if (IsPlayerInRangeOfPoint(playerid, 7.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
       {
           if(KSInfo[i][Khaithac] == 0)
           {
             SetKhaiThac[playerid] = SetTimerEx("UPDATEHP", 1000, 0, "d", playerid);
             KSInfo[i][Khaithac] = 1;
             ZKhaiThac[playerid] = 1;
             PlayerKhaiThac[playerid] = i;
             return 1;
           }
           else
           {
             SendClientMessage(playerid, -1, "{AA3333}[KHOANG SAN]{FFFF00} Khoang san nay da co nguoi khai thac");
             return 1;
           }

       }
    }
    return 1;
}*/

CMD:npckhoangsan(playerid, params[])
{
    ShowPlayerDialog(playerid, KSDIALOG, DIALOG_STYLE_LIST, "Khoang san", "Che Tao vu khi\nHuong dan cong viec\nMua May khoan VIP\nMua may khoan thuong\nBom Xang\nMua May Quet", "CHON", "HUY");
    return 1;
}
CMD:testmoney(playerid, params[])
{
    GivePlayerMoney(playerid, 1000000);
    return 1;
}
CMD:khoangsan(playerid, params[])
{
    new string[128];
    format(string, sizeof(string), "So luong Sat %d Dong %d Vang %d\nCan xang cua ban: %d [ xang trong may %f [ lit ] ]", PlayerInfo[playerid][pFe],PlayerInfo[playerid][pCu],PlayerInfo[playerid][pAg],PlayerInfo[playerid][pCanXang]-1,PlayerInfo[playerid][pXang]);
    ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Khoang san", string, "Dong lai", "");
    return 1;
}
CMD:quetkhoangsan(playerid, params[])
{
    if(PlayerInfo[playerid][pMayQuet] == 0) return SendClientMessage(playerid, -1, "Ban khong co may quet");
    for (new i=0; i<MAXKS; i++)
    {
        if (IsPlayerInRangeOfPoint(playerid, 100.0, KSInfo[i][kX], KSInfo[i][kY], KSInfo[i][kZ]))
        {
            if(KSInfo[i][Khaithac] == 0)
            {
                new string[129];
                format(string, sizeof(string),"Khoang san gan day : KS ID :  %d , Mau : %f ", KSInfo[i][Ksid],KSInfo[i][Khp]);
                SendClientMessage(playerid, -1, string);
            }
            else
            {
                new string[129];
                format(string, sizeof(string),"Khoang san gan day : KS ID :  %d , Mau : %f Nguoi Dang khai thac : %s", KSInfo[i][Ksid],KSInfo[i][Khp],GetPlayerNameEx(KSInfo[i][playeridks]));
                SendClientMessage(playerid, -1, string);
            }
        }
        else
        {

        }
    }
    return 1;
}
