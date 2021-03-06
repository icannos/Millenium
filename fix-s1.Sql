-- Fix Quests s1

-- http://fr.wowhead.com/quest=12528/jouer-le-jeu

SET @ENTRY := 28097;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,6,0,100,0,0,0,0,0,7,12528,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Death - Add quest 12528");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=22 AND `SourceEntry`=28097 AND `SourceGroup`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES (22,1,28097,28,0,12528,0,0,0,'Description');


-- http://fr.wowhead.com/quest=11073

-- Ancient Skull Pile
SET @ENTRY := 185928;
SET @SOURCETYPE := 1;

DELETE FROM creature WHERE id=185928;

DELETE FROM gossip_menu_option WHERE menu_id = 8687;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES (8687, 1, 0, '<Call forth Terrok.>', 1, 1, 0, 0, 0, 0, NULL);


DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,62,0,100,0,8687,1,0,0,85,41004,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Option 1 Selected - Invoker Cast Summon Terokk"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Option 1 Selected - Close Gossip");

DELETE FROM `event_scripts` WHERE `id` =15014;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(15014, 0, 10, 21838, 3000000, 0, -3789.4, 3507.63, 286.982, -0.994838);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8687 AND `ConditionTypeOrReference`=29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 8687, 0, 0, 0, 29, 0, 21838, 200, 0, 1, 0, 0, '', 'Only show gossip if no terokk nearby');




-- http://www.wowhead.com/quest=20439/a-meeting-with-the-magister

-- Arcanist Tybalin
SET @ENTRY := 36669;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,20439,0,0,0,11,69672,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanist Tybalin - On Quest Accept - Cast Sunreaver Disguise"),
(@ENTRY,@SOURCETYPE,1,0,20,0,100,0,20439,0,0,0,28,70973,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanist Tybalin - On Quest Reward - Remove Aura Sunreaver Disguise"),
(@ENTRY,@SOURCETYPE,2,3,62,0,100,0,10858,1,0,0,11,69672,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanist Tybalin - On Quest Accept - Cast Sunreaver Disguise"),
(@ENTRY,@SOURCETYPE,3,0,61,0,100,0,10858,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanist Tybalin - On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,4,0,62,0,100,0,10858,0,0,0,80,3666900,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Arcanist Tybalin - On Gossip Select - Run Script"),
(@ENTRY,@SOURCETYPE,5,3,62,0,100,0,10858,2,0,0,11,69672,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Arcanist Tybalin - On Gossip Select 2 - Cast Sunreaver Disguise");




-- Spawn http://www.wowhead.com/npc=21496/dertrok

DELETE FROM creature where id = 21496;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (144482, 21496, 530, 1, 1, 0, 0, 2163.37, 4771.83, 156.477, 5.59925, 300, 0, 0, 5341, 0, 0, 0, 0, 0, 0);

-- Spawn http://fr.wowhead.com/npc=10081/ame-en-peine-poudreuse

REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (123900, 10081, 209, 1, 1, 0, 0, 1627.47, 1186.85, 8.87693, 0.647954, 7200, 15, 0, 5757, 0, 1, 0, 0, 0, 1);
