--- Register Background Goal to `DB_GLU_Backgrounds_Goal`. 
--- @param backgroundId string UUID of Background
--- @param goalId string UUID of Background Goal
--- @param goalString string String name to track goal. Example `Act1_TestGoal`. This should be prefixed with your mod prefix to avoid collisions.
--- @param global string Value is either `Global` or `GlobalAvatar`. Defaults to `Global`
function Actions.RegisterBackgroundGoal(backgroundId, goalId, goalString, global)
  CLUtils.Info("Entering Actions.RegisterBackgroundGoal", Globals.InfoOverride)
  global = global or "Global"
  local backgroundTagId = Utils.GetBackgroundTag(backgroundId, "Background", true)
  if not Utils.TruthDB(Utils.HandleBackgroundsGoal("Get", _, goalString, _, _)) then
    Utils.HandleBackgroundsGoal("Add", backgroundTagId, goalString, goalId, global)
  else
    CLUtils.Warn(Strings.WARN_DB_GLU_Backgrounds_Goal_Exists .. goalString)
  end
end
