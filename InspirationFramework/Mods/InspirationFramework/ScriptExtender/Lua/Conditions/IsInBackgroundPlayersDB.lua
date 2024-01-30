--- Return true if `Osi.DB_GLO_Backgrounds_Players` contains `characterId` and/or `backgroundTagId`
--- @param characterId string|nil UUID of a Character
--- @param backgroundTagId string|nil UUID of a Background Tag
---@return boolean
function Conditions.IsInBackgroundPlayersDB(characterId, backgroundTagId)
  CLUtils.Info("Entering Conditions.IsInBackgroundPlayersDB", Globals.InfoOverride)
  return Utils.TruthDB(Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTagId))
end
