function Actions.AddPlayerBackgroundDBEntry(characterId, backgroundTagId)
  if Conditions.IsInPlayersDB(characterId) and
    Conditions.BackgroundHasGoals(backgroundTagId) and (
      Conditions.IsTagged(characterId, backgroundTagId) or
      not Conditions.IsInBackgroundPlayersDB(characterId, backgroundTagId)
    ) then
    Osi.DB_GLO_Backgrounds_Players(characterId, backgroundTagId)
  end
end
