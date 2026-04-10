# DEV_PLAN.md

Derived from: *"a stardew valley style survival horror experience in the poppy playtime universe"*
and the existing foundation: isometric grid system + hub/excursion dual inventory.

---

## Phase 1 — Movement & World (current)

- [x] Godot project setup (1920×1080, GL Compatibility)
- [x] Global autoload — isometric tile constants (64×32, ISO_SKEW 0.5)
- [x] Dual inventory structures (`permanent_hub_inventory`, `temporary_excursion_inventory`)
- [x] Player sprite (factory worker SVG placeholder)
- [x] Isometric 8-directional player movement (`CharacterBody2D`, floating mode)
- [x] Procedural isometric ground grid (`Polygon2D` checkerboard, 17×17 tiles)
- [x] Camera follow with position smoothing
- [x] Y-sort for correct isometric draw order
- [ ] Player facing direction + sprite flip per movement axis
- [ ] AnimatedSprite2D walk cycle (4-direction, idle + walk frames)
- [ ] World boundary / collision walls

---

## Phase 2 — World Systems

- [ ] Day/night cycle (shader tint + ambient light, Stardew-style time clock)
- [ ] Interactable object base class (`Interactable.gd`) with prompt UI
- [ ] Prop/resource node placement (barrels, crates, plant troughs)
- [ ] Scene transition system (door triggers → load new scene)
- [ ] Factory floor room layouts (hand-crafted tilemap or procedural rooms)

---

## Phase 3 — Survival & Items

- [ ] Player stats: health, stamina, hunger
- [ ] Item definition resource (`Item.tres` schema: id, name, icon, stack_size)
- [ ] Inventory UI panel (grid slots, drag-and-drop) wired to Global inventories
- [ ] Pickup system (dropped items in world → add to excursion inventory)
- [ ] Crafting table interaction + recipe system
- [ ] Consumables (food restores hunger/health)

---

## Phase 4 — Hub & Excursion Loop

- [ ] Hub scene (safe base, separate from factory floors)
- [ ] Hub upgrade system (unlock rooms, storage expansions)
- [ ] Excursion entry/exit triggers
- [ ] On-return inventory transfer (`temporary_excursion_inventory` → hub storage)
- [ ] Save/load system (persist hub state between sessions)

---

## Phase 5 — Horror Elements (Poppy Playtime)

- [ ] Enemy base class (`Enemy.gd`) with patrol state
- [ ] Line-of-sight / hearing detection
- [ ] Chase + attack state machine
- [ ] Huggy Wuggy variant (fast, corridor patrol)
- [ ] Mommy Long Legs variant (ranged limb attack)
- [ ] Stealth crouch mechanic (reduces detection radius)
- [ ] Jump scare event system (scripted triggers)
- [ ] Atmospheric: flickering lights, distant audio cues

---

## Phase 6 — Narrative & Polish

- [ ] Dialogue system (NPC notes / recordings)
- [ ] Story progression flags (Global autoload)
- [ ] Main menu + settings screen
- [ ] Music & SFX integration (AudioStreamPlayer autoload bus)
- [ ] Particle effects (dust, blood, sparks)
- [ ] Export builds (Windows, Linux, Web)
