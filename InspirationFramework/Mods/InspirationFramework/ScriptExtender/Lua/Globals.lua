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

Globals.BackgroundTags = {
  HauntedOne = "HAUNTED_ONE_ce00b3b6-238e-4524-851b-3d1f2d2b1189",
  Acolyte = "ACOLYTE_906d1961-e9c6-4170-b775-62797a0efe1c",
  Charlatan = "CHARLATAN_07925e5b-af3d-4743-a565-b9fee04c24ac",
  Criminal = "CRIMINAL_74ed9de3-fff5-419a-949b-18bd5e17944e",
  Entertainer = "ENTERTAINER_bd3cfefd-5fe2-47ea-bd3c-e99eaad9b714",
  FolkHero = "FOLKHERO_9c38904c-4aed-4d22-9038-fc7d103aaed5",
  GuildArtisan = "GUILD_ARTISAN_baf9fb0e-f535-40a0-bb78-3ec289d84e66",
  Noble = "NOBLE_56825486-9cfc-4ec2-87d1-c8065c41774b",
  Sage = "SAGE_dad18490-c61d-4958-805c-f017eb68f8a0",
  Soldier = "SOLDIER_d135f265-c2e1-4077-a836-b548ee871681",
  Outlander = "OUTLANDER_d81df6f9-9f6e-4146-841a-9f285e6ee879",
  Urchin = "URCHIN_2faee476-d77b-42a7-a4c6-2b9ac934673c"
}
