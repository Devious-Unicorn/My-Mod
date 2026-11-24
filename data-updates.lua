local loader_tech = {
    type = "technology",
    name = "loader-tech",
    icon = "__My-Mod__/graphics/icon/loader.png",
    prerequisites = { "logistics" },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "my-loader"
        }
    },
    unit = {
        count = 100,
        ingredients = {
            { "automation-science-pack", 1 }
        },
        time = 30
    },
    order = "c-a"
}

data:extend { loader_tech }
