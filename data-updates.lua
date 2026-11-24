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

local fast_loader_tech = {
	type = "technology",
	name = "fast-loader-tech",
	icon = "__My-Mod__/graphics/icon/fast-loader.png",
	prerequisites = { "logistics", "logistics-2", "loader-tech", "steel-processing" },
	effects = {
		{
			type = "unlock-recipe",
			recipe = "my-fast-loader"
		}
	},
	unit = {
		count = 200,
		ingredients = {
			{ "automation-science-pack", 1 },
			{"logistic-science-pack", 1}
		},
		time = 45
	},
	order = "c-a"
}

data:extend { loader_tech, fast_loader_tech }
