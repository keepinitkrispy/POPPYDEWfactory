# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

POPPYDEWfactory is a Stardew Valley-style survival horror game set in the Poppy Playtime universe, built with **Godot 4.x** (GL Compatibility rendering) and **GDScript**.

## Running the Game

Godot 4.x handles compilation internally. There is no external build system (no npm, Makefile, or Cargo).

- **Editor**: Open `project.godot` in the Godot 4.x editor, then press F5 to run.
- **CLI headless run**: `godot --headless` (for non-rendering tasks)
- **CLI export**: `godot --export "platform_name" output_path`
- **Main scene**: `res://scenes/player/MovementDemo.tscn`

There is currently no configured linter or test framework.

## Architecture

### Isometric Grid System

All world positioning must respect the **mandatory 2:1 isometric diamond ratio** defined in `scripts/autoload/Global.gd`:

- `TILE_WIDTH = 64`, `TILE_HEIGHT = 32` — base cell dimensions in pixels
- `ISO_SKEW = 0.5` — Y-axis compression factor; apply this when converting world-to-screen coordinates

These constants are global constraints. New tile types, maps, and movement code must use them.

### Dual Inventory Model

Two inventory dictionaries live in `Global.gd` (autoloaded as `Global`):

- `permanent_hub_inventory` — items stored at the player's permanent base/hub, persists between excursions
- `temporary_excursion_inventory` — items carried during an active mission; expected to be cleared/transferred on return

All item data is `Dictionary` with `{ ItemName: Quantity }` shape.

### Autoload / Globals

`scripts/autoload/Global.gd` is the single autoloaded node. Add world constants and cross-scene state here. Scene-local logic stays in scene scripts.

### Display

- Viewport: 1920×1080, stretch mode `viewport`, aspect `keep`
- Renderer: GL Compatibility (targets mobile and web in addition to desktop)
