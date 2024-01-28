function Actions.RemovePlayerBackgroundDBEntry(characterId, backgroundTag)
  if Conditions.IsInBackgroundPlayersDB(characterId, backgroundTag) and
    not Conditions.IsInPlayersDB(characterId) then
    Osi.DB_GLO_Backgrounds_Players:Delete(characterId, backgroundTag)
  end
end
