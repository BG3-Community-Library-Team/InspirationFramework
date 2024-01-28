function Actions.AddBackgroundTag(backgroundTag)
  if Conditions.IsInBackgroundPlayersDB(_, backgroundTag) and
    not Conditions.IsBackgroundTagLoaded(backgroundTag) then
    Osi.DB_GLO_Backgrounds_Tags(backgroundTag)
  end
end
