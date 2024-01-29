--- Loop through DB_Players and register the background tag for any players that aren't already registered
function Utils.RegisterBackgroundTag()
  for _, playerID in pairs(Osi.DB_Players[1]) do
    if not Conditions.IsInBackgroundPlayersDB(playerID) then
      Utils.HandleBackgroundsPlayers("Add", playerID, Utils.GetBackgroundTag(playerID, "Character", true))
    else
      CLUtils.Info(Strings.INFO_DB_GLO_Backgrounds_Players_Exists .. Strings.FRAG_SKIPPING)
    end
  end
end

--- Register Background Goal to DB_GLU_Backgrounds_Goal. 
--- @param backgroundId string UUID of Background
--- @param goalId string UUID of Background Goal
--- @param goalString string String name to track goal. Example `Act1_TestGoal`. This should be prefixed with your mod prefix to avoid collisions.
--- @param global string Value is either `Global` or `GlobalAvatar`. Defaults to `Global`
function Utils.RegisterBackgroundGoal(backgroundId, goalId, goalString, global)
  global = global or "Global"
  local backgroundTagId = Utils.GetBackgroundTag(backgroundId, "Background", true)
  if not Utils.TruthDB(Utils.HandleBackgroundsGoal("Get", _, goalString, _, _)) then
    Utils.HandleBackgroundsGoal("Add", backgroundTagId, goalString, goalId, global)
  else
    CLUtils.Warn(Strings.WARN_DB_GLU_Backgrounds_Goal_Exists .. goalString)
  end
end

-- Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTagId, goalString, goalId)

--- Retrieve the Background Tag from a given Character
--- @param id string ID of character. Defaults to Host Character.
--- @param idType string Type of object we're getting the UUID of. Supports `Character` or `Background`. Defaults to `Character`.
--- @param full boolean Boolean to determine if tag should be prefixed with Tag Name field.
---@return string
function Utils.GetBackgroundTag(id, idType, full)
  idType = idType or "Character"
  local tag
  if idType == "Background" then
    local background = Ext.StaticData.Get(id, "Background")
    tag = background.Tags[1]
  else
    id = id or Osi.GetHostCharacter()
    tag = Ext.Entity.Get(id).BackgroundTag.Tags[1]
  end
  if full then
    tag = Ext.StaticData.Get(tag, "Tag").Name .. "_" .. tag
  end
  return tag
end
