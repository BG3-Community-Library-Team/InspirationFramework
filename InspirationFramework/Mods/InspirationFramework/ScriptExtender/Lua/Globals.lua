Globals = {}
IF = {}
IF.UUID = "0119681e-9ea0-4b24-8009-bc13da121229"
IF.modTableKey = "InspirationFramework"
IF.modPrefix = "IF"
IF.modVersion = Ext.Mod.GetMod(IF.UUID).Info.ModVersion

Globals.InfoOverride = false

local clImports = {}
clImports[1] = "Globals"
clImports[2] = "Strings"
clImports[3] = "DictUtils"
clImports[4] = "Utils"
clImports[5] = "Validators"

CLGlobals, CLStrings, CLDictUtils, CLUtils, CLValidators = Mods.CommunityLibrary.Import(clImports)

