# GodSpire — Game Design

> Status: Early design / prototype planning  
> Last updated: 2026-10-26  
> This file documents the developer's current intentions. Numbers, descriptions, and release targets are subject to iteration. Blank/TBD sections are deliberately unresolved.

## Game Concept

GodSpire is inspired by **Slay the Spire 2**, but replaces deckbuilding with **3D action combat**, combining Soulslike combat with hack-and-slash abilities and basic attacks.

Players, either solo or as a party, climb the Spire to defeat the god standing above all: **The Creator**.

## Core Combat

The aim is to keep mechanics relatively simple while making combat fun and action-packed.

- **M1 / basic attacks:** All characters have a four-hit M1 sequence, **except Polvern**. Polvern's exact sequence is not yet specified.
- **Combat style:** A mixture of Soulslike combat and hack-and-slash attacks and abilities.
- **Further universal combat rules:** TBD.

## Playable Characters

Five characters are intended for Beta 1. Four are currently named below; the fifth has not yet been specified.


## Polvern / Polv — The Pitmaster

**Inspiration:** Sett (League of Legends)

Polvern is a frontline bruiser who specializes in close-range combat, grappling, defensive resource management, and extended combos.

His unlockable abilities are intended to support two distinct fighting styles:

- **Burst Tank:** Focuses on surviving damage, accumulating Grit, and converting that resource into devastating attacks.
- **Combo Fighter:** Focuses on maintaining offensive pressure, extending combos, controlling enemy positioning, and maximizing consecutive damage.

Players should be encouraged to lean into one of these styles through ability selection, while hybrid builds remain possible.

### Passive — Born in the Pit

- Longer combos increase damage output, up to 75% bonus damage.
- Combo damage scaling resets after 3 seconds without continuing the combo.
- Blocking and parrying generate Grit.
- Maximum Grit is equal to 50% of Polvern's maximum HP.

### Starting Abilities

**Double Hook**
- Unleash two punches with a 200% damage increase.
- Resets the M1 combo sequence.

**Immovable**
- Convert 100% of accumulated Grit into a shield.

### Unlockable Abilities

**Face Mash**
- Grab up to 2 nearby enemies within a radius.
- Successfully grabbing 2 enemies stuns them.

**Knee Crasher**
- Lunge forward with a knee strike, pushing the target backward.
- Polvern moves alongside the target, allowing the combo to continue.
- Colliding with other enemies deals area damage.

**Crown Splitter**
- Deliver an upward kick that briefly launches an enemy.
- Creates an opportunity to extend the combo with additional attacks or abilities.

**Liberating Hook**
- Convert accumulated Grit into damage.
- Release a massive shockwave punch.
- Damage scaling and Grit consumption values are TBD.

**Show Stopper**
- Grab an enemy and soar into the sky with them.
- Slam the enemy into the ground, dealing heavy damage.
- Surrounding enemies receive 50% of the primary impact damage.

**Resolve — Legendary Passive**
- Activate health regeneration when Polvern falls below 35% maximum HP.
- The lower his remaining health, the stronger the regeneration becomes.
- Intended as a powerful legendary defensive upgrade.
- Exact regeneration scaling and limitations are TBD.

### Intended Build Paths

#### Burst Tank

**Combat identity:** Absorb punishment, build Grit, and retaliate with powerful burst attacks.

Key ability synergies:
- Born in the Pit — Grit generation
- Immovable — Defensive shielding
- Liberating Hook — Grit-powered burst damage
- Resolve — Legendary survivability

This build emphasizes resource decisions between defensive survival and offensive retaliation.

#### Combo Fighter

**Combat identity:** Maintain relentless pressure through consecutive attacks, grapples, launchers, and combo extensions.

Key ability synergies:
- Born in the Pit — Increasing combo damage
- Double Hook — M1 sequence reset
- Face Mash — Grappling and crowd control
- Knee Crasher — Combo extension and enemy displacement
- Crown Splitter — Launching and follow-up opportunities
- Show Stopper — Powerful grab-based finisher

This build emphasizes timing, positioning, and maintaining combos.

### Build Design Principles

- Both fighting styles should be viable.
- Ability unlocks should encourage specialization without forcing rigid classes.
- Legendary abilities may provide substantial build-defining advantages.
- Hybrid builds should remain possible.
- Neither path should automatically outperform the other in every encounter.
- Actual ability balance should be determined through gameplay testing rather than fixed prematurely.

### Open Design Questions

- Exact Grit generation and consumption rates.
- How combo scaling interacts with ability animations.
- Whether some abilities receive different behavior against bosses.
- Ability rarities beyond Resolve.
- Whether unlockable abilities are offered through a shared pool or weighted toward particular builds.
- Exact balance between burst damage, shielding, and regeneration.


**Previously discussed provisional stats**

- Max HP: **500**
- Starting HP: **500**
- Max Grit: **250**
- Starting Grit: **0**

These are exploratory numbers, not finalized balance values.

### Sover — Child of the Stars

*Inspired by The Regent from Slay the Spire 2.*

**Passive — The Star Forge**

- Uses swords and stars to fight.
- Starts with **20 Star Knives** and **100 Star Power**.
- M1 attacks are tied to Star Knives. Exact consumption / regeneration rules TBD.

**Starting abilities**

- **Knife Forge:** Generate **20 Star Knives**, consuming **5 Star Power**.
- **Sovereign Blade:** Consume **30 Star Power** to forge a blade; the next **5 M1s** become medium-range slashes.
- **Meditate (Passive):** Standing still for at least **2 seconds** activates Meditate, regenerating **10 Star Power every 0.5 seconds**.

**Unlockable abilities / passives**

- **Sovereign Scythe:** Consume **45 Star Power** to forge a scythe; the next **5 M1s** gain greater range and collateral damage.
- **Regent of the Forge (Passive):** Dealing damage generates **2 Star Power per hit**.
- **Star Shackles:** Stun nearby enemies and deal damage over time.
- **Sovereign Rampart:** Create a massive wall that blocks incoming projectiles or attacks for **1 second**; consumes **30 Star Power**.
- **Piercing Stardust:** Rain multiple star blades onto a targeted area.

### Kong — The One to Be King

*Inspired by Sun Wukong from Journey to the West.*

**Passive — King's Discipline**

- Gains a **Focus** bar as hits land, up to **10 Focus points**.
- At maximum Focus, activate **War King**.

**Passive — War King**

- Kong uses the **Cloud Staff**, capable of extending and shrinking.
- On death, immediately recover **10 HP** and continue fighting. Cooldown: **2 combat encounters**.
- All M1 attacks gain longer reach and larger hitboxes while Extend! is active.

**Starting abilities**

- **Cloud Crash:** Smash the ground; if an opponent is hit, damage is amplified by **150%**. War King increases range.
- **Cloud Step:** Become invisible, leaving behind a clone that distracts enemies; dash forward a short distance.

**Unlockable abilities**

- **Royal Decree:** Mark up to **4 enemies**; everyone deals **25% increased damage** to those targets.
- **Stone Skin:** Harden skin to block **75% of incoming damage**. With successful timing, parry the target instead, block all incoming damage, and refresh **90% of the cooldown**.
- **Intimidation:** Briefly stun surrounding enemies.
- **Soaring Thrust:** While grounded, fire the staff forward; while airborne, thrust the staff downward for area damage.
- **Cloud Burst:** Kong thrusts his staff at high speeds mulitple times, increase it's hitbox if in War King

### Nashirey — Nature's Goddess

**Passive:** TBD.

**Abilities:** TBD.

### Fifth Character

**Name / title:** TBD.  
**Passive and abilities:** TBD.

## Relics

TBD. Relics are intended to aid gameplay and build decisions within a run.

## Potions

TBD. Potions are intended to aid gameplay during runs.

## World and Deep Lore

Fighters from different backgrounds set out to defeat the god towering over the Spire. The Creator has brought havoc upon the mortal world; the fighters climb to stop him from causing further destruction.

The story emphasizes the need for allies, even though the game supports solo play.

Further lore, the precise motivation of The Creator, and the significance of the Spire are TBD.

## Bosses

### The Observer

- Planned as the final boss and an extremely difficult, nearly impossible challenge in **Beta 0**.
- Planned to become **slightly easier in Beta 1**.
- Exact mechanics: TBD.

### The Creator

- The god at the top of the Spire and the central antagonist.
- Introduced as a boss **after The Observer** in Beta 1.
- At full launch, the ultimate boss encounter should be meaningfully playable and **winnable**.
- Exact mechanics and encounter structure: TBD.

## Release Roadmap

These are **targets**, not fixed promises.

### Beta 0 — Launch

- **Characters:** First **2 designed characters** (currently Polvern and Sover in document order).
- **Modes:** Singleplayer and co-op up to **2 players**.
- **Items:** A small selection of relics and potions.
- **Areas:** At least **2**, each with around **5–7 encounters**.
- **Bosses:** Multiple bosses; final boss is **The Observer**, initially extremely difficult / nearly impossible.

### Beta 0.x — Interim Iterations

Intermediate releases (for example, Beta 0.5) may be used to introduce and test incremental improvements before Beta 1. Specific contents: TBD.

### Beta 1 — Testing

- **Characters:** All **5 planned characters**.
- **Modes:** Co-op expands to **4 players**.
- **Items:** Potentially more relics and potions.
- **Areas:** **1 additional area**.
- **Bosses:** **1 new boss**, with the introduction of **The Creator**, encountered after The Observer.
- **Difficulty:** The Observer becomes slightly easier than in Beta 0.

### Full Launch

- **Characters:** Final count TBD.
- **Modes:** Singleplayer and multiplayer.
- **Items:** Significantly more relics and potions to create more structured decisions.
- **Areas:** At least **4–5 areas**, with approximately **6–12 encounters each**.
- **Bosses:** More bosses; the final boss becomes a fully realized encounter that players can beat.
- **Quick Mode modifier (proposed):** Reduce the number of areas and floors/encounters per area.
- **Modifier access (proposed):** VIP-only initially. Whenever **2 new modifiers** are released, an older modifier becomes free to use.

## Monetization Ideas

Proposed, not implemented or locked:

- Character skins
- VIP
- Donations
- In-game Money and Gems
- Gacha systems

Monetization details, pricing, fairness, platform-policy compliance, and progression impact remain TBD.

## Open Design Questions

- What makes Polvern's basic attack sequence different from the standard four-hit M1 chain?
- What are the exact rules for damage, blocking, parrying, dodging, enemy stagger, and player death?
- How are Strength, Grit, Star Knives, Star Power, and Focus calculated and replenished?
- What are Nashirey's mechanics and the fifth Hero's identity?
- How do abilities unlock and how many can be equipped at a time?
- What do relic and potion acquisition, rarity, and run progression look like?
- Are encounter layouts handcrafted, randomized, or mixed?
- How do enemy count, HP, and difficulty scale with party size?
- What separates The Observer from The Creator mechanically and narratively?
- How should Quick Mode and VIP modifiers interact with rewards and fair progression?

## Design Guardrail

Keep the core combat enjoyable before expanding content, multiplayer complexity, procedural systems, or monetization. Do not treat TBD details as finalized decisions.
