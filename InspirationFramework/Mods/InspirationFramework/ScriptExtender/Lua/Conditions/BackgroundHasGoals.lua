function Conditions.BackgroundHasGoals(backgroundTag)
  return Utils.TruthDB(Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTag, _, _, _))
end
