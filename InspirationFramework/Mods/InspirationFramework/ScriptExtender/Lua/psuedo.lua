-- This function adds the inspiration event, completing the goal, IF you have the correct background.
-- Osi.AddBackgroundGoal(character, goal, categoryId)

--[[
IF
TagSet((CHARACTER)_Var1, (TAG)_Var2)
AND
DB_Players(_Var1)
AND
DB_GLO_Backgrounds_Goal(_Var2, _, _, _)
AND NOT
DB_GLO_Backgrounds_Players(_Var1, _Var2)
THEN
DB_GLO_Backgrounds_Players(_Var1, _Var2);
]]

Osi.RegisterListener("TagSet", 2, "after", function (characterId, backgroundTagId)
  if Osi.DB_Players:Get(characterId) and Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTagId, _, _, _) and not Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTagId) then
    Osi.DB_GLO_Backgrounds_Players(characterId, backgroundTagId)
  end
end)

--[[
IF
DB_Players(_Var1)
AND
DB_GLO_Backgrounds_Goal(_Var2, _, _, _)
AND NOT
DB_GLO_Backgrounds_Players(_Var1, _Var2)
AND
IsTagged(_Var1, _Var2, 1)
THEN
DB_GLO_Backgrounds_Players(_Var1, _Var2);
]]

if Osi.DB_Players:Get(characterId) and Osi.DB_GLO_Backgrounds_Goal(backgroundTagId, _, _, _) and Osi.IsTagged(characterId, backgroundTagId, 1) == 1 then
  Osi.DB_GLO_Backgrounds_Players(characterId, backgroundTagId)
end

--[[
DB_GLO_Backgrounds_Players(_Var1, _Var2)
AND NOT
DB_Players(_Var1)
THEN
NOT DB_GLO_Backgrounds_Players(_Var1, _Var2);
]]

if Osi.DB_GLO_Backgrounds_Players(characterId, backgroundTagId) and not Osi.DB_Players(characterId) then
  Osi.DB_GLO_Backgrounds_Players:Delete(characterId, backgroundTagId)
end

--[[
IF
DB_GLO_Backgrounds_Players(_, _Var2)
AND NOT
DB_GLO_Backgrounds_Tags(_Var2)
THEN
DB_GLO_Backgrounds_Tags(_Var2);
]]

if Osi.DB_GLO_Backgrounds_Players(_, backgroundTagId) and not Osi.DB_GLO_Backgrounds_Tags(backgroundTagId) then
  Osi.DB_GLO_Backgrounds_Tags(backgroundTagId)
end

--[[
IF
DB_GLO_Backgrounds_Tags(_Var1)
AND NOT
DB_GLO_Backgrounds_Players(_, _Var1)
THEN
NOT DB_GLO_Backgrounds_Tags(_Var1);
]]

if Osi.DB_GLO_Backgrounds_Tags(backgroundTagId) and not Osi.DB_GLO_Backgrounds_Players(_, backgroundTagId) then
  Osi.DB_GLO_Backgrounds_Tags:Delete(backgroundTagId)
end

--[[
PROC
PROC_GLO_Backgrounds_CompleteGoal((CHARACTER)_Var1, (STRING)_Var2)
AND NOT
DB_Players(_Var1)
AND
CharacterGetOwner(_Var1, _Var3)
AND
DB_Players(_Var3)
THEN
PROC_GLO_Backgrounds_CompleteGoal(_Var3, _Var2);
]]

Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_CompleteGoal", 2, "after", function (character, goal)
  if not Osi.DB_Players:Get(character) and Osi.DB_Players:Get(Osi.CharacterGetOwner(character)) then
    Osi.PROC_GLO_Backgrounds_CompleteGoal(character, goal)
  end
end)

--[[
PROC
PROC_GLO_Backgrounds_CompleteGoal((CHARACTER)_Var1, (STRING)_Var2)
AND
DB_Players(_Var1)
AND NOT
DB_GLO_Backgrounds_Blocked(_Var2)
AND NOT
DB_CurrentLevel("TUT_Avernus_C")
THEN
PROC_GLO_Backgrounds_RewardPlayer(_Var1, _Var2);
PROC_GLO_Backgrounds_ShareGoalRewarding(_Var1, _Var2);
DB_GLO_Backgrounds_Blocked(_Var2);
]]

-- goal can be a GUIDSTRING or a string (ex. "GLO_Criminal_StealValuable_1000")
Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_CompleteGoal", 2, "after", function (character, goal)
  if Osi.DB_Players:Get(character) and not Osi.DB_GLO_Backgrounds_Blocked(goal) and not Osi.DB_CurrentLevel:Get("TUT_Avernus_C") then
    Osi.PROC_GLO_Backgrounds_RewardPlayer(character, goal)
    Osi.PROC_GLO_Backgrounds_ShareGoalRewarding(character, goal)
    Osi.DB_GLO_Backgrounds_Blocked(goal)
  end
end)

--[[
PROC
PROC_GLO_Backgrounds_RewardPlayer((CHARACTER)_Var1, (STRING)_Var2)
AND NOT
DB_GLO_Backgrounds_Completed(_Var1, _Var2)
AND
DB_GLO_Backgrounds_Goal(_Var3, _Var2, _Var4, _)
AND
DB_GLO_Backgrounds_Players(_Var1, _Var3)
THEN
DB_GLO_Backgrounds_Completed(_Var1, _Var2);
PROC_GLO_Backgrounds_GivePoint(_Var1, _Var4);
]]

-- Need to determine how to get `backgroundTagId` and `goalId`
Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_RewardPlayer", 2, "after", function (character, goalString) 
  local backgroundTagId = Osi.DB_GLO_Backgrounds_Players:Get(character, _)[1][2] -- [1] = SubArray, [2] = Background Tag
  if not Osi.DB_GLO_Backgrounds_Completed:Get(character, goalString) and Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTagId, goalString, _, _) then
    local goalId = Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTagId, goalString, _, _)[1][3]
    Osi.DB_GLO_Backgrounds_Completed(character, goalString)
    Osi.PROC_GLO_Backgrounds_GivePoint(character, goalId)
  end
end)

--[[
PROC
PROC_GLO_Backgrounds_GivePoint((CHARACTER)_Var1, (GUIDSTRING)_Var2)
AND
DB_ActiveLevel(_Var3)
AND
DB_GLO_Backgrounds_Category(_Var3, _Var4)
THEN
AddBackgroundGoal(_Var1, _Var2, _Var4);
]]

Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_GivePoint", 2, "after", function (character, goalId)
  local categoryId = Osi.DB_GLO_Backgrounds_Category(Osi.GetRegion, _)[1][2] -- [1] is the sub-array, [2] is the Act
  Osi.AddBackgroundGoal(character, goalId, categoryId)
end)

--[[
PROC
PROC_GLO_Backgrounds_ShareGoalRewarding((CHARACTER)_Var1, (STRING)_Var2)
AND
DB_Players(_Var3)
AND
_Var1 != _Var3
AND
DB_GLO_Backgrounds_Goal(_, _Var2, _, _Var6)
AND NOT
QRY_GLO_Backgrounds_BlockSharingWithPlayer(_Var1, _Var3, _Var6)
THEN
PROC_GLO_Backgrounds_RewardPlayer(_Var3, _Var2);
]]

Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_ShareGoalRewarding", 2, "after", function (character, goalId)

end)

--[[
QRY
QRY_GLO_Backgrounds_BlockSharingWithPlayer((CHARACTER)_Var1, (CHARACTER)_Var2, "GlobalAvatar")
AND NOT
DB_Avatars(_Var2)
THEN
DB_NOOP(1);
]]

--[[
IF
DB_GLO_Backgrounds_Goal(_Var1, _Var2, _Var3)
AND NOT
DB_GLO_Backgrounds_Goal(_Var1, _Var2, _Var3, _)
THEN
DB_GLO_Backgrounds_Goal(_Var1, _Var2, _Var3, "Global");
]]

--[[
PROC
PROC_GLO_Backgrounds_CompleteGoal((CHARACTER)_Var1, (STRING)_Var2)
AND
DB_GLO_Backgrounds_ChainAfterGoal(_Var2, _Var3)
THEN
PROC_GLO_Backgrounds_CompleteGoal(_Var1, _Var3);
]]

--[[
IF
FlagSet((FLAG)_Var1, (CHARACTER)_Var2, _)
AND
DB_GLO_Backgrounds_ChainAfterCharacterFlag(_Var1, _Var4)
THEN
PROC_GLO_Backgrounds_CompleteGoal(_Var2, _Var4);
]]

--[[
IF
FlagSet((FLAG)_Var1, _, (INTEGER)_Var3)
AND
DB_DialogPlayers(_Var3, _Var4, _)
AND
DB_GLO_Backgrounds_ChainAfterGlobalFlagInDialog(_Var1, _Var6)
THEN
PROC_GLO_Backgrounds_CompleteGoal(_Var4, _Var6);
]]
