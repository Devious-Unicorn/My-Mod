local woodSmelting = {
    type = "recipe",
    name = "Wood-Smelting",
    category = "smelting",
    icon = "__My-Mod__/graphics/icon/Wood Smelting.png",
    ingredients = {{type = "item", name = "wood", amount = 5}},
    results = {{type = "item", name = "coal", amount = 2}}
}

local loader_name = "my-loader"
local loader_entity = table.deepcopy(data.raw["loader-1x1"]["loader-1x1"])
loader_entity.name = loader_name
loader_entity.icon = "__My-Mod__/graphics/icon/loader.png"
loader_entity.minable = {mining_time = 0.2, result = loader_name}
loader_entity.speed = data.raw["transport-belt"]["transport-belt"].speed
loader_entity.hidden = false
loader_entity.collision_box = {{-0.4, -0.4}, {0.4, 0.4}}
loader_entity.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
loader_entity.tile_width = 1
loader_entity.tile_height = 1
loader_entity.collision_mask = table.deepcopy(data.raw["transport-belt"]["transport-belt"].collision_mask)
loader_entity.flags = {"placeable-neutral", "player-creation"}
loader_entity.belt_animation_set = data.raw["transport-belt"]["transport-belt"].belt_animation_set
loader_entity.structure = table.deepcopy(data.raw["underground-belt"]["underground-belt"].structure)
loader_entity.structure.direction_in.sheet.filename = "__My-Mod__/graphics/entity/loader-structure.png"
loader_entity.structure.direction_out.sheet.filename = "__My-Mod__/graphics/entity/loader-structure.png"
loader_entity.structure.front_patch = nil
loader_entity.structure.back_patch = nil

local loader_item = {
  type = "item",
  name = loader_name,
  icon = "__My-Mod__/graphics/icon/loader.png",
  icon_size = 64,
  subgroup = "belt",
  order = "d[loader]-a[my-loader]",
  place_result = loader_name,
  stack_size = 50
}

local loader_recipe = {
  type = "recipe",
  name = loader_name,
  enabled = false,
  ingredients = {
    { type = "item", name = "iron-plate", amount = 10 },
    { type = "item", name = "electronic-circuit", amount = 5 },
    { type = "item", name = "transport-belt", amount = 5 }
  },
  results = {
    { type = "item", name = loader_name, amount = 1 }
  }
}

data:extend({woodSmelting, loader_entity, loader_item, loader_recipe})
