function Conditions.HasValidBackgroundTag(backgroundId)
  local res = false
  local background = CLUtils.CacheOrRetrieve(backgroundId, "Background")
  if background.Tags[1] then
    local tag = CLUtils.CacheOrRetrieve(background.Tags[1], "Tag")
    if tag then
      return true
    else
      CLUtils.Error("")
    end
  else
    CLUtils.Error("")
  end

  return res
end
