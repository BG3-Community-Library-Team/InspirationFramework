Globals = {}
IF = {}
IF.UUID = "0119681e-9ea0-4b24-8009-bc13da121229"
IF.modTableKey = "InspirationFramework"
IF.modPrefix = "IF"
IF.modVersion = Ext.Mod.GetMod(IF.UUID).Info.ModVersion

Mods.IF = Mods.InspirationFramework
Globals.InfoOverride = false

local clImports = {}
clImports[1] = "Globals"
clImports[2] = "Utils"

CLGlobals, CLUtils = Mods.CommunityLibrary.Import(clImports)

Globals.ImportedBackgroundGoals = {}

