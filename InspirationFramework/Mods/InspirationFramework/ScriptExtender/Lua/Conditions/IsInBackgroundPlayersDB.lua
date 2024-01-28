function Conditions.IsInBackgroundPlayersDB(characterId, backgroundTagId)
  return Utils.TruthDB(Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTagId))
end
