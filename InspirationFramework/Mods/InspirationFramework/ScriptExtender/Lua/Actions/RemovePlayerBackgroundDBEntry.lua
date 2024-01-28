function Actions.RemovePlayerBackgroundDBEntry(characterId, backgroundTagId)
  if Conditions.IsInBackgroundPlayersDB(characterId, backgroundTagId) and
    not Conditions.IsInPlayersDB(characterId) then
    Osi.DB_GLO_Backgrounds_Players:Delete(characterId, backgroundTagId)
  end
end
