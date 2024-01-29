-- Utils to help debug certain DBs
Utils = {}
--- comment
--- @param characterId string ID of character. Defaults to Host Character.
--- @param full boolean Boolean to determine if tag should be prefixed with Tag Name field.
---@return string
function Utils.GetBackgroundTag(characterId, full)
  characterId = characterId or Osi.GetHostCharacter()
  local tag = Ext.Entity.Get(characterId).BackgroundTag.Tags[1]
  if full then
    tag = Ext.StaticData.Get(tag, "Tag").Name .. "_" .. tag
  end
  return tag
end

--- Add, Remove, or Retrieve from DB_GLO_Backgrounds_Players
--- @param action string Action to perform. `Get/Retrieve`, `Delete/Remove`, or `Add/Insert`. Defaults to Get.
--- @param characterId string ID of Character
--- @param backgroundTagId string ID of background tag.
---@return table|nil
function Utils.HandleBackgroundsPlayers(action, characterId, backgroundTagId)
  action = action or "Get"
  if action == "Get" or action == "Retrieve" then
    return Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTagId)
  elseif action == "Delete" or action == "Remove" then
    return Osi.DB_GLO_Backgrounds_Players:Delete(characterId, backgroundTagId)
  elseif action == "Add" or action == "Insert" then
    return Osi.DB_GLO_Backgrounds_Players(characterId, backgroundTagId)
  end
  return nil
end

--- Add, Remove, or Retrieve from DB_GLO_Backgrounds_Goal
--- @param action string Action to perform. `Get/Retrieve`, `Delete/Remove`, or `Add/Insert`. Defaults to Get.
--- @param backgroundTagId string ID of background tag.
--- @param goalString string String ID of Goal
--- @param goalId string UUID of Goal
--- @param global string Global or GlobalAvatar
---@return table|nil
function Utils.HandleBackgroundsGoal(action, backgroundTagId, goalString, goalId, global)
  action = action or "Get"
  if action == "Get" or action == "Retrieve" then
    return Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTagId, goalString, goalId, global)
  elseif action == "Delete" or action == "Remove" then
    return Osi.DB_GLO_Backgrounds_Goal:Delete(backgroundTagId, goalString, goalId, global)
  elseif action == "Add" or action == "Insert" then
    return Osi.DB_GLO_Backgrounds_Goal(backgroundTagId, goalString, goalId, global)
  end
  return nil
end

--- Add, Remove, or Retrieve from DB_GLO_Backgrounds_Tags
--- @param action string Action to perform. `Get/Retrieve`, `Delete/Remove`, or `Add/Insert`. Defaults to Get.
--- @param backgroundTagId string ID of background tag.
---@return table|nil
function Utils.HandleBackgroundsTags(action, backgroundTagId)
  action = action or "Get"
  if action == "Get" or action == "Retrieve" then
    return Osi.DB_GLO_Backgrounds_Tags:Get(backgroundTagId)
  elseif action == "Delete" or action == "Remove" then
    return Osi.DB_GLO_Backgrounds_Tags:Delete(backgroundTagId)
  elseif action == "Add" or action == "Insert" then
    return Osi.DB_GLO_Backgrounds_Tags(backgroundTagId)
  end
  return nil
end

--- Add, Remove, or Retrieve from DB_GLO_Backgrounds_Blocked
--- @param action string Action to perform. `Get/Retrieve`, `Delete/Remove`, or `Add/Insert`. Defaults to Get.
--- @param goal string ID of background tag.
---@return table|nil
function Utils.HandleBackgroundsBlocked(action, goal)
  action = action or "Get"
  if action == "Get" or action == "Retrieve" then
    return Osi.DB_GLO_Backgrounds_Blocked:Get(goal)
  elseif action == "Delete" or action == "Remove" then
    return Osi.DB_GLO_Backgrounds_Blocked:Delete(goal)
  elseif action == "Add" or action == "Insert" then
    return Osi.DB_GLO_Backgrounds_Blocked(goal)
  end
  return nil
end
