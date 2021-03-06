/*
	To return array of keys on the players toolbelt and inside a (valid) backpack:
	_result = call epoch_tempKeys;
	Returns array: [["11148","1457"],["Black Key (2eb5)","Green Key (9c30)"],["ItemKeyBlack1148","ItemKeyGreen1457"]]
*/

private ["_temp_keys","_temp_keys_names","_ownerKeyId","_ownerKeyName","_items","_temp_keys_class"];

_temp_keys = [];
_temp_keys_names = [];
_temp_keys_class = [];
_items = items player;
dayz_myBackpack = unitBackpack player;

if (!isNull dayz_myBackpack) then {
	_items = _items + ((getWeaponCargo dayz_myBackpack) select 0);
};

{
	if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in DZE_itemKeys) then {
		_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
		_ownerKeyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
		_temp_keys_names set [count _temp_keys_names,_ownerKeyName];
		_temp_keys set [count _temp_keys,str _ownerKeyId];
		_temp_keys_class set [count _temp_keys_class,_x];
	};
} count _items;

[_temp_keys,_temp_keys_names,_temp_keys_class]