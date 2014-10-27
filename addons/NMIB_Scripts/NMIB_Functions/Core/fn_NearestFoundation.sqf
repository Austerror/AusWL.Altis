//Find nearest foundation to player within X metres
if (isNil ('NMIB_GridSlotPos')) then
{
	NMIB_NearestFoundation = ((nearestObjects [player,["iBuild_Foundation_Solid"],16]) select 0);
	NMIB_GridSlotPos = getPosASL NMIB_NearestFoundation;
	2 call NMIB_fnc_SelectModule;
};