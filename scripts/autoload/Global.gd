# Global.gd (Autoload)
extends Node

# --- World Constants ---
# Mandatory 2:1 isometric diamond ratio (64x32 pixel base cells)
const TILE_WIDTH: int = 64
const TILE_HEIGHT: int = 32

# Mandatory 2:1 isometric skew rule (Y-axis compression)
const ISO_SKEW: float = 0.5 

# --- Inventory (Demo #1 Data Structures) ---
var permanent_hub_inventory: Dictionary = {} # [ItemName: Quantity]
var temporary_excursion_inventory: Dictionary = {} # [ItemName: Quantity]
