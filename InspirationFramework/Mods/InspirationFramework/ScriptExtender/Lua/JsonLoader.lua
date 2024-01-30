local configFilePathPattern = string.gsub("Mods/%s/ScriptExtender/InspirationFrameworkConfig.json", "'", "\'")

local function ConvertToPayload(data, modGUID)
  CLUtils.Info("Entering ConvertToPayload", Globals.InfoOverride)
  local payload = {
    modGuid = modGUID,
    Backgrounds = {}
  }

  for _, background in pairs(data.Backgrounds) do
    payload.Backgrounds[background.Name] = {
      Id = background.Id,
      Goals = {}
    }
    for _, goal in pairs(background.Goals) do
      payload.Backgrounds[background.Name].Goals[goal.Name] = {
        Id = goal.Id,
        Global = goal.Global or "Global"
      }
    end
  end

  return payload
end

local function SubmitData(data, modGUID)
  CLUtils.Info("Entering SubmitData", Globals.InfoOverride)
  Api.ImportBackgrounds(ConvertToPayload(data, modGUID))
end

---@param configStr string
---@param modGUID GUIDSTRING
local function TryLoadConfig(configStr, modGUID)
  CLUtils.Info("Entering TryLoadConfig", Globals.InfoOverride)
  local success, data = pcall(function ()
    return Ext.Json.Parse(configStr)
  end)
  if success then
    if data ~= nil then
      SubmitData(data, modGUID)
    end
  else
    CLUtils.Error(Strings.ERR_JSON_PARSE_FAIL .. CLUtils.RetrieveModHandleAndAuthor(modGUID))
  end
end

function LoadConfigFiles()
  CLUtils.Info("Entering LoadConfigFiles", Globals.InfoOverride)
  for _, uuid in pairs(Ext.Mod.GetLoadOrder()) do
    local modData = Ext.Mod.GetMod(uuid)
    local filePath = configFilePathPattern:format(modData.Info.Directory)
    local config = Ext.IO.LoadFile(filePath, "data")
    if config ~= nil and config ~= "" then
      CLUtils.Info("Found config for Mod: " .. Ext.Mod.GetMod(uuid).Info.Name, Globals.InfoOverride)
      local b, err = xpcall(TryLoadConfig, debug.traceback, config, uuid)
      if not b then
        CLUtils.Error(err)
      end
    end
  end
end
