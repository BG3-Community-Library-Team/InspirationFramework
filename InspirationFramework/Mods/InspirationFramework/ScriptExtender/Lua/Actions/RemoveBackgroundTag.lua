function Actions.RemoveBackgroundTag(characterId)
  if Conditions.IsBackgroundTagLoaded(characterId) and
    not Conditions.IsInBackgroundPlayersDB(characterId, _) then
    Osi.DB_GLO_Backgrounds_Tags:Delete(characterId)
  end
end
