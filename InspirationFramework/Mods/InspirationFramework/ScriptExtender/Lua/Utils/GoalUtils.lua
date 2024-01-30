function Utils.MarkGoalComplete(characterId, goalString)
  Osi.PROC_GLO_Backgrounds_CompleteGoal(characterId, goalString)
end

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

function Utils.PrepGoalString(modGuid, goalString)
  return goalString .. "_" .. Ext.Mod.GetMod(modGuid).Info.Directory
end
