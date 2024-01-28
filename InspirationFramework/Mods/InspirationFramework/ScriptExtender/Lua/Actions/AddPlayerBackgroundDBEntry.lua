function Actions.AddPlayerBackgroundDBEntry(characterId, backgroundTag)
  if Conditions.IsInPlayersDB(characterId) and
    Conditions.BackgroundHasGoals(backgroundTag) and (
      Conditions.IsTagged(characterId, backgroundTag) or
      not Conditions.IsInBackgroundPlayersDB(characterId, backgroundTag)
    ) then
    Osi.DB_GLO_Backgrounds_Players(characterId, backgroundTag)
  end
end
