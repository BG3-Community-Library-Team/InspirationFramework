Ext.Osiris.RegisterListener("DB_Players", 1, "after", function (_)
  CLUtils.Info("Entering DB_Players Listener", Globals.InfoOverride)
  Actions.RegisterBackgroundTag()
end)
