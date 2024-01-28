function Actions.AddbackgroundTagId(backgroundTagId)
  if Conditions.IsInBackgroundPlayersDB(_, backgroundTagId) and
    not Conditions.IsbackgroundTagIdLoaded(backgroundTagId) then
    Osi.DB_GLO_Backgrounds_Tags(backgroundTagId)
  end
end
