main() { }
#define MAILER_URL
// == == == == [ ������� ] == == == ==
#include <a_samp>
#include <a_mysql>
#include <fix>
#include <sscanf2>
#include <dc_cmd>
#include <mxINI>
#include <streamer>
#include <foreach>
#include <a_http>
#include <mailer>
//#include <ezcar>
#include <gttp>
#include <map1>
#include <a_http>
#include <CarStatus>
#include <anticheat.inc>

#undef MAX_PLAYERS
const MAX_PLAYERS = 200; // === === === [ ���������� ������ ] === === === //
// == == == == [ MySQL �� ] == == == ==
#define MySQL_Host "151.80.47.109"
#define MySQL_User "gs50402"
#define MySQL_Base "gs50402"
#define MySQL_Pass "SESYZTn6cE"
// == == == == [ Server Settings ] == == == ==
#define SERVER_HOSTNAME "Sailonio RP | �������� ������"
#define SERVER_MODNAME "Sailonio gmode v2.0"
#define SERVER_DNAME "Sailonio Role Play"
#define ACCESS_TOKEN "3b9bd308678a139f94cdc4b75fe6ec8bb26c58a73721bab77dad698705a8cdb430cdcd8c0875459d064c2"
#define PEER_ID "2000000001"
// == == == == [ �������������� ������� ] == == ==
#define	P_LSPD 	1
#define	P_LVPD 	2
#define P_SFPD 	3
#define P_MEDLS 4
#define P_MEDLV 5
#define P_MEDSF 6
#define P_FBI	7
// == == == == [ ����������� ] == == == == ==
new Text: Speed[MAX_PLAYERS][3];
new Text:Sailonio_Logo[3];
// == == == == [ ������� ] == == == ==
#define SPD ShowPlayerDialog
#define SCM SendClientMessage
#define SAM AdminMessege //������������� ��������: SAM(Color_Red, "���� ������", 1) - Color_Red - ����� �����, "���� ������" - ����� ���������, 1 - � ������ ������ ����� ����� �����
#define SCMTA SendClientMessageToAll
#define DSL DIALOG_STYLE_LIST
#define DSI DIALOG_STYLE_INPUT
#define DSM DIALOG_STYLE_MSGBOX
#define DSP DIALOG_STYLE_PASSWORD
#define PI PlayerInfo
#define pid playerid
#define GetName(%1) pInfo[%1][pName]
// == == == == [ ����� ] == == == ==
#define COLOR_GRAD5 0xE3E3E3FF
#define Color_Brown 0xA52A2AFF
#define Color_Blue 0x00BFFFFF
#define Color_Crimson 0xDC143CFF
#define Color_Chocolate 0xD2691EFF
#define Color_FireBrick 0xB22222FF
#define Color_Grey 0x999999FF
#define Color_Green 0x008000FF
#define Color_LimeGreen 0x00FF00FF
#define Color_Maroon 0x800000FF
#define Color_Orange 0xDF8600FF
#define Color_OrangeRed 0xFF4500FF
#define Color_Purple 0x800080FF
#define Color_Red 0xFF0000FF
#define Color_White 0xFFFFFFFF
#define Color_Yellow 0xFFFF00FF
#define Color_LightRed 0xFF463CFF
#define COLOR_LRED 0xF65B00AA
#define COLOR_USE 0x60A000AA
#define COLOR_SUCCESS 0x009FD3AA
#define COLOR_ERROR 0xFF0000AA
#define COLOR_OOC 0xC0C0C0AA
#define COLOR_CHAT 0xFAF0E6AA
#define Color_LightGrey 0x999999FF


/////Lift

// == == == == [ ����� ] == == == == ==
// ���������

//
new VehicleNames[212][] = {
	"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
	"Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washinon","Bobcat","Mr Whoopee","BF Injection",
	"Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie",
	"Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder",
	"Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
	"Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR3 50","Walton","Regina",
	"Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo","Greenwood",
	"Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","RC Goblin","Hotring A","Hotring B",
	"Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain",
	"Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
	"Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover",
	"Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A",
	"Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer",
	"Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer A","Emperor",
	"Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C","Andromada","Dodo","RC Cam","Launch","Police Car","Police Car",
	"Police Car","Police Ranger","Picador","S.W.A.T.","Alpha","Phoenix","Glendale","Sadler","L Trailer A","L Trailer B",
	"Stair Trailer","Boxville","Farm Plow","U Trailer" };
// == == == == [ ������� 2 ] == == == ==

CMD:infoserv(playerid, params[])
{
        ShowPlayerDialog(playerid, 8008 , DIALOG_STYLE_MSGBOX, "���������� � �������", "��� ������ ����� ���������� � ����� Role Play!\n\
		FULL RP ������!\n\
		�� ������� ����� �������!\n\
		�� ������ �� ������ ����������� � ������ ��� ���������!\n\
		� ��� ��������� �������!\n\
		� ���-�� �����!\n\
		������ ���������� � ������ ��! ��� ��������� � ������� ����!\n\
		�������� ����!", "�����", "�������");
        return 1;
}

CMD:repserv(playerid, params[])
{
        ShowPlayerDialog(playerid, 8007, DIALOG_STYLE_LIST, "��� �� ������� ������?", "�������\n�������\n�����", "��", "�������");
        return 1;
}

// == == == == [ ������� ] == == == ==
#define Freeze(%0,%1) TogglePlayerControllable(%0, %1)
#define Pkick(%0) SetTimerEx("TimeKick", 80, false, "i", %0)
#if !defined isnull
#define isnull(%0) ((!(%0[0])) || (((%0[0]) == '\1') && (!(%0[1]))))
#endif
#define ARMOUR_INDEX 4

//DOnateee
#define D_DONATE_MENU 9300
///////////
#define D_ALOGIN 9000
#define D_REPORT 9100
#define D_CARNUMBER 9200


////////���������/////////////
#define buyinfernus 10600
#define buysultan 10601
#define buybullet 10602
#define buywindsor 10603
#define buyyosemite 10604
#define buyjester 10605
#define buyelegy 10606
#define buyflash 10607
#define buyuranus 10608
#define buyhuntley 10609
#define buybf400 10610
#define buynrg500 10611
#define buysanchez 10612
////////////// ������� ����� ///////////////
#define MAX_HOUSES 50 // ���� ����� �������� �� ����������� ���-�� �����
#define D_H_CREATE_DESC 100 // ���� �� ������ �������� ���� (��� 1)
#define D_H_CREATE_PRICE 200 // ������ �������� ���� (��� 2)
#define D_H_CREATE_INT 300 // ������ �������� ���� (��� 3)
#define D_H_CREATE_CONF 400 // ������ �������� ���� (�������������)
// == == == == [ �������� ] == == == ==
forward PlayerCheck(playerid);
forward PlayerLogin(playerid);
forward CheckReferal(playerid, name[]);
forward CheckReferal_2(playerid);
forward CheckLogin(playerid);
forward TimeKick(playerid);
forward UpdateTime(playerid);
forward GetID(playerid);
forward FastSpawn(playerid);
forward ArmourUpdate();
forward ChangeWeather();
// == == == == [ ���������� ] == == == ==
new dbHandle,
    number_skin[MAX_PLAYERS char],
    number_pass[MAX_PLAYERS char],
    
    Text: select_skin[MAX_PLAYERS][11],
    update_timer[MAX_PLAYERS],
    login_timer[MAX_PLAYERS],
    
    bool: login_check[MAX_PLAYERS char];
new userconnect[MAX_PLAYERS];
//new bool: EngineState[MAX_VEHICLES];
// == == == == [ ���������� ������ ] == == == ==
enum player
{
	pID,
	pName[MAX_PLAYER_NAME+1],
	pPass[32+1],
	pEmail[46+1],
	pEmailActive,
	pReferal[MAX_PLAYER_NAME+1],
	pDateReg[10+1],
	pNations,
	pCar,
	pCarID,
	Float:pCarX,
	Float:pCarY,
	Float:pCarZ,
	Float:pCarAngel,
	pCarNumber[20],
	pCarColor1,
	pCarColor2,
	pAge,
	pSex,
	pSkin,
	pMoney,
	pLevel,
	pApass[35],
	pAlogin,
 	pAdmin,
	pMute,
	pMember,
	pRank,
	pHouse
}

// == == == [ House ] == == == == ==
enum hInfo
{
        hDesc[32], // ������ ������ ����� ������������� ��� �������� �������� ����
        hOwner[MAX_PLAYER_NAME], // ���� ��� �������� ����� ���������
        Float:hX,Float:hY,Float:hZ, // ���������� ����� � ��� (x,y,z)
        hInterior, // ������ ���������� �� ��������� ���� (�� ���� � �������� �����)
        hVirtWorld, // ����������� ��� ��� ���� (��� ��������� ��������� ��������� ����� � ����������� �����������)
        hPrice, // ���� ����
        hLock, // ������ �� ��� ��� ���
        hPick, // ����� ����
        hTakings,
        Text3D:hText // 3D ����� � ����������� � ����
};
new House[MAX_HOUSES][hInfo]; // ������� 2-� ������ ������ ������� ����� ���������� � ���������� enum'a. (������ 2-� ������ - � ������� ���� ���� ��������������)
new adminCar[MAX_PLAYERS];
new m_h; // ����� �������������� ��� �������� ������� ���������� ��������� �����
new STR[158]; // ������, ��� �������������� ����� (������ 1 ���������� ����� �� ��������� � ������ ������� ����)

enum hiInfo
{
        Float:hiX,Float:hiY,Float:hiZ,hiInt, // ������� ��������� x,y,z � ��� id
        hiName[15], // �������� ���������
}
new HInts[][hiInfo]={ // 2-� ������ ������ + � ��� �� ����� ������ ���������� �� ����������, ��� �� ������, �� �������: ���������� x,y,z,id ���������,"��������"
        {318.564971,1118.209960,1083.882812,5,"Crack den"},
        {2269.4453,-1210.2952,1047.5625,10,"Hashbury House"},
        {2496.2676,-1693.8955,1014.7422,3,"Johnsons House"},
        {1299.14,-794.77,1084.00,5,"Madd Doggs M."},
        {2260.3711,-1135.7345,1050.6328,10,"R.B.M. Room"},
        {2365.6023,-1133.6688,1050.8750,8,"V. B. House"},
        {1302.519897,-1.787510,1001.028259,18,"Warehouse 2"},
        {2324.419921,-1145.568359,1050.710083,12,"Un. safe house"},
        {76.632553,-301.156829,1.578125,0,"Blueberry"}
};

new pInfo[MAX_PLAYERS][player];
//����������
new PlayerVehicle;
new avtcar[28];
new Text3D:opavtcar[28];
new Text:Speed_TD[MAX_PLAYERS][9];
new Text:DateAndClock[2];
new carnumber;
new Iterator:iAdmin<MAX_PLAYERS>;

Name(playerid) // ������� ��� �������� ����
{
        new Nm[MAX_PLAYER_NAME];
        GetPlayerName(playerid,Nm,24);
        return Nm;
}

public ArmourUpdate()
{
	for(new i=0; i<=GetMaxPlayers(); i++)
	{
		new Float:armour;
		GetPlayerArmour(i, armour);
		if( armour > 0.0 )
		{
			SetPlayerAttachedObject( i, ARMOUR_INDEX, 373, 1, 0.286006, -0.038657, -0.158132, 67.128456, 21.916156, 33.972290, 1.000000, 1.000000, 1.000000 ); // ????? ????? ?? ??????
		}
		else if( armour == 0.0 )
		{
			RemovePlayerAttachedObject(i, ARMOUR_INDEX);
		}
	}
	return 1;
}

stock PlayerTextDraws(playerid)
{
	// == == == [ ����� ����� ] == == ==
	select_skin[playerid][0] = TextDrawCreate(535.177124, 334.000000, "usebox");
	TextDrawLetterSize(select_skin[playerid][0], 0.000000, 8.044445);
	TextDrawTextSize(select_skin[playerid][0], 426.696929, 0.000000);
	TextDrawAlignment(select_skin[playerid][0], 1);
	TextDrawColor(select_skin[playerid][0], 0);
	TextDrawUseBox(select_skin[playerid][0], true);
	TextDrawBoxColor(select_skin[playerid][0], 102);
	TextDrawSetShadow(select_skin[playerid][0], 0);
	TextDrawSetOutline(select_skin[playerid][0], 0);
	TextDrawFont(select_skin[playerid][0], 0);

	select_skin[playerid][1] = TextDrawCreate(475.674652, 350.333282, "usebox");
	TextDrawLetterSize(select_skin[playerid][1], 0.000000, 2.275923);
	TextDrawTextSize(select_skin[playerid][1], 438.878021, 0.000000);
	TextDrawAlignment(select_skin[playerid][1], 1);
	TextDrawColor(select_skin[playerid][1], 0);
	TextDrawUseBox(select_skin[playerid][1], true);
	TextDrawBoxColor(select_skin[playerid][1], 102);
	TextDrawSetShadow(select_skin[playerid][1], 0);
	TextDrawSetOutline(select_skin[playerid][1], 0);
	TextDrawFont(select_skin[playerid][1], 0);

	select_skin[playerid][2] = TextDrawCreate(525.401245, 351.333251, "usebox");
	TextDrawLetterSize(select_skin[playerid][2], 0.000000, 2.275923);
	TextDrawTextSize(select_skin[playerid][2], 488.542358, 0.000000);
	TextDrawAlignment(select_skin[playerid][2], 1);
	TextDrawColor(select_skin[playerid][2], 0);
	TextDrawUseBox(select_skin[playerid][2], true);
	TextDrawBoxColor(select_skin[playerid][2], 102);
	TextDrawSetShadow(select_skin[playerid][2], 0);
	TextDrawSetOutline(select_skin[playerid][2], 0);
	TextDrawFont(select_skin[playerid][2], 0);

	select_skin[playerid][3] = TextDrawCreate(501.101013, 383.833099, "usebox");
	TextDrawLetterSize(select_skin[playerid][3], 0.000000, 2.229071);
	TextDrawTextSize(select_skin[playerid][3], 464.178894, 0.000000);
	TextDrawAlignment(select_skin[playerid][3], 1);
	TextDrawColor(select_skin[playerid][3], 0);
	TextDrawUseBox(select_skin[playerid][3], true);
	TextDrawBoxColor(select_skin[playerid][3], 102);
	TextDrawSetShadow(select_skin[playerid][3], 0);
	TextDrawSetOutline(select_skin[playerid][3], 0);
	TextDrawFont(select_skin[playerid][3], 0);

	select_skin[playerid][4] = TextDrawCreate(531.771606, 340.083312, "LD_SPAC:white");
	TextDrawLetterSize(select_skin[playerid][4], 0.000000, 0.000000);
	TextDrawTextSize(select_skin[playerid][4], -101.200592, -6.416625);
	TextDrawAlignment(select_skin[playerid][4], 1);
	TextDrawColor(select_skin[playerid][4], -5963521);
	TextDrawSetShadow(select_skin[playerid][4], 0);
	TextDrawSetOutline(select_skin[playerid][4], 0);
	TextDrawFont(select_skin[playerid][4], 4);

	select_skin[playerid][5] = TextDrawCreate(472.800415, 352.749847, "LD_SPAC:white");
	TextDrawLetterSize(select_skin[playerid][5], 0.000000, 0.000000);
	TextDrawTextSize(select_skin[playerid][5], -31.390945, -3.499959);
	TextDrawAlignment(select_skin[playerid][5], 1);
	TextDrawColor(select_skin[playerid][5], -1523963137);
	TextDrawSetShadow(select_skin[playerid][5], 0);
	TextDrawSetOutline(select_skin[playerid][5], 0);
	TextDrawFont(select_skin[playerid][5], 4);

	select_skin[playerid][6] = TextDrawCreate(522.526611, 353.749847, "LD_SPAC:white");
	TextDrawLetterSize(select_skin[playerid][6], 0.000000, 0.000000);
	TextDrawTextSize(select_skin[playerid][6], -31.390945, -3.499959);
	TextDrawAlignment(select_skin[playerid][6], 1);
	TextDrawColor(select_skin[playerid][6], -1523963137);
	TextDrawSetShadow(select_skin[playerid][6], 0);
	TextDrawSetOutline(select_skin[playerid][6], 0);
	TextDrawFont(select_skin[playerid][6], 4);

	select_skin[playerid][7] = TextDrawCreate(498.226470, 385.666503, "LD_SPAC:white");
	TextDrawLetterSize(select_skin[playerid][7], 0.000000, 0.000000);
	TextDrawTextSize(select_skin[playerid][7], -31.390945, -3.499959);
	TextDrawAlignment(select_skin[playerid][7], 1);
	TextDrawColor(select_skin[playerid][7], -1523963137);
	TextDrawSetShadow(select_skin[playerid][7], 0);
	TextDrawSetOutline(select_skin[playerid][7], 0);
	TextDrawFont(select_skin[playerid][7], 4);

	select_skin[playerid][8] = TextDrawCreate(458.682708, 348.833282, "<");
	TextDrawLetterSize(select_skin[playerid][8], 0.946163, 2.708333);
	TextDrawTextSize(select_skin[playerid][8], 18.935607, 19.916625);
	TextDrawAlignment(select_skin[playerid][8], 2);
	TextDrawColor(select_skin[playerid][8], -1);
	TextDrawSetShadow(select_skin[playerid][8], 0);
	TextDrawSetOutline(select_skin[playerid][8], 2);
	TextDrawBackgroundColor(select_skin[playerid][8], 51);
	TextDrawFont(select_skin[playerid][8], 1);
	TextDrawSetProportional(select_skin[playerid][8], 1);
	TextDrawSetSelectable(select_skin[playerid][8], true);

	select_skin[playerid][9] = TextDrawCreate(510.283172, 349.249938, ">");
	TextDrawLetterSize(select_skin[playerid][9], 0.946163, 2.708333);
	TextDrawTextSize(select_skin[playerid][9], 18.935607, 19.916625);
	TextDrawAlignment(select_skin[playerid][9], 2);
	TextDrawColor(select_skin[playerid][9], -1);
	TextDrawSetShadow(select_skin[playerid][9], 0);
	TextDrawSetOutline(select_skin[playerid][9], 2);
	TextDrawBackgroundColor(select_skin[playerid][9], 51);
	TextDrawFont(select_skin[playerid][9], 1);
	TextDrawSetProportional(select_skin[playerid][9], 1);
	TextDrawSetSelectable(select_skin[playerid][9], true);

	select_skin[playerid][10] = TextDrawCreate(485.045806, 381.750061, "><");
	TextDrawLetterSize(select_skin[playerid][10], 0.683324, 2.743333);
	TextDrawTextSize(select_skin[playerid][10], 18.935607, 28.916625);
	TextDrawAlignment(select_skin[playerid][10], 2);
	TextDrawColor(select_skin[playerid][10], -1);
	TextDrawSetShadow(select_skin[playerid][10], 0);
	TextDrawSetOutline(select_skin[playerid][10], 2);
	TextDrawBackgroundColor(select_skin[playerid][10], 51);
	TextDrawFont(select_skin[playerid][10], 1);
	TextDrawSetProportional(select_skin[playerid][10], 1);
	TextDrawSetSelectable(select_skin[playerid][10], true);

    Speed[playerid][0] = TextDrawCreate(138.000000, 403.000000, " "); //30
    TextDrawBackgroundColor(Speed[playerid][0], 0x00000033);
    TextDrawFont(Speed[playerid][0], 1);
    TextDrawLetterSize(Speed[playerid][0], 0.359999, 1.299998);
    TextDrawColor(Speed[playerid][0], -1);
    TextDrawSetOutline(Speed[playerid][0], 1);
    TextDrawSetProportional(Speed[playerid][0], 1);

    Speed[playerid][1] = TextDrawCreate(138.000000, 403.000000, "IIIIIIIIIIIIIIIIIIIIIIIIIIIII"); //30
    TextDrawBackgroundColor(Speed[playerid][1], 0x00000000);
    TextDrawFont(Speed[playerid][1], 1);
    TextDrawLetterSize(Speed[playerid][1], 0.359999, 1.299998);
    TextDrawColor(Speed[playerid][1], 0xFFFFFF33);
    TextDrawSetOutline(Speed[playerid][1], 1);
    TextDrawSetProportional(Speed[playerid][1], 1);

    Speed[playerid][2] = TextDrawCreate(145.000000, 388.000000, " "); //km
    TextDrawBackgroundColor(Speed[playerid][2], 0x000000FF);
    TextDrawFont(Speed[playerid][2], 2);
    TextDrawLetterSize(Speed[playerid][2], 0.309998, 1.600000);
    TextDrawColor(Speed[playerid][2], -1);
    TextDrawSetOutline(Speed[playerid][2], 0);
    TextDrawSetProportional(Speed[playerid][2], 1);
    TextDrawSetShadow(Speed[playerid][2], 0);
	// �������
	Sailonio_Logo[0] = TextDrawCreate(557.9995, 7.8133, "S"); // �����
	TextDrawLetterSize(Sailonio_Logo[0], 0.5942, 3.3720);
	TextDrawAlignment(Sailonio_Logo[0], 2);
	TextDrawColor(Sailonio_Logo[0], -65281);
	TextDrawSetOutline(Sailonio_Logo[0], 1);
	TextDrawBackgroundColor(Sailonio_Logo[0], 255);
	TextDrawFont(Sailonio_Logo[0], 2);
	TextDrawSetProportional(Sailonio_Logo[0], 1);
	TextDrawSetShadow(Sailonio_Logo[0], 0);

	Sailonio_Logo[1] = TextDrawCreate(563.7778, 14.7822, "ailonio"); // �����
	TextDrawLetterSize(Sailonio_Logo[1], 0.4000, 1.6000);
	TextDrawAlignment(Sailonio_Logo[1], 1);
	TextDrawColor(Sailonio_Logo[1], -65281);
	TextDrawSetOutline(Sailonio_Logo[1], 1);
	TextDrawBackgroundColor(Sailonio_Logo[1], 255);
	TextDrawFont(Sailonio_Logo[1], 3);
	TextDrawSetProportional(Sailonio_Logo[1], 1);
	TextDrawSetShadow(Sailonio_Logo[1], 0);

	Sailonio_Logo[2] = TextDrawCreate(563.7781, 27.2266, Rus("��������_������")); // �����
	TextDrawLetterSize(Sailonio_Logo[2], 0.1999, 0.8384);
	TextDrawAlignment(Sailonio_Logo[2], 1);
	TextDrawColor(Sailonio_Logo[2], -65281);
	TextDrawSetOutline(Sailonio_Logo[2], 1);
	TextDrawBackgroundColor(Sailonio_Logo[2], 255);
	TextDrawFont(Sailonio_Logo[2], 3);
	TextDrawSetProportional(Sailonio_Logo[2], 1);
	TextDrawSetShadow(Sailonio_Logo[2], 0);
	//Speeeeeeeeed
	Speed_TD[playerid][0] = TextDrawCreate(591.9993, 339.8310, "Box"); // ?????
	TextDrawLetterSize(Speed_TD[playerid][0], 0.0000, 5.3600);
	TextDrawTextSize(Speed_TD[playerid][0], 453.0000, 0.0000);
	TextDrawAlignment(Speed_TD[playerid][0], 1);
	TextDrawColor(Speed_TD[playerid][0], -1);
	TextDrawUseBox(Speed_TD[playerid][0], 1);
	TextDrawBoxColor(Speed_TD[playerid][0], 255);
	TextDrawBackgroundColor(Speed_TD[playerid][0], 255);
	TextDrawFont(Speed_TD[playerid][0], 1);
	TextDrawSetProportional(Speed_TD[playerid][0], 1);
	TextDrawSetShadow(Speed_TD[playerid][0], 0);

	Speed_TD[playerid][1] = TextDrawCreate(393.0001, 337.6845, ""); // ?????
	TextDrawTextSize(Speed_TD[playerid][1], 61.0000, 70.0000);
	TextDrawAlignment(Speed_TD[playerid][1], 1);
	TextDrawColor(Speed_TD[playerid][1], -1);
	TextDrawBackgroundColor(Speed_TD[playerid][1], 255);
	TextDrawFont(Speed_TD[playerid][1], 5);
	TextDrawSetProportional(Speed_TD[playerid][1], 0);
	TextDrawSetShadow(Speed_TD[playerid][1], 0);
	TextDrawSetPreviewModel(Speed_TD[playerid][1], 411);
	TextDrawSetPreviewRot(Speed_TD[playerid][1], 0.0000, 0.0000, -40.0000, 1.0000);
	TextDrawSetPreviewVehCol(Speed_TD[playerid][1], 1, 1);

	Speed_TD[playerid][2] = TextDrawCreate(457.5998, 340.0000, "999_km/h"); // ?????
	TextDrawLetterSize(Speed_TD[playerid][2], 0.4000, 1.6000);
	TextDrawAlignment(Speed_TD[playerid][2], 1);
	TextDrawColor(Speed_TD[playerid][2], -1);
	TextDrawBackgroundColor(Speed_TD[playerid][2], 255);
	TextDrawFont(Speed_TD[playerid][2], 1);
	TextDrawSetProportional(Speed_TD[playerid][2], 1);
	TextDrawSetShadow(Speed_TD[playerid][2], 0);

	Speed_TD[playerid][3] = TextDrawCreate(458.4000, 353.0000, "100%"); // ?????
	TextDrawLetterSize(Speed_TD[playerid][3], 0.4000, 1.6000);
	TextDrawAlignment(Speed_TD[playerid][3], 1);
	TextDrawColor(Speed_TD[playerid][3], -1);
	TextDrawBackgroundColor(Speed_TD[playerid][3], 255);
	TextDrawFont(Speed_TD[playerid][3], 1);
	TextDrawSetProportional(Speed_TD[playerid][3], 1);
	TextDrawSetShadow(Speed_TD[playerid][3], 0);

	Speed_TD[playerid][4] = TextDrawCreate(554.4000, 340.0000, "doors"); // ?????
	TextDrawLetterSize(Speed_TD[playerid][4], 0.4000, 1.6000);
	TextDrawAlignment(Speed_TD[playerid][4], 1);
	TextDrawColor(Speed_TD[playerid][4], -1);
	TextDrawBackgroundColor(Speed_TD[playerid][4], 255);
	TextDrawFont(Speed_TD[playerid][4], 1);
	TextDrawSetProportional(Speed_TD[playerid][4], 1);
	TextDrawSetShadow(Speed_TD[playerid][4], 0);

	Speed_TD[playerid][5] = TextDrawCreate(554.4000, 353.0000, "lights"); // ?????
	TextDrawLetterSize(Speed_TD[playerid][5], 0.4000, 1.6000);
	TextDrawAlignment(Speed_TD[playerid][5], 1);
	TextDrawColor(Speed_TD[playerid][5], -1);
	TextDrawBackgroundColor(Speed_TD[playerid][5], 255);
	TextDrawFont(Speed_TD[playerid][5], 1);
	TextDrawSetProportional(Speed_TD[playerid][5], 1);
	TextDrawSetShadow(Speed_TD[playerid][5], 0);

	Speed_TD[playerid][6] = TextDrawCreate(554.4000, 366.0000, "engine"); // ?????
	TextDrawLetterSize(Speed_TD[playerid][6], 0.4000, 1.6000);
	TextDrawAlignment(Speed_TD[playerid][6], 1);
	TextDrawColor(Speed_TD[playerid][6], -1);
	TextDrawBackgroundColor(Speed_TD[playerid][6], 255);
	TextDrawFont(Speed_TD[playerid][6], 1);
	TextDrawSetProportional(Speed_TD[playerid][6], 1);
	TextDrawSetShadow(Speed_TD[playerid][6], 0);
	
	DateAndClock[0] = TextDrawCreate(554.6668, 4.5777, "24:00");
	TextDrawLetterSize(DateAndClock[0], 0.4239, 2.1309);
	TextDrawAlignment(DateAndClock[0], 1);
	TextDrawColor(DateAndClock[0], -253326081);
	TextDrawSetOutline(DateAndClock[0], 1);
	TextDrawBackgroundColor(DateAndClock[0], 255);
	TextDrawFont(DateAndClock[0], 3);
	TextDrawSetProportional(DateAndClock[0], 1);
	TextDrawSetShadow(DateAndClock[0], 0);

	DateAndClock[1] = TextDrawCreate(575.3331, 22.8295, "31TH_FEBRUARY");
	TextDrawLetterSize(DateAndClock[1], 0.1983, 1.0980);
	TextDrawAlignment(DateAndClock[1], 2);
	TextDrawColor(DateAndClock[1], -253326081);
	TextDrawSetOutline(DateAndClock[1], 1);
	TextDrawBackgroundColor(DateAndClock[1], 255);
	TextDrawFont(DateAndClock[1], 2);
	TextDrawSetProportional(DateAndClock[1], 1);
	TextDrawSetShadow(DateAndClock[1], 0);
}

stock SetSpeedDel(playerid)
{
    switch(SpeedVehicle(playerid))
    {
        case 0..9: TextDrawSetString(Speed[playerid][0], "~w~~h~I");
        case 10..14: TextDrawSetString(Speed[playerid][0], "~w~~h~II");
        case 15..19: TextDrawSetString(Speed[playerid][0], "~g~III");
        case 20..24: TextDrawSetString(Speed[playerid][0], "~g~IIII");
        case 25..29: TextDrawSetString(Speed[playerid][0], "~g~~h~IIIII");
        case 30..34: TextDrawSetString(Speed[playerid][0], "~g~~h~IIIIII");
        case 35..39: TextDrawSetString(Speed[playerid][0], "~g~~h~IIIIIII");
        case 40..44: TextDrawSetString(Speed[playerid][0], "~g~~h~IIIIIIII");
        case 45..49: TextDrawSetString(Speed[playerid][0], "~g~~h~~h~IIIIIIIII");
        case 50..59: TextDrawSetString(Speed[playerid][0], "~g~~h~~h~IIIIIIIIII");
        case 60..64: TextDrawSetString(Speed[playerid][0], "~g~~h~~h~IIIIIIIIIII");
        case 65..69: TextDrawSetString(Speed[playerid][0], "~g~~h~~h~IIIIIIIIIIII");
        case 70..79: TextDrawSetString(Speed[playerid][0], "~y~IIIIIIIIIIIII");
        case 80..89: TextDrawSetString(Speed[playerid][0], "~y~IIIIIIIIIIIIII");
        case 90..99: TextDrawSetString(Speed[playerid][0], "~y~~h~IIIIIIIIIIIIIII");
        case 100..109: TextDrawSetString(Speed[playerid][0], "~y~~h~IIIIIIIIIIIIIIII");
        case 110..119: TextDrawSetString(Speed[playerid][0], "~y~~h~IIIIIIIIIIIIIIIII");
        case 120..129: TextDrawSetString(Speed[playerid][0], "~y~~h~IIIIIIIIIIIIIIIIII");
        case 130..139: TextDrawSetString(Speed[playerid][0], "~y~~h~IIIIIIIIIIIIIIIIIII");
        case 140..149: TextDrawSetString(Speed[playerid][0], "~y~~h~IIIIIIIIIIIIIIIIIIII");
        case 150..164: TextDrawSetString(Speed[playerid][0], "~y~~h~IIIIIIIIIIIIIIIIIIIII");
        case 165..174: TextDrawSetString(Speed[playerid][0], "~y~~h~IIIIIIIIIIIIIIIIIIIIII");
        case 175..189: TextDrawSetString(Speed[playerid][0], "~r~IIIIIIIIIIIIIIIIIIIIIII");
        case 190..199: TextDrawSetString(Speed[playerid][0], "~r~IIIIIIIIIIIIIIIIIIIIIIII");
        case 200..209: TextDrawSetString(Speed[playerid][0], "~r~~h~IIIIIIIIIIIIIIIIIIIIIIIII");
        case 210..219: TextDrawSetString(Speed[playerid][0], "~r~~h~IIIIIIIIIIIIIIIIIIIIIIIIII");
        case 220..229: TextDrawSetString(Speed[playerid][0], "~r~~h~IIIIIIIIIIIIIIIIIIIIIIIIIII");
        case 230..239: TextDrawSetString(Speed[playerid][0], "~r~~h~~h~IIIIIIIIIIIIIIIIIIIIIIIIIIII");
        case 240..249: TextDrawSetString(Speed[playerid][0], "~r~~h~~h~IIIIIIIIIIIIIIIIIIIIIIIIIIIII");
        default: TextDrawSetString(Speed[playerid][0], "~r~~h~~h~IIIIIIIIIIIIIIIIIIIIIIIIIIIII");
    }
}

stock SpeedVehicle(playerid)
{
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid))
    GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
    else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 253.3;
    return floatround(ST[3]);
}

stock SetSpeedPok(playerid)
{
    new string[15];
    format(string, sizeof(string), "%d km'h", SpeedVehicle(playerid));
    TextDrawSetString(Speed[playerid][2], string);


    new str[64];
    new str1[64];
    new str2[64];
    new str3[64];
    new str4[64];
    new light[24];
    new door[24];
    new eng[24];
    new carid = GetPlayerVehicleID(playerid);
    new Float:carhp;
    GetVehicleHealth(carid, carhp);
    GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
	if(doors != 1)
	{
		door = "~g~ door";
	}
	else
	{
		door = "~r~ door";
	}

    if(engine != 1)
	{
		eng = "~r~ eng";
	}
	else
	{
		eng = "~g~ eng";
	}
	
	if(lights != 1)
	{
		light = "~r~ light";
	}
	else
	{
		light = "~g~ light";
	}
    format(str, sizeof(str), "Speed %d km'h", SpeedVehicle(playerid));
    TextDrawSetString(Speed_TD[playerid][2], str);
    format(str1, sizeof(str1), "%s", door);
    TextDrawSetString(Speed_TD[playerid][4], str1);
    format(str2, sizeof(str2), "%s", eng);
    TextDrawSetString(Speed_TD[playerid][6], str2);
    format(str3, sizeof(str3), "%s", light);
    TextDrawSetString(Speed_TD[playerid][5], str3);
    format(str4, sizeof(str4), "%.0f%", carhp/10);
    TextDrawSetString(Speed_TD[playerid][3], str4);
}

// == == == == [ ������� ] == == == ==
public OnGameModeInit()
{
    SetTimeForServer();
    TextLabel();
    PickUps();
    SpawnVehicles();
   	LoadHouses();
    for(new veh=0; veh<MAX_VEHICLES; veh++)
	{
        SetVehicleNumberPlate(veh, "Sailonio");
	}
	SendRconCommand("hostname "SERVER_HOSTNAME"");
	SetGameModeText(SERVER_MODNAME);
	ConnectMySQL();
	AddPlayerClass(0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_STREAMED);
	ShowNameTags(true);
	SetNameTagDrawDistance(20.0);
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	ManualVehicleEngineAndLights();
	Attach3DTextLabelToVehicle( opavtcar[0], avtcar[0], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[1], avtcar[1], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[2], avtcar[2], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[3], avtcar[3], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[4], avtcar[4], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[5], avtcar[5], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[6], avtcar[6], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[7], avtcar[7], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[8], avtcar[8], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[9], avtcar[9], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[10], avtcar[10], 0.0, 0.0, 2.0 );
	Attach3DTextLabelToVehicle( opavtcar[11], avtcar[11], 0.0, 0.0, 2.0 );
    Attach3DTextLabelToVehicle( opavtcar[12], avtcar[12], 0.0, 0.0, 2.0 );
	SetTimer("ArmourUpdate", 1000, true);
	SetTimer("ChangeWeather",1000*60*30, true); //1 ��� � 30 �����
	ChangeWeather();
	new y, m,d;
	getdate(y, m, d);
	new mi,h;
	gettime(h,mi);
	printf("[ ������ ����: %i/%i/%i � %i:%i]",d,m,y,h,mi);
	return true;
}
public OnGameModeExit()
{
	return true;
}
public OnPlayerRequestClass(playerid, classid)
{
	return true;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    if(GetPVarInt(playerid,"maptp") == 1)
    {
        if(pInfo[playerid][pAdmin] > 2)
        {
	        new vehicleid = GetPlayerVehicleID(playerid); // ������ ID ������ � ������� ����� �����
	        if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) // ���� ����� � ���������� � �� ��������
	        {
	        	SetVehiclePos(vehicleid, fX, fY, fZ); // �������� ����������
	        }
	        else // ���� ����� �� ��������� � ����������
	        {
	        	SetPlayerPos(playerid, fX, fY, fZ); // �������� ������
	        }
	        SendClientMessage(playerid, -1, "�� ���� ������� ���������������."); // ��������� � �������� ���������
		}
        return 1;
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	PlayAudioStreamForPlayer(playerid, "http://wenstony.tk/music/1.mp3");
    PlayerTextDraws(playerid);
    LoadMap(playerid);
	GetPlayerName(playerid, pInfo[playerid][pName], MAX_PLAYER_NAME);
 	static fmt_str[] = "SELECT `ID` FROM `users` WHERE `Name` = '%s' LIMIT 1";
	new string[sizeof(fmt_str)+(-2+MAX_PLAYER_NAME)];
	mysql_format(dbHandle, string, sizeof(string), fmt_str, pInfo[playerid][pName]);
	mysql_function_query(dbHandle, string, true, "PlayerCheck", "d", playerid);
	Clear(playerid);
	//
	pInfo[playerid][pCarID] = -1;
    TextDrawShowForPlayer(playerid, Sailonio_Logo[0]);
    TextDrawShowForPlayer(playerid, Sailonio_Logo[1]);
    TextDrawShowForPlayer(playerid, Sailonio_Logo[2]);
	//
	userconnect[playerid] = 1;
	{
    SendClientMessage(playerid, Color_Orange, "����� ���������� �� Sailonio Role Play!");
    }
    new pcon[44];
    format(pcon, sizeof(pcon), "%s ������� �� ������", GetName(playerid));
    AdminMessege(0x33333300, pcon, 1);
    return true;
}
public OnPlayerDisconnect(playerid, reason)
{
	new carid = pInfo[playerid][pCarID];
    DestroyVehicle(carid);
    save_account(playerid);
    KillTimers(playerid);
    userconnect[playerid] = 0;
    Iter_Remove(iAdmin, playerid);
	return true;
}
public OnPlayerSpawn(playerid)
{
    if(GetPVarInt(playerid, "SET_ADM_POS") == 1) // ���� ����� ��� ������, �� ������� �� ������� �����.
    {
	    DeletePVar(playerid, "SET_ADM_POS"); // ������� PVAR � ������������.

		SetPlayerPos(playerid, GetPVarFloat(playerid, "re_X"), GetPVarFloat(playerid, "re_Y"), GetPVarFloat(playerid, "re_Z")); // ������� ������ �� �����������.
		SetPlayerInterior(playerid, GetPVarInt(playerid, "re_int")); // ������������� ������� ������� ��������.
		SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "re_virt")); // ������������� ������� ������� ����.���.

		DeletePVar(playerid, "re_X"); // ������� PVAR � ������������.
		DeletePVar(playerid, "re_Y"); // ������� PVAR � ������������.
		DeletePVar(playerid, "re_Z"); // ������� PVAR � ������������.
		DeletePVar(playerid, "re_int"); // ������� PVAR � ����������.
		DeletePVar(playerid, "re_virt"); // ������� PVAR � ����.�����.
	}
    StopAudioStreamForPlayer(playerid);
    if(login_check{playerid} == true)
 		SetPlayerSpawn(playerid);
	return true;
}
public OnPlayerDeath(playerid, killerid, reason)
{
	return true;
}
public OnVehicleSpawn(vehicleid)
{
	return true;
}
public OnVehicleDeath(vehicleid, killerid)
{
	return true;
}
public OnPlayerText(playerid, text[])
{
    if(login_check{playerid} == false)
	{
	    SCM(playerid, Color_Grey, !"�� �� ������������.");
	    return false;
	}
 	new string[185];
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	format(string,sizeof(string),"{FFFF00}%s[%d] �������:{B7AFAF}  %s",GetName(playerid),playerid,text);
	ProxDetector(30.0, playerid, string, Color_LimeGreen, Color_LimeGreen, Color_LimeGreen, Color_LimeGreen, Color_LimeGreen);
	SetTimerEx("UnChat", 2030, 0, "d", playerid);
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,0,1,1,1,1,1);
		SetTimerEx("ClearAnim", 100*strlen(text), false, "d", playerid);
	}
	SetPlayerChatBubble(playerid, text, -1, 20.0, 10000);
	return false;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
return true;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return true;
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
	return true;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new newcar = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    GetVehicleParamsEx(newcar, engine, lights, alarm, doors, bonnet, boot, objective);
		if(engine != VEHICLE_PARAMS_ON)
		{
		    SCM(playerid, Color_Yellow, "����� ������� ���������, ������� '2'");
			GameTextForPlayer(playerid, VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400], 2000, 1);
		}
	}
    if(newstate == 2)
    {
        /*TextDrawShowForPlayer(playerid, Speed[playerid][0]);
        TextDrawShowForPlayer(playerid, Speed[playerid][1]);
        TextDrawShowForPlayer(playerid, Speed[playerid][2]);*/
        TextDrawShowForPlayer(playerid, Speed_TD[playerid][0]);
        //TextDrawShowForPlayer(playerid, Speed_TD[playerid][1]);
        TextDrawShowForPlayer(playerid, Speed_TD[playerid][2]);
        TextDrawShowForPlayer(playerid, Speed_TD[playerid][3]);
        TextDrawShowForPlayer(playerid, Speed_TD[playerid][4]);
        TextDrawShowForPlayer(playerid, Speed_TD[playerid][5]);
        TextDrawShowForPlayer(playerid, Speed_TD[playerid][6]);
    }
    else
    {
        /*TextDrawHideForPlayer(playerid, Speed[playerid][0]);
        TextDrawHideForPlayer(playerid, Speed[playerid][1]);
        TextDrawHideForPlayer(playerid, Speed[playerid][2]);*/
        TextDrawHideForPlayer(playerid, Speed_TD[playerid][0]);
        //TextDrawHideForPlayer(playerid, Speed_TD[playerid][1]);
        TextDrawHideForPlayer(playerid, Speed_TD[playerid][2]);
        TextDrawHideForPlayer(playerid, Speed_TD[playerid][3]);
        TextDrawHideForPlayer(playerid, Speed_TD[playerid][4]);
        TextDrawHideForPlayer(playerid, Speed_TD[playerid][5]);
        TextDrawHideForPlayer(playerid, Speed_TD[playerid][6]);
    }
    if(newcar == avtcar[0]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 500.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buyinfernus,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[1]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 230.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buysultan,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[2]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 460.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buybullet,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[3]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 60.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buywindsor,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[4]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 55.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buyyosemite,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[5]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 235.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buyjester,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[6]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 232.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buyelegy,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[7]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 230.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buyflash,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[8]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 210.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buyuranus,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[9]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 75.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buyhuntley,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[10]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 120.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buybf400,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[11]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 175.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buynrg500,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	if(newcar == avtcar[12]) // aaaa
	{
 		new string[86];
	  	format(string, sizeof(string), "������ ������ ����� 90.000 ����.\n�� ������������� ������� ������� ����������?");
		ShowPlayerDialog(playerid,buysanchez,DIALOG_STYLE_MSGBOX, "������� ����������",string, "��", "���");
	}
	return true;
}
public OnPlayerEnterCheckpoint(playerid)
{
	return true;
}
public OnPlayerLeaveCheckpoint(playerid)
{
	return true;
}
public OnPlayerEnterRaceCheckpoint(playerid)
{
	return true;
}
public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return true;
}
public OnRconCommand(cmd[])
{
	return true;
}
public OnPlayerRequestSpawn(playerid)
{
	return true;
}
public OnObjectMoved(objectid)
{
	return true;
}
public OnPlayerObjectMoved(playerid, objectid)
{
	return true;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	return true;
}
public OnVehicleMod(playerid, vehicleid, componentid)
{
	return true;
}
public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return true;
}
public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return true;
}
public OnPlayerSelectedMenuRow(playerid, row)
{
	return true;
}
public OnPlayerExitedMenu(playerid)
{
	return true;
}
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return true;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
	{
		if(pInfo[playerid][pAdmin] > 1) return true;
		new string[150];
		format(string, 256, "{C6C6C6} [WARNING]������� [ERROR 003] %s[%i] �������� ���������� '�����'",GetName(playerid),playerid);
		SAM(Color_LightRed,string,1);
		SCM(playerid, Color_Orange,"�� ���� ������� �� ���������� � ���������. ��� ������: #003");
		Kick(playerid);
		return true;
	}
    if(newkeys == KEY_SUBMISSION)
	{
		if(GetPlayerState(playerid) == 2)
	 	{
	  		a__engine(playerid);
	  	}
	}
	if(newkeys & KEY_ACTION)
	{
        if(GetPlayerState(playerid) == 2)
	 	{
	  		a__lights(playerid);
	  	}
	}
	if(newkeys == KEY_ANALOG_UP)
	{
        if(GetPlayerState(playerid) == 2)
	 	{
	  		a__bonnet(playerid);
	  	}
	}
	if(newkeys == KEY_ANALOG_DOWN)
	{
        if(GetPlayerState(playerid) == 2)
	 	{
	  		a__boot(playerid);
	  	}
	}
	return true;
}
public OnRconLoginAttempt(ip[], password[], success)
{
	return true;
}
public OnPlayerUpdate(playerid)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    SetSpeedDel(playerid);
        SetSpeedPok(playerid);
		if(pInfo[playerid][pAdmin] < 7)
		{
			static SPEEDPLAYER[MAX_PLAYERS];
			if(SpeedVehicle(playerid) - SPEEDPLAYER[playerid] > 20)
			{
			    new string[70];
				format(string, sizeof(string), "[AntiCheat]: %s �������� ���������� SpeedHack", GetName(playerid));
				SAM(Color_LightRed, string, 1);
				return true;
			}
			SPEEDPLAYER[playerid] = SpeedVehicle(playerid);
		}
		return true;
	}
	return true;
}
public OnPlayerStreamIn(playerid, forplayerid)
{
	return true;
}
public OnPlayerStreamOut(playerid, forplayerid)
{
	return true;
}
public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return true;
}
public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return true;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 8008)
	{
 		if(response)
        {
                SendClientMessage(playerid, COLOR_GRAD5, "������� ��� ��������� ������ ���������� � �������!");
        }
        else
        {
                SendClientMessage(playerid, COLOR_GRAD5, "������� ��� ��������� ������ ���������� � �������!");
        }
  		if(dialogid == 8007)
		{
	        if(response)
	        {
	                if(listitem == 0)
	                {
	                        SendClientMessage(playerid, Color_Green, "�� ���������� ��� �� ����� ������� �����!");
	                }
	                if(listitem == 1)
	                {
	                        SendClientMessage(playerid, Color_Green, "�� ���������� ��� �� ����� �������� �����!");
	                }
	        }
		}
	}
	switch (dialogid)
	{
         case D_H_CREATE_DESC:
         {
         	if(response) // ���� ����� ����� "�����"
         	{
         		if(!strlen(inputtext))return ShowPlayerDialog(playerid,D_H_CREATE_DESC,DIALOG_STYLE_INPUT,"�������� ���� - ��������","������� �������� ��� ����.","�����","�������"); // ���� ����� ������ �� ���� �� ���������� ��� ������ �����
         		SetPVarString(playerid,"h_desc",inputtext); // ���������� � PVar �������� ����� � ���������� ��� ������������
         		ShowPlayerDialog(playerid,D_H_CREATE_PRICE,DIALOG_STYLE_INPUT,"�������� ���� - ����","������� ���� ��� ����.","�����","�����"); // ���������� ��������� ������ - ���� ����.
         	}
         }
         case D_H_CREATE_PRICE:
                {
                    if(response) // ���� ����� "��"
                    {
                        if(!strlen(inputtext))return ShowPlayerDialog(playerid,D_H_CREATE_PRICE,DIALOG_STYLE_INPUT,"�������� ���� - ����","������� ���� ��� ����.","�����","�����");
                        SetPVarInt(playerid,"h_price",strval(inputtext)); // ��������� ���� � PVar
                        STR=""; // ������� ������ (����� �� ���� ������ ����������
                        for(new i;i<sizeof(HInts);i++) // ��������� ���� ��� ������������ ���������� ������� � ������� ����� ������ � ���������� �����������
                        {
                            strcat(STR,HInts[i][hiName]); // ���������� � ������ STR �������� �� HInts[i][hiName]
                            strcat(STR,"\n"); // ������ ������� �� ��������� ������ �.�. ����� ������� = DIALOG_STYLE_LIST
                        }
                        ShowPlayerDialog(playerid,D_H_CREATE_INT,DIALOG_STYLE_LIST,"�������� ���� - ��������",STR,"�����","�����"); // ���������� ������ � ������� ������� ����������
                    }
                    else DeletePVar(playerid,"h_desc"),ShowPlayerDialog(playerid,D_H_CREATE_DESC,DIALOG_STYLE_INPUT,"�������� ���� - ��������","������� �������� ���  ����.","�����","�������"); // ���� �� ����� ����� "�����" ���������� ��� ���������� ������ � ������� �� ��� ���� ������� ����� (��������: DeletePVar).
                }
         case D_H_CREATE_INT:
                {
                    if(response) // ���� ����� "�����"
                    {
                                SetPVarInt(playerid,"h_int",listitem); // ���������� � PVar ����� ������ (������� ������ ���� � 0 ��� � � �������� ������� �����.
                                ShowPlayerDialog(playerid,D_H_CREATE_CONF,DIALOG_STYLE_MSGBOX,"�������� ���� - �������������","�� ������������� ������ ������� ��� � ���� �����?","�������","������"); // ���������� ������ �������������
                    }
                    else DeletePVar(playerid,"h_price"),ShowPlayerDialog(playerid,D_H_CREATE_PRICE,DIALOG_STYLE_INPUT,"�������� ���� - ����","������� ���� ��� ����.","�����","�����"); // �����, ���� ����� "�����" ���������� ���������� ������ � ������� �� ��� ����� ����� (����: DeletePVar)
                }
         case D_H_CREATE_CONF:
                {
                    if(response) // ���� ����� ����� "�������"
                	{
	                 	m_h++,SaveHouseAmount(); // ����������� ����� ���-�� �����
						new str1[32];
						new Float:x[3]; // ������� ����������� ������� (��� ����������� ��������� � ��������� ������ �� PVar'a - �������� ����, ��, ��� ������� �����)
						GetPlayerPos(playerid,x[0],x[1],x[2]),GetPVarString(playerid,"h_desc",str1,32); // ���������� ������� ������, ������� �������� � str
						House[m_h][hX]=x[0],House[m_h][hY]=x[1],House[m_h][hZ]=x[2],House[m_h][hPrice]=GetPVarInt(playerid,"h_price"), // ����������� ���������� ���� ����������� ��������
						House[m_h][hInterior]=GetPVarInt(playerid,"h_int"),House[m_h][hVirtWorld]=m_h,strmid(House[m_h][hDesc],str1,0,32,32),
						strmid(House[m_h][hOwner],"None",0,5,5);  // ���������� ��������� ���� ��� None
						SaveHouse(m_h); // ��������� ���
						House[m_h][hPick]=CreatePickup(1273,23,x[0],x[1],x[2],0); // ������� �����
						format(STR,128,"[��� ���������]\n��������: %s\n����: $%d",House[m_h][hDesc],House[m_h][hPrice]); // ����������� ������ ��� 3D ����������
						House[m_h][hText]=Create3DTextLabel(STR,0xFFFFFFFF,x[0],x[1],x[2]+0.5,10.0,0,0); // ������� 3D ����� � ��-����
						GameTextForPlayer(playerid,"~g~House created",100,1); // ���������� ����� ������ �� �������� �������� ����
						DeletePVar(playerid,"h_price"),DeletePVar(playerid,"h_desc"),DeletePVar(playerid,"h_int"); // ������� ��� �� ������ ��� PVar's
                    }
                    else DeletePVar(playerid,"h_price"),DeletePVar(playerid,"h_desc"),DeletePVar(playerid,"h_int"); // ����� ���� ����� ����� "������" ������� PVar's.
                }
	}
	switch (dialogid)
	{
         case 8010: // ������ ����
         {
         	if(response) // ���� ����� ����� "�����"
         	{
         		if(listitem == 0)
	      		{
					a__stats(playerid);
	      		}
		      	if(listitem == 1)
		      	{
          			new string[256];
				    new msg[] = "{F3FF02}/time {FFFFFF}- ��������� �� ����\n{F3FF02}/report {FFFFFF}- ������ ������ �������������/������������\n{F3FF02}/setspawn {FFFFFF}- ����� ���� ��� ���������\n{F3FF02}/donate {FFFFFF}- ������� ����� ����\n{F3FF02}/park {FFFFFF}- ������������ ������ ���������";
					format(string, sizeof(string), msg);
				    SPD(playerid, 8011, DSM, "������� ������", string, "�������", "");
					return 1;
		      	}
		      	if(listitem == 2)
		      	{
					SPD(playerid, 8012, DSL, "������������ ��������", "������������� ����������� �����\n������� �����\n������� ������", "�����", "������");
				}
         	}
         }
         case 8012: // ������ ������������ ��������
         {
			if(response)
			{
                if(listitem == 0)
	      		{
	      		
	      		}
	      		if(listitem == 1)
	      		{

	      		}
	      		if(listitem == 2)
	      		{

	      		}
			}
		 }
	}
	switch (dialogid)
	{
         case D_DONATE_MENU:
         {
         	if(response) // ���� ����� ����� "�����"
         	{
         		if(listitem == 0)
	      		{
		      		SCM(playerid, -1, "[DEBUG]�������");
					return 1;
	      		}
         	}
         }
         case D_ALOGIN:
         {
         	new string[256];
         	new ip[20];
			GetPlayerIp(playerid,ip,20);
			if(response)
			{
				if(!strlen(inputtext)) return ShowPlayerDialog(playerid,D_ALOGIN,DIALOG_STYLE_INPUT, "����� �����������", "������� ������\n\n������ ������ �������� �� ��������� ���� � ����\n    �������� �� 6 �� 15 ��������", "����", "������");
				if(!strcmp(pInfo[playerid][pApass],inputtext, false))
				{
					if(pInfo[playerid][pAdmin] <= 0) return SCM(playerid, -1,"�� �� �������������!");
					format(string, sizeof(string), "{F0FFF0}� ������������� %s[%i], %i ������, ����� �� ���������. IP: %s",Name(playerid),playerid,pInfo[playerid][pAdmin],ip);
					SAM(-1, string, 1);
					pInfo[playerid][pAlogin] = 1;
					Iter_Add(iAdmin, playerid);
				}
				else
				{
					format(string, sizeof(string), "{ff0000}� [WARNING]:{F0FFF0} ������������� %s, ��� �������� ������. ��� IP: %s",Name(playerid),ip);
					SAM(-1, string, 1);
				}
				return true;
			}
			else
			{
				format(string, sizeof(string), "{ff0000}� [WARNING]:{F0FFF0} ������������� %s, ����� �� ����� ������ ��� ����� ����� ������. ��� IP: %s",Name(playerid),ip);
				SAM(-1, string, 1);
			}
         }
         case D_REPORT:
         {
			new string[150];
			new t_report[130];
			new report = strmid(t_report, inputtext, 0, 130, 150);
			if(response)
			{
			    format(string, sizeof(string), "[REPORT]%s[%d]: %s", Name(playerid), playerid, report);
				SAM(Color_Orange, string, 1);
			}
		 }
		 case D_CARNUMBER:
         {
            new string[86];
			if(response)
			{
			    if(pInfo[playerid][pMoney] >= 15.000)
			    {
				    new newnumber = strmid(pInfo[playerid][pCarNumber], GeneratePassword(6), 0, 10, 32);
				    format(string, sizeof(string), "�� ������� ��������� ����� ������ ��� ������ �/�.");
					SAM(Color_Orange, string, 1);
					new dialogs[256];
					pInfo[playerid][pMoney] -= 15000;
					format(dialogs, sizeof(dialogs), "�� ������� �������� ����� ������������� ������.\n����� ����� �������� �� ����� ���������� ��� ���������(/fixcar).\n\n� ������ ����� ���� ������� ����� � ������� 15.000$\n ���� ����� ������: {FFFF00}%s", pInfo[playerid][pCarNumber]);
					SPD(playerid, 9201, DSM, "����������� � ��������!", dialogs, "��", "");
				}
				else
				{
					SCM(playerid, Color_LightRed, "��� ��������� �������� �������!");
				}
			}
		 }
	}
	switch (dialogid)
	{
 		case buyinfernus:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 500000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 411;
		        pInfo[playerid][pMoney] -= 500000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buysultan:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 230000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 560;
		        pInfo[playerid][pMoney] -= 230000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buybullet:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 460000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 541;
		        pInfo[playerid][pMoney] -= 460000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buywindsor:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 60000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 555;
		        pInfo[playerid][pMoney] -= 60000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buyyosemite:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 55000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 554;
		        pInfo[playerid][pMoney] -= 55000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buyjester:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 235000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 559;
		        pInfo[playerid][pMoney] -= 235000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buyelegy:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 232000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 562;
		        pInfo[playerid][pMoney] -= 232000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buyflash:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 230000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 565;
		        pInfo[playerid][pMoney] -= 230000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buyuranus:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 210000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 558;
		        pInfo[playerid][pMoney] -= 210000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buyhuntley:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 75000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 579;
		        pInfo[playerid][pMoney] -= 75000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buybf400:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 120000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 581;
		        pInfo[playerid][pMoney] -= 120000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                DestroyVehicle(avtcar[10]);
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buynrg500:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 157000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 552;
		        pInfo[playerid][pMoney] -= 157000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
		case buysanchez:
		{
		    if(response)
		    {
		        if(pInfo[playerid][pCar] != 0) return SendClientMessage(playerid, Color_LightRed, "� ��� ��� ���� ������!"),RemovePlayerFromVehicle(playerid);
		        if(pInfo[playerid][pMoney] < 90000)return SendClientMessage(playerid, Color_LightRed, "� ��� ������������ �����!"),RemovePlayerFromVehicle(playerid);
		        pInfo[playerid][pCar] = 468;
		        pInfo[playerid][pMoney] -= 90000;
		        SendClientMessage(playerid, Color_Green, "����������� � ��������. ����� ������������ ������ ��������� ����������� ������� /park.");
		        PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], 1805.0170,-1281.7368,13.3473,49.5783, pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
				pInfo[playerid][pCarID] = PlayerVehicle;
				SendClientMessage(playerid, Color_LimeGreen, "��� ��������� ������� ��� �� �������� � ����������.");
                
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
			}
		}
	}
//����� �� ��������

	new len = strlen(inputtext),
 	val = strval(inputtext);
	switch(dialogid)
	{
	    case 1:
	    {
	        if(response)
	        {
	            if(!len)
	            {
	                ShowRegister(playerid);
	                return SCM(playerid, Color_Grey, "�� ������ �� �����.");
	            }
	            if(!(6 <= len <= 32))
	            {
	                ShowRegister(playerid);
					return SCM(playerid, Color_Grey, !"�������� ����� ������.");
	            }
	            if(CheckRusText(inputtext, len+1))
				{
				    ShowRegister(playerid);
				    return SCM(playerid, Color_Grey, !"������� ��������� ����������.");
				}
				strmid(pInfo[playerid][pPass], inputtext, 0, len, 32+1);
				ShowPassCheck(playerid);
	        }
	        else
	        {
	            SCM(playerid, Color_FireBrick, !"������� /q[uit]");
	            Pkick(playerid);
	        }
	    }
	    case 2:
	    {
			if(!strcmp(pInfo[playerid][pPass], inputtext)) ShowEmail(playerid);
			else
			{
			    SCM(playerid, Color_LightRed, !"�������� ������.");
				return Pkick(playerid);
			}
	    }
	    case 3:
	    {
	        if(response)
	        {
				if(!len)
				{
				    ShowEmail(playerid);
				    return SCM(playerid, Color_Grey, !"�� ������ �� �����.");
				}
				if(!(6 <= len <= 46))
				{
				    ShowEmail(playerid);
				    return SCM(playerid, Color_Grey, !"�������� ����� ���������� �����.");
				}
				if(strfind(inputtext, "@", false) == -1 || strfind(inputtext, ".", false) == -1)
				{
				    ShowEmail(playerid);
				    return SCM(playerid, Color_Grey, !"�������� ������ ����������� �����.");
				}
				if(CheckRusText(inputtext, len+1))
				{
				    ShowEmail(playerid);
				    return SCM(playerid, Color_Grey, !"������� ��������� ����������.");
				}
				strmid(pInfo[playerid][pEmail], inputtext, 0, len, 46+1);
				ShowReferal(playerid);
	        }
	        else ShowPassCheck(playerid);
	    }
	    case 4:
	    {
	        if(response)
		    {
		        if(isnull(inputtext))
				{
				    ShowReferal(playerid);
				    return SCM(playerid, Color_Grey, !"�� ������ �� �����.");
				}
				static fmt_str[] = "SELECT `ID` FROM `users` WHERE `Name` = '%e' LIMIT 1";
				new string[sizeof(fmt_str)+(-2+MAX_PLAYER_NAME)];
				mysql_format(dbHandle, string, sizeof(string), fmt_str, (inputtext));
				mysql_function_query(dbHandle, string, true, "CheckReferal", "de", playerid, inputtext);
		    }
		    else ShowNations(playerid);
	    }
	    case 5:
	    {
	        if(response)
			{
				pInfo[playerid][pNations] = listitem+1;
				ShowAge(playerid);
			}
			else ShowReferal(playerid);
	    }
	    case 6:
	    {
	        if(response)
	        {
	            if(isnull(inputtext))
				{
				    ShowAge(playerid);
				    return SCM(playerid, Color_Grey, !"�� ������ �� �����.");
				}
				if(!(1 <= val <= 99))
				{
				    ShowAge(playerid);
				    return SCM(playerid, Color_Grey, !"�������� ����� ��������.");
				}
				pInfo[playerid][pAge] = val;
				ShowSex(playerid);
	        }
	        else ShowNations(playerid);
	    }
	    case 7:
	    {
	        SpawnPlayer(playerid);
		    if(response)
		    {
			    pInfo[playerid][pSex] = 1;
			    SetPlayerSkin(playerid, 32);
			    number_skin{playerid} = 1;
			}
		    else
		    {
			    pInfo[playerid][pSex] = 2;
			    SetPlayerSkin(playerid, 63);
			    number_skin{playerid} = 15;
			}
			TextDrawShowForPlayer(playerid, select_skin[playerid][0]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][1]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][2]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][3]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][4]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][5]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][6]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][7]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][8]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][9]);
			TextDrawShowForPlayer(playerid, select_skin[playerid][10]);
			SelectTextDraw(playerid, 0xA52A2AFF);
		   	SetPlayerVirtualWorld(playerid, playerid);
		   	SetPlayerInterior(playerid, 0);
		   	SetPlayerPos(playerid, 248.6302,33.8265,1007.3272);
			SetPlayerFacingAngle(playerid, 35.4503);
			SetPlayerCameraPos(playerid, 245.2390,36.4504,1008.5635);
			SetPlayerCameraLookAt(playerid, 248.6302,33.8265,1007.3272);
   			Freeze(playerid, 0);
			/*for(new i; i != 11; i++)
			{
				TextDrawShowForPlayer(playerid, select_skin[playerid][i]);
				SelectTextDraw(playerid, 0xA52A2AFF);
		        SetPlayerVirtualWorld(playerid, playerid);
		        SetPlayerInterior(playerid, 0);
		        SetPlayerPos(playerid, 248.6302,33.8265,1007.3272);
				SetPlayerFacingAngle(playerid, 35.4503);
				SetPlayerCameraPos(playerid, 245.2390,36.4504,1008.5635);
				SetPlayerCameraLookAt(playerid, 248.6302,33.8265,1007.3272);
		        Freeze(playerid, 0);
	        }*/
	    }
	    case 8:
	    {
	        if(response)
	        {
	        	if(isnull(inputtext))
				{
	                ShowLogin(playerid);
	                return SCM(playerid, Color_Grey, "�� ������ �� �����.");
	            }
				static fmt_str[] = "SELECT * FROM `users` WHERE `ID` = '%d' AND `Pass` = '%e' LIMIT 1";
				new string[sizeof(fmt_str)+37];
				mysql_format(dbHandle, string, sizeof(string), fmt_str, pInfo[playerid][pID], inputtext);
				mysql_function_query(dbHandle, string, true, "PlayerLogin", "d", playerid);
			}
			else
			{
			    SCM(playerid, Color_FireBrick, !"������� /q[uit]");
	            Pkick(playerid);
			}
	    }
	}
	return true;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return true;
}
public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
    if(login_check{playerid} == false)
	{
	    SCM(playerid, Color_Grey, !"�� �� ������������.");
	    return false;
	}
	return true;
}
public OnPlayerClickTextDraw(playerid, Text: clickedid)
{
    if(clickedid == Text:INVALID_TEXT_DRAW && number_skin{playerid} > 0)
	    SelectTextDraw(playerid, 0xA52A2AFF);
	if(clickedid == select_skin[playerid][9])
	{
	    number_skin{playerid} ++;
	    if(pInfo[playerid][pSex] == 1)
  		{
	        if(number_skin{playerid} == 15)
	            number_skin{playerid} = 1;
		}
	    else
	    {
	        if(number_skin{playerid} == 29)
	            number_skin{playerid} = 15;
		}

	    switch(number_skin{playerid})
	    {
	        // == == == [�������] == == ==
	        case 1: SetPlayerSkin(playerid, 32);
	        case 2: SetPlayerSkin(playerid, 78);
	        case 3: SetPlayerSkin(playerid, 79);
	        case 4: SetPlayerSkin(playerid, 133);
	        case 5: SetPlayerSkin(playerid, 134);
	        case 6: SetPlayerSkin(playerid, 135);
	        case 7: SetPlayerSkin(playerid, 136);
	        case 8: SetPlayerSkin(playerid, 137);
	        case 9: SetPlayerSkin(playerid, 160);
	        case 10: SetPlayerSkin(playerid, 200);
	        case 11: SetPlayerSkin(playerid, 212);
	        case 12: SetPlayerSkin(playerid, 213);
	        case 13: SetPlayerSkin(playerid, 230);
	        case 14: SetPlayerSkin(playerid, 239);
	        // == == == [�������] == == ==
	        case 15: SetPlayerSkin(playerid, 63);
	        case 16: SetPlayerSkin(playerid, 64);
	        case 17: SetPlayerSkin(playerid, 75);
	        case 18: SetPlayerSkin(playerid, 85);
	        case 19: SetPlayerSkin(playerid, 131);
	        case 20: SetPlayerSkin(playerid, 152);
	        case 21: SetPlayerSkin(playerid, 198);
	        case 22: SetPlayerSkin(playerid, 199);
	        case 23: SetPlayerSkin(playerid, 201);
	        case 24: SetPlayerSkin(playerid, 207);
	        case 25: SetPlayerSkin(playerid, 237);
	        case 26: SetPlayerSkin(playerid, 238);
	        case 27: SetPlayerSkin(playerid, 243);
	        case 28: SetPlayerSkin(playerid, 245);
	    }
	}
	if(clickedid == select_skin[playerid][8])
	{
	    number_skin{playerid} --;
	    if(pInfo[playerid][pSex] == 1)
     	{
	        if(number_skin{playerid} == 0)
	            number_skin{playerid} = 14;
		}
	    else
	    {
	        if(number_skin{playerid} == 14)
	            number_skin{playerid} = 28;
		}
	    switch(number_skin{playerid})
	    {
	        // == == == [�������] == == ==
	        case 1: SetPlayerSkin(playerid, 32);
	        case 2: SetPlayerSkin(playerid, 78);
	        case 3: SetPlayerSkin(playerid, 79);
	        case 4: SetPlayerSkin(playerid, 133);
	        case 5: SetPlayerSkin(playerid, 134);
	        case 6: SetPlayerSkin(playerid, 135);
	        case 7: SetPlayerSkin(playerid, 136);
	        case 8: SetPlayerSkin(playerid, 137);
	        case 9: SetPlayerSkin(playerid, 160);
	        case 10: SetPlayerSkin(playerid, 200);
	        case 11: SetPlayerSkin(playerid, 212);
	        case 12: SetPlayerSkin(playerid, 213);
	        case 13: SetPlayerSkin(playerid, 230);
	        case 14: SetPlayerSkin(playerid, 239);
	        // == == == [�������] == == ==
	        case 15: SetPlayerSkin(playerid, 63);
	        case 16: SetPlayerSkin(playerid, 64);
	        case 17: SetPlayerSkin(playerid, 75);
	        case 18: SetPlayerSkin(playerid, 85);
	        case 19: SetPlayerSkin(playerid, 131);
	        case 20: SetPlayerSkin(playerid, 152);
	        case 21: SetPlayerSkin(playerid, 198);
	        case 22: SetPlayerSkin(playerid, 199);
	        case 23: SetPlayerSkin(playerid, 201);
	        case 24: SetPlayerSkin(playerid, 207);
	        case 25: SetPlayerSkin(playerid, 237);
	        case 26: SetPlayerSkin(playerid, 238);
	        case 27: SetPlayerSkin(playerid, 243);
	        case 28: SetPlayerSkin(playerid, 245);
	    }
	}
	if(clickedid == select_skin[playerid][10])
	{
	    new year_server,
	        month_server,
	        day_server;
		for(new i; i != 11; i++) TextDrawHideForPlayer(playerid, select_skin[playerid][i]);
	    SCM(playerid, Color_White, !"�� ������� ������������������");
	    login_check{playerid} = true;
	    update_timer[playerid] = SetTimerEx("UpdateTime", 1000, false, "i", playerid);
	    Freeze(playerid, 1);
	    number_skin{playerid} = 0;
	    CancelSelectTextDraw(playerid);
	    // == == == [ �������� �������� ] == == ==
	    pInfo[playerid][pLevel] = 1;
	    pInfo[playerid][pSkin] = GetPlayerSkin(playerid);
	    pInfo[playerid][pAlogin] = 0;
	    
	    getdate(year_server, month_server, day_server);
	    format(pInfo[playerid][pDateReg], 10+1, "%02d/%02d/%02d", day_server, month_server, year_server);
	    // == == == == == == == == == == == == ==
	    static fmt_str[] = "INSERT INTO `users` (`Name`, `Pass`, `Email`, `Referal`,`Date Reg`, `Nations`, `Age`, `Sex`, `Skin`, `Level`, `Admin`, `House`, `Apass`) \
		VALUES ('%s', '%s', '%s', '%s', '%s', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%s')";
		new string[sizeof(fmt_str)+MAX_PLAYER_NAME*2+76];
		mysql_format(dbHandle, string, sizeof(string), fmt_str, pInfo[playerid][pName], pInfo[playerid][pPass], pInfo[playerid][pEmail],
		pInfo[playerid][pReferal], pInfo[playerid][pDateReg], pInfo[playerid][pNations], pInfo[playerid][pAge], pInfo[playerid][pSex],
		pInfo[playerid][pSkin], pInfo[playerid][pLevel], pInfo[playerid][pAdmin], pInfo[playerid][pHouse], pInfo[playerid][pApass]);
		mysql_function_query(dbHandle, string, true, "GetID", "i", playerid);
	    SpawnPlayer(playerid);
	}
	return true;
}
// == == == == [ ���� ������� ] == == == ==
public PlayerCheck(playerid)
{
	new rows,
		fields;
	cache_get_data(rows, fields);
	if(rows)
	{
	    login_timer[playerid] = SetTimerEx("CheckLogin", 1000*35, false, "i", playerid);
	    pInfo[playerid][pID] = cache_get_field_content_int(0, "ID");
		ShowLogin(playerid);
	}
	else ShowRegister(playerid);
}
public PlayerLogin(playerid)
{
    new rows,
	    fields;
	cache_get_data(rows, fields);
	if(rows)
	{
	    cache_get_field_content(0, "Apass", pInfo[playerid][pApass], dbHandle, 32+1);
	    cache_get_field_content(0, "CarNumber", pInfo[playerid][pCarNumber], dbHandle, 32+1);
	    cache_get_field_content(0, "Pass", pInfo[playerid][pPass], dbHandle, 32+1);
	    cache_get_field_content(0, "Email", pInfo[playerid][pEmail], dbHandle, 46+1);
	    cache_get_field_content(0, "Referal", pInfo[playerid][pReferal], dbHandle, MAX_PLAYER_NAME+1);
	    cache_get_field_content(0, "Date Reg", pInfo[playerid][pDateReg], dbHandle, 10+1);
	    pInfo[playerid][pNations] = cache_get_field_content_int(0, "Nations");
	    pInfo[playerid][pAge] = cache_get_field_content_int(0, "Age");
	    pInfo[playerid][pSex] = cache_get_field_content_int(0, "Sex");
	    pInfo[playerid][pSkin] = cache_get_field_content_int(0, "Skin");
	    pInfo[playerid][pMoney] = cache_get_field_content_int(0, "Money");
	    pInfo[playerid][pLevel] = cache_get_field_content_int(0, "Level");
	    pInfo[playerid][pAdmin] = cache_get_field_content_int(0, "Admin");
	    pInfo[playerid][pHouse] = cache_get_field_content_int(0, "House");
	    pInfo[playerid][pCar] = cache_get_field_content_int(0, "Car");
	    pInfo[playerid][pCarColor1] = cache_get_field_content_int(0, "CColor1");
	    pInfo[playerid][pCarColor2] = cache_get_field_content_int(0, "CColor2");
	    pInfo[playerid][pCarX] = cache_get_field_content_int(0, "CarX");
	    pInfo[playerid][pCarY] = cache_get_field_content_int(0, "CarY");
	    pInfo[playerid][pCarZ] = cache_get_field_content_int(0, "CarZ");
	    pInfo[playerid][pCarAngel] = cache_get_field_content_int(0, "CarAngel");
	    pInfo[playerid][pMember] = cache_get_field_content_int(0, "Member");
	    pInfo[playerid][pRank] = cache_get_field_content_int(0, "Rank");
	    //== == == == == == == == == == == == == == == == == == == == == == ==
	    login_check{playerid} = true;
	    SetTimerEx("FastSpawn", 100, false, "i", playerid);
	    //SpawnPlayer(playerid);
	    update_timer[playerid] = SetTimerEx("UpdateTime", 1000, false, "i", playerid);
	    KillTimer(login_timer[playerid]);
	    static fmt_str[] = "SELECT * FROM `referal` WHERE `Name` = '%s' LIMIT 1";
		new string[sizeof(fmt_str)+MAX_PLAYER_NAME-1];
		mysql_format(dbHandle, string, sizeof(string), fmt_str, pInfo[playerid][pName]);
		mysql_function_query(dbHandle, string, true, "CheckReferal_2", "d", playerid);
		
		static fmt_str1[] = "SELECT * FROM `bans` WHERE `name` = '%s' LIMIT 1";
		new string1[sizeof(fmt_str1)+MAX_PLAYER_NAME-1];
		mysql_format(dbHandle, string1, sizeof(string1), fmt_str1, pInfo[playerid][pName]);
		mysql_function_query(dbHandle, string1, true, "CheckBan", "d", playerid);
	}
	else
	{
	    number_pass{playerid} ++;
	    if(number_pass{playerid} == 3)
	    {
	        Pkick(playerid);
	        return SCM(playerid, Color_FireBrick, !"������� �� ���� ������ ���������. ������� /q[uit]");
	    }
	    static const fmt_str[] = "�������� ������. �������� �������: %d";
		new string[sizeof(fmt_str)];
		format(string, sizeof(string), fmt_str, 3-number_pass{playerid});
		SCM(playerid, Color_LightRed, string);
	    ShowLogin(playerid);
	}
	return true;
}
public CheckReferal(playerid, name[])
{
    new rows,
	    fields;
	cache_get_data(rows, fields);
	if(!rows)
	{
	    ShowReferal(playerid);
	    return SCM(playerid, Color_Grey, !"������� �� ������.");
	}
	strmid(pInfo[playerid][pReferal], name, 0, strlen(name), MAX_PLAYER_NAME+1);
	ShowSex(playerid);
	return true;
}
public CheckReferal_2(playerid)
{
    new rows,
	    fields;
	cache_get_data(rows, fields);
	if(rows)
	{
	    pInfo[playerid][pMoney] += 100_000;
	    SavePlayer(playerid, "Money", pInfo[playerid][pMoney], "d");
	    SCM(playerid, Color_Yellow, !"�� ��������� 100.000$ �� ������������� ������");
	    static fmt_str[] = "DELETE FROM `referal` WHERE `Name` = '%s' LIMIT 1";
		new string[sizeof(fmt_str)+MAX_PLAYER_NAME-1];
		mysql_format(dbHandle, string, sizeof(string), fmt_str, pInfo[playerid][pName]);
		mysql_function_query(dbHandle, string, true, "", "");
	}
	return true;
}
public CheckLogin(playerid)
{
	SCM(playerid, Color_FireBrick, !"����� �� ����������� �����. ������� /q[uit]");
	Pkick(playerid);
	return true;
}
public TimeKick(playerid)
{
	Kick(playerid);
	return true;
}
public UpdateTime(playerid)
{
    if(pInfo[playerid][pMoney] != GetPlayerMoney(playerid))
	{
	    ResetPlayerMoney(playerid);
	    GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
	}
	update_timer[playerid] = SetTimerEx("UpdateTime", 1000, false, "i", playerid);
	return true;
}
public GetID(playerid)
{
	pInfo[playerid][pID] = cache_insert_id();
	return true;
}
public FastSpawn(playerid)
{
	SpawnPlayer(playerid);
	return true;
}

forward CheckBan(playerid);
public CheckBan(playerid)
{
	new rows[2], unbandate[12];
	cache_get_data(rows[0], rows[1]);
	if(rows[0])
	{
		new unban;
	    cache_get_field_content(0, "unbandate", unbandate), unban = strval(unbandate);
	    if(gettime() > unban)
	    {
	        new query[60];
	        format(query, sizeof(query), "DELETE FROM `bans` WHERE `name` = '%s'", pInfo[playerid][pName]);
	        mysql_function_query(dbHandle, query, false, "", "");
	    }
	    else
	    {
	        new string[256], query[28], admin[24], reason[27], bandate[13], bantime[11];
	        cache_get_field_content(0, "admin", query); strmid(admin, query, 0, strlen(query), MAX_PLAYER_NAME);
	        cache_get_field_content(0, "reason", query); strmid(reason, query, 0, strlen(query), 27);
	        cache_get_field_content(0, "bandate", query); strmid(bandate, query, 0, strlen(query), 13);
	        cache_get_field_content(0, "bantime", query); strmid(bantime, query, 0, strlen(query), 11);
			new how = unban - gettime();
			how = how/86400;
	        format(string, sizeof(string), "{FFFFFF}���� ������� ������������ �� {ff4400}%d ����.{FFFFFF}\n\n��� ��������������: %s\n������� ����������: %s\n���� � �����: %s %s\n\n������� {ffcd00}/q (/quit){FFFFFF} ����� �����.", how+1, admin, reason, bandate, bantime);
	        SPD(playerid, 91, DIALOG_STYLE_MSGBOX, "Sailonio Role Play", string, "�������", "");
	        Kick(playerid);
	    }
	}
	return 1;
}

public ChangeWeather()
{
	new weather ;
	weather = random(20) ;
	SetWeather(weather);
	switch(weather)
	{
		case 1:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]:{FFC800}���������� �� ���������!");
		case 2:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {646CFF}���������� �� ���������!");
		case 3:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {FFC800}���������� �� ���������!");
		case 4:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� �������.");
		case 5:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� ��������!");
		case 6:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� ��������!");
		case 7:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� ��������!");
		case 8:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� ���������!");
		case 9:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� ��������!");
		case 10:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {ACFF46}���������� �� ���������!");
		case 11:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {ACFF46}���������� �� ���������!");
		case 12:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� ��������!");
		case 13:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {FFDE37}���������� �� ���������!");
		case 14:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {FFDE37}���������� �� ���������!");
		case 15:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� ��������!");
		case 16:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {D2EBFF}���������� �� ��������!");
		case 17:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {FF5441}���������� �� ������!");
		case 18:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {FF5441}���������� �� ������!");
		case 19:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {0A1EFF}���������� �� ���������!");
		case 20:SendClientMessageToAll(Color_Blue,"{73F6FF}[������� ������]: {FAFFF5}������ ��������� �� ��������, �� �������� ������.");
	}
	return 1;
}

forward Hours();
public Hours() // ��������� ������ ��� ����� �� �������
{
        new hour, minute, second;
        gettime(hour, minute, second);
        SetWorldTime(hour);
}

// == == == == [ ����� ] == == == ==
stock ShowLogin(playerid)
{
    static const fmt_str[] = "{FFFFFF}����� ����������\n\n\
		�����: {A52A2A}[%s]{FFFFFF}\n\
		����: {A52A2A}[%d]{FFFFFF}\n\
		�������: {FF0000}[�����]{FFFFFF}\n\n\
		{999999}� ��� ���� 35 ������, ����� ������{FFFFFF}\n\
	������� ���� ������:";
	new string[sizeof(fmt_str)+(-2+MAX_PLAYER_NAME)+(-2+5)];
	format(string, sizeof(string), fmt_str, pInfo[playerid][pName], GetPlayerPing(playerid));
	SPD(playerid, 8, DSP, "�����������", string, "�>>", "�><�");
}
stock ShowRegister(playerid)
{
    static const fmt_str[] = "{FFFFFF}[����� ����������]\n\n\
	�����: {A52A2A}[%s]{FFFFFF}\n\
	����: {A52A2A}[%d]{FFFFFF}\n\
	�������: {008000}[��������]{FFFFFF}\n\n\
	���������� ���� ������:";
	new string[sizeof(fmt_str)+(-2+MAX_PLAYER_NAME)+(-2+5)];
	format(string, sizeof(string), fmt_str, pInfo[playerid][pName], GetPlayerPing(playerid));
	SPD(playerid, 1, DSI, "�����������", string, "�>>", "�><�");
}
stock ShowPassCheck(playerid)
{
	SPD(playerid, 2, DSP, "[������������� ������]", "{FFFFFF}����������� ���� {A52A2A}[������]{FFFFFF}\n\
	����� ���������� {A52A2A}[�����������]{FFFFFF}:", "�>>", "�><�");
}
stock ShowEmail(playerid)
{
	SPD(playerid, 3, DSI, "[����������� �����]", "{FFFFFF}������� ��������� ���� {A52A2A}[����������� �����]{FFFFFF}\n\
	� ������ ������ ��� ������ ��������{FFFFFF}\n\
	�� ������� ������������ ���� {A52A2A}[�������]{FFFFFF}:\n\
	{DF8600}[���������]{FFFFFF}:\n\
	\t{008000}[]{FFFFFF}����������� ����� ������ ���� �� 6-�� �� 46-�� �������\n\
	\t{008000}[]{FFFFFF}����������� ����� ������ �������� �� ���� � ��������� ��������", "�>>", "<<�");
}
stock ShowReferal(playerid)
{
	SPD(playerid, 4, DSI, "[�������]", "{FFFFFF}������� {A52A2A}[��� ������] {FFFFFF}�������������\n\
	��� �� ������:\n\
	{DF8600}[���������]{FFFFFF}:\n\n\
	����������� {A52A2A}���� 6-�� ������{FFFFFF}, ���� �����\n\
	\t{008000}[]{FFFFFF}������� {DF8600}[120.000$]\n\
	\t{008000}[]{FFFFFF}������� {A52A2A}[VIP] - ������ {FFFFFF}�� {DF8600}[7 ����]\n\
	\t{008000}[]{FFFFFF}������� {A52A2A}[�����] {FFFFFF}� ������� {DF8600}[250 ������]", "�><�", "�>>");
}
stock ShowNations(playerid)
{
    SPD(playerid, 5, DSL, !"[��������������]", !"������������\n\
    ���������\n\
	�����������\n\
	������������\n\
	�������\n\
	����������\n\
	������������\n\
	��������", !"�>>", !"<<�");
}
stock ShowAge(playerid)
{
    SPD(playerid, 6, DSI, !"[�������]", !"{FFFFFF}������� �������\n\
	������ {A52A2A}[���������]{FFFFFF}:\n\
	{DF8600}[���������]{FFFFFF}:\n\n\
	\t{008000}[]{FFFFFF}������� �� 1-�� �� 99-��\n\
	\t{008000}[]{FFFFFF}������� ������ �������� �� ����", !"�>>", !"<<�");
}
stock ShowSex(playerid)
{
	SPD(playerid, 7, DSM, !"[���]", !"{FFFFFF}�������� {A52A2A}[���] {FFFFFF}������\n\
	���������{FFFFFF}\n\
	�� �������� �� ������ ������ {A52A2A}[Role Play]{FFFFFF}:", !"�������", !"�������");
}
stock CheckRusText(string[], size = sizeof(string))
{
    for(new i; i < size; i++)
	switch(string[i])
	{
	    case '�'..'�', '�'..'�', ' ': return true;
	}
	return false;
}
stock Clear(playerid)
{
	number_skin{playerid} = 0;
	number_pass{playerid} = 0;
	login_check{playerid} = false;
}
stock KillTimers(playerid)
{
    KillTimer(update_timer[playerid]);
   	KillTimer(login_timer[playerid]);
}
stock SetPlayerSpawn(playerid)
{
    SetPlayerScore(playerid, pInfo[playerid][pLevel]);
	SetPlayerSkin(playerid, pInfo[playerid][pSkin]);
	SetPlayerColor(playerid, 0xFFFFFF00);
	new hid = pInfo[playerid][pHouse];
	if(pInfo[playerid][pHouse] >= 1)
	{
        SetPlayerPos(playerid,HInts[House[hid][hInterior]][hiX],HInts[House[hid][hInterior]][hiY],HInts[House[hid][hInterior]][hiZ]);
		SetPlayerInterior(playerid,HInts[House[hid][hInterior]][hiInt]);
		SetPlayerVirtualWorld(playerid,House[hid][hVirtWorld]);
	}
	else
	{
        SetPlayerPos(playerid, 1154.3717, -1769.2594, 16.5938);
		SetPlayerFacingAngle(playerid, 0.0);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetCameraBehindPlayer(playerid);
	}
	return true;
}

stock save_account(playerid)
{
	new query[1600];
	format(query, sizeof(query), "UPDATE `users` SET `Level` = '%d', `House` = '%d', `Money` = '%d', `Skin` = '%d', `Apass` = '%s', `Car` = '%d', `CarX` = '%f', `CarY` = '%f', `CarZ` = '%f', `CarAngel` = '%f', `CarNumber` = '%s' WHERE `ID` = '%d' LIMIT 1",
	pInfo[playerid][pLevel],
	pInfo[playerid][pHouse],
	pInfo[playerid][pMoney],
	pInfo[playerid][pSkin],
	pInfo[playerid][pApass],
	pInfo[playerid][pCar],
	pInfo[playerid][pCarX],
	pInfo[playerid][pCarY],
	pInfo[playerid][pCarZ],
	pInfo[playerid][pCarAngel],
	pInfo[playerid][pCarNumber],
	pInfo[playerid][pID]);
	mysql_function_query(dbHandle, query, false, "", "");
}

stock SavePlayer(playerid, const field_name[], const set[], const type[])
{
	new string[128+1];
	if(!strcmp(type, "d", true))
	{
	    mysql_format(dbHandle, string, sizeof(string), "UPDATE `users` SET `%s` = '%d' WHERE `ID` = '%d' LIMIT 1",
		field_name, set, pInfo[playerid][pID]);
	}
    else if(!strcmp(type, "s", true))
    {
	    mysql_format(dbHandle, string, sizeof(string), "UPDATE `users` SET `%s` = '%s' WHERE `ID` = '%d' LIMIT 1",
		field_name, set, pInfo[playerid][pID]);
	}
    mysql_function_query(dbHandle, string, false, "", "");
}

// == == == == [ ������ ] == == == ==
SaveHouseAmount() // ������� ��� ���������� ������� ���-�� ����� (����������� ��� �������� �����)
{
    new f=ini_openFile("houses/m_h.ini"); // ��������� ����
    ini_setInteger(f,"Amount",m_h); // ���������� �������� ���������� m_h � ���� Amount
    return ini_closeFile(f); // ��������� ����
}

LoadHouses()
{
        if(!fexist("houses/m_h.ini"))return print("[������] ���� houses/m_h.ini �� ������"); // ��������� ������� ����� � scriptfiles/houses (���� �� ������, � ��� ������� ������ ������)
        new f=ini_openFile("houses/m_h.ini"); // ��������� ����
        ini_getInteger(f,"Amount",m_h); // �������� ������ �������� ��������� �����
        ini_closeFile(f); // ��������� ���� ����
        if(!fexist("houses/houses.ini"))return print("[������] ���� houses/houses.ini �� ������"); // ��������� ������� ����� houses.ini � ��� �� ����������.
        f=ini_openFile("houses/houses.ini"); // ��������� ���
        new str[8]; // ������� ��������� ������ ��� ����������� �������������� ������ (����� � �����)
        for(new h=1;h<=m_h;h++) // ��������� ����
        {
        	format(str,sizeof(str),"ID %d",h); // ����������� ������ ��� ����� � �����
        	ini_getString(f,str,STR); // �������� ������ � ���� ������
        	sscanf(STR,"p<|>s[32]s[24]fffiiii",House[h][hDesc],House[h][hOwner],House[h][hX],House[h][hY],House[h][hZ],House[h][hInterior],House[h][hVirtWorld],House[h][hPrice],House[h][hLock],House[h][hTakings]); // ������������ ������ �� ���������� (������ ���� ����� ������ "|", ������: Dom 1|2.612|213.132|2.321")
        	if(!strcmp(House[h][hOwner],"None",true)) // ���������� ������ ���� �������� ���� == None ������ ��� �� ������ (� ���������� ��� �������� �������� ���� ����� ����� None)
                {
                        House[h][hPick]=CreatePickup(1273,23,House[h][hX],House[h][hY],House[h][hZ],0); // ������� ����� ����
                        format(STR,128,"[��� ���������]\n��������: %s\n����: $%d",House[h][hDesc],House[h][hPrice]);// ����������� ������ ��� 3D ������
                        House[h][hText]=Create3DTextLabel(STR,0xFFFFFFFF,House[h][hX],House[h][hY],House[h][hZ]+0.5,10.0,0,0); // ������� 3D �����
                }
                else // �����, ���� �������� ���� �� ����� None, ������ ��� ������
                {
                        House[h][hPick]=CreatePickup(19522,23,House[h][hX],House[h][hY],House[h][hZ],0); // ������� ����� ���� (������ ������ ��� ������)
                        format(STR,128,"[���]\n��������: %s\n��������: %s",House[h][hDesc],House[h][hOwner]); // ����������� ������
                        House[h][hText]=Create3DTextLabel(STR,0xFFFFFFFF,House[h][hX],House[h][hY],House[h][hZ]+0.5,10.0,0,0); // � ������� 3D ����� � �����������
                }
        }
        ini_closeFile(f); // ��������� ���
        return printf("Loaded %d houses",m_h); // � ��� ���� ���������� ���-�� ����������� �����
}

SaveHouse(h) // ������� ��� ���������� ������ ���� � ����
{
        new f=ini_openFile("houses/houses.ini"); // ��������� ����
        new str[8]; // ������� ������ ��� �������������� ������ (��� �����, ��� � ���������� ������)
        format(str,8,"ID %d",h); // ����������� ������
        format(STR,sizeof(STR),"%s|%s|%f|%f|%f|%d|%d|%d|%d|%d",House[h][hDesc],House[h][hOwner],House[h][hX],House[h][hY],House[h][hZ],House[h][hInterior],House[h][hVirtWorld],House[h][hPrice],House[h][hLock],House[h][hTakings]); // ����� ����������� ������ (��� � ����������� � ����); ��� ��� ������, �� � ����� ��������, ���������� ����� "|"
        ini_setString(f,str,STR); // ���������� ������
        ini_closeFile(f); // ��������� ����
        return 1;
}

UpdateHouse(h) // ��� ������� ��� ���������� ���� (�������� ��� ��� ������� / ������� �� ����� �� ������������)
{
	DestroyPickup(House[h][hPick]); // ������� �����
    if(!strcmp(House[h][hOwner],"None",true)) // ����� ��������� �� ��������� ����, ���� ��� ��� �����:
    {
        House[h][hPick]=CreatePickup(1274,23,House[h][hX],House[h][hY],House[h][hZ],0); // �����
        format(STR,128,"[��� ���������]\n��������: %s\n����: $%d",House[h][hDesc],House[h][hPrice]);// ����������� ������
        Update3DTextLabelText(House[h][hText],0xFFFFFFFF,STR); // ��������� ����� ��������� 3D ����� (������� �������� ��� �������� ����)
    }
    else // ���� ���� �������� (������ ���)
    {
        House[h][hPick]=CreatePickup(19522,23,House[h][hX],House[h][hY],House[h][hZ],0); // �����
        format(STR,128,"[���]\n��������: %s\n��������: %s",House[h][hDesc],House[h][hOwner]); // ����������� ������
        Update3DTextLabelText(House[h][hText],0xFFFFFFFF,STR); // ��������� 3D �����
    }
}

stock ConnectMySQL()
{
	dbHandle =mysql_connect(MySQL_Host, MySQL_User, MySQL_Base, MySQL_Pass);
	switch(mysql_errno())
	{
	    case 0: print("MySQL - connected");
	    default: print("MySQL - disconnect");
	}
	mysql_set_charset("cp1251");
}

stock AdminMessege(color,const string[],level)
{
	foreach(new i: iAdmin)
	{
		if (pInfo[i][pAdmin] >= level)
		{
			SCM(i, color, string);
		}
	}
	return true;
}

stock a__engine(playerid)
{
	new carid = GetPlayerVehicleID(playerid);
    GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
	if(carid == INVALID_VEHICLE_ID) return true;
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(engine != VEHICLE_PARAMS_ON)
		{
			SetVehicleParamsEx(carid,1,lights,alarm,doors,bonnet,boot,objective);
			new string[50];
			format(string, sizeof(string), "%s ���� ���������", pInfo[playerid][pName]);
			ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
			return true;
		}
		else
		{
			SetVehicleParamsEx(carid,0,lights,alarm,doors,bonnet,boot,objective);
			new string[50];
			format(string, sizeof(string), "%s �������� ���������", pInfo[playerid][pName]);
			ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
			return true;
		}
	}
	return true;
}

stock a__lights(playerid)
{
    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
	if(GetPlayerVehicleID(playerid) == INVALID_VEHICLE_ID) return true;
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(lights != VEHICLE_PARAMS_ON)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,1,alarm,doors,bonnet,boot,objective);
			return true;
		}
		else
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,0,alarm,doors,bonnet,boot,objective);
			return true;
		}
	}
	return true;
}

stock a__bonnet(playerid)
{
    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
	if(GetPlayerVehicleID(playerid) == INVALID_VEHICLE_ID) return true;
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(bonnet != VEHICLE_PARAMS_ON)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,1,boot,objective);
			return true;
		}
		else
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,0,boot,objective);
			return true;
		}
	}
	return true;
}

stock a__boot(playerid)
{
    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
	if(GetPlayerVehicleID(playerid) == INVALID_VEHICLE_ID) return true;
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(boot != VEHICLE_PARAMS_ON)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,1,objective);
			return true;
		}
		else
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,0,objective);
			return true;
		}
	}
	return true;
}

stock ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	//if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && gSpectateID[playerid] != INVALID_PLAYER_ID) return true;
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		foreach (Player, i)
		{
			if(IsPlayerConnected(i))
			{
				if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
				{
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					{
						SCM(i, col1, string);
					}
					else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					{
						SCM(i, col2, string);
					}
					else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					{
						SCM(i, col3, string);
					}
					else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					{
						SCM(i, col4, string);
					}
					else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					{
						SCM(i, col5, string);
					}
				}
			}
		}
	}
	return true;
}

SetTimeForServer()
{
        new hour, minute, second; // ���������� ��� ��������� �������
        gettime(hour, minute, second); // �������� ����� � ����������� ����������
        SetWorldTime(hour); // ������������� ����� �� �������
        SetTimer("Hours", 60*1000, true);  // ��������� ��������� ������
        return true;
}

CMD:donate(playerid)
{
	return 1;
}

CMD:buyhouse(playerid)
{
    for(new h=1;h<=m_h;h++)
	{
		if(!IsPlayerInRangeOfPoint(playerid,1.5,House[h][hX],House[h][hY],House[h][hZ]))continue;
		if(GetPlayerMoney(playerid)<House[h][hPrice])return SendClientMessage(playerid,-1,"� ��� �� ������� �������!"); // ��������� ������� �������
		if(strcmp(House[h][hOwner],"None",true)!=0)return SendClientMessage(playerid,-1,"��� ��� ������!"); // ������ ���� �� �������� ��� ��� ��� ������ ��������� ������
		strmid(House[h][hOwner],Name(playerid),0,24,24),UpdateHouse(h); // ���� ���, ���������� ������ ���������, ��������� 3� ��-��� � ������ ����� ����
		SaveHouse(h);
		GivePlayerMoney(playerid,-House[h][hPrice]); // ������� ������
		SendClientMessage(playerid,-1,"�� ������� ������ ���!");
		return 1;
	}
	SendClientMessage(playerid,-1,"����� � ���� ��� ����!");
	return 1;
}

CMD:sellhouse(playerid)
{
    for(new h=1;h<=m_h;h++)
    {
	    if(!IsPlayerInRangeOfPoint(playerid,1.5,House[h][hX],House[h][hY],House[h][hZ]))continue;
	    if(!strcmp(House[h][hOwner],Name(playerid),true)) // ���� ����� �������� ����� ����, �����...
    	{
    		strmid(House[h][hOwner],"None",0,5,5),UpdateHouse(h);
    		SaveHouse(h);
    		GivePlayerMoney(playerid,House[h][hPrice]/2); // ������ ������ ��� ���� �� ���
    		SendClientMessage(playerid,-1,"�� ������� ���� ���!");
    		return 1;
    	}
    }
    //SendClientMessage(playerid,-1,"����� � ���� ��� ����!");
    return 1;
}

CMD:hmenu(playerid)
{
    for(new h=1;h<=m_h;h++)
    {
    	if(IsPlayerInRangeOfPoint(playerid,50.5,HInts[House[h][hInterior]][hiX],HInts[House[h][hInterior]][hiY],HInts[House[h][hInterior]][hiZ]) && GetPlayerVirtualWorld(playerid)==House[h][hVirtWorld])
    	{
    	    if(!strcmp(House[h][hOwner],Name(playerid),true))
    		{
				new string[512];
			    /*new htaking = House[h][hTakings];
			    new hown = House[h][hOwner];*/
			    new msg[] = "{FFFF00}����� ����: {FFFFFF}[#%d]\n{FFFF00}�������� ����: {FFFFFF}[%s]\n{FFFF00}���� ����: {FFFFFF}[%d$]";
				format(string, sizeof(string), msg,h, House[h][hOwner], House[h][hTakings]);
			    SPD(playerid, 87124, DIALOG_STYLE_MSGBOX, "���� ����", string, "�������", "");
				return 1;
			}
			else
			{
				SCM(playerid, Color_LightRed, "��� �� ��� ���.");
			}
    	}
    	else
    	{
            SCM(playerid, Color_LightRed, "�� ������ ���������� ������ ������ ����.");
		}
    }
    return 1;
}

CMD:enter(playerid)
{
    for(new h=1;h<=m_h;h++)
    {
	    if(!IsPlayerInRangeOfPoint(playerid,1.5,House[h][hX],House[h][hY],House[h][hZ]))continue;
	    if(strcmp(House[h][hOwner],Name(playerid),true)!=0 && House[h][hLock]==1)return SendClientMessage(playerid,-1,"��� ������!"); // ���� �� �� �������� � ��� ������- �� ������
	    SetPlayerPos(playerid,HInts[House[h][hInterior]][hiX],HInts[House[h][hInterior]][hiY],HInts[House[h][hInterior]][hiZ]); // ���, �� ��� ������ ������ ������ ������ ���������� ������ ����
	    SetPlayerInterior(playerid,HInts[House[h][hInterior]][hiInt]); // + ������ ��� �� (HInts[�����_������][hiInt]
	    SetPlayerVirtualWorld(playerid,House[h][hVirtWorld]); // ����������� ������ ����. ���
    }
    return 1;
}

CMD:exit(playerid)
{
    for(new h=1;h<=m_h;h++)
    {
    	if(IsPlayerInRangeOfPoint(playerid,1.5,HInts[House[h][hInterior]][hiX],HInts[House[h][hInterior]][hiY],HInts[House[h][hInterior]][hiZ]) && GetPlayerVirtualWorld(playerid)==House[h][hVirtWorld])
    	{
    		SetPlayerPos(playerid,House[h][hX],House[h][hY],House[h][hZ]);
    		SetPlayerVirtualWorld(playerid,0),SetPlayerInterior(playerid,0);
    	}
    }
    return 1;
}

CMD:hlock(playerid)
{
    for(new h=1;h<=m_h;h++)
    {
	    if(!IsPlayerInRangeOfPoint(playerid,1.5,House[h][hX],House[h][hY],House[h][hZ]))continue;
	    if(strcmp(House[h][hOwner],Name(playerid),true)!=0)return SendClientMessage(playerid,-1,"� ��� ��� ������ �� ����� ����!"); // ���������� ��������� ���� � ����� ������, ���� �� ��������� - ������� ���������
	    if(House[h][hLock]==0)House[h][hLock]=1,SaveHouse(h),GameTextForPlayer(playerid,"~r~House locked",100,1); // ���� ��� ������ - ��������� (0 ������ / 1 ������)
	    else if(House[h][hLock]==1)return SendClientMessage(playerid,-1,"��� ��� ������!"); // ����� ������� ���������
	    return 1;
    }
    return 1;
}

CMD:hopen(playerid)
{
    for(new h=1;h<=m_h;h++)
    {
	    if(!IsPlayerInRangeOfPoint(playerid,1.5,House[h][hX],House[h][hY],House[h][hZ]))continue;
	    if(strcmp(House[h][hOwner],Name(playerid),true)!=0)return SendClientMessage(playerid,-1,"� ��� ��� ������ �� ����� ����!");
	    if(House[h][hLock]==1)House[h][hLock]=0,SaveHouse(h),GameTextForPlayer(playerid,"~g~House unlocked",100,1);
	    else if(House[h][hLock]==0)return SendClientMessage(playerid,-1,"��� ��� ������!");
	    return 1;
    }
    return 1;
}

CMD:setspawn(playerid)
{
    for(new h=1;h<=m_h;h++)
    {
    	if(IsPlayerInRangeOfPoint(playerid,100.5,HInts[House[h][hInterior]][hiX],HInts[House[h][hInterior]][hiY],HInts[House[h][hInterior]][hiZ]) && GetPlayerVirtualWorld(playerid)==House[h][hVirtWorld])
    	{
    		pInfo[playerid][pHouse] = h;
    		SCM(playerid, Color_LightRed, "�� ������� ��� ����� ��������� � ���� ����");
    		new query[256];
    		format(query, sizeof(query), "UPDATE `users` SET `House` = '%d' WHERE `id` = '%d' LIMIT 1", pInfo[playerid][pHouse], pInfo[playerid][pID]);
			mysql_function_query(dbHandle, query, false, "", "");
    	}
    	else
    	{
            pInfo[playerid][pHouse] = 0;
    		SCM(playerid, Color_LightRed, "����� ����� ��������� - �����");
		}
    }
    return 1;
}

CMD:admins(playerid)
{
    new string[80];
   	SCM(playerid, Color_LightRed, "������������� � ����:");
	new drank[30];
	foreach (Player, i)
	{
	if(pInfo[i][pAdmin] >= 1 && pInfo[i][pAdmin] < 9)
	{
		switch(pInfo[i][pAdmin])
		{
			case 1: { drank = "{FFB700}������"; }
			case 2: { drank = "{FFB700}��.������"; }
			case 3: { drank = "{FFB700}���������"; }
			case 4: { drank = "{FFB700}��.���������"; }
			case 5: { drank = "{0EC62C}�������������"; }
			case 6: { drank = "{0EC62C}������� �������������"; }
			case 7: { drank = "{FF0A0A}������� �������������"; }
			case 8: { drank = "{FF0A0A}����������"; }
		}
		format(string, sizeof(string), "�����: %s[%i] ������: %s",GetName(i),i,drank);
		SCM(playerid, -1, string);
		}
	}
	return true;
}
CMD:help(playerid, params[])
{
        SPD(playerid, 8010, DIALOG_STYLE_LIST, "������ �� �������", "���������� ��������\n������ ������\n������������", "��", "�������");
        return 1;
}
ALTX:help("/mm", "/mn", "/menu");
CMD:ban(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
	if(pInfo[playerid][pAdmin] < 4) return 1;
	if(sscanf(params, "ddS()[26]", params[0], params[1], params[2])) return SCM(playerid, Color_Grey, "�����������: /ban [id] [����] [�������]");
	if(login_check{playerid} == false) return SCM(playerid, Color_Grey, "����� �� �����������");
	if(params[1] < 1 || params[1] > 60) return SCM(playerid, Color_Grey, "���� ���� �� 1 �� 60 ����");
	if(pInfo[params[0]][pAdmin] > 0 && GetPVarInt(playerid, "noban") == 0)
	{
		SetPVarInt(playerid, "noban", 1);
		SCM(playerid, Color_Orange, "�� ����������� �������� �������������� �������. ����� ���������� ������� ������� ��� ���");
		return 1;
	}
	new string[230];
	if(!strlen(params[2]))
	{
		format(string, sizeof(string), "������������� %s ������� ������ %s �� %d ����.", pInfo[playerid][pName], pInfo[params[0]][pName], params[1]);
	}
	else
	{
		format(string, sizeof(string), "������������� %s ������� ������ %s �� %d ����. �������: %s", pInfo[playerid][pName], pInfo[params[0]][pName], params[1], params[2]);
 	}
  	SCMTA(Color_Red, string);
	new dialog[310];
	new Year, Month, Day;
	getdate(Year, Month, Day);
	new monthname[9];
	switch(Month)
	{
	    case 1: monthname = "������";
	    case 2: monthname = "�������";
	    case 3: monthname = "�����";
	    case 4: monthname = "������";
	    case 5: monthname = "���";
	    case 6: monthname = "����";
	    case 7: monthname = "����";
	    case 8: monthname = "�������";
	    case 9: monthname = "��������";
	    case 10: monthname = "�������";
	    case 11: monthname = "������";
	    case 12: monthname = "�������";
	}
	new unban = gettime() + 86400*params[1];
	new Hour, Minute, Second;
	gettime(Hour, Minute, Second);
	new query[278];
	if(pInfo[params[0]][pAdmin] != 0)
	{
		pInfo[playerid][pAdmin] = 0;
		format(query, sizeof(query), "UPDATE `users` SET `Admin` = '0' WHERE `id` = '%d' LIMIT 1", pInfo[playerid][pID]);
		mysql_function_query(dbHandle, query, false, "", "");

	}
	new banip[16];
	GetPlayerIp(params[0], banip, 16);
	format(query, sizeof(query), "INSERT INTO `bans` (`name`, `bandate`, `unbandate`, `bantime`, `admin`, `reason`, `ipban`, `idacc`) VALUES ('%s', '%d-%02d-%02d', '%d', '%02d:%02d:%02d', '%s', '%s', '%s', '%d')", pInfo[params[0]][pName], Year, Month, Day, unban, Hour, Minute, Second, pInfo[playerid][pName], params[2], banip, pInfo[params[0]][pID]);
	mysql_function_query(dbHandle, query, false, "", "");
    format(dialog, sizeof(dialog), "{FFFFFF}����: %02d %s %d �.\n��� ���: %s\n��� ��������������: %s.\n���������� ����: %d\n�������: %s\n\n{b0ef71}���� �� �� �������� � ����������, �������� �������� (F8)\n� �������� ������ �� ������ sailonio-rp.ru/forum", Day, monthname, Year, pInfo[params[0]][pName], pInfo[playerid][pName], params[1], params[2]);
    SPD(params[0], 89, DIALOG_STYLE_MSGBOX, "{dd605f}��� ��������", dialog, "�������", "");
	Kick(params[0]);
	return 1;
}
ALTX:engine("/en");
CMD:engine(playerid)
{
	a__engine(playerid);
}

CMD:lights(playerid)
{
	a__lights(playerid);
}

CMD:bonnet(playerid)
{
    a__bonnet(playerid);
}

CMD:boot(playerid)
{
    a__boot(playerid);
}

stock a__stats(playerid)
{
    new sex[10];
    switch(pInfo[playerid][pSex])
	{
		case 1: { sex = "�������"; }
		case 2: { sex = "�������"; }
	}
	new rassa[15];
    switch(pInfo[playerid][pNations])
	{
		case 1: { rassa = "����������"; }
		case 2: { rassa = "������"; }
		case 3: { rassa = "���������"; }
		case 4: { rassa = "����������"; }
		case 5: { rassa = "�������"; }
		case 6: { rassa = "��������"; }
		case 7: { rassa = "����������"; }
		case 8: { rassa = "������"; }
	}
	new money = pInfo[playerid][pMoney];
	new lvl = pInfo[playerid][pLevel];
	new skin = pInfo[playerid][pSkin];
	new alvl = pInfo[playerid][pAdmin];
	new hspawn = pInfo[playerid][pHouse];
	new adlogin = pInfo[playerid][pAlogin];
	new playercar = pInfo[playerid][pCar];
	new playercarid = pInfo[playerid][pCarID];
	new prank = pInfo[playerid][pRank];
	new pmember = pInfo[playerid][pMember];
    new string[1024];
    new msg[] = "{FFFF00}���: {FFFFFF}%s\n{FFFF00}�������: {FFFFFF}%i\n{FFFF00}���: {FFFFFF}%s\n{FFFF00}����� ������: {FFFFFF}#%i\n{FFFF00}��������������: {FFFFFF}%s\n\n\n{FFFF00}��������� �����: {FFFFFF}%i\n\nAdmin lvl: %i\n���� �����-����: %i\nAlogin: %i\n���������: %d\nID ����������: %d";
	format(string, sizeof(string), msg, GetName(playerid),lvl, sex, skin, rassa, money, alvl, hspawn, adlogin, playercar, playercarid);
    SPD(playerid, 8712487124781, DIALOG_STYLE_MSGBOX, "���������� ��������", string, "�������", "");
	return 1;
}

CMD:stats(playerid)
{
    a__stats(playerid);
}
CMD:me(playerid, params[])
{
    if(pInfo[playerid][pMute] > 0)
	{
	    SCM(playerid, 0xDF5402FF, "�� �� ������ ������������ ���");
	 	return 1;
	}
    if(sscanf(params, "s[100]", params[0])) return SCM(playerid, Color_Grey, "������� /me [���������]");
    new string[156];
	format(string, sizeof(string), "%s %s", pInfo[playerid][pName], params[0]);
	ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
	return 1;
}
CMD:do(playerid, params[])
{
    if(pInfo[playerid][pMute] > 0)
	{
	    SCM(playerid, 0xDF5402FF, "�� �� ������ ������������ ���");
	 	return 1;
	}
    if(sscanf(params, "s[100]", params[0])) return SCM(playerid, Color_Grey, "������� /do [���������]");
    new string[160];
	format(string, sizeof(string), "%s | (%s)", params[0], pInfo[playerid][pName]);
	ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
	return 1;
}
CMD:try(playerid, params[])
{
    if(pInfo[playerid][pMute] > 0)
	{
	    SCM(playerid, 0xDF5402FF, "�� �� ������ ������������ ���");
	 	return 1;
	}
    if(sscanf(params, "s[82]", params[0])) return SCM(playerid, Color_Grey, "������� /try [���������]");
    new string[128];
    switch(random(2))
    {
        case 0:
        {
            format(string, sizeof(string), "%s %s | {FF6600}��������", pInfo[playerid][pName], params[0]);
        }
        case 1:
        {
        	format(string, sizeof(string), "%s %s | {66CC00}������", pInfo[playerid][pName], params[0]);
        }
    }
	ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
	return 1;
}
CMD:s(playerid, params[])
{
    if(pInfo[playerid][pMute] > 0)
	{
	    SCM(playerid, 0xDF5402FF, "�� �� ������ ������������ ���");
	 	return 1;
	}
	//if(pInfo[playerid][pLevel] < 2) return SCM(playerid, Color_LightGrey, "���� ����� ������������ �� 2 ������");
    if(sscanf(params, "s[87]", params[0])) return SCM(playerid, Color_LightGrey, "�����������: /s [�����]");
    new string[128];
    format(string, sizeof(string), "%s[%d] �������: %s", pInfo[playerid][pName], playerid, params[0]);
	ProxDetector(60.0, playerid, string, Color_White, Color_White, Color_White, Color_White, Color_White);
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) { ApplyAnimation(playerid,"ON_LOOKERS","shout_01",6000.9,0,0,0,0,0,1); }
	return 1;
}
CMD:goto(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    if(pInfo[playerid][pAdmin] < 3) return 1;
    if(sscanf(params, "d", params[0])) return SCM(playerid, Color_Grey, "�����������: /goto [id]");
    if (!IsPlayerConnected(params[0])) return SCM(playerid, Color_Grey, "������ ��� �� �������");
    new Float:tpx, Float:tpy, Float:tpz;
    GetPlayerPos(params[0], tpx, tpy, tpz);
    new vw = GetPlayerVirtualWorld(params[0]);
    new pi = GetPlayerInterior(params[0]);
    SetPlayerPos(playerid, tpx+1.0, tpy+1.0, tpz);
    SetPlayerVirtualWorld(playerid, vw);
    SetPlayerInterior(playerid, pi);
	GameTextForPlayer(playerid, "TELEPORT", 1000, 3);
    return 1;
}

CMD:gethere(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    if(pInfo[playerid][pAdmin] < 3) return 1;
    if(sscanf(params, "d", params[0])) return SCM(playerid, Color_Grey, "�����������: /gethere [id]");
    if (!IsPlayerConnected(params[0])) return SCM(playerid, Color_Grey, "������ ��� �� �������");
    new Float:tpx, Float:tpy, Float:tpz;
    GetPlayerPos(playerid, tpx, tpy, tpz);
    new vw = GetPlayerVirtualWorld(playerid);
    new pi = GetPlayerInterior(playerid);
    SetPlayerPos(params[0], tpx+1.0, tpy+1.0, tpz);
    SetPlayerVirtualWorld(params[0], vw);
    SetPlayerInterior(params[0], pi);
	GameTextForPlayer(params[0], "TELEPORT", 1000, 3);
    return 1;
}

CMD:msg(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
	new string[256];
	if(pInfo[playerid][pAdmin] < 6) return 1;
	if(sscanf(params, "s", params[0])) return SCM(playerid, Color_Red, "�����������: /msg [�����], ����� ���������� �������");
	format(string, sizeof(string), "������������� %s[%d]: %s", pInfo[playerid][pName], playerid, params[0]);
	SCMTA(Color_Orange, string);
	//if(pInfo[playerid][pAdmin] > 1) || if(pInfo[playerid][pAdmin] < 6) return SCM(playerid, Color_Red, "�������� ������ � 6 ������");
	return 1;
}

CMD:a(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
	new string[256];
	if(pInfo[playerid][pAdmin] < 1) return 1;
	if(sscanf(params, "s", params[0])) return SCM(playerid, Color_Red, "�����������: /a [�����], ��� ������������� �����-����");
	format(string, sizeof(string), "[ADMIN-CHAT] %s[%d]: %s", pInfo[playerid][pName], playerid, params[0]);
	SAM(Color_Orange, string, 1);
	return 1;
}

CMD:kick(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
	new string[128];
	if(pInfo[playerid][pAdmin] < 3) return 1;
	if(sscanf(params, "us", params[0], params[1])) return SCM(playerid, Color_Red, "�����������: /kick [id] [�������]");
	format(string, sizeof(string), "������������� %s ������ ������ %s. �������: %s", pInfo[playerid][pName], GetName(params[0]), params[1]);
	SCMTA(Color_Red, string);
	Kick(params[0]);
	return 1;
}

CMD:skick(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    new string[128];
	if(pInfo[playerid][pAdmin] < 3) return 1;
	if(sscanf(params, "us", params[0], params[1])) return SCM(playerid, Color_Red, "�����������: /skick [id] [�������]");
	format(string, sizeof(string), "������������� %s ������ ������ %s. �������: %s", pInfo[playerid][pName], GetName(params[0]), params[1]);
	SAM(Color_Red, string, 3);
	Kick(params[0]);
	return 1;
}

CMD:createhouse(playerid)
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    if(pInfo[playerid][pAdmin] < 1) return SCM(playerid, -1, "�� �� ������ ������������ ���!"); // �������� �� ������
	ShowPlayerDialog(playerid,D_H_CREATE_DESC,DIALOG_STYLE_INPUT,"�������� ���� - ��������","������� �������� ��� ����.","�����","�������"); // ������� ������
	return 1;
}

CMD:ahlock(playerid)
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    if(pInfo[playerid][pAdmin] < 1) return SCM(playerid, -1, "�� �� ������ ������������ ���!"); // �������� �� ������
	for(new h=1;h<=m_h;h++) // ��������� ����
	{
		if(!IsPlayerInRangeOfPoint(playerid,1.5,House[h][hX],House[h][hY],House[h][hZ]))continue; // ������, ����� �� ����� ����� � ����� �� ����� ��� ��� (���� ���, ���������� ���������� continue)
		if(House[h][hLock]==1)House[h][hLock]=0,GameTextForPlayer(playerid,"~g~House unlocked",100,1); // ���� ����� ���� ������ - ���������
		else House[h][hLock]=1,GameTextForPlayer(playerid,"~r~House locked",100,1); // ���� ������ - ���������
		SaveHouse(h); // ��������� ���
		return 1;
	}
	return 1;
}

CMD:veh(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    if(pInfo[playerid][pAdmin] < 1) return 1;
    if(sscanf(params, !"d", params[0])) return SendClientMessage(playerid, -1, "����������� /veh [id]");
    if(params[0] < 400 && params[0] > 611) return SendClientMessage(playerid, -1, "������������ id ����������");
    new Float: p[3];
    GetPlayerPos(playerid,p[0],p[1],p[2]);
    adminCar[playerid] = GetPlayerVehicleID(playerid);
    DestroyVehicle(adminCar[playerid]);
    adminCar[playerid] = CreateVehicle(params[0], p[0],p[1],p[2], 82.2873, -1, -1, -1, 0);
    SetVehicleNumberPlate(adminCar[playerid], "ADMIN CAR");
    PutPlayerInVehicle(playerid, adminCar[playerid], 0);
    return 1;
}

CMD:setskin(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    new string[144]; // ���������� ���  ��������������
    if(pInfo[playerid][pAdmin] < 1) return SCM(playerid, -1, "�� �� ������ ������������ ���!"); // �������� �� ������
    if(sscanf(params, "dd", params[0], params[1])) return SCM(playerid, -1, "/setskin [id] [id �����]"); //���� �� ��� ���������
    if(!IsPlayerConnected(params[0])) return SCM(playerid, -1, "������ ��� �� �������!"); // ���� ������ ��� �� �������
    if(params[1] > 311 || params[1] <1) return SCM(playerid, -1, "������ ����� ����!"); //�������� �� ����
    pInfo[params[0]][pSkin] = params[1];
    SetPlayerSkin(params[0], params[1]); // ��������� �����
    format(string, sizeof(string), "������������� %s ����� ��� ����! �����: #%i", pInfo[playerid][pName], params[1]); // ����������� ���������
    SCM(params[0], -1, string); // ��� ��� ����
    return 1;
}
CMD:skin(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    new string[144]; // ���������� ���  ��������������
    if(pInfo[playerid][pAdmin] < 1) return SCM(playerid, -1, "�� �� ������ ������������ ���!"); // �������� �� ������
    if(sscanf(params, "dd", params[0], params[1])) return SCM(playerid, -1, "/skin [id] [id �����]"); //���� �� ��� ���������
    if(!IsPlayerConnected(params[0])) return SCM(playerid, -1, "������ ��� �� �������!"); // ���� ������ ��� �� �������
    if(params[1] > 311 || params[1] <1) return SCM(playerid, -1, "������ ����� ����!"); //�������� �� ����
    SetPlayerSkin(params[0], params[1]); // ��������� �����
    format(string, sizeof(string), "������������� %s ����� ��� ��������� ����! �����: #%i", pInfo[playerid][pName], params[1]); // ����������� ���������
    SCM(params[0], -1, string); // ��� ��� ����
    return 1;
}
ALTX:adminzone("/az");
CMD:adminzone(playerid)
{
	if(pInfo[playerid][pAlogin] == 0) return 1;
	if(pInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, "�� �� ������ ������������ ���!"); // ���� �������� �� �������
	TeleportCam(playerid, 1, -729.276000,503.086944,1371.971801, 71.2003);
	SetPlayerInterior(playerid, 1);
	SetPlayerVirtualWorld(playerid, 69);
	return 1;
}

CMD:alogin(playerid)
{
    if(pInfo[playerid][pAdmin] < 1) return 1;
	if(pInfo[playerid][pAlogin] == 1) return 1;
    ShowPlayerDialog(playerid,D_ALOGIN,DIALOG_STYLE_INPUT, "{FF0000}����� �����������", "������� ������, ����� �������������� � ������� ��������������", "����", "������");
	return 1;
}

ALTX:report("/ask", "/rep");
CMD:report(playerid)
{
    ShowPlayerDialog(playerid,D_REPORT,DIALOG_STYLE_INPUT, "������", "��������� ������, �� �������� ������� id(����������������� �����) ������", "���������", "������");
	return 1;
}

CMD:vkmsg(playerid, params[])
{
	if(pInfo[playerid][pAdmin] < 8) return 1;
	if(sscanf(params, "s", params[0])) return SCM(playerid, -1,"������� ���������!");
	//new admlvl = pInfo[pAdmin]
	new vkmsg[256];
	format(vkmsg, sizeof(vkmsg), "[������������� %i ������ %s]%s", pInfo[playerid][pAdmin], GetName(playerid), params[0]);
	HTTP(playerid, HTTP_POST, "https://api.vk.com/method/messages.send?v=5.101&random_id=1057385&access_token=ACCESS_TOKEN&peer_id=PEER_ID&message=vkmsg", "", "");
	return 1;
}

CMD:spawn(playerid)
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    if(pInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, "�� �� ������ ������������ ���!"); // ���� �������� �� �������
    SpawnPlayer(playerid);
    return 1;
}

CMD:tpcor(playerid,params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    if(pInfo[playerid][pAdmin] < 1) return true;
    new Float:px,Float:py,Float:pz,string[128];
    if(sscanf(params,"p<,>fff",px,py,pz)) return SendClientMessage(playerid, -1, "�������: /tpcor <x,y,z>");
    if (GetPlayerState(playerid) == 2) SetVehiclePos(GetPVarInt(playerid,"VehicleEnters"), px, py, pz);
        else SetPlayerPos(playerid, px, py, pz);
    format(string, sizeof(string), "�� ���� ��������������� {FFFFFF}X:%f, Y:%f, Z:%f",px,py,pz);
    SendClientMessage(playerid, -1, string);
    return 1;
}

CMD:debug(playerid)
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
	new string[256];
	format(string, sizeof(string), "��� ������: %s. ���������� ����: X:%f, Y:%f, Z:%f. ������������� ������: %s", pInfo[playerid][pApass], pInfo[playerid][pCarX], pInfo[playerid][pCarY], pInfo[playerid][pCarZ], pInfo[playerid][pCarNumber]);
	SCM(playerid, -1, string);
	return 1;
}

CMD:pnumber(playerid)
{
	new string[12] = "11-";
	new msg[64];
	strins(string, GenerateNumbers(5), 3);
	format(msg, sizeof(msg), "����� ��������: %s", string);
	SCM(playerid, -1, msg);
}

CMD:park(playerid)
{
	new carid = GetPlayerVehicleID(playerid);
	if(carid != pInfo[playerid][pCarID]) return SCM(playerid, Color_LightRed, "�� ������ ���������� � ������ ����������.");
	new Float:X,Float:Y,Float:Z,Float:Angle;
	GetVehicleZAngle(carid, Angle);
	GetVehiclePos(carid, X, Y, Z);
	pInfo[playerid][pCarX] = X;
	pInfo[playerid][pCarY] = Y;
	pInfo[playerid][pCarZ] = Z;
	pInfo[playerid][pCarAngel] = Angle;
	SCM(playerid, Color_Orange, "�� ������������ ���� ������������ �������� �� ����� �����.");
	return 1;
}

CMD:makeadmin(playerid, params[])
{
	new string[110];
	if(pInfo[playerid][pAlogin] == 0) return 1;
	if(pInfo[playerid][pAdmin] < 8) return 1;
	if(params[0] < 1 && params[0] > 7) return SendClientMessage(playerid, -1, "������������ �������!");
    if(sscanf(params, "dd", params[0], params[1])) return SCM(playerid, -1, "/makeadmin [id ������] [������� �������]");
    if(!IsPlayerConnected(params[0])) return SCM(playerid, -1, "������ ��� �� �������!");
    pInfo[params[0]][pAdmin] = params[1];
    new lengthpass = strmid(pInfo[playerid][pApass], GeneratePassword(6), 0, 10, 32);
    format(string, sizeof(string), "������ ��� ������� � ����� �����������: %s.����������� ��������� ���.", pInfo[playerid][pApass]);
    SCM(params[0], Color_Orange, string);
    format(string, sizeof(string), "������������� %s[%d] �������� %s[%d] ���������������[%d ������]", GetName(playerid), playerid, GetName(params[0]), params[0], params[1]);
    SAM(Color_Red, string, 1);
    return 1;
}

CMD:givemoney(playerid, params[])
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    new string[144]; // ���������� ���  ��������������
    if(pInfo[playerid][pAdmin] < 1) return SCM(playerid, -1, "�� �� ������ ������������ ���!"); // �������� �� ������
    if(sscanf(params, "dd", params[0], params[1])) return SCM(playerid, -1, "/givemoney [id] [�����]"); //���� �� ��� ���������
    if(!IsPlayerConnected(params[0])) return SCM(playerid, -1, "������ ��� �� �������!"); // ���� ������ ��� �� �������
    pInfo[params[0]][pMoney] += params[1];
    format(string, sizeof(string), "������������� %s ����� ��� ������ � ���������� %i$", pInfo[playerid][pName], params[1]); // ����������� ���������
    SCM(params[0], Color_Blue, string); // ��� ��� ����
    SCM(playerid, Color_Blue, "�������� �������!"); // ��� ��� ����
    return 1;
}

CMD:re(playerid, params[])
{
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid, 0xCC0000FF, "[���������]: {FFFFFF}/re [ID ������]"); // �������� �� ��������� �������.
 	if(!IsPlayerConnected(params[0]))return SendClientMessage(playerid, 0xCECECEFF, "����� �� � ����."); // ��������, � ���� �� �����?

	if(GetPVarInt(playerid, "SET_ADM_POS") == 0) // �������� �� PVAR set_adm_pos, ������ � return SetPVarInt(playerid, "SET_ADM_POS", 1);
	{
		new Float: reX, Float: reY, Float: reZ, Float: reA;
		GetPlayerPos(playerid, reX, reY, reZ);
		GetPlayerFacingAngle(playerid, reA);

		SetPVarFloat(playerid, "re_X", reX);
		SetPVarFloat(playerid, "re_Y", reY);
		SetPVarFloat(playerid, "re_Z", reZ);
		SetPVarFloat(playerid, "re_A", reA);

		SetPVarInt(playerid, "re_int", GetPlayerInterior(params[0]));
		SetPVarInt(playerid, "re_virt", GetPlayerVirtualWorld(params[0])); // �� � ��� �����������, ������� ���� PVAR � ���������� ������ ������ �� ������� �����, � ����� ��������� � ����.����.
	}
	TogglePlayerSpectating(playerid, true);

	SetPlayerInterior(playerid, GetPlayerInterior(params[0])); // ������������� ������ �������� ������.
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(params[0])); // ������������� ������� ����.��� ������.

	if(IsPlayerInAnyVehicle(params[0]))
 	{
		PlayerSpectateVehicle(playerid, GetPlayerVehicleID(params[0]), 1);
	}
	else
	{
		PlayerSpectatePlayer(playerid, params[0], 1);
	}
	return SetPVarInt(playerid, "SET_ADM_POS", 1); // ������������� PVAR set_adm_pos ��� ����, ����� ��� ����������� �� ������ ���������� �� ��������.
}

CMD:reoff(playerid, params[])
{
    if(GetPVarInt(playerid, "SET_ADM_POS") == 0) return 1;
    TogglePlayerSpectating(playerid, false);

	return OnPlayerSpawn(playerid);
}

CMD:god(playerid)
{
    if(pInfo[playerid][pAlogin] == 0) return 1;
    if(pInfo[playerid][pAdmin] < 2 || pInfo[playerid][pAlogin] == 0) return true; // ��� �������� �� �������
    if(GetPVarInt(playerid,"agm") == 0)
    {
        SetPVarInt(playerid,"agm", 1);
        SetPlayerHealth(playerid, 0x7F800000);
        SendClientMessage(playerid, Color_Red, "AGM ON");
    }
    else
    {
        SetPVarInt(playerid,"agm", 0);
        SetPlayerHealth(playerid, 100.0);
        SendClientMessage(playerid, Color_Red, "AGM OFF");
    }
    return 1;
}

CMD:maptp(playerid)
{
	if(pInfo[playerid][pAdmin] < 2) return 1;
    if(GetPVarInt(playerid,"maptp") == 0)
    {
        SetPVarInt(playerid,"maptp", 1);
        SendClientMessage(playerid, Color_Red, "�������� �� ������� ����ר�");
    }
    else
    {
        SetPVarInt(playerid,"maptp", 0);
        SendClientMessage(playerid, Color_Red, "�������� �� ������� ��������");
	}
	return 1;
}

CMD:cnumber(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid,6.0,1778.7946,-1705.1389,13.5226)) return 1;
    SPD(playerid, D_CARNUMBER, DSM, "����������� ����� �������� ������", "�� ������������� ������ ������� �������� ����� �� ���� ������������ ��������?\n�� ��������� �/� ������ ����� �� ������������.\n����� ������� ����� ������ 15.000$\n\n��� ������� ������ ������ ���������.", "��", "������");
    return 1;
}

CMD:fixcar(playerid)
{
	if(pInfo[playerid][pMoney] < 100) return SCM(playerid, Color_Orange, "��������� ���������� ������ ���������� ���������� 100$");
	SpawnPlayerCar(playerid);
	return 1;
}

CMD:lock(playerid)
{
    new Float:cx,Float:cy,Float:cz;
	GetVehiclePos(PlayerVehicle, cx, cy, cz);
	if(IsPlayerInRangeOfPoint(playerid, 4.0,cx, cy, cz) )
	{
		if(pInfo[playerid][pCarID] == PlayerVehicle)
		{
			GetVehicleParamsEx(PlayerVehicle, engine, lights, alarm, doors, bonnet, boot, objective);
			if(doors != VEHICLE_PARAMS_ON)
			{
				SetVehicleParamsEx(PlayerVehicle,engine,lights,alarm,1,bonnet,boot,objective);
				GameTextForPlayer(playerid, Rus("~w~������ ~r~�������"), 5000, 3);
				PlayerPlaySound(playerid, 24600, 0.0, 0.0, 0.0);
				new string[50];
				format(string, sizeof(string), "%s ������ ������ ���������", pInfo[playerid][pName]);
				ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
				return true;
			}
			else
			{
				SetVehicleParamsEx(PlayerVehicle,engine,lights,alarm,0,bonnet,boot,objective);
				GameTextForPlayer(playerid, Rus("~w~������ ~g~�������"), 5000, 3);
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
				new string[50];
				format(string, sizeof(string), "%s ������ ������ ���������", pInfo[playerid][pName]);
				ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
				return true;
			}
		}
		return true;
	}
	else
	{
		SCM(playerid, -1,"����� � ���� ��� ������� ����������.");
	}
	return 1;
}

CMD:makeleader(playerid, params[])
{
	if(pInfo[playerid][pAdmin] < 8) return 1;
	if(sscanf(params, "ui", params[0], params[1])) return SCM(playerid, -1, "�������: /makeleader [id] [id �������]");
	new msg[99];
	format(msg, sizeof(msg), "[������������� %s] �������� %s ������� ������� [#%i]", GetName(playerid), GetName(params[0]), params[1]);
	SAM(Color_LightRed, msg, 1);
	return 1;
}

stock GeneratePassword(size)
{
	new
	bigletters[26][] = {"A", "B", "C", "D", "E", "F", "G", "H", "H", "J", "K", "K", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"},
	smallletters[26][] = {"a", "b", "c", "d", "e", "f", "g", "h", "h", "j", "k", "k", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"},
	numbers[10][] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"},
	password[128];
	if(size > sizeof(password)) size = sizeof(password);
	for(new i = 0; i < size; i ++)
	{
		switch(random(3))
		{
		case 0: strcat(password, bigletters[random(sizeof(bigletters))]);
		case 1: strcat(password, smallletters[random(sizeof(smallletters))]);
		case 2: strcat(password, numbers[random(sizeof(numbers))]);
		}
	}
	return password;
}

stock GenerateNumbers(size)
{
	new
	numbers[10][] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"},
	password[128];
	if(size > sizeof(password)) size = sizeof(password);
	for(new i = 0; i < size; i ++)
	{
		strcat(password, numbers[random(sizeof(numbers))]);
	}
	return password;
}

stock Rus(string[])
{
     new result[256];
     for(new i=0; i < 256; i++) {
         switch(string[i]) {
         case '�':result[i] = 'a';
         case '�':result[i] = 'A';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = 'e';
         case '�':result[i] = 'E';
         case '�':result[i] = 'e';
         case '�':result[i] = 'E';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = 'k';
         case '�':result[i] = 'K';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = 'M';
         case '�':result[i] = '�';
         case '�':result[i] = '*';
         case '�':result[i] = 'o';
         case '�':result[i] = 'O';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = 'p';
         case '�':result[i] = 'P';
         case '�':result[i] = 'c';
         case '�':result[i] = 'C';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = 'y';
         case '�':result[i] = 'Y';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = 'x';
         case '�':result[i] = 'X';
         case '�':result[i] = '*';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         case '�':result[i] = '�';
         default:result[i]=string[i];
         }
     }
     return result;
}

stock SpawnPlayerCar(playerid)
{
    if(pInfo[playerid][pCar] != 0)
    {
        if(pInfo[playerid][pCarID] != -1)
        {
			DestroyVehicle(pInfo[playerid][pCarID]);
		}
		PlayerVehicle = CreateVehicle(pInfo[playerid][pCar], pInfo[playerid][pCarX], pInfo[playerid][pCarY], pInfo[playerid][pCarZ], pInfo[playerid][pCarAngel], pInfo[playerid][pCarColor1], pInfo[playerid][pCarColor1], -1);
		pInfo[playerid][pCarID] = PlayerVehicle;
		new carid = pInfo[playerid][pCarID];
		GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(carid, 0, 0, 0, 1, 0, 0, objective);
		SetVehicleNumberPlate(carid, pInfo[playerid][pCarNumber]);
		pInfo[playerid][pMoney] -= 1000;
	}
	else
	{
  		SCM(playerid, -1, "� ��� ��� ������� ����������");
	}
	return 1;
}

stock SpawnVehicles()
{
    //============================= ��������� ==================================
	avtcar[0] = AddStaticVehicleEx(411,1802.8579,-1302.3168,21.8156,61.6114,1,1,-1); // INFERNUS ���������
	avtcar[1] = AddStaticVehicleEx(560,1814.1281,-1298.8876,21.9158,92.7654,1,1,-1); // buysultan
	avtcar[2] = AddStaticVehicleEx(541,1815.6482,-1291.1553,21.8357,91.2184,1,1,-1); // buybullet
	avtcar[3] = AddStaticVehicleEx(555,1814.1936,-1295.0709,21.8952,87.0657,1,1,-1); // buywindsor
	avtcar[4] = AddStaticVehicleEx(554,1807.7546,-1308.5961,22.3045,89.1275,1,1,-1); // buyYosemite
	avtcar[5] = AddStaticVehicleEx(559,1813.6555,-1279.5809,21.8677,182.6010,1,1,-1); // buyjester
	avtcar[6] = AddStaticVehicleEx(562,1817.4548,-1275.8618,21.8703,181.1501,1,1,-1); // buyelegy
	avtcar[7] = AddStaticVehicleEx(565,1821.5033,-1272.8790,21.8362,176.7474,1,1,-1); // buyflash
	avtcar[8] = AddStaticVehicleEx(558,1824.9946,-1272.9017,21.8430,175.5860,1,1,-1); // buyuranus
	avtcar[9] = AddStaticVehicleEx(579,1822.0541,-1284.3063,22.1486,92.5492,1,1,-1); // buyhuntley
	avtcar[10] = AddStaticVehicleEx(581,1791.9664,-1301.9753,21.8077,308.7571,1,1,-1); // buybf400
	avtcar[11] = AddStaticVehicleEx(522,1792.4805,-1302.8329,21.7817,309.7710,1,1,-1); // buynrg500
	avtcar[12] = AddStaticVehicleEx(468,1793.3209,-1303.7745,21.8799,316.9644,1,1,-1); // buysanchez
}

stock TextLabel()
{
    opavtcar[0] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Infernus{FFFFFF}] \n����: [{FFFF00}500.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[1] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Sultan{FFFFFF}] \n����: [{FFFF00}230.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[2] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Bullet{FFFFFF}] \n����: [{FFFF00}460.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[3] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Windsor{FFFFFF}] \n����: [{FFFF00}60.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[4] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Yosemite{FFFFFF}] \n����: [{FFFF00}55.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[5] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Jester{FFFFFF}] \n����: [{FFFF00}235.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[6] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Elegy{FFFFFF}] \n����: [{FFFF00}232.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[7] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Flash{FFFFFF}] \n����: [{FFFF00}230.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[8] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Uranus{FFFFFF}] \n����: [{FFFF00}210.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[9] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Huntley{FFFFFF}] \n����: [{FFFF00}75.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[10] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}BF - 400{FFFFFF}] \n����: [{FFFF00}120.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[11] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}NRG - 500{FFFFFF}] \n����: [{FFFF00}157.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    opavtcar[12] = Create3DTextLabel("{FFFFFF}������: [{FFFF00}Sanchez{FFFFFF}] \n����: [{FFFF00}90.000{FFFFFF}]", -1, 7.77, 7.77, 7.77, 20.0, 0, 1 ); // �������� �����
    Create3DTextLabel("����� �������� ������\n����������� �������: {FFFF00}/cnumber", -1, 1778.7946,-1705.1389,13.5226, 100.0, 0, 1 ); // ������� ������� �� ����
    
}

stock PickUps()
{
	CreatePickup(1239, 1, 1778.7946,-1705.1389,13.5226, 0); // ������ �� ����������
}
