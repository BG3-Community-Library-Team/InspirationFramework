function Conditions.IsInPlayersDB(characterId)
  return Utils.TruthDB(Osi.DB_Players:Get(characterId))
end
