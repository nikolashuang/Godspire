# GodSpire — Development Context

> Status: Active project context  
> Last updated: 2026-10-26  
> Companion: [`GODSPIRE_DESIGN.md`](./GODSPIRE_DESIGN.md)

## Purpose

This file is primarily written for ChatGPT and future development sessions. It records how GodSpire should be developed, the architecture currently under consideration, and the difference between confirmed decisions and ideas still being explored.

**Read the latest repository and both Markdown files before making major architectural recommendations.** The files are living notes, not a substitute for the latest code or the developer's newer decisions.

## Project Identity

- **Project:** GodSpire
- **Platform:** Roblox
- **Language:** Luau
- **Workflow:** Roblox Studio + Rojo
- **Developer:** Primarily solo
- **Repository:** `nikolashuang/GodSpire`
- **Genre:** 3D action game inspired by Slay the Spire 2's climb/run premise, with Soulslike and hack-and-slash combat rather than deckbuilding.
- **Gameplay goal:** Solo and cooperative runs climbing the Spire toward The Creator.
- **Initial co-op target:** Up to 2 players for Beta 0; up to 4 for Beta 1.

The repository could not be verified from the GitHub connector on 2026-10-26 (404). The file structure and architectural discussion below are based on developer-provided information, not an independently checked repository snapshot.

## Developer Background

The developer has experience with **C#, C++, and Java**, but is actively growing more comfortable with **Luau** and Roblox-specific networking and APIs.

Previously developed **Overtake**, a complex multiplayer parkour project. It became difficult to maintain while restructuring toward Roblox's newer Server Authority architecture. Avoid recreating that level of networking and architectural complexity prematurely in GodSpire.

### Development Values

- Learn *why* a system works, not just how to paste it in.
- Develop gradually and validate one mechanic at a time.
- Prefer small prototypes to speculative frameworks.
- Reuse decisions and terminology consistently to avoid repeated restructuring.
- Do not turn every possible edge case into an immediate engineering task.
- Explain real tradeoffs and call out actual risks.
- Preserve solo-developer feasibility.

## How ChatGPT Should Collaborate

Act as a **development partner and mentor**, not an autonomous programmer.

- Explain responsibilities, ownership, data flow, and engine constraints.
- Prefer conceptual guidance, pseudocode, and short illustrative snippets.
- Provide full code when explicitly requested or truly the clearest teaching example.
- Challenge problematic choices constructively, without reflexively inventing more layers.
- Verify current Roblox Creator Hub documentation for engine/API-dependent implementation questions.
- Distinguish *game-design choices* from *Roblox engine requirements*.
- Flag the costs of networking, DataStores, UX, moderation, performance, and content production when they are relevant.
- Be professional and concise; no emojis.
- When asked to **update these Markdown files later**, return copy-and-paste Markdown changes rather than directly modifying the repo, unless the developer specifically requests another workflow.

## Existing Project Structure

Developer-reported Rojo layout:

```text
src/
├── client/
├── server/
└── shared/
```

Broad guidance, not a rigid architecture contract:

- **Client:** Input, camera, UI, animations/VFX presentation, responsive movement feedback.
- **Server:** Authoritative shared game state, enemy/combat outcomes as needed, rewards, progression, saving, multiplayer coordination.
- **Shared:** Data definitions, types, constants, utility code and behavior legitimately used by both sides.

Do not assume more specific folders/files exist until observed in the repository.

## Current Architecture Direction — Composition

The developer is experimenting with **classes** and **components**, potentially kept in separate folders.

The proposed `Hero` class represents a playable character instance and **orchestrates behavior across its components**. Components implement focused behavior, such as movement.

Proposed composition example:

```lua
self.MovementComponent = MovementComponent.new(self)
```

The component can reference its owning Hero. The Hero should not become an empty object that only exposes long chains of component calls; it can provide meaningful methods coordinating state/resource checks with component actions.

Illustrative interaction:

```text
Dodge request
  -> Hero considers character state / resource constraints
  -> MovementComponent carries out movement behavior
```

Important nuances:

- Components do not necessarily need a full class lifecycle if simple functions suffice.
- Use reusable components where responsibilities meaningfully exist; don't create a component for each trivial helper.
- Watch for excessive cross-component coupling; the Hero can coordinate when appropriate.
- Different Heroes may share core components while using different stats, skills, and behaviors.
- **Composition is a direction being tested**, not a permanently finalized universal framework.

## Movement

Roblox already provides built-in character movement. GodSpire needs custom actions such as dodges, and potentially other character-specific mobility.

- Do not replace default Roblox movement unnecessarily.
- Player movement and NPC locomotion are related but may have different needs; don't force them into the same implementation prematurely.
- Keep responsive presentation in mind without immediately adopting a complicated server-authoritative movement model.

## Multiplayer and Server Authority

GodSpire is a **cooperative**, not ranked competitive, game. Cheating prevention still matters for authoritative run state, rewards, progression, and reasonable combat validation, but is lower priority than it was for Overtake.

- Make important persistent and shared game decisions on the server.
- Favor responsive controls and well-scoped client responsibilities.
- Do not implement an elaborate anti-cheat or networking framework without a demonstrated need.
- Prototype solo gameplay first; develop co-op incrementally toward the Beta 0 duo target and later the Beta 1 four-player target.
- Avoid claiming all combat can safely be client-authoritative just because the game is PvE.

## Design Baseline

Read [`GODSPIRE_DESIGN.md`](./GODSPIRE_DESIGN.md) for the canonical *current design intentions*.

Relevant established concepts include:

- Polvern / Polv: Pitmaster, combo damage and Grit.
- Sover: Star Knives and Star Power.
- Kong: Focus, Cloud Staff and Extend!.
- Nashirey: Nature's Goddess, details pending.
- A fifth character is planned but unnamed.
- Relics and potions should contribute to run decisions; detailed designs are pending.
- The Observer is the deliberately extreme Beta 0 final boss.
- The Creator is the central antagonist and later boss after The Observer.
- The initial release scope is **Beta 0**, not the full-launch vision.

## Practical Implementation Order

Treat as a lightweight sequence, not a rigid task contract:

1. Confirm a clean Rojo and module setup.
2. Prototype a single Hero and its most essential state.
3. Add a focused movement action such as a dodge.
4. Prototype M1 combat and one basic enemy.
5. Prove a short encounter is satisfying.
6. Add character-specific mechanics one at a time.
7. Expand to a small singleplayer run and boss.
8. Introduce duo co-op after core behaviors and their state ownership are better understood.

Keep integration in mind when prototyping, but do not implement all eventual systems at once.

## Decisions Still Open

- Component lifecycle and exact boundaries
- Hero state representation and character configuration
- Damage, health, Grit, Focus, and Star Power ownership
- Ability unlocking/equipment mechanics
- Input and combat networking interfaces
- NPC architecture and encounter flow
- Run progression, generation, and saving
- Multiplayer synchronization and scaling
- Relic/potion systems
- Monetization and modifier rules

When these are decided, update only the relevant sections and do not redesign the rest without good cause.

## Source-of-Truth Order

1. The developer's newest explicit decision in the current discussion
2. Current actual repo code (unless the developer says it is not yet updated)
3. `GODSPIRE_CONTEXT.md` for workflow and architecture
4. `GODSPIRE_DESIGN.md` for game rules and roadmap
5. Older conversation summaries

At the start of a new chat, attempt to inspect **`nikolashuang/GodSpire`** before relying on assumptions. If inaccessible, say so and rely on the available files/context rather than inventing repository state.

## Guiding Principle

**Build systems the developer can understand, test, and maintain alone. Progress steadily, preserve consistency, and let working prototypes establish the need for greater complexity.**



## Character Build Philosophy

GodSpire's playable Heroes should support meaningful build variation through unlockable abilities, passives, and potentially relic interactions.

### Distinct Build Paths

A Hero may support multiple fighting styles rather than having only one optimal build.

Polvern currently represents the first example:

- **Burst Tank:** Defensive resource management and powerful Grit-based attacks.
- **Combo Fighter:** Sustained offensive pressure and combo extension.

### Development Considerations

- Do not implement separate Hero classes for individual build paths.
- Build variation should primarily emerge from ability selections and interactions.
- Reuse existing combat, movement, resource, and ability systems wherever practical.
- Do not create a complex build-tree framework before the unlock system has been prototyped.
- Preserve flexibility for hybrid builds.
- Evaluate whether each fighting style provides genuinely different gameplay decisions rather than only different damage numbers.

### Ability Rarity

Unlockable abilities may have different rarities.

Legendary abilities are intended to feel particularly impactful and may significantly change a Hero's survivability, combat options, or playstyle.

Polvern's Resolve is currently designated as a Legendary passive.

The complete rarity structure, ability acquisition system, and balancing rules are not yet finalized.

