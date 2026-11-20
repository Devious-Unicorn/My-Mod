local woodSmelting = {
    type = "recipe",
    name = "Wood-Smelting",
    category = "smelting",
    icon = "__My-Mod__/graphics/Wood Smelting.png",
    ingredients = {{type = "item", name = "wood", amount = 5}},
    results = {{type = "item", name = "coal", amount = 2}}
}

data:extend({woodSmelting})