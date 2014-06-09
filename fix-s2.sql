
--> Squire Cavin
	-- Squire Cavin SAI
SET @ENTRY := 33522;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,10383,0,0,0,12,33785,6,0,0,0,0,7,0,0,0,0,0,0,0,"Squire Cavin - On Gossip Option 0 Selected - Summon Creature 'The Black Knight'");


--> Spawn Fondeboue:
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (162774, 10323, 1, 1, 1, 0, 28, 4994.85, 550.339, 4.93405, 3.45171, 300, 0, 0, 516, 0, 0, 0, 0, 0, 0);

-- > Ecuyer danny fix du script gossip:

-- Squire Danny SAI
SET @ENTRY := 33518;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,10343,0,0,0,12,33707,6,0,0,0,0,0,0,0,0,0,0,0,0,"Squire Danny - On Gossip Option 0 Selected - Summon Creature 'Argent Champion'");

-- Remise par d�faut de la DB � partir de TC


-- gossip_menu_option for Squires David,Danny and Cavin
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10340,10383,10343);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(10340, 0, 0, 'I am ready to fight!', 1, 1, 0, 0, 0, 0, NULL),
(10340, 1, 0, 'How do the Argent Crusade riders fight?', 1, 1, 10440, 0, 0, 0, NULL),
(10383, 0, 0, 'Ask Cavin to summon the Black Knight.', 1, 1, 0, 0, 0, 0, NULL),
(10343, 0, 0, 'I am ready to fight!', 1, 1, 0, 0, 0, 0, NULL);

-- Squire Danny menu option conditions
DELETE FROM `conditions` WHERE SourceTypeOrReferenceId=15 and SourceGroup=10343;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 10343, 0, 0, 0, 9, 0, 13731, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 0, 28, 0, 13731, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 1, 9, 0, 13729, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 1, 28, 0, 13729, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 1, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 2, 9, 0, 13728, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 2, 28, 0, 13728, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 2, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 2, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 3, 9, 0, 13727, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 3, 28, 0, 13727, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 3, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 3, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 4, 9, 0, 13726, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 4, 28, 0, 13726, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 4, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 4, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 5, 9, 0, 13725, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 5, 28, 0, 13725, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 5, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 5, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 6, 9, 0, 13724, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 6, 28, 0, 13724, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 6, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 6, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 7, 9, 0, 13723, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 7, 28, 0, 13723, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 7, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 7, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 8, 9, 0, 13713, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 8, 28, 0, 13713, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 8, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 8, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is not near'),
--
(15, 10343, 0, 0, 9, 9, 0, 13699, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge'),
(15, 10343, 0, 0, 9, 28, 0, 13699, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Valiant''s Challenge not complete'),
(15, 10343, 0, 0, 9, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63034'),
(15, 10343, 0, 0, 9, 29, 0, 33707, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if an Argent Champion is now near');

-- Squire Cavin menu option conditions
DELETE FROM `conditions` WHERE SourceTypeOrReferenceId=15 and SourceGroup=10383;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 10383, 0, 0, 0, 9, 0, 13664, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Black Knight''s Fall'),
(15, 10383, 0, 0, 0, 28, 0, 13664, 0, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if player has quest The Black Knight''s Fall not complete'),
(15, 10383, 0, 0, 0, 1, 0, 63663, 0, 0, 0, 0, 0, '', 'Squire Danny - Show gossip option if player has aura 63663'),
(15, 10383, 0, 0, 0, 29, 0, 33785, 100, 0, 1, 0, 0, '', 'Squire Danny - Show gossip option if The Black Knight is not near');