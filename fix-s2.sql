


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

-- Remise par défaut de la DB à partir de TC


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

-- Valiant Champion Quest Credit 
REPLACE INTO `quest_template` (`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`, `RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`, `RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`, `RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`, `RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`, `RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`, `RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`, `Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `RequiredSpellCast1`, `RequiredSpellCast2`, `RequiredSpellCast3`, `RequiredSpellCast4`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`, `WDBVerified`) VALUES (13680, 2, -1, 77, 0, -241, 0, 0, 0, 0, 690, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13678, 0, 0, 0, 5, 74000, 132300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1124, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Aspirant\'s Challenge', 'Speak with Squire David to summon your opponent. Once you have defeated the Argent Valiant, return to Magister Edien Sunhollow at the Argent Tournament Grounds.', 'You have trained hard as an aspirant, $N, and now the time has come to test your mounted combat skills against an experienced opponent.$B$BEquip your lance, then go to the stables outside the pavilion and mount the Sunreaver hawkstrider.$B$BAt the Aspirants\' Ring on the northern side of the tournament grounds, you\'ll find a human child called Squire David. He\'ll ask if you\'re ready for the fight and call out your opponent.$B$BGood luck, $N. May your mount be steady and your aim true.', NULL, 'Congratulations are in order, $N. You have bested your challenger and earned the right to advance to the rank of valiant.', NULL, 'Return to Magister Edien Sunhollow at Argent Tournament Grounds in Icecrown.', 24108, 0, 0, 0, 1, 0, 0, 0, 46106, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Argent Valiant defeated', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);
