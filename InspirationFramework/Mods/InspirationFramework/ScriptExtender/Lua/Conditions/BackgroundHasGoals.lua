function Conditions.BackgroundHasGoals(backgroundTag)
  return not not next(Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTag, _, _, _))
end
