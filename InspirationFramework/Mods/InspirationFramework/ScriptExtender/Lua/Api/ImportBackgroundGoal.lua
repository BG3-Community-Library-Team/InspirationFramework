function Api.ImportBackgrounds(payload)
  if Ext.Mod.IsModLoaded(payload.modGuid) then
    for _, background in pairs(payload) do
      for goalName, goalData in pairs(background.Goals) do
        Globals.ImportedBackgroundGoals[Utils.PrepGoalString(goalName)] = {
          Id = background.Id,
          GoalId = goalData.Id,
          Global = goalData.Global
        }
      end
    end
  end
end

--[[
{
  modGuid = "UUID of Mod",
  Backgrounds = {
    Background = {
      Id = "UUID of Background",
      Goals = {
        Act1_TestGoal = {
          Id = "UUID of Background Goal",
          Global = "Global or GlobalAvatar"
          CompletionFn = Function(...) -- Maybe leave this for Mod Authors side of things instead, and use CompleteGoal
        }
      }
    }
  }
}
]]
