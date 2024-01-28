function Conditions.IsInBackgroundPlayersDB(characterId, backgroundTag)
  return Utils.TruthDB(Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTag))
end
