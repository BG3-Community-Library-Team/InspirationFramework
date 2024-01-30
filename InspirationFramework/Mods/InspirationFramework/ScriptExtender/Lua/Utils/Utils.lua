--- This looks funky so our DB checks are more readable
---@param array table|nil DB Table
---@return boolean
function Utils.TruthDB(array)
  CLUtils.Info("Entering Utils.TruthDB", Globals.InfoOverride)
  return not not next(array)
end

--- Suffix goal string with Mod's Meta Folder value
--- @param modGuid string UUID of mod
--- @param goalString string Goal Name
---@return string
function Utils.PrepGoalString(modGuid, goalString)
  CLUtils.Info("Entering Utils.PrepGoalString", Globals.InfoOverride)
  return goalString .. "_" .. Ext.Mod.GetMod(modGuid).Info.Directory
end

--- Retrieve the Background Tag from a given Character
--- @param id string ID of character. Defaults to Host Character.
--- @param idType string Type of object we're getting the UUID of. Supports `Character` or `Background`. Defaults to `Character`.
--- @param full boolean Boolean to determine if tag should be prefixed with Tag Name field.
---@return string
function Utils.GetBackgroundTag(id, idType, full)
  CLUtils.Info("Entering Utils.GetBackgroundTag", Globals.InfoOverride)
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
