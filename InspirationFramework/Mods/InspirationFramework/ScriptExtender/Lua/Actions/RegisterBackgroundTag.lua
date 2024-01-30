--- Loop through ` and register the background tag for any players that aren't already registered
function Actions.RegisterBackgroundTag()
  CLUtils.Info("Entering Actions.RegisterBackgroundTag", Globals.InfoOverride)
  if Utils.TruthDB(Osi.DB_Players:Get(_)) then
    for _, playerID in pairs(Osi.DB_Players:Get(_)) do
      if not Conditions.IsInBackgroundPlayersDB(playerID[1]) then
        Utils.HandleBackgroundsPlayers("Add", playerID[1], Utils.GetBackgroundTag(playerID[1], "Character", true))
      else
        CLUtils.Info(Strings.INFO_DB_GLO_Backgrounds_Players_Exists .. Strings.FRAG_SKIPPING)
      end
    end
  end
end
