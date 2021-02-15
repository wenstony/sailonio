/*
*   easyCar.inc v0.2.0
*   Инклуд упрощающий работу с машинами в сампе.   
*
*   Автор: FLUDE
*
*   CarName(vehid) - Узнать название автомобиля
*   SetVehicleNitro(vehid,type) - Установить нитро X2, X5 или X10 на машину.
*   GetVehicleSpeed(vehid) - Получить скорость машины в километрах. 
*   SetVehicleMaxSpeed(vehid, Float:speed) - Установить максимальную скорость машины.
*   IsInBike(playerid) - Проверить, находится ли игрок в мотоцикле.
*   SwitchEngine(vehid,bool:launched) - Запустить/Заглушить двигатель
*   EngineStatus(vehid) - Узнать статус двигателя
*   SwitchLights(vehid,bool:launched) - Включить/Выключить фары
*   LightsStatus(vehid) - Узнать статуc фар
*   SwitchAlarm(vehickeid,bool:launched) - Включить/Выключить сигнализацию
*   AlarmStatus(vehid) - Узнать статус сигнализации
*   SwitchDoors(vehid,bool:status) - Открыть/Закрыть двери
*   DoorsStatus(vehid) - Узнать статус дверей
*   SwitchBonnet(vehid,bool:status) - Открыть/Закрыть капот
*   BonnetStatus(vehid) - Узнать статус капота
*   SwitchBoot(vehid,bool:status) - Открыть/Закрыть багажник
*   BootStatus(vehid) - Узнать статус багажника
*/
 
// ID Нитро
#define X2  1009
#define X5  1008
#define X10 1010
 

#define SetVehicleNitro(%0,%1) AddVehicleComponent(%0,%1)
 
#define Engine(%0) SwitchEngine(%0)
#define Lights(%0) SwitchLights(%0)
#define Alarm(%0) SwitchAlarm(%0)
#define Doors(%0) SwitchDoors(%0)
#define Bonnet(%0) SwitchBonnet(%0)
#define Boot(%0) SwitchBoot(%0)
 
new engine,lights,alarm,doors,bonnet,boot,objective;
 
static const stock inc_VehicleNames[212][] = {
    "Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
    "Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection",
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
    "Police Car","Police Ranger","Picador","S.W.A.T","Alpha","Phoenix","Glendale","Sadler","L Trailer A","L Trailer B",
    "Stair Trailer","Boxville","Farm Plow","U Trailer" 
};
 
 
#define CarName(%0) inc_VehicleNames[GetVehicleModel(GetPlayerVehicleID(%0))-400]
/*
*   Получение скорости автомобиля.
*
*   @vehid - ID машины
*
*   return int
*/
stock GetVehicleSpeed(vehid,meters=0)
{
    new Float:x,Float:y,Float:z;
    GetVehicleVelocity(vehid,x,y,z);
    if meters==1 *then return floatround(floatsqroot(x*x+y*y+z*z)*180);         
    else return floatround(floatsqroot(x*x+y*y+z*z)*180/1.609344); 
}
 
/*
*   Установка макисимальной скорости для машины 
*   Автор: AustinJ
*
*   @vehid - ID машины
*   @mph - Скорость
*/
stock SetVehicleMaxSpeed(vehid, Float:speed)
{
    new Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2, Float:a;
    GetVehicleVelocity(vehid,x1,y1,z1);
    GetVehiclePos(vehid,x2,y2,z2);
    GetVehicleZAngle(vehid,a); a=360-a;
    x1=(floatsin(a,degrees)*(speed/100)+floatcos(a,degrees)*0+x2)-x2;
    y1=(floatcos(a,degrees)*(speed/100)+floatsin(a,degrees)*0+y2)-y2;
    SetVehicleVelocity(vehid,x1,y1,z1);
}
 
/*
*   Проверка, находится ли игрок в мотоцикле
*
*   @playerid - ID игрока
*
*   return bool
*/
stock IsInBike(playerid)
{
    new vehid = GetPlayervehid(playerid);
    (vehid==461||vehid==462||vehid==463||vehid==468||vehid==471||vehid==521||vehid==522||vehid==523||vehid==581||vehid==586) ? return true : return false;
}
 
/*
*   Запустить/Заглушить двигатель
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*   @lauched - 1 включить, 0 заглушить
*
*   return bool
*/
stock SwitchEngine(vehid,bool:launched) 
{       
    return launched ? SetVehicleParamsEx(vehid, VEHICLE_PARAMS_ON, -1, -1, -1, -1, -1, -1) : SetVehicleParamsEx(vehid, VEHICLE_PARAMS_OFF, -1, -1, -1, -1, -1, -1);
} 
 
/*
*   Узнать статус двигателя
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*
*   return bool
*/
stock EngineStatus(vehid) 
{ 
    GetVehicleParamsEx(vehid,engine,lights,alarm,doors,bonnet,boot,objective); 
    return engine; 
} 
 
/*
*   Включить/Выключить фары
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*   @lauched - 1 включить, 0 выключить
*
*   return bool
*/
stock SwitchLights(vehid,bool:launched) 
{
    return launched ? SetVehicleParamsEx(vehid, -1,VEHICLE_PARAMS_ON, -1, -1, -1, -1, -1) : SetVehicleParamsEx(vehid, -1,VEHICLE_PARAMS_OFF, -1, -1, -1, -1, -1);
} 
 
/*
*   Узнать статус фар
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*
*   return bool
*/
stock LightsStatus(vehid) 
{ 
    GetVehicleParamsEx(vehid,engine,lights,alarm,doors,bonnet,boot,objective); 
    return lights; 
} 
 
/*
*   Включить/Выключить сигнализацию
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*   @lauched - 1 включить, 0 выключить
*
*   return bool
*/
stock SwitchAlarm(vehickeid,bool:launched) 
{
    return launched ? SetVehicleParamsEx(vehid, -1,-1, VEHICLE_PARAMS_ON, -1, -1, -1, -1) : SetVehicleParamsEx(vehid, -1,-1, VEHICLE_PARAMS_OFF, -1, -1, -1, -1);
} 
 
/*
*   Узнать статус сигнализации
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*
*   return bool
*/
stock AlarmStatus(vehid) 
{ 
    GetVehicleParamsEx(vehid,engine,lights,alarm,doors,bonnet,boot,objective); 
    return alarm; 
} 
 
/*
*   Открыть/Закрыть двери
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*   @lauched - 1 открыть, 0 закрыть
*
*   return bool
*/
stock SwitchDoors(vehid,bool:status) 
{
    return status ? SetVehicleParamsEx(vehid, -1,-1,-1,VEHICLE_PARAMS_ON, -1, -1, -1) : SetVehicleParamsEx(vehid, -1,-1,-1,VEHICLE_PARAMS_OFF, -1, -1, -1);
} 
 
/*
*   Узнать статус дверей
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*
*   return bool
*/
stock DoorsStatus(vehid)  
{ 
    GetVehicleParamsEx(vehid,engine,lights,alarm,doors,bonnet,boot,objective); 
    return doors; 
} 
 
/*
*   Открыть/Закрыть капот
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*   @lauched - 1 открыть, 0 закрыть
*
*   return bool
*/
stock SwitchBonnet(vehid,bool:status) 
{
    return status ? SetVehicleParamsEx(vehid, -1,-1,-1,-1,VEHICLE_PARAMS_ON, -1, -1) : SetVehicleParamsEx(vehid, -1,-1,-1,-1,VEHICLE_PARAMS_OFF, -1, -1);
}
 
/*
*   Узнать статус капота
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*
*   return bool
*/
stock BonnetStatus(vehid)  
{ 
    GetVehicleParamsEx(vehid,engine,lights,alarm,doors,bonnet,boot,objective); 
    return bonnet; 
} 
 
/*
*   Открыть/Закрыть багажник
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*   @lauched - 1 открыть, 0 закрыть
*
*   return bool
*/
stock SwitchBoot(vehid,bool:status) 
{
    return status ? SetVehicleParamsEx(vehid, -1,-1,-1,-1,-1,VEHICLE_PARAMS_ON, -1) : SetVehicleParamsEx(vehid, -1,-1,-1,-1,-1,VEHICLE_PARAMS_OFF, -1);
} 
 
/*
*   Узнать статус багажника
*   Автор: n01ze Virtual1ty
*
*   @vehid - ID машины
*
*   return bool
*/
stock BootStatus(vehid)  
{ 
    GetVehicleParamsEx(vehid,engine,lights,alarm,doors,bonnet,boot,objective); 
    return boot; 
}