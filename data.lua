local woodSmelting = {
	type = "recipe",
	name = "Wood-Smelting",
	category = "smelting",
	icon = "__My-Mod__/graphics/icon/Wood Smelting.png",
	ingredients = { { type = "item", name = "wood", amount = 5 } },
	results = { { type = "item", name = "coal", amount = 2 } }
}

local loader_name = "my-loader"
local loader_entity = table.deepcopy(data.raw["loader-1x1"]["loader-1x1"])
loader_entity.name = loader_name
loader_entity.icon = "__My-Mod__/graphics/icon/loader.png"
loader_entity.minable = { mining_time = 0.2, result = loader_name }
loader_entity.speed = data.raw["transport-belt"]["transport-belt"].speed
loader_entity.hidden = false
loader_entity.collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } }
loader_entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
loader_entity.tile_width = 1
loader_entity.tile_height = 1
loader_entity.collision_mask = table.deepcopy(data.raw["transport-belt"]["transport-belt"].collision_mask)
loader_entity.flags = { "placeable-neutral", "player-creation" }
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
		{ type = "item", name = "iron-plate",         amount = 10 },
		{ type = "item", name = "electronic-circuit", amount = 10 },
		{ type = "item", name = "transport-belt",     amount = 5 }
	},
	results = {
		{ type = "item", name = loader_name, amount = 1 }
	}
}

local fast_loader_name = "my-fast-loader"
local fast_loader_entity = table.deepcopy(data.raw["loader-1x1"]["loader-1x1"])
fast_loader_entity.name = fast_loader_name
fast_loader_entity.icon = "__My-Mod__/graphics/icon/fast-loader.png"
fast_loader_entity.minable = { mining_time = 0.2, result = fast_loader_name }
fast_loader_entity.speed = data.raw["transport-belt"]["fast-transport-belt"].speed
fast_loader_entity.hidden = false
fast_loader_entity.collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } }
fast_loader_entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
fast_loader_entity.tile_width = 1
fast_loader_entity.tile_height = 1
fast_loader_entity.collision_mask = table.deepcopy(data.raw["transport-belt"]["fast-transport-belt"].collision_mask)
fast_loader_entity.flags = { "placeable-neutral", "player-creation" }
fast_loader_entity.belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set
fast_loader_entity.structure = table.deepcopy(data.raw["underground-belt"]["fast-underground-belt"].structure)
fast_loader_entity.structure.direction_in.sheet.filename = "__My-Mod__/graphics/entity/fast-loader-structure.png"
fast_loader_entity.structure.direction_out.sheet.filename = "__My-Mod__/graphics/entity/fast-loader-structure.png"
fast_loader_entity.structure.front_patch = nil
fast_loader_entity.structure.back_patch = nil

local fast_loader_item = {
	type = "item",
	name = fast_loader_name,
	icon = "__My-Mod__/graphics/icon/fast-loader.png",
	icon_size = 64,
	subgroup = "belt",
	order = "d[loader]-b[my-fast-loader]",
	place_result = fast_loader_name,
	stack_size = 50
}

local fast_loader_recipe = {
	type = "recipe",
	name = fast_loader_name,
	enabled = false,
	ingredients = {
		{ type = "item", name = "iron-plate",          amount = 15 },
		{ type = "item", name = "electronic-circuit",  amount = 25 },
		{ type = "item", name = "steel-plate",         amount = 5 },
		{ type = "item", name = "fast-transport-belt", amount = 5 }
	},
	results = {
		{ type = "item", name = fast_loader_name, amount = 1 }
	}
}

local express_loader_name = "my-express-loader"
local express_loader_entity = table.deepcopy(data.raw["loader-1x1"]["loader-1x1"])
express_loader_entity.name = express_loader_name
express_loader_entity.icon = "__My-Mod__/graphics/icon/express-loader.png"
express_loader_entity.minable = { mining_time = 0.2, result = express_loader_name }
express_loader_entity.speed = data.raw["transport-belt"]["express-transport-belt"].speed
express_loader_entity.hidden = false
express_loader_entity.collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } }
express_loader_entity.selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
express_loader_entity.tile_width = 1
express_loader_entity.tile_height = 1
express_loader_entity.collision_mask = table.deepcopy(data.raw["transport-belt"]["express-transport-belt"]
	.collision_mask)
express_loader_entity.flags = { "placeable-neutral", "player-creation" }
express_loader_entity.belt_animation_set = data.raw["transport-belt"]["express-transport-belt"].belt_animation_set
express_loader_entity.structure = table.deepcopy(data.raw["underground-belt"]["express-underground-belt"].structure)
express_loader_entity.structure.direction_in.sheet.filename = "__My-Mod__/graphics/entity/express-loader-structure.png"
express_loader_entity.structure.direction_out.sheet.filename = "__My-Mod__/graphics/entity/express-loader-structure.png"
express_loader_entity.structure.front_patch = nil
express_loader_entity.structure.back_patch = nil

local express_loader_item = {
	type = "item",
	name = express_loader_name,
	icon = "__My-Mod__/graphics/icon/express-loader.png",
	icon_size = 64,
	subgroup = "belt",
	order = "d[loader]-c[my-express-loader]",
	place_result = express_loader_name,
	stack_size = 50
}

local express_loader_recipe = {
	type = "recipe",
	category = "crafting-with-fluid",
	name = express_loader_name,
	enabled = false,
	ingredients = {
		{ type = "item",  name = "iron-plate",             amount = 20 },
		{ type = "item",  name = "electronic-circuit",     amount = 25 },
		{ type = "item",  name = "advanced-circuit",       amount = 25 },
		{ type = "item",  name = "steel-plate",            amount = 10 },
		{ type = "item",  name = "express-transport-belt", amount = 5 },
		{ type = "fluid", name = "lubricant",              amount = 10 }
	},
	results = {
		{ type = "item", name = express_loader_name, amount = 1 }
	}
}

-- TODO: add turbo loaders

data:extend({ woodSmelting, loader_entity, loader_item, loader_recipe, fast_loader_item, fast_loader_recipe, fast_loader_entity, express_loader_entity, express_loader_item, express_loader_recipe })
