/*
 *
 *  GTA 5 Cam TP System
 *  © Copyright 2014, Nosferatu
 *
 */
 
//
new Float:tpp[MAX_PLAYERS][4],Float:ttp[MAX_PLAYERS][3]; // saves start and end coordinates
//
 
forward TeleportCam(playerid, step, Float:xg, Float:yg, Float:zg, Float:ag);
public TeleportCam(playerid, step, Float:xg, Float:yg, Float:zg, Float:ag)
{
switch (step)
{
case 1:
{
if(GetPVarInt(playerid,"ENDTP") > gettime() || IsPlayerInRangeOfPoint(playerid, 5.0, xg, yg, zg)) return true;
SetPVarInt(playerid,"ENDTP",gettime() + 10);
PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
tpp[playerid][0] = xg,tpp[playerid][1] = yg,tpp[playerid][2] = zg,tpp[playerid][3] = ag; // write end coords
GetPlayerPos(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]); // check start coords and write
if(IsPlayerInAnyVehicle(playerid) && 2 == GetPlayerState(playerid)) SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), playerid+1);
SetPlayerVirtualWorld(playerid,playerid+1);
TogglePlayerControllable(playerid,0);
SetPlayerCameraPos(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]+20);
SetPlayerCameraLookAt(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]);
SetTimerEx("TeleportCam",1000,false,"ii",playerid,2);
}
case 2:
{
PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
SetPlayerCameraPos(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]+50);
SetPlayerCameraLookAt(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]);
SetTimerEx("TeleportCam",1000,false,"ii",playerid,3);
}
case 3:
{
PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
SetPlayerCameraPos(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]+100);
SetPlayerCameraLookAt(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]);
SetTimerEx("TeleportCam",1000,false,"ii",playerid,4);
}
case 4:
{
PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
SetPlayerCameraPos(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]+200);
SetPlayerCameraLookAt(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]);
SetTimerEx("TeleportCam",1000,false,"ii",playerid,5);
}
case 5:
{
if(IsPlayerInAnyVehicle(playerid) && 2 == GetPlayerState(playerid))
{
SetVehiclePos(GetPlayerVehicleID(playerid),tpp[playerid][0],tpp[playerid][1],tpp[playerid][2]);
SetVehicleZAngle(GetPlayerVehicleID(playerid),tpp[playerid][3]);
}
else
{
SetPlayerPos(playerid,tpp[playerid][0],tpp[playerid][1],tpp[playerid][2]);
SetPlayerFacingAngle(playerid,tpp[playerid][3]);
}
InterpolateCameraPos(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2]+200, tpp[playerid][0],tpp[playerid][1],tpp[playerid][2]+200, 3000);
InterpolateCameraLookAt(playerid, ttp[playerid][0],ttp[playerid][1],ttp[playerid][2], tpp[playerid][0],tpp[playerid][1],tpp[playerid][2], 3000);
SetTimerEx("TeleportCam",4000,false,"ii",playerid,6);
}
case 6:
{
PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
SetPlayerCameraPos(playerid, tpp[playerid][0],tpp[playerid][1],tpp[playerid][2]+100);
SetPlayerCameraLookAt(playerid, tpp[playerid][0],tpp[playerid][1],tpp[playerid][2]);
SetTimerEx("TeleportCam",1000,false,"ii",playerid,7);
}
case 7:
{
PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
SetPlayerCameraPos(playerid, tpp[playerid][0],tpp[playerid][1],tpp[playerid][2]+50);
SetPlayerCameraLookAt(playerid, tpp[playerid][0],tpp[playerid][1],tpp[playerid][2]);
SetTimerEx("TeleportCam",1000,false,"ii",playerid,8);
}
case 8:
{
PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
TogglePlayerControllable(playerid, true);
SetPlayerVirtualWorld(playerid,0);
if(IsPlayerInAnyVehicle(playerid) && 2 == GetPlayerState(playerid)) SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), 0);
SetPlayerVirtualWorld(playerid,0);
SetCameraBehindPlayer(playerid);
}
}
return true;
}