
# GodSpire — Development Context

> Status: Active Development Context
>
> Last Updated: 2026-10-27
>
> Companion Document: [GODSPIRE_DESIGN.md](./GODSPIRE_DESIGN.md)
>
> Repository: `nikolashuang/GodSpire`

---

# 1. Purpose

This document provides development context for GodSpire and future ChatGPT conversations.

It records:

- Development philosophy.
- Developer experience and preferences.
- Project architecture.
- Technical decisions.
- Gameplay implementation considerations.
- Established systems and terminology.
- Current priorities.
- Unresolved architectural questions.

**GODSPIRE_DESIGN.md is the canonical reference for gameplay design, character mechanics, lore, and release planning.**

This document should not duplicate full character descriptions or ability lists.

Both files should be reviewed alongside the latest repository code before recommending significant implementation changes.

---

# 2. Project Identity

- **Name:** GodSpire
- **Platform:** Roblox
- **Language:** Luau
- **Development Tools:** Roblox Studio and Rojo
- **Development Team:** Primarily solo developer
- **Genre:** 3D Action Roguelike
- **Inspirations:** Slay the Spire 2, Soulslike combat, and hack-and-slash games

## Gameplay Overview

GodSpire replaces traditional deckbuilding with real-time combat.

Players select a Hero and climb the Spire, acquiring abilities, passives, stat points, relics, and potions throughout a run.

Each Hero has a distinct combat identity and starting kit.

Players make strategic build decisions while also mastering mechanical combat.

The game supports solo play and cooperative multiplayer.

## Multiplayer Targets

- Beta 0: Up to 2 players per run.
- Beta 1: Up to 4 players per run.
- Full Launch: Singleplayer and multiplayer, targeting up to 4 players.

The initial development priority remains functional singleplayer combat.

---

# 3. Developer Background

The developer has previous programming experience with:

- C#
- C++
- Java

The developer is strengthening their knowledge of:

- Luau.
- Roblox-specific APIs.
- Roblox networking.
- Combat architecture.
- Multiplayer state management.
- Maintainable game development.

## Previous Project — Overtake

Before GodSpire, the developer worked on Overtake, a multiplayer parkour game.

Overtake involved complex movement mechanics and competitive gameplay.

Development became difficult when restructuring around Roblox's newer Server Authority systems.

Although the architecture was understood conceptually, unfamiliar APIs and the amount of implementation knowledge required created excessive complexity.

GodSpire should avoid repeating this experience.

## Lessons From Overtake

- Learn systems incrementally.
- Avoid unnecessary architectural complexity.
- Implement and test small mechanics individually.
- Understand unfamiliar APIs before depending on them extensively.
- Prefer maintainable solutions suitable for one developer.
- Prioritize progress through practical experimentation.
- Avoid premature networking complexity.
- Preserve architectural consistency.

---

# 4. ChatGPT Collaboration Guidelines

ChatGPT should act as a development mentor and collaborative engineering partner.

## Preferred Assistance

- Explain how and why systems work.
- Identify genuine problems and tradeoffs.
- Help reason about architecture.
- Provide focused examples and pseudocode.
- Prefer conceptual guidance before complete implementations.
- Provide complete code when explicitly requested or clearly appropriate.
- Help with debugging and implementation planning.
- Challenge decisions constructively.
- Preserve decisions already made unless there is a meaningful reason to revisit them.

## Communication Style

- Professional.
- Concise by default.
- Technically grounded.
- No unnecessary emojis.
- Avoid excessive praise.
- Avoid overengineering straightforward systems.
- Ask clarifying questions only when necessary.
- Do not repeatedly revisit settled design choices.

## Roblox Documentation

For questions involving Roblox APIs or engine-specific behavior:

- Prefer current official Roblox documentation.
- Verify potentially changing APIs.
- Explain networking responsibilities.
- Distinguish engine limitations from design preferences.

## Markdown Updates

When the developer asks to update Markdown documentation:

**Provide complete copy-and-paste Markdown text when requested.**

Do not directly modify repository files unless explicitly instructed.

When replacing documentation, preserve existing confirmed decisions and merge newer information rather than discarding established context.

---

# 5. Repository Structure

GodSpire uses Rojo.

The developer-reported source structure is:

```text
src/
├── client/
├── server/
└── shared/
```

Specific folders and modules should be confirmed against the current repository before making assumptions.

## General Responsibilities

### Client

Responsible for responsive presentation and player interactions.

Examples:

- Player input.
- Camera.
- UI.
- Local animations.
- Visual effects.
- Responsive movement feedback.

### Server

Responsible for authoritative gameplay state and important outcomes.

Examples:

- Combat validation and damage outcomes.
- Enemy behavior.
- Run progression.
- Rewards.
- Persistent progression.
- Multiplayer coordination.
- Important character state.

### Shared

Contains definitions and logic legitimately required by both client and server.

Examples:

- Hero configuration.
- Ability configuration.
- Shared types.
- Constants.
- Utility functions.
- Shared calculations where appropriate.

Avoid treating every shared module as automatically safe for client authority.

---

# 6. Architecture Direction — Composition

GodSpire is experimenting with a composition-based character architecture.

The developer is considering separating:

- Classes.
- Components.
- Character configurations.
- Character-specific behavior.

This is an active architectural direction rather than a permanently fixed framework.

## Hero Class

The Hero class represents an individual playable character instance.

Its responsibilities may include:

- Tracking Hero identity.
- Initializing base stats.
- Holding runtime combat state.
- Coordinating components.
- Managing character-specific resources.
- Providing meaningful Hero-level methods.

The Hero class should act as an orchestrator rather than becoming an unnecessary collection of forwarding functions.

## Components

Components should represent meaningful, reusable responsibilities.

Potential examples include:

- Movement.
- Combat.
- Defensive mechanics.
- Abilities.
- Resources.

Only create components when their responsibilities justify separation.

Avoid one component per trivial helper or excessively granular systems.

## Example Composition

Conceptual example:

```lua
self.MovementComponent = MovementComponent.new(self)
```

The owning Hero can coordinate behavior.

For example:

```text
Player requests dodge
    ↓
Hero evaluates current combat state
    ↓
Movement component performs dodge behavior
    ↓
Combat/defensive systems process the outcome
```

This is an example of responsibility separation, not a finalized implementation contract.

## Character-Specific Components

Different Heroes may use specialized behavior while sharing foundational combat systems.

For example:

- Polvern uses Quick Reflex.
- Sover uses Star Shielding.
- Kong uses the Cloud Staff and Focus.
- Nashirey uses nature-based healing and combat.

Avoid creating a completely separate combat framework for every Hero.

Whenever practical, reuse shared systems and modify behavior through configuration or specialized components.

## Character Configuration

Starting attributes and character-specific default values should be defined separately from mutable runtime state.

Conceptually:

```text
Hero Configuration
    ↓
Hero Instance
    ↓
Runtime Stats and Resources
    ↓
Combat Components and Abilities
```

Configuration represents initial values.

Runtime state represents values that can change as the player progresses.

Do not mutate shared configuration tables when applying upgrades during a run.

---

# 7. Primary Stat System

GodSpire has four primary attributes:

- Strength.
- Dexterity.
- Arcane.
- Vitality.

Every Hero begins with 50 preallocated stat points.

Players earn additional stat points during a run and allocate them according to their preferred build.

## Strength

Determines baseline damage and provides additional scaling for Strength-based abilities.

## Dexterity

Improves Block capacity and shield size or effectiveness.

It is not currently intended to change attack speed or blocking animation speed.

## Arcane

Represents magical potency.

Depending on the ability, Arcane may influence:

- Magical damage.
- Healing.
- Magical shields.
- Magical effects.
- Other ability-specific properties.

## Vitality

Increases maximum health.

## Scaling Architecture

Separate the following concepts:

1. Base damage derived from Strength.
2. Ability-specific damage scaling.
3. Additional effects determined by other attributes.

Some abilities scale through Strength.

Others scale primarily through Arcane.

Hybrid abilities may use multiple attributes.

An Arcane-only scaling designation does not mean the attack ignores the baseline damage established by Strength.

Exact numerical formulas are not yet finalized.

Avoid hardcoding different universal damage formulas for individual Heroes.

Prefer a consistent shared damage-calculation system that supports ability-specific scaling coefficients.

---

# 8. Character Runtime State

Each Hero should maintain mutable runtime values separately from starting configuration.

Potential runtime values include:

- Current HP.
- Maximum HP.
- Strength.
- Dexterity.
- Arcane.
- Vitality.
- Block capacity.
- Current Block.
- Temporary shields.
- Character-specific resources.
- Current combo state.
- Acquired abilities.
- Equipped abilities.
- Active passives.

The exact representation remains an implementation decision.

## Hero-Specific Resources

### Polvern

- Grit.
- Combo damage scaling.

### Sover

- Star Knives.
- Star Power.

### Kong

- Focus.
- Extend! state.

### Nashirey

TBD.

### Divi

- Char mark interactions.

Resource behavior should be character-specific while allowing shared systems where appropriate.

---

# 9. Combat Architecture

The universal combat foundation should support:

- M1 attack sequences.
- Damaging abilities.
- Blocking.
- Parrying.
- Dodging.
- Hit detection.
- Damage calculation.
- Temporary shields.
- Defensive resources.
- Enemy hit reactions.
- Character-specific modifiers.

## Basic Attacks

All Heroes are intended to have four-hit M1 sequences except Polvern.

Abilities may replace, enhance, or reset attack sequences.

For example:

- Polvern's Double Hook resets his M1 sequence.
- Sover's Sovereign Blade temporarily changes his M1 behavior.
- Sover's Sovereign Scythe temporarily changes his M1 behavior.

Avoid tightly coupling the universal M1 implementation to one Hero's animations or attack count.

## Defensive Mechanics

Characters should share underlying defensive principles without necessarily using identical animations or behavior.

Examples:

- Polvern uses relatively stationary dodges.
- Sover uses magical shields.
- Kong has Stone Skin as an unlockable defensive ability.

Block capacity and temporary shields are separate concepts.

Dexterity influences defensive capacity and shielding.

Exact calculations remain TBD.

## Damage Ownership

The server should remain responsible for authoritative damage outcomes.

The client may provide input and responsive presentation.

Avoid allowing a client to freely determine:

- Final damage.
- Permanent rewards.
- Enemy deaths.
- Run completion.
- Persistent currency.
- Unvalidated combat outcomes.

A full competitive-grade anti-cheat architecture is not an immediate requirement.

---

# 10. Abilities and Progression

GodSpire is a roguelike.

Heroes do not have access to their entire unlockable ability pool at the beginning of a run.

## Starting Abilities

Each Hero has innate mechanics and starting abilities.

These are available at the start of a run.

## Unlockable Abilities

Additional abilities and passives are acquired during encounters.

Players can develop different builds depending on which rewards they receive.

## Ability Rarity

Three rarity tiers are established:

- Common: Gray.
- Rare: Red.
- Legendary: Blue.

Polvern's Resolve is a confirmed Legendary passive.

Remaining rarity assignments should follow the game design document.

## Ability Inventory

Players may collect more abilities than they can equip.

Acquired abilities belong to the current run's build.

## Equipment Rules

Confirmed:

- Active ability slots are limited.
- Players collect abilities during runs.
- Equipped abilities can only be changed at Rest Sites.

Still unresolved:

- Exact slot count.
- Empty-slot behavior.
- Whether starting abilities can be replaced.
- Passive equipment limits.

## Rest Sites

Rest Sites are strategic preparation points.

Their confirmed gameplay function is to allow equipped abilities to be changed.

Other functions, such as healing or stat allocation, remain under consideration.

## Ability Implementation Considerations

The system should eventually distinguish:

- Ability definition.
- Ability acquisition.
- Ability equipment.
- Ability activation.
- Cooldowns.
- Resource costs.
- Scaling.
- Temporary effects.
- Passive effects.

These responsibilities do not necessarily require separate modules or classes.

Avoid implementing a large ability framework before a few concrete abilities have been tested.

---

# 11. Character Build Philosophy

Heroes should support multiple viable build directions.

The player should be able to specialize through:

- Ability selection.
- Passive acquisition.
- Stat allocation.
- Relics.
- Combat strategy.

## Polvern Example

### Burst Tank

Emphasizes:

- Grit.
- Shielding.
- Burst damage.
- Survivability.

### Combo Fighter

Emphasizes:

- Combo duration.
- M1 resets.
- Launchers.
- Grapples.
- Continuous offensive pressure.

## Development Considerations

- Do not implement separate Hero classes for different builds.
- Reuse common systems.
- Avoid rigid build trees unless later justified.
- Allow hybrid builds.
- Prefer meaningful mechanical differences over purely numerical damage changes.

Other Heroes may develop multiple build identities as their ability pools are expanded.

---

# 12. Run State and Persistence

GodSpire distinguishes between run-specific progression and persistent player progression.

## Run-Specific State

Expected examples:

- Earned stat points.
- Acquired abilities.
- Equipped abilities.
- Temporary upgrades.
- Relics.
- Potions.
- Current run progression.

These are intended to reset between runs unless an exception is explicitly designed.

## Persistent State

Potential examples:

- Character unlocks.
- Cosmetics.
- Currency.
- Permanent progression.
- Player preferences.
- Achievements.

The exact persistent progression model is TBD.

Do not introduce permanent stat upgrades automatically.

Permanent stat progression could complicate encounter balancing, particularly in cooperative multiplayer.

## Death and Restart

Reenver's Nature's Blessing provides the narrative explanation for Heroes returning to the base of the Spire after death.

Gameplay reset behavior should be consistent with the roguelike progression rules.

The exact technical lifecycle of runs remains TBD.

---

# 13. Multiplayer and Server Authority

GodSpire is a cooperative PvE game rather than a ranked competitive experience.

This reduces the need for extremely strict movement authority compared with Overtake.

However, authoritative server state remains important.

## Principles

- Keep controls responsive.
- Validate important combat outcomes.
- Protect reward and progression integrity.
- Do not trust arbitrary client-submitted damage values.
- Keep persistent data authoritative.
- Implement multiplayer incrementally.
- Avoid prematurely adopting complex networking solutions.

## Multiplayer Targets

### Beta 0

Up to 2 players per run.

### Beta 1

Up to 4 players per run.

## Architectural Considerations

Where practical, avoid hardcoding exactly two players into systems that should eventually support four.

Potential concerns include:

- Enemy targeting.
- Damage ownership.
- Reviving teammates.
- Cooperative support abilities.
- Encounter completion.
- Reward distribution.
- Enemy scaling.
- Run state synchronization.

Only implement the complexity required by the current development milestone.

---

# 14. Movement

Roblox already provides default character movement.

GodSpire should use those capabilities where appropriate.

Custom actions may include:

- Dodges.
- Character-specific evasive behavior.
- Lunges.
- Launchers.
- Airborne follow-ups.
- Ability-driven movement.

Avoid replacing the entire Roblox movement system without a demonstrated need.

Player movement and NPC movement may require different implementation strategies.

Do not force them into identical components simply for architectural symmetry.

---

# 15. Relics and Potions

Relics and potions are part of GodSpire's run-based progression.

They should influence decisions and complement character mechanics.

Exact implementations are TBD.

## Technical Considerations

Eventually, relics may need to modify:

- Stats.
- Resource generation.
- Damage calculations.
- Defensive effects.
- Ability behavior.
- Other runtime values.

Design their interactions around existing systems rather than implementing independent combat calculations for each relic.

Avoid introducing a complex modifier architecture before concrete relic examples justify it.

Potions should similarly integrate with existing combat and runtime state.

---

# 16. Development Roadmap

## Current Priority — Combat Foundation

Focus on the first two Heroes:

- Polvern.
- Sover.

Implement a working combat foundation before expanding to the remaining roster.

## Suggested Implementation Order

1. Establish a clean Rojo setup.
2. Implement the core Hero class.
3. Initialize Hero configuration and runtime stats.
4. Implement a simple movement or defensive action.
5. Implement basic M1 combat.
6. Implement one test enemy.
7. Implement a basic damage calculation.
8. Implement Polvern's starting abilities and Grit.
9. Implement Sover's starting abilities and Star Power.
10. Validate a short combat encounter.
11. Implement basic ability acquisition.
12. Introduce Rest Site equipment management.
13. Test a short singleplayer run.
14. Expand toward Beta 0 cooperative gameplay.

This is guidance rather than a rigid task schedule.

## Beta 0

Target:

- Polvern and Sover.
- Singleplayer and duo cooperative play.
- Two areas.
- Approximately 5–7 encounters per area.
- Initial relics and potions.
- Multiple bosses.
- The Observer.

## Beta 1

Target:

- All five planned Heroes.
- Up to four players.
- One additional area.
- Additional content.
- The Creator introduced after The Observer.

The full release roadmap belongs in GODSPIRE_DESIGN.md.

---

# 17. Architectural Decisions Still Open

The following are not fully finalized:

- Exact Hero class responsibilities.
- Component boundaries.
- Component lifecycle.
- Combat state representation.
- Resource ownership.
- Damage formulas.
- Stat scaling coefficients.
- Block and shield implementation.
- Hit detection strategy.
- Ability activation interfaces.
- Ability slot count.
- Passive management.
- Rest Site implementation.
- Enemy architecture.
- Run management.
- Encounter generation.
- Multiplayer networking.
- DataStore design.
- Persistent progression.
- Relic and potion architecture.

These should be resolved gradually through implementation.

Avoid building abstract systems solely because they may eventually be useful.

---

# 18. Source of Truth

When working on GodSpire, use the following priority:

1. The developer's latest explicit decisions.
2. Current repository code, unless the developer states it has changed locally.
3. GODSPIRE_DESIGN.md for game rules, characters, and lore.
4. GODSPIRE_CONTEXT.md for architecture and development practices.
5. Older discussion history.

At the beginning of a new conversation, inspect:

`nikolashuang/GodSpire`

Review the latest relevant source files and both Markdown documents when available.

If the repository cannot be accessed, explain that limitation rather than assuming its contents.

---

# 19. Development Guardrails

GodSpire should remain a sustainable solo-development project.

Prioritize:

- Understanding over blindly copying code.
- Playable mechanics over excessive planning.
- Small, testable implementations.
- Architectural consistency.
- Maintainable systems.
- Practical experimentation.
- Incremental multiplayer development.
- Reusing existing systems where appropriate.

Avoid:

- Premature abstraction.
- Complex networking without demonstrated need.
- Excessive cross-component dependencies.
- Implementing every future system immediately.
- Large structural rewrites without clear benefit.
- Treating speculative mechanics as finalized requirements.

## Guiding Principle

**Build GodSpire gradually, understand each system, preserve architectural consistency, and let actual gameplay determine when greater complexity is justified.**
