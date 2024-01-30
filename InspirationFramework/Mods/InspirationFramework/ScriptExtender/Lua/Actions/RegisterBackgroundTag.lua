--- Loop through ` and register the background tag for any players that aren't already registered
function Actions.RegisterBackgroundTag()
  for _, playerID in pairs(Osi.DB_Players[1]) do
    if not Conditions.IsInBackgroundPlayersDB(playerID) then
      Utils.HandleBackgroundsPlayers("Add", playerID, Utils.GetBackgroundTag(playerID, "Character", true))
    else
      CLUtils.Info(Strings.INFO_DB_GLO_Backgrounds_Players_Exists .. Strings.FRAG_SKIPPING)
    end
  end
end
