--- comment
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

function Utils.RegisterGoal()

end

function Utils.ParseCharacterBackgrounds()

end
