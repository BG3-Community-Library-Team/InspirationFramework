function Conditions.IsbackgroundTagIdLoaded(backgroundTagId)
  return Utils.TruthDB(Osi.DB_GLO_Backgrounds_Tags:Get(backgroundTagId))
end
