// Action Menu Use Austerror Custom Item

#define ERR_MUTEX_LOCKED localize "STR_WL_Errors_InProgress"
#define MUTEX_LOCK_OR_FAIL \
	if mutexScriptInProgress exitWith {hint ERR_MUTEX_LOCKED;}; \
    mutexScriptInProgress = true;
#define MUTEX_UNLOCK mutexScriptInProgress = false; doCancelAction = false

private ["_id","_item", "_remove"];
_id = _this;
_item = _id call mf_inventory_get;

MUTEX_LOCK_OR_FAIL;
_remove = call (_item select USE);
if _remove then {[_id, 1] call mf_inventory_remove};
MUTEX_UNLOCK;