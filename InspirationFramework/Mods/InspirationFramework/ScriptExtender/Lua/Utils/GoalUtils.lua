--- Loop through DB_Players and register the background tag for any players that aren't already registered
function Utils.RegisterBackgroundTag()
  for _, playerID in pairs(Osi.DB_Players[1]) do
    local player = Ext.Entity.Get(playerID)
    -- Grabbing the first Background tag, as while multiple tags are technically supported, it gets funky
    if not Conditions.IsInBackgroundPlayersDB(playerID) then
      Utils.HandleBackgroundsPlayers("Add", playerID, player.BackgroundTag.Tags[1])
    else
      CLUtils.Info(Strings.ERR_DB_GLO_Backgrounds_Players_Exists .. Strings.FRAG_SKIPPING)
    end
  end
end

function Utils.RegisterBackgroundGoal()

end
-- Osi.DB_GLO_Backgrounds_Goal:Get(backgroundTagId, goalString, goalId)

--- Retrieve the Background Tag from a given Character
--- @param characterId string ID of character. Defaults to Host Character.
--- @param full boolean Boolean to determine if tag should be prefixed with Tag Name field.
---@return string
function Utils.GetBackgroundTag(characterId, full)
  characterId = characterId or Osi.GetHostCharacter()
  local tag = Ext.Entity.Get(characterId).BackgroundTag.Tags[1]
  if full then
    tag = Ext.StaticData.Get(tag, "Tag").Name .. "_" .. tag
  end
  return tag
end
