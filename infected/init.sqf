// Infected custom init for Austerror
_path = "infected\functions";
INF_fnc_infectedzone = compileFinal preProcessFileLineNumbers format["%1\fn_infectedzone.sqf", _path];
INF_fnc_attack = compileFinal preProcessFileLineNumbers format["%1\fn_attack.sqf", _path];
INF_fnc_attacker = compileFinal preProcessFileLineNumbers format["%1\fn_attacker.sqf", _path];
INF_fnc_contact = compileFinal preProcessFileLineNumbers format["%1\fn_contact.sqf", _path];
INF_fnc_nearesttarget = compileFinal preProcessFileLineNumbers format["%1\fn_nearesttarget.sqf", _path];
INF_fnc_nextSound = compileFinal preProcessFileLineNumbers format["%1\fn_nextSound.sqf", _path];
INF_fnc_roaming = compileFinal preProcessFileLineNumbers format["%1\fn_roaming.sqf", _path];
INF_fnc_stuff = compileFinal preProcessFileLineNumbers format["%1\fn_stuff.sqf", _path];
INF_fnc_vehicle = compileFinal preProcessFileLineNumbers format["%1\fn_vehicle.sqf", _path];
INF_fnc_infectedinit = compileFinal preProcessFileLineNumbers format["%1\fn_infectedinit.sqf", _path];
INF_fnc_spawner = compileFinal preProcessFileLineNumbers format["%1\fn_spawner.sqf", _path];
INF_fnc_roam = compileFinal preProcessFileLineNumbers format["%1\fn_roam.sqf", _path];
INF_fnc_playerLeavingZone = compileFinal preProcessFileLineNumbers format["%1\fn_playerLeavingZone.sqf", _path];
INF_fnc_inithordeattacker = compileFinal preProcessFileLineNumbers format["%1\fn_inithordeattacker.sqf", _path];
INF_fnc_inithorde = compileFinal preProcessFileLineNumbers format["%1\fn_inithorde.sqf", _path];
INF_fnc_Edattack = compileFinal preProcessFileLineNumbers format["%1\fn_Edattack.sqf", _path];
INF_fnc_infecthim = compileFinal preProcessFileLineNumbers format["%1\fn_infecthim.sqf", _path];
INF_fnc_Ednearesttarget = compileFinal preProcessFileLineNumbers format["%1\fn_Ednearesttarget.sqf", _path];
INF_fnc_Edroam = compileFinal preProcessFileLineNumbers format["%1\fn_Edroam.sqf", _path];
INF_fnc_infinit = compileFinal preProcessFileLineNumbers format["%1\fn_infinit.sqf", _path];
INF_fnc_autopop = compileFinal preProcessFileLineNumbers format["%1\fn_autopop.sqf", _path];

T_INIT = false;
T_Server = false; T_Client = false; T_JIP = false;

if (playersNumber east + playersNumber west + playersNumber resistance + playersNumber civilian > 0) then { T_MP = true } else { T_MP = false };

if (isServer) then
{
	T_Server = true;
	if (!(isNull player)) then { T_Client = true };
	T_INIT = true;
} else {
	T_Client = true;
	if (isNull player) then
	{
		T_JIP = true;
		[] spawn { waitUntil { !(isNull player) }; T_INIT = true };
	} else {
		  T_INIT = true;
		};
};
/*_________________________________________________________
	Any script that has to work with the player object will have to wait until T_INIT == true
		waitUntil { T_INIT };
	SinglePlayer: !T_MP
	MultiPlayer: T_MP
	Dedicated Server: T_Server && !T_Client
	Dedicated Server or ServerClient: T_Server
	ClientOnly: T_Client && !T_Server
	Client or ServerClient: T_Client
	Client or ServerClient, NOT JIP: T_Client && !T_JIP
	JIP Client: T_JIP

if(T_Server)then
{
	_infectedZone=["Town_1","Town_2","Town_3","Town_4","Town_5","Town_6","Town_7","Town_8","Town_9","Town_10","Town_11","Town_12","Town_13","Town_14","Town_15","Town_16","Town_17","Town_18","Town_19","Town_20"]; // zones to infect
	
	{
		private ["_markName","_markPos","_mPosX","_mPosY","_mkrY","_mkrX","_detectorName","_x"];
		_markName=_x;
		_markPos=MarkerPos _markName;
		_mPosX=_markPos select 0;
		_mPosY=_markPos select 1;
		_mkrY= getmarkerSize _markName select 0;
		_mkrX= 100; // getmarkerSize _markName select 1;
		_detectorName=_x;
		//deleteMarker _x;
		_x=createTrigger["EmptyDetector",_markPos];
		//_x setTriggerArea[(_mkrX*3),(_mkrX*3),0,false];
		_x setTriggerArea[(_mkrX),(_mkrX),0,false];
		_x setTriggerActivation ["west", "PRESENT", false];
		_x setTriggerStatements ["this","thisTrigger spawn INF_fnc_autopop","thisTrigger spawn INF_fnc_playerLeavingZone;"];
		sleep 0.1;
	} forEach _infectedZone;
};
_________________________________________________________*/