function Conditions.BackgroundHasGoals(backgroundTagId)
  return Utils.TruthDB(Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTagId, _, _, _))
end
