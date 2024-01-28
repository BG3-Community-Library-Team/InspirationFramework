function Conditions.IsInPlayersDB(characterId)
  return not not next(Osi.DB_Players:Get(characterId))
end
