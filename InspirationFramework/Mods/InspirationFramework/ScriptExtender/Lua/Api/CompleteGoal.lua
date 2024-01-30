--- API Function to mark a Background Goal as completed.
--[[
```lua
{
  modGuid = "UUID of Mod",
  Goals = {
    Act1_TestGoal = {
      GoalId = "UUID of Goal"
      CharacterId = "ID of Character"
    }
  }
}
```
]]
--- @param payload table Payload matching the parameters described above.
function Api.CompleteGoal(payload)
  CLUtils.Info("Entering Api.CompleteGoal", Globals.InfoOverride)
  if Ext.Mod.IsModLoaded(payload.modGuid) then
    for goalName, goalCompletionData in pairs(payload.Goals) do
      local modifiedGoalName = Utils.PrepGoalString(payload.modGuid, goalName)
      local backgroundTag = Utils.GetBackgroundTag(goalCompletionData.CharacterId, "Character", true)
      local goalBackground = Utils.HandleBackgroundsGoal("Get", _, modifiedGoalName, _, _)[1][1]

      if backgroundTag == goalBackground then
        Osi.PROC_GLO_Backgrounds_CompleteGoal(goalCompletionData.CharacterId, modifiedGoalName)
      else
        CLUtils.Error(Strings.WARN_BackgroundDoesntMatchGoal)
      end
    end
  end
end
