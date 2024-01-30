function Conditions.IsInBackgroundPlayersDB(characterId, backgroundTagId)
  CLUtils.Info("Entering Conditions.IsInBackgroundPlayersDB", Globals.InfoOverride)
  return Utils.TruthDB(Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTagId))
end
