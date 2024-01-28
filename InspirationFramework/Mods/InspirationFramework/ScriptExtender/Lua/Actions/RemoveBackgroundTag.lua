function Actions.RemovebackgroundTagId(backgroundTagId)
  if Conditions.IsbackgroundTagIdLoaded(backgroundTagId) and
    not Conditions.IsInBackgroundPlayersDB(_, backgroundTagId) then
    Osi.DB_GLO_Backgrounds_Tags:Delete(backgroundTagId)
  end
end
