function Conditions.IsInBackgroundPlayersDB(characterId, backgroundTag)
  return not not next(Osi.DB_GLO_Backgrounds_Players:Get(characterId, backgroundTag))
end
