function Api.ImportBackgrounds(payload)
  CLUtils.Info("Entering Api.ImportBackgrounds", Globals.InfoOverride)
  if Ext.Mod.IsModLoaded(payload.modGuid) then
    for _, background in pairs(payload.Backgrounds) do
      for goalName, goalData in pairs(background.Goals) do
        if not Globals.ImportedBackgroundGoals[Utils.PrepGoalString(payload.modGuid, goalName)] then
          Globals.ImportedBackgroundGoals[Utils.PrepGoalString(payload.modGuid, goalName)] = {
            Id = background.Id,
            GoalId = goalData.Id,
            Global = goalData.Global
          }
        end
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
          Global = "Optional - Global or GlobalAvatar. Default Global"
        }
      }
    }
  }
}
]]
