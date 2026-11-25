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

local express_loader_tech = {
	type = "technology",
	name = "express-loader-tech",
	icon = "__My-Mod__/graphics/icon/express-loader.png",
	prerequisites = { "logistics", "logistics-2", "loader-tech", "steel-processing", "lubricant", "fast-loader-tech", "logistics-3", "automation-3" },
	effects = {
		{
			type = "unlock-recipe",
			recipe = "my-express-loader"
		}
	},
	unit = {
		count = 500,
		ingredients = {
			{ "automation-science-pack", 3 },
			{"logistic-science-pack", 2},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1}
		},
		time = 45
	},
	order = "c-a"
}

data:extend { loader_tech, fast_loader_tech, express_loader_tech }
