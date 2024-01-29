## Notes

So far the most important DBs look to be `DB_Players`, `DB_GLO_Backgrounds_Goal`, `DB_GLO_Backgrounds_Players`, and `DB_GLO_Backgrounds_Tags` (the last of which which I assume would automatically 
retrieve the relevant tags from a background automatically, so probably don't need to insert into there). The other piece is figuring out what controls the goal string ID (as opposed to 
the UUID). It might only exist as data inserted into the DB though 🤔

General structure of `DB_GLO_Backgrounds_Goal` is: `[Background Tag ID, Goal String ID, Goal UUID, and "Global" OR "GlobalAvatar"]`
That last one I think has to do with if it's available for Tav vs an Origin, but that's a wild guess
Reasoning is it's `GlobalAvatar` for things such as: `Act1_Noble_InterruptCompanion`, `Act1_Noble_KnowsWyllNoble`, `Act1_Noble_KnowsAstarionMagistrate`, and one relating to Resurrecting Gale

Adding the `Act1_Acolyte_BookOfTheDead` into `DB_GLO_Backgrounds_Goal` doesn't appear to be enough to make reading the Book of the Dead trigger the Inspiration Event or provide an Inspiration
Point.

You can have multiple entries for the same character in `DB_GLO_Backgrounds_Players`. This in addition to the above is also not enough

`DB_GLO_Backgrounds_Goal` can be queried for 3 OR 4 parameters, so the 4th `Global`/`GlobalAvatar` param appears optional. It defaults to `Global`:
```sql
IF
DB_GLO_Backgrounds_Goal(_Var1, _Var2, _Var3)
AND NOT
DB_GLO_Backgrounds_Goal(_Var1, _Var2, _Var3, _)
THEN
DB_GLO_Backgrounds_Goal(_Var1, _Var2, _Var3, "Global");
```

`Osi.AddBackgroundGoal` seems to have some behind-the-scenes handling preventing someone with the wrong background to get the inspiration event for another background (even when a valid
entry in DB_GLO_Backgrounds_Goal is present). Handling doesn't appear to be covered in `GLO_Backgrounds.txt` from what I'm seeing so far. More specifically it doesn't seem to be hitting
any of the listeners I've set for `PROC_GLO_Backgrounds_CompleteGoal`, `DB_GLO_Backgrounds_Blocked`, `PROC_GLO_Backgrounds_RewardPlayer`, `PROC_GLO_Backgrounds_GivePoint`, or
`PROC_GLO_Backgrounds_ShareGoalRewarding` to watch the process. I'm testing with only vanilla goals. I inserted this:
```json
[
        [
                "CHARLATAN_07925e5b-af3d-4743-a565-b9fee04c24ac",
                "Act1_HauntedOne_CookedDwarfEaten",
                "e3599d7e-beb7-422f-bf4d-6135b3b743c6"
        ]
]
```

It isn't checking for the first instance of a goal being present, compares the background tag with the players' background tag, and noping out if it doesn't match.

All the Inspiration completion procedures leads back to `Osi.AddBackgroundGoal()`.  Unfortunately it's a void function, too. Best way might be to register a listener for `AddBackgroundGoal`
and then checking if the relevant character's Inspiration Points have changed, then just call `Osi.GiveInspirationPoints()` if the relevant goal is either not vanilla, or a vanilla but
granted to someone with a different background tag 🤔

I don't think this is the hidden blocker, though I'm not watching it for changes so it could be, but a custom background with two tags granted: the Acolyte background tag and its own custom tag,
only gets the Acolyte tag added into `DB_GLO_Backgrounds_Tags`

To add to `Osi.DB_GLO_Backgrounds_Tags`, you have to first make sure the correct value is present in `Osi.DB_GLO_Backgrounds_Players`.

Having the Background Tag registered and present in both `DB_GLO_Backgrounds_Tags` and `DB_GLO_Backgrounds_Players` isn't enough to get `Osi.AddBackgroundGoal()` to work, even when granting a vanilla
background tag that doesn't actually match the player's background.