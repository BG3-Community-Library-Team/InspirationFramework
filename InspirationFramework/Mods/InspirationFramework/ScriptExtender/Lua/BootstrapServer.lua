_D("Inspiration Framework Loaded")

Ext.Require("Utils/DebugUtils.lua")

Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_CompleteGoal", 2, "after", function (character, goal)
  _D("PROC_GLO_Backgrounds_CompleteGoal proc'd")

  if not Osi.DB_Players:Get(character) and Osi.DB_Players:Get(Osi.CharacterGetOwner(character)) then
    _D(character .. " Finishing Goal on behalf of Owner " .. Osi.CharacterGetOwner(character))
  end

  if Osi.DB_Players:Get(character) and not Osi.DB_GLO_Backgrounds_Blocked(goal) and not Osi.DB_CurrentLevel:Get("TUT_Avernus_C") then
    _D("Not in TUT_Avernus_C, so Rewarding Player: " .. character .. ", Share Goal Rewarding, and Blocking Goal " .. goal)
  end
end)

Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_RewardPlayer", 2, "after", function (character, goalString)
  _D("PROC_GLO_Backgrounds_RewardPlayer proc'd")
  local backgroundTagId = Osi.DB_GLO_Backgrounds_Players:Get(character, _)[1][2] -- [1] = SubArray, [2] = Background Tag
  if not Osi.DB_GLO_Backgrounds_Completed:Get(character, goalString) and Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTagId, goalString, _, _) then
    _D("Goal" .. goalString .. "not completed for character " .. character .. ", but background " .. backgroundTagId .. "has goal" .. goalString .. ". Marking as complete, and granting player a point.")
  end
end)

Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_GivePoint", 2, "after", function (character, goalId)
  _D("PROC_GLO_Backgrounds_GivePoint proc'd")
  local categoryId = Osi.DB_GLO_Backgrounds_Category(Osi.GetRegion, _)[1][2] -- [1] is the sub-array, [2] is the Act
  _D("Calling Osi.AddBackgroundGoal if we're in the right region.")
end)

Ext.Osiris.RegisterListener("PROC_GLO_Backgrounds_ShareGoalRewarding", 2, "after", function (character, goalId)
  _D("PROC_GLO_Backgrounds_ShareGoalRewarding proc'd")
end)

Ext.Osiris.RegisterListener("AddBackgroundGoal", 3, "after", function (character, goalId, categoryId)
  _D("AddBackgroundGoal fired")
end)

Ext.Osiris.RegisterListener("DB_GLO_Backgrounds_Players", 2, "after", function (characterId, backgroundTag)
  _D("DB_GLO_Backgrounds_Players change detected...")
  _D(Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTag))
end)

Ext.Osiris.RegisterListener("DB_GLO_Backgrounds_Players", 2, "afterDelete", function (characterId, backgroundTag)
  _D(characterId .. " with background tag " .. backgroundTag .. " removed from DB_GLO_Backgrounds_Players")
end)

