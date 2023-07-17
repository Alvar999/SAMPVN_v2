#include <a_samp>

new strR[255];

#define FILTERSCRIPT

#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_RED 0xFF0000FF

public OnFilterScriptInit()
{

}
stock PlayerName(playerid)
{
new name[MAX_PLAYER_NAME];
GetPlayerName(playerid,name,MAX_PLAYER_NAME);
return name;
}
new l[MAX_PLAYERS];
public OnPlayerText(playerid, text[])
{
new is1=0;
new r=0;
l[playerid] = 1;
if(strfind(text, "GTA-AB.NET", true) != -1 || strfind(text, "00.000.00.00:0000", true) != -1 || strfind(text, "GTAVNS.COM", true) != -1 || strfind(text, "GOSAMP.NET", true) != -1) return 1;
while(strlen(text[is1]))
{
if('0'<=text[is1]<='9')
{
new is2=is1+1;
new p=0;
while(p==0)
{
if('0'<=text[is2]<='9'&&strlen(text[is2])) is2++;
else
{
strmid(strR[r],text,is1,is2,255);
if(strval(strR[r])<255) r++;
is1=is2;
p=1;
}
}
}
is1++;
}
if(r>=4)
{
new strMy[255];
new STRname[255];
GetPlayerName(playerid,STRname,255);
format(strMy, sizeof(strMy), " Dang Quang Cao Server %s(%d): %s",STRname,playerid,text);
for(new j1=0; j1 < MAX_PLAYERS;j1++)
if(IsPlayerAdmin(j1)) SendClientMessage(j1, 0xFF0000FF, strMy);
for(new z=0;z<r;z++)
{
new pr2;
while((pr2=strfind(text,strR[z],true))!=-1) for(new i=pr2,j=pr2+strlen(strR[z]);i<j;i++) text[i]='*';
if(l[playerid] == 1)
{
new tstr[256];
format(tstr, 256, "~ %s has been banned from the server for 'Advertising'", PlayerName(playerid));
SendClientMessageToAll(COLOR_RED, tstr);
l[playerid] = 0;
}
Kick(playerid);
}
}
//Domains Names
if(strfind(text, ".com", true) != -1 || strfind(text, ".co", true) != -1 || strfind(text, ".info", true) != -1 || strfind(text, ".net", true) != -1 || strfind(text, ".org", true) != -1 || strfind(text, ".me", true) != -1 ||
strfind(text, ".us", true) != -1 || strfind(text, ".biz", true) != -1 || strfind(text, ".com.co", true) != -1 || strfind(text, ".com.uk", true) != -1 || strfind(text, ".net.co", true) != -1 || strfind(text, ".top", true) != -1 ||
strfind(text, ".in", true) != -1 || strfind(text, ".uk", true) != -1 || strfind(text, ".site", true) != -1 || strfind(text, ".net16.net", true) != -1 || strfind(text, "7777", true) != -1 || strfind(text, ".tk", true) != -1 ||
strfind(text, "join my server", true) != -1 || strfind(text, "come in my server", true) != -1 || strfind(text, "come on this server", true) != -1 || strfind(text, "comuv.com", true) != -1)
{
new sendername[MAX_PLAYER_NAME];
new string[256];
GetPlayerName(playerid, sendername, 24);
format(string, sizeof(string), "~ %s Da bi Kick Do Quang Cao Server", sendername);
SendClientMessageToAll(COLOR_RED, string);
TogglePlayerControllable(playerid, 0);
Kick(playerid);
return 0;
}
return 1;
}
