private ["_UA1","_UA2"];

// Detect if player has bound keys for iBuild actions
_UA1 = "- Press ~ to toggle iBuild on/off.";
_UA2 = "- Hold TAB to construct module.";
_Text = parseText format['<t>Controls:<br/>%1<br/>- Press 1-6 to select module.<br/>%2</t>',_UA1,_UA2];
((uiNamespace getVariable 'NMIB_HUD') displayCtrl 666333) ctrlSetStructuredText (_Text);

// Hide iBuild cross-hair if player has weapon
if (currentWeapon player != "") then {((uiNamespace getVariable 'NMIB_HUD') displayCtrl 6633) ctrlShow false};

// Display and update construction progress bar
if (NMIB_BuildTime > 0) then
{
	_Display = (uiNamespace getVariable 'NMIB_HUD');
	
	_PBWidth = NMIB_BuildProgress/2;

	_ProgressPos = ctrlPosition (_Display displayCtrl 1203);
	
	_X = ((0.5-(_PBWidth/2)) * safezoneW + safezoneX);
	_Y = (_ProgressPos select 1);
	_W = (_PBWidth * safezoneW);
	_H = (_ProgressPos select 3);
	
	(_Display displayCtrl 1203) ctrlSetPosition [_X,_Y,_W,_H];
	(_Display displayCtrl 1203) ctrlSetBackgroundColor [1-NMIB_BuildProgress,0+NMIB_BuildProgress,0,0.5];
	(_Display displayCtrl 1203) ctrlCommit 0;
} else {
	//NMIB_BuildProgress = 0;
	
	// Update HUD to display currently selected module name
	((uiNamespace getVariable 'NMIB_HUD') displayCtrl 1201) ctrlSetText NMIB_ModuleName;
};