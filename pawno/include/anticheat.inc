/*Античит SRL*/
stock Anticheat_Server(playerid)// Античит SRL
{
	new string[128];
	new ip[20];
	new plname[MAX_PLAYER_NAME];
	new animlib[32];
	new animname[32];
	GetAnimationName(GetPlayerAnimationIndex(playerid), animlib, sizeof(animlib), animname, sizeof(animname));
	//---------------------------------------------------------- Античит на Броню -------------------------------------------
	//CheckArmour(playerid);
	//---------------------------------------------------------- Античит на Танки, Гидры -------------------------------------------
	/*if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 432 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 520 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 425)//Гидра)//Гидра)//Танк
	{
		if(pInfo[playerid][pAdmin] < 2 && pInfo[playerid][pMember] == F_NONE) { Kick(playerid); }
	}*/
	//---------------------------------------------------------- Античит на оружие -------------------------------------------
	if(GunCheckTime[playerid] == 0 && gPlayerLogged[playerid] == true)
	{
		new weap = GetPlayerWeapon(playerid);
		if(weap != 0 && !Weapons[playerid][weap] && weap != 40)
		{
			GetPlayerIp(playerid,ip,sizeof(ip));
			GetPlayerName(playerid, plname, sizeof(plname));
			format(string,sizeof(string),"{C6C6C6} Античит < ERROR 006 > кикнут(а) %s[%i] [Чит на оружие]",plname,playerid);
			SAM(-1,string,1);
			SCM(playerid,Color_LightRed,"Вы были кикнуты по подозрению в читерстве. #9007");
			ResetPlayerWeaponsAC(playerid);
			Kick(playerid);
		}
	}
	//---------------------------------------------------------- Античит на Джет пак -------------------------------------------
	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK)
	{
		format(string,sizeof(string),"{C6C6C6} Античит < ERROR 007 > кикнут(а) %s[%i] [Jet Pack]",GetName(playerid),playerid);//имя мы бьем через format
		SAM(Color_LightRed,string,1);
		SCM(playerid,Color_LightRed,"Вы были кикнуты за использование чит программ");
		Kick(playerid);
		return true;
	}
	//---------------------------------------------------------- Античит на спидхак -------------------------------------------
	/*if(SpeedVehicle(playerid) >= 150 && GetVehicleModel(GetPlayerVehicleID(playerid)) != 538)
	{
		new Float:posx, Float:posy, Float:posz;
		GetPlayerPos(playerid, posx, posy, posz);
		if(posz < 20)
		{
			format(string, 256, "{C6C6C6} Античит < ERROR 008 > кикнут(а) %s[%i] [СпидХак]",GetName(playerid),playerid);
			SAM(Color_LightRed,string,1);
			SCM(playerid,Color_LightRed,"Вы были кикнуты по подозрению в читерстве. #9001");
			Kick(playerid);
			return true;
		}
	}*/
	//---------------------------------------------------------- Античит на CJ RUN -------------------------------------------
	if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) return true;
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
	{
		if(strcmp(animlib, "PED", true) == 0 && strcmp(animname, "RUN_PLAYER", true) == 0)// cj run
		{
			if(IsPlayerApplyAnimation(playerid, "SPANKINGW")) return true;
			if(pInfo[playerid][pAdmin] < 2)
			{
				SCM(playerid,Color_LightRed,"Вы были кикнуты по подозрению в читерстве. #9000");
				Kick(playerid);
				return true;
			}
		}
	}
	//---------------------------------------------------------- Античит на Fly Hack -------------------------------------------
	if(IsPlayerInAnyVehicle(playerid)) return true;
	new Float:posx, Float:posy, Float:posz;//переменные
	GetPlayerPos(playerid, posx, posy, posz);//проверка на координаты
	if(strcmp(animlib, "SWIM", true) == 0 && strcmp(animname, "SWIM_crawl", true) == 0)//проверяем на анимацию, если все верно то....
	{
		if(posz >= 15 && GetPlayerSpeed(playerid) > 60 &&  GetPlayerInterior(playerid) == 0)
		{
			if(IsPlayerApplyAnimation(playerid, "SPANKINGW")) return true;
			format(string, 256, "{C6C6C6} Античит < ERROR 009 > кикнут(а) %s[%i] [Fly Hack или Air Brike]",GetName(playerid),playerid);
			SAM(Color_LightRed,string,1);
			ResetPlayerWeaponsAC(playerid);
			SCM(playerid,Color_LightRed,"Вы были кикнуты по подозрению в читерстве. #9008");
			Kick(playerid);//кикаем игрока
		}
	}
	return true;
}