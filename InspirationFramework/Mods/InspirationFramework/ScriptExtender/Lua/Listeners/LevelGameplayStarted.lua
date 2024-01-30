Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function (_, _)
  CLUtils.Info("Entering LevelGameplayStarted Listener", Globals.InfoOverride)
  LoadConfigFiles()

  Actions.RegisterBackgroundTag()
  for goalName, goalData in pairs(Globals.ImportedBackgroundGoals) do
    Actions.RegisterBackgroundGoal(goalData.Id, goalData.GoalId, goalName, goalData.Global)
  end
end)
