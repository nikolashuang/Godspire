
# GodSpire — Game Design

> Status: Early Development / Prototype Planning
>
> Last Updated: 2026-10-27
>
> Companion Document: [GODSPIRE_CONTEXT.md](./GODSPIRE_CONTEXT.md)
>
> This document records GodSpire's current game design, character identities, combat mechanics, progression systems, lore, and release roadmap.
>
> Mechanics and numerical values may change during development. Unfinished decisions are marked TBD.

---

# 1. Game Concept

GodSpire is a 3D action roguelike inspired by **Slay the Spire 2**, replacing deckbuilding and turn-based card combat with real-time 3D combat.

Its combat combines elements of:

- Soulslike combat.
- Hack-and-slash abilities.
- Basic attack combos.
- Character-specific resources and mechanics.
- Strategic build development during runs.

Players choose a Hero and ascend the Spire, either alone or cooperatively.

Throughout a run, players acquire abilities, passives, relics, potions, and additional stat points to strengthen their Heroes.

At the top of the Spire stands **The Creator**, a God whose actions have brought havoc upon the mortal world.

The ultimate objective is to climb the Spire and defeat The Creator.

## Design Philosophy

GodSpire aims to provide:

- Simple but engaging combat mechanics.
- Fast and responsive action.
- Meaningful character differences.
- Multiple viable builds per Hero.
- Strategic decision-making between encounters.
- Replayability through roguelike progression.
- Both singleplayer and cooperative gameplay.
- A manageable development scope for a solo developer.

The goal is to blend mechanical combat skill with strategic build decisions.

---

# 2. Core Combat

## Combat Identity

The combat system combines deliberate Soulslike defensive mechanics with faster hack-and-slash offense.

Players should be rewarded for understanding enemy attacks, positioning correctly, maintaining combos, and using abilities effectively.

## Basic Attacks (M1)

- All Heroes have a four-hit M1 attack sequence, except Polvern.
- Polvern's exact M1 sequence is TBD.
- M1s can interact with character passives, resources, and abilities.
- Some abilities may reset, replace, enhance, or extend M1 combos.

## Defensive Mechanics

The intended universal defensive mechanics include:

- Blocking.
- Parrying.
- Dodging.
- Block capacity.
- Temporary shields.

Characters may modify the behavior of these mechanics through their innate passives.

Examples:

- Polvern performs relatively stationary dodges through Quick Reflex.
- Sover creates magical shields through Star Shielding.
- Kong has access to Stone Skin as an unlockable defensive ability.

Exact universal block, parry, dodge, and shield calculations are TBD.

---

# 3. Primary Stats

Every Hero begins a run with **50 preallocated stat points**.

These points are distributed differently for each Hero to establish their starting strengths, weaknesses, and combat identity.

Players earn additional stat points throughout a run and choose how to allocate them.

## Stat Definitions

### Strength (STR)

Strength determines a Hero's baseline damage output.

It also provides additional damage scaling for abilities specifically designed to scale with Strength.

- Contributes to every Hero's baseline damage.
- Improves additional damage on Strength-scaling abilities.
- Supports physical and offensive builds.
- Does not automatically provide additional Strength scaling to every ability.

### Dexterity (DEX)

Dexterity determines defensive Block capacity and influences shield strength.

- Increases Block capacity.
- Increases the size or effectiveness of shields.
- Supports defensive builds.

Dexterity is not currently intended to increase attack speed or blocking animation speed.

Exact scaling formulas are TBD.

### Arcane (ARC)

Arcane represents magical potency.

It is a flexible support and scaling attribute that affects different properties depending on the ability.

Possible applications include:

- Additional magical damage.
- Healing effectiveness.
- Magical shielding.
- Ability-specific magical effects.
- Other magical properties.

Arcane does not have to increase damage on every ability.

### Vitality (VIT)

Vitality determines a Hero's health scaling.

- Increases maximum HP.
- Improves survivability.
- Can indirectly strengthen mechanics based on maximum health.

Exact HP scaling is TBD.

## Base Damage vs. Ability Scaling

Strength contributes to the baseline damage of every damaging attack.

An ability may then receive additional scaling from:

- Strength.
- Arcane.
- Strength and Arcane.
- Other attributes when appropriate.

An ability listed as **Arcane Scaling** still uses the baseline damage established through Strength, but its additional scaling comes from Arcane.

An ability listed as **Strength Scaling** receives additional scaling through Strength.

Hybrid abilities may use multiple scaling attributes with different coefficients.

For example:

- Face Mash: Strength Scaling.
- Piercing Stardust: Arcane Scaling.
- Liberating Hook: Strength + Arcane Scaling.
- Sovereign Rampart: Arcane + Dexterity Scaling.

Exact damage formulas, coefficients, and caps remain TBD.

## Stat Progression

- Every Hero begins with 50 predetermined stat points.
- Starting allocations are unique to each Hero.
- Players acquire additional stat points while progressing through the Spire.
- Earned points can be allocated according to the player's preferred build.
- Stat bonuses are intended to be run-specific.
- At the beginning of a new run, Heroes return to their original starting allocation.

The amount and frequency of earned stat points are TBD.

Stat allocation at Rest Sites has been discussed as a possible rule but is not finalized.

---

# 4. Roguelike Progression

GodSpire uses a run-based progression structure inspired by Slay the Spire.

Players start with a limited character kit and develop their build through encounters.

## Starting Kits

Every Hero begins with:

- Their predetermined starting stats.
- Their innate passives.
- Their starting abilities.
- Their character-specific combat resources.

Starting abilities are available without needing to find them as rewards.

## Ability Acquisition

Players obtain additional abilities and passives during runs.

Unlockable abilities are not automatically available simply because they belong to a character's ability pool.

Instead, their availability depends on the rewards encountered during the run.

The intended progression is:

1. Enter the Spire with a starting kit.
2. Complete combat encounters.
3. Receive rewards.
4. Acquire abilities, passives, stat points, or other upgrades.
5. Develop a specialized build.
6. Continue climbing until victory or defeat.

The exact reward-generation system remains TBD.

## Ability Rarity

Unlockable abilities use three established rarity tiers.

| Rarity | Color |
|---|---|
| Common | Gray |
| Rare | Red |
| Legendary | Blue |

Rarity influences how abilities appear through rewards.

Legendary abilities are intended to offer particularly impactful effects and may enable major changes to a character's build.

Rarity should not necessarily mean that an ability deals more raw damage.

Common abilities should remain useful throughout a run.

**Confirmed rarity assignment:**

- Polvern's Resolve: Legendary Passive.

Other individual ability rarities have not been fully recorded and remain TBD.

## Ability Inventory and Equipment

Players can collect multiple abilities during a run.

However, active combat abilities occupy a limited number of equipped slots.

### Confirmed Rules

- Players retain acquired abilities during the current run.
- Collected abilities do not all need to be equipped simultaneously.
- Players can only change their equipped active abilities at Rest Sites.
- Equipment decisions are intended to create strategic commitment between encounters.

### Still Under Consideration

- Exact number of active ability slots.
- Whether newly acquired abilities can fill empty slots immediately.
- Whether passive abilities are always active or subject to limits.
- Whether starting abilities can be unequipped.
- Whether abilities can be upgraded or duplicated.

Four active slots have been suggested as an initial prototype value, but are not finalized.

## Rest Sites

Rest Sites are locations where players prepare for upcoming encounters.

Their established function is to allow players to change equipped abilities.

They encourage strategic planning rather than constant loadout swapping.

Potential additional functions include:

- Healing.
- Stat allocation.
- Other preparation activities.

These additional functions are TBD.

## Character Build Philosophy

Each Hero should support more than one meaningful playstyle.

Builds emerge through:

- Acquired active abilities.
- Acquired passives.
- Stat allocation.
- Relic interactions.
- Resource management.
- Player decision-making.

Players should be encouraged to specialize without being prevented from experimenting with hybrid builds.

---

# 5. Playable Heroes

Five Heroes are currently planned for Beta 1.

The first two Heroes targeted for Beta 0 are Polvern and Sover.

Each Hero has different starting stats, innate mechanics, and possible build directions.

---

# 5.1. Polvern / Polv — The Pitmaster

**Inspiration:** Sett from League of Legends.

**Combat Identity:** Brawler / Combo Fighter / Burst Tank.

Polvern is an aggressive close-range fighter who specializes in extended combos, grappling, defensive timing, and Grit-powered attacks.

He is intended to support two primary build directions:

- Burst Tank.
- Combo Fighter.

Hybrid builds should remain viable.

## Base Stats

| Stat | Points |
|---|---:|
| Strength | 20 |
| Dexterity | 10 |
| Arcane | 5 |
| Vitality | 15 |
| **Total** | **50** |

## Innate Passive — Born in the Pit

- Longer combos increase damage output.
- Maximum combo damage bonus is 75%.
- Combo scaling resets after 3 seconds without continuing the combo.
- Blocking, parrying, and dodging generate Grit.
- Maximum Grit equals 50% of Polvern's maximum HP.

Exact Grit generation values and the definition of a successful defensive action are TBD.

## Innate Passive — Quick Reflex

Through his experience as a fighter, Polvern has developed exceptional reflexes.

Instead of relying on long dodge rolls or large evasive movements, Polvern dodges with little to no displacement.

- Dodging is relatively stationary.
- Successful dodges mitigate all incoming damage covered by the dodge.
- Designed to support aggressive positioning and combo pressure.

Exact dodge timing and invulnerability behavior are TBD.

## Starting Abilities

### Double Hook

Unleash two powerful consecutive punches.

- Each punch has a 200% damage increase, as currently described.
- Resets Polvern's M1 combo sequence.

**Scaling:** TBD.

The exact interpretation of the 200% damage increase should be confirmed during balance implementation.

### Immovable

Convert accumulated Grit into a temporary shield.

- Consumes 100% of available Grit.
- Converts the consumed Grit into shielding.

**Scaling:** Grit-based; interaction with Dexterity is TBD.

## Unlockable Abilities and Passives

### Face Mash

Grab nearby enemies within a radius.

- Maximum targets: 2.
- If two enemies are successfully grabbed, they are stunned.

**Scaling:** Strength.

### Knee Crasher

Lunge toward an enemy with a powerful knee strike.

- Pushes the target backward.
- Polvern moves alongside the target.
- Allows the combo to continue.
- Collisions with surrounding enemies deal area damage.

**Scaling:** Strength.

### Crown Splitter

Deliver an upward kick that briefly launches an enemy.

- Creates an opportunity to extend the current combo.
- Enables additional follow-up attacks or abilities.

**Scaling:** Strength.

### Liberating Hook

Convert Grit into an enormous shockwave punch.

- Uses Grit to amplify the attack.
- Intended as a major burst-damage option.

**Scaling:** Strength + Arcane.

Exact Grit-to-damage conversion is TBD.

### Show Stopper

Grab an enemy and soar into the sky with them.

- Slam the captured enemy into the ground.
- Deal primary impact damage.
- Surrounding enemies receive 50% of the primary impact damage.

**Scaling:** Strength.

### Resolve — Legendary Passive

Gain health regeneration when Polvern falls below 35% maximum HP.

- Regeneration activates below 35% HP.
- The lower Polvern's current health, the stronger the regeneration becomes.
- Intended as an impactful survivability upgrade.

Exact regeneration scaling and limitations are TBD.

## Intended Build Paths

### Burst Tank

Focuses on Grit management, defensive survival, and powerful retaliation.

Potential synergies:

- Born in the Pit.
- Immovable.
- Liberating Hook.
- Resolve.
- Vitality and defensive investment.

### Combo Fighter

Focuses on maintaining pressure and extending offensive sequences.

Potential synergies:

- Born in the Pit.
- Double Hook.
- Face Mash.
- Knee Crasher.
- Crown Splitter.
- Show Stopper.
- Strength investment.

## Provisional Combat Values

Previously discussed values:

- Max HP: 500.
- Starting HP: 500.
- Max Grit: 250.
- Starting Grit: 0.

These are exploratory values and may change with the stat-scaling system.

## Open Character Questions

- Exact combo damage progression.
- Grit generation rates.
- Grit consumption and conversion formulas.
- Interaction between Immovable and Dexterity.
- Whether Resolve scales with Vitality.
- Boss-specific behavior for grabs and launches.
- Final ability rarity assignments.

---

# 5.2. Sover — Child of the Stars

**Inspiration:** The Regent from Slay the Spire 2.

**Combat Identity:** Celestial Weaponsmith / Mystic Arts / Resource Management.

Sover uses Star Knives and forged celestial weapons to fight.

His mechanics revolve around managing Star Power, choosing which weapons to forge, and using magical defensive techniques.

## Base Stats

| Stat | Points |
|---|---:|
| Strength | 10 |
| Dexterity | 10 |
| Arcane | 25 |
| Vitality | 5 |
| **Total** | **50** |

## Innate Passive — The Star Forge

Sover fights using weapons created through celestial power.

- Starts with 20 Star Knives.
- Starts with 100 Star Power.
- M1 attacks are connected to Star Knives.

**Star Knife Damage Scaling:** Strength + Arcane.

Exact Star Knife consumption and attack sequence rules are TBD.

## Innate Passive — Star Shielding

Sover is less physically agile than other Heroes.

Rather than performing conventional dodge rolls, Sover creates miniature magical shields to defend himself.

- His defensive action manifests through magical shields.
- Intended to provide an alternative defensive identity.

Exact Block interactions, timing, and resource consumption are TBD.

## Starting Abilities

### Knife Forge

Generate Star Knives using Star Power.

- Generates 20 Star Knives.
- Consumes 5 Star Power.

Maximum Star Knife capacity and whether Knife Forge can exceed that capacity are TBD.

### Sovereign Blade

Forge a celestial blade that temporarily replaces Sover's M1 attacks.

- Consumes 30 Star Power.
- The next 5 M1s become medium-range slash attacks.

**Scaling:** Strength + Arcane.

### Meditate — Innate Passive

Sover restores Star Power by remaining stationary.

- Activates after standing still for at least 2 seconds.
- Regenerates 2.5 Star Power every 0.5 seconds.
- Using abilities interrupts meditation.

Movement interruption rules and whether defensive actions interrupt meditation are TBD.

At the current rate, meditation restores 5 Star Power per second after activation.

## Unlockable Abilities and Passives

### Sovereign Scythe

Forge a celestial scythe.

- Consumes 45 Star Power.
- The next 5 M1s gain increased range and collateral damage.

**Scaling:** Strength + Arcane.

### Regent of the Forge — Passive

Generate Star Power by dealing damage.

- Gain 2 Star Power per successful hit.

Interaction with repeated hits, damage-over-time attacks, and large AoE effects is TBD.

### Star Shackles

Conjure celestial restraints around enemies.

- Stuns enemies within a radius.
- Deals damage over time.

**Scaling:** Arcane.

### Sovereign Rampart

Create a massive defensive wall using celestial power.

- Consumes 30 Star Power.
- Lasts 2.5 seconds.
- Blocks incoming projectiles and attacks.
- Teammates can stand behind the wall for protection.

**Scaling:** Arcane + Dexterity.

Exact wall durability, directional coverage, and interaction with enemy attacks are TBD.

### Piercing Stardust

Rain multiple celestial blades onto a targeted area.

- Deals area damage through falling star blades.

**Scaling:** Arcane.

Exact targeting, duration, and damage behavior are TBD.

## Possible Build Directions

These are design interpretations, not fixed build classes.

### Celestial Weapons

Emphasizes forged weapons and enhanced M1 attacks.

Potential abilities:

- Sovereign Blade.
- Sovereign Scythe.
- Regent of the Forge.

### Star Magic

Emphasizes magical abilities and area damage.

Potential abilities:

- Star Shackles.
- Piercing Stardust.
- Regent of the Forge.

### Defensive Support

Emphasizes magical protection and team utility.

Potential abilities:

- Sovereign Rampart.
- Star Shielding.
- Dexterity and Arcane investment.

## Open Character Questions

- Star Knife consumption during M1 attacks.
- What happens when Sover has zero Star Knives.
- Maximum Star Knife capacity.
- Maximum Star Power scaling.
- Star Shielding behavior.
- Meditation interruption conditions.
- Regent of the Forge regeneration limits.
- Final ability rarity assignments.

---

# 5.3. Kong — The One to Be King

**Inspiration:** Sun Wukong from Journey to the West.

**Combat Identity:** Staff Fighter / Focus Management / Mobility.

Kong uses the Cloud Staff, a weapon capable of extending and shrinking.

His gameplay revolves around building Focus through aggressive combat and enhancing his abilities.

## Base Stats

TBD.

Total starting allocation will equal 50 points.

## Innate Passive — Unrelenting Ambition

- Kong gains Focus by successfully landing hits.
- Maximum Focus: 10 points.
- Reaching maximum Focus activates Extend!.

The exact effect, duration, and consumption behavior of Extend! are TBD.

## Innate Passive — War King

Kong wields the Cloud Staff.

- The Cloud Staff can extend and shrink.
- His M1 attacks have increased range and larger hitboxes.
- When Kong dies, he immediately recovers 10 HP and continues fighting.
- The revival effect has a cooldown of 2 combat encounters.

Interactions with multiplayer downing and resurrection mechanics are TBD.

## Starting Abilities

### Cloud Crash

Kong slams his staff into the ground.

- Successfully hitting an opponent amplifies damage by 150%.
- Extend! increases the attack's range.

### Cloud Step

Kong becomes invisible and moves forward.

- Leaves behind a clone.
- Enemies are redirected toward the clone.
- Kong performs a short forward dash.

## Unlockable Abilities

### Royal Decree

Mark up to 4 enemies.

- Marked enemies receive 25% increased damage from everyone.

### Stone Skin

Kong hardens his body into stone.

- Reduces incoming damage by 75%.
- Successfully timing the defense instead parries the target.
- A successful parry blocks all incoming damage.
- Successful timing refreshes 90% of the ability cooldown.

### Intimidation

Kong intimidates nearby enemies.

- Briefly stuns enemies within range.

### Soaring Thrust

Attack behavior changes depending on whether Kong is grounded or airborne.

- Grounded: Thrust the staff forward.
- Airborne: Thrust the staff downward, dealing area damage.

### Cloud Burst

Kong manipulates clouds across the arena.

- Enemies touching the clouds are slowed.
- Affected enemies take 5% increased damage from others.

## Open Character Questions

- Starting stat distribution.
- Exact Focus generation.
- Extend! activation and effects.
- Duration of crowd-control effects.
- Scaling attributes for individual abilities.
- Final rarity assignments.
- Interaction between War King's revival and the run-death system.

---

# 5.4. Nashirey — The Aspect of Nature

**Combat Identity:** Nature Magic / Healing / Wood Manipulation.

Nashirey is the Aspect of Nature and channels divine abilities borrowed from **Reenver, the Father of All Nature**.

She is not currently defined as a Goddess herself.

Instead, her abilities originate from her connection to Reenver.

## Intended Gameplay Identity

Nashirey specializes in:

- Healing.
- Nature-based magic.
- Wood manipulation.
- Offensive wood-style techniques.
- Potential cooperative support.

Arcane is expected to play an important role in her healing effectiveness and magical abilities.

Strength continues to determine her baseline damage.

## Base Stats

TBD.

Total starting allocation will equal 50 points.

## Innate Passives

TBD.

## Starting Abilities

TBD.

## Unlockable Abilities

TBD.

## Divine Connection

Nashirey's powers are borrowed from Reenver.

Her abilities are manifestations of his authority over nature.

Her exact relationship with Reenver and the reason she possesses these abilities remain TBD.

---

# 5.5. Divi — Last Hope of Divinity

**Combat Identity:** Divine Light / Glint Magic / Marking.

Divi specializes in magical attacks that apply marks to enemies.

## Base Stats

TBD.

Total starting allocation will equal 50 points.

## Innate Passive — Glint Marks

- Hitting enemies with Glint abilities applies Char.

Exact mark duration, stacking, and application rules are TBD.

## Innate Passive — Purging Light

- Deal 5% additional damage to enemies marked with Char.

## Starting Abilities

### Glittersparkle — Glint

Conjure a blinding light in front of Divi.

- Affects enemies within its radius.
- Applies Char marks.

### Glittery Jewels

Fire multiple projectiles made of divine light toward enemies.

## Unlockable Abilities

TBD.

## Open Character Questions

- Starting stat distribution.
- Char duration and stacking rules.
- Whether Char interacts with teammate damage.
- Scaling attributes.
- Additional abilities and passives.
- Final rarity assignments.

---

# 6. Relics

Relics are run-based upgrades intended to influence how players build their Heroes.

Their purpose is to provide additional strategic decisions and create interactions with character mechanics.

Potential interactions include:

- Improving attributes.
- Enhancing combat resources.
- Strengthening defensive effects.
- Modifying ability behavior.
- Supporting specialized builds.

These are potential design categories rather than finalized relic effects.

## Current Status

Individual relics: TBD.

Relic rarities: TBD.

Acquisition rules: TBD.

Stacking and duplicate behavior: TBD.

Beta 0 is intended to include a small initial selection.

---

# 7. Potions

Potions provide additional tools to aid players during runs.

They may support survival, combat, or temporary build enhancement.

## Current Status

Individual potions: TBD.

Inventory limits: TBD.

Acquisition rules: TBD.

Potion rarity and effects: TBD.

Beta 0 is intended to include a small initial selection.

---

# 8. World and Deep Lore

## The Spire

High above the mortal world stands the Spire.

Within it resides a powerful God known as The Creator.

Havoc has been brought upon the mortal world, prompting fighters from many different backgrounds to climb the Spire and challenge the God standing above them all.

The ascent is dangerous, and even powerful Heroes may struggle to survive.

Though the journey can be attempted alone, cooperation may provide the strength necessary to overcome the Spire's challenges.

## The Creator

The Creator is the primary divine antagonist of GodSpire.

He stands above the mortal world within the Spire.

His actions have brought destruction and suffering upon mortals, driving Heroes to challenge him.

His exact motivations, origins, and relationship with other divine beings remain TBD.

## Reenver — The Father of All Nature

**Title:** The Father of All Nature.

**Domain:** Nature.

**Known Connection:** Nashirey, the Aspect of Nature.

Reenver is a God associated with nature and the mysterious resurrection of fallen Heroes.

Whenever Heroes fall during their journey through the Spire, they mysteriously awaken at its base.

Upon returning, they are surrounded by the refreshing scent of the forest.

No matter how many times they perish, they continue to return.

Reenver is responsible for these revivals, restoring the fallen through **Nature's Blessing**.

His exact reasons for repeatedly reviving the Heroes remain unknown.

## Nature's Blessing

Nature's Blessing is the divine power through which Reenver restores fallen Heroes to life.

It provides the narrative explanation for GodSpire's roguelike death-and-restart structure.

When Heroes perish during a run, they return to the base of the Spire through Reenver's intervention.

Their equipment, abilities, and acquired run progression reset according to the game's roguelike systems.

Whether the Heroes retain their memories of previous attempts is TBD.

## Nashirey and Reenver

Nashirey is known as the Aspect of Nature.

She borrows her abilities from Reenver rather than possessing independent divine authority over nature.

Through this connection, she can manipulate wood, attack enemies through nature-based techniques, and heal allies.

The precise nature of her relationship with Reenver is currently unknown.

It has not yet been established whether she can use Nature's Blessing to resurrect fallen allies.

## Unresolved Lore Questions

- Why does The Creator bring havoc upon mortals?
- Why does Reenver repeatedly revive the Heroes?
- What is Reenver's relationship with The Creator?
- Why has Nashirey been granted Reenver's abilities?
- What limitations does Nature's Blessing have?
- Are other divine beings involved in the conflict?
- What happens when The Creator is defeated?

These questions are intentionally unresolved and may be developed as the story expands.

---

# 9. Bosses

## The Observer

The Observer is planned as an extremely powerful boss encountered near the end of the climb.

### Beta 0

- Serves as the final boss.
- Designed to be extremely difficult, almost impossible to defeat.

### Beta 1

- Becomes slightly easier compared with Beta 0.
- The Creator is introduced as a boss encountered after The Observer.

Exact attacks, mechanics, and narrative role remain TBD.

## The Creator

The Creator is GodSpire's central antagonist.

### Beta 1

- Introduced as a boss after The Observer.

### Full Launch

- Becomes a complete and meaningfully winnable final boss encounter.

Exact mechanics, phases, and rewards remain TBD.

---

# 10. Release Roadmap

Release targets are subject to development progress and playtesting.

## Beta 0 — Initial Launch

### Characters

- Polvern — The Pitmaster.
- Sover — Child of the Stars.

### Game Modes

- Singleplayer.
- Cooperative multiplayer supporting up to 2 players.

### Content

- At least 2 areas.
- Approximately 5–7 encounters per area.
- A small selection of relics.
- A small selection of potions.
- Different bosses.
- The Observer as an exceptionally difficult final boss.

### Development Priority

Establish a complete playable foundation around the first two Heroes.

The goal is to validate combat, progression, encounter flow, and replayability.

---

## Beta 0.x — Intermediate Updates

Optional intermediate releases may be used for:

- Balance changes.
- Bug fixes.
- Additional content.
- Combat improvements.
- Multiplayer testing.
- Quality-of-life improvements.

Specific milestones are TBD.

---

## Beta 1 — Testing

### Characters

All 5 currently planned Heroes:

- Polvern.
- Sover.
- Kong.
- Nashirey.
- Divi.

### Multiplayer

- Increase the maximum party size to 4 players.

### Content

- One additional area.
- Additional relics and potions, if appropriate.
- One new boss.
- Introduction of The Creator as a boss after The Observer.
- The Observer becomes slightly easier.

---

## Full Launch

### Characters

Final Hero count: TBD.

### Game Modes

- Singleplayer.
- Multiplayer.

The intended cooperative player limit is up to 4, following Beta 1.

### Content

- At least 4–5 areas.
- Approximately 6–12 encounters per area.
- More relics and potions.
- More structured build decisions.
- Additional bosses.
- A complete final encounter in which The Creator can be defeated.

### Quick Mode Modifier

A proposed modifier that reduces the length of a run.

Potential effects:

- Fewer areas.
- Fewer encounters per area.
- Shorter overall run duration.

### Modifier Access Proposal

- New modifiers may initially be exclusive to VIP players.
- Whenever 2 new modifiers are released, an older modifier becomes available for free.

These modifier and access rules are proposals, not finalized monetization decisions.

---

# 11. Monetization

GodSpire may include the following monetization systems:

## Character Skins

Cosmetic appearances for playable Heroes.

## VIP

A premium membership or gamepass offering additional features.

Exact benefits remain TBD.

## Donations

Optional purchases that allow players to support development.

## Money and Gems

Potential in-game currencies.

Their exact purposes, acquisition methods, and relationship to permanent progression remain TBD.

## Gacha Systems

Potential randomized reward systems.

The precise rewards, costs, probabilities, and implementation remain TBD.

Any monetization implementation must comply with Roblox's applicable platform rules and regional restrictions.

---

# 12. Future Directions

GodSpire may eventually expand beyond the Spire itself.

One long-term concept is a larger connected world inspired by the mission-oriented structure of Helldivers.

Players could travel to different regions to protect cities and villages from threats.

Potential concepts include:

- A more open world.
- Multiple regions.
- Cities and villages requiring protection.
- Cooperative defensive missions.
- Additional activities outside the Spire.

This direction is exploratory and is not part of the initial Beta 0 scope.

Future expansion should reuse existing gameplay systems wherever practical rather than requiring an entirely separate game architecture.

---

# 13. Unresolved Design Questions

## Combat

- Exact base damage formula.
- Strength and Arcane scaling coefficients.
- Maximum health calculations.
- Dexterity and Block capacity scaling.
- Shield stacking and durability rules.
- Block regeneration.
- Parry and dodge timing.
- Damage mitigation and enemy stagger.
- Character-specific defensive interactions.

## Character Systems

- Final ability scaling coefficients.
- Ability cooldowns.
- Character resource regeneration.
- Ability rarity assignments.
- Kong's exact Extend! behavior.
- Nashirey's complete ability kit.
- Divi's complete ability kit.
- Kong, Nashirey, and Divi starting stats.

## Roguelike Progression

- Number of equipped ability slots.
- Passive ability limits.
- Ability reward distribution.
- Rarity probabilities.
- Stat point reward frequency.
- Exact stat allocation locations.
- Rest Site frequency.
- Relic and potion reward systems.
- Run generation and encounter selection.
- Permanent progression between runs.

## Multiplayer

- Enemy difficulty scaling with player count.
- Cooperative revival mechanics.
- Reward ownership.
- Encounter synchronization.
- Interaction between character support abilities and allies.

## World and Lore

- The Creator's motivations.
- Reenver's motivations and limitations.
- Nashirey's divine connection.
- The Observer's narrative role.
- The consequences of defeating The Creator.

---

# 14. Development Priorities

GodSpire is being developed primarily by a solo developer.

Development should remain gradual and focused on proving individual systems through gameplay.

## Initial Prototype Priorities

1. Establish a functioning Rojo project structure.
2. Implement a basic Hero instance and character configuration.
3. Implement fundamental movement and defensive mechanics.
4. Implement M1 combat.
5. Implement a basic enemy.
6. Prototype Polvern's starting mechanics.
7. Prototype Sover's starting mechanics.
8. Establish basic damage and stat calculations.
9. Test a small combat encounter.
10. Expand into a simple run with ability rewards and Rest Sites.

Cooperative systems, additional Heroes, and more advanced progression mechanics should be added incrementally.

## Design Guardrail

GodSpire should prioritize enjoyable combat and maintainable development over excessive complexity.

Avoid implementing every planned system simultaneously.

Preserve established design decisions where possible, experiment with small prototypes, and revise mechanics based on actual gameplay.

**The immediate goal is to create a playable and enjoyable foundation for Polvern and Sover before expanding the full roguelike experience.**
