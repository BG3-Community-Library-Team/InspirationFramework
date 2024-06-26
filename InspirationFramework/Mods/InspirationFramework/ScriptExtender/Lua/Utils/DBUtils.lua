--- Add, Remove, or Retrieve from DB_GLO_Backgrounds_Players
--- @param action string Action to perform. `Get/Retrieve`, `Delete/Remove`, or `Add/Insert`. Defaults to Get.
--- @param characterId string ID of Character
--- @param backgroundTagId string ID of background tag.
---@return table|nil
function Utils.HandleBackgroundsPlayers(action, characterId, backgroundTagId)
  CLUtils.Info("Entering Utils.HandleBackgroundsPlayers", Globals.InfoOverride)
  if characterId and backgroundTagId then
    action = action or "Get"
    if action == "Get" or action == "Retrieve" then
      return Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTagId)
    elseif action == "Delete" or action == "Remove" then
      return Osi.DB_GLO_Backgrounds_Players:Delete(characterId, backgroundTagId)
    elseif action == "Add" or action == "Insert" then
      return Osi.DB_GLO_Backgrounds_Players(characterId, backgroundTagId)
    else
      -- Invalid Action
      CLUtils.Error(Strings.ERR_INVALID_DB_ACTION)
    end
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
  CLUtils.Info("Entering Utils.HandleBackgroundsGoal", Globals.InfoOverride)
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
  CLUtils.Info("Entering Utils.HandleBackgroundsTags", Globals.InfoOverride)
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

--- Add, Remove, or Retrieve from DB_GLO_Backgrounds_Completed
--- @param action string Action to perform. `Get/Retrieve`, `Delete/Remove`, or `Add/Insert`. Defaults to Get.
--- @param characterId string ID of Character.
--- @param goalString string string ID of goal (not UUID).
---@return table|nil
function Utils.HandleBackgroundsCompleted(action, characterId, goalString)
  CLUtils.Info("Entering Utils.HandleBackgroundsCompleted", Globals.InfoOverride)
  action = action or "Get"
  if action == "Get" or action == "Retrieve" then
    return Osi.DB_GLO_Backgrounds_Completed:Get(characterId, goalString)
  elseif action == "Delete" or action == "Remove" then
    return Osi.DB_GLO_Backgrounds_Completed:Delete(characterId, goalString)
  elseif action == "Add" or action == "Insert" then
    return Osi.DB_GLO_Backgrounds_Completed(characterId, goalString)
  end
  return nil
end

--- Add, Remove, or Retrieve from DB_GLO_Backgrounds_Blocked
--- @param action string Action to perform. `Get/Retrieve`, `Delete/Remove`, or `Add/Insert`. Defaults to Get.
--- @param goalString string string ID of goal (not UUID).
---@return table|nil
function Utils.HandleBackgroundsBlocked(action, goalString)
  CLUtils.Info("Entering Utils.HandleBackgroundsBlocked", Globals.InfoOverride)
  action = action or "Get"
  if action == "Get" or action == "Retrieve" then
    return Osi.DB_GLO_Backgrounds_Blocked:Get(goalString)
  elseif action == "Delete" or action == "Remove" then
    return Osi.DB_GLO_Backgrounds_Blocked:Delete(goalString)
  elseif action == "Add" or action == "Insert" then
    return Osi.DB_GLO_Backgrounds_Blocked(goalString)
  end
  return nil
end

--- Add, Remove, or Retrieve from DB_GLO_Backgrounds_ChainAfterGoal
--- @param action string Action to perform. `Get/Retrieve`, `Delete/Remove`, or `Add/Insert`. Defaults to Get.
--- @param goalStringA string string ID of goal (not UUID).
--- @param goalStringB string string ID of another goal (not UUID).
---@return table|nil
function Utils.HandleBackgroundsChainAfterGoal(action, goalStringA, goalStringB)
  CLUtils.Info("Entering Utils.HandleBackgroundsChainAfterGoal", Globals.InfoOverride)
  action = action or "Get"
  if action == "Get" or action == "Retrieve" then
    return Osi.DB_GLO_Backgrounds_ChainAfterGoal:Get(goalStringA, goalStringB)
  elseif action == "Delete" or action == "Remove" then
    return Osi.DB_GLO_Backgrounds_ChainAfterGoal:Delete(goalStringA, goalStringB)
  elseif action == "Add" or action == "Insert" then
    return Osi.DB_GLO_Backgrounds_ChainAfterGoal(goalStringA, goalStringB)
  end
  return nil
end
