#include <a_samp>

new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;

public OnGameModeInit()
{
    Textdraw0 = TextDrawCreate(641.199951, 195.633331, "usebox");
    TextDrawLetterSize(Textdraw0, 0.000000, 10.883336);
    TextDrawTextSize(Textdraw0, -2.000000, 0.000000);
    TextDrawAlignment(Textdraw0, 1);
    TextDrawColor(Textdraw0, 0);
    TextDrawUseBox(Textdraw0, true);
    TextDrawBoxColor(Textdraw0, 102);
    TextDrawSetShadow(Textdraw0, 0);
    TextDrawSetOutline(Textdraw0, 0);
    TextDrawFont(Textdraw0, 0);

    Textdraw1 = TextDrawCreate(190.399948, 209.066619, "CHET");
    TextDrawLetterSize(Textdraw1, 1.725198, 3.153068);
    TextDrawAlignment(Textdraw1, 1);
    TextDrawColor(Textdraw1, -16776961);
    TextDrawSetShadow(Textdraw1, 0);
    TextDrawSetOutline(Textdraw1, 1);
    TextDrawBackgroundColor(Textdraw1, 51);
    TextDrawFont(Textdraw1, 3);
    TextDrawSetProportional(Textdraw1, 1);

    Textdraw2 = TextDrawCreate(307.999938, 265.813293, "Ban da chet!");
    TextDrawLetterSize(Textdraw2, 0.617999, 1.958399);
    TextDrawAlignment(Textdraw2, 2);
    TextDrawColor(Textdraw2, -1);
    TextDrawSetShadow(Textdraw2, 0);
    TextDrawSetOutline(Textdraw2, 0);
    TextDrawBackgroundColor(Textdraw2, 51);
    TextDrawFont(Textdraw2, 1);
    TextDrawSetProportional(Textdraw2, 1);
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    TextDrawShowForPlayer(playerid, Textdraw0);
    TextDrawShowForPlayer(playerid, Textdraw1);
    TextDrawShowForPlayer(playerid, Textdraw2);
    return 1;
}

public OnPlayerSpawn(playerid)
{
    TextDrawHideForPlayer(playerid, Textdraw0);
    TextDrawHideForPlayer(playerid, Textdraw1);
    TextDrawHideForPlayer(playerid, Textdraw2);
    return 1;
}
