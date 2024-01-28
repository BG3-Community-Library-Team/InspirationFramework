function Conditions.IsBackgroundTagLoaded(backgroundTag)
  return Utils.TruthDB(Osi.DB_GLO_Backgrounds_Tags:Get(backgroundTag))
end
