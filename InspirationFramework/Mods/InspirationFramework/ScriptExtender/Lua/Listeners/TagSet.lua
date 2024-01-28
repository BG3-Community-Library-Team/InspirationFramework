Ext.Osiris.RegisterListener("TagSet", 2, "after", function (target, tag)
  -- TODO: Confirm `tag` is a backgroundTagId. Otherwise grab the specific tag desired
  Actions.AddPlayerBackgroundDBEntry(target, tag)
end)
