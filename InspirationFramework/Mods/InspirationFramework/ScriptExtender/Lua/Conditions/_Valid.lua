--[[
IF
TagSet((CHARACTER)_Var1, (TAG)_Var2)
AND
DB_Players(_Var1)
AND
DB_GLO_Backgrounds_Goal(_Var2, _, _, _)
AND NOT
DB_GLO_Backgrounds_Players(_Var1, _Var2)
THEN
DB_GLO_Backgrounds_Players(_Var1, _Var2);
]]


function Conditions.IsValid(character, tag)

  return Conditions.IsInPlayers(character)
end

--[[
IF
DB_Players(_Var1)
AND
DB_GLO_Backgrounds_Goal(_Var2, _, _, _)
AND NOT
DB_GLO_Backgrounds_Players(_Var1, _Var2)
AND
IsTagged(_Var1, _Var2, 1)
THEN
DB_GLO_Backgrounds_Players(_Var1, _Var2);
]]


--[[
IF
DB_GLO_Backgrounds_Players(_Var1, _Var2)
AND NOT
DB_Players(_Var1)
THEN
NOT DB_GLO_Backgrounds_Players(_Var1, _Var2);
]]

--[[IF
DB_GLO_Backgrounds_Players(_, _Var2)
AND NOT
DB_GLO_Backgrounds_Tags(_Var2)
THEN
DB_GLO_Backgrounds_Tags(_Var2);
]]

--[[
IF
DB_GLO_Backgrounds_Tags(_Var1)
AND NOT
DB_GLO_Backgrounds_Players(_, _Var1)
THEN
NOT DB_GLO_Backgrounds_Tags(_Var1);
]]
