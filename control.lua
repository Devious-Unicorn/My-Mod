--- The number of slots in the Factorio hotbar if you have all of them turned on<br>
--- 4 rows * 10 slots
local TOTAL_SLOTS = 40

local function read_slot(player, index)
	local slot = player.get_quick_bar_slot(index)
	if not slot then return nil end

	if slot.name then
		return {
			name = slot.name,
			quality = slot.quality and slot.quality.name or "normal"
		}
	end

	return { raw = slot }
end

local function write_slot(player, index, cached)
	if not cached then
		player.set_quick_bar_slot(index, nil)
		return
	end

	if cached.name then
		player.set_quick_bar_slot(index, {
			name = cached.name,
			quality = cached.quality
		})
	elseif cached.raw then
		player.set_quick_bar_slot(index, cached.raw)
	end
end

local function slots_equal(a, b)
	if a == nil and b == nil then return true end
	if a == nil or b == nil then return false end
	if a.name and b.name then
		return a.name == b.name and a.quality == b.quality
	end
	return a.raw == b.raw
end

-- Returns true if the player is holding any item, ghost, or blueprint/planner
local function is_holding_anything(player)
	local stack = player.cursor_stack
	if stack and stack.valid_for_read then return true end
	if player.cursor_ghost ~= nil then return true end
	if player.cursor_record ~= nil then return true end
	return false
end

local function cache_quickbar(player)
	storage.quickbar_cache = storage.quickbar_cache or {}
	local cache = {}
	for i = 1, TOTAL_SLOTS do
		cache[i] = read_slot(player, i)
	end
	storage.quickbar_cache[player.index] = cache
end

script.on_init(function()
	for _, player in pairs(game.players) do
		cache_quickbar(player)
	end
end)

script.on_configuration_changed(function()
	for _, player in pairs(game.players) do
		cache_quickbar(player)
	end
end)

script.on_event(defines.events.on_player_created, function(event)
	local player = game.get_player(event.player_index)
	if player then
		cache_quickbar(player)
	end
end)

script.on_event(defines.events.on_player_set_quick_bar_slot, function(event)
	local player = game.get_player(event.player_index)
	if not player then return end

	storage.quickbar_cache = storage.quickbar_cache or {}
	local old_cache = storage.quickbar_cache[player.index]
	if not old_cache then
		cache_quickbar(player)
		return
	end

	local holding = is_holding_anything(player)

	for i = 1, TOTAL_SLOTS do
		local old_slot = old_cache[i]
		local new_slot = read_slot(player, i)

		if not slots_equal(old_slot, new_slot) then
			if old_slot ~= nil and new_slot ~= nil then
				-- Slot B was about to be overwritten: restore Slot B
				write_slot(player, i, old_slot)
			elseif old_slot ~= nil and new_slot == nil then
				if holding then
					-- Slot A was cleared during a hotbar-to-hotbar switch while holding an item: restore Slot A
					write_slot(player, i, old_slot)
				else
					-- Cursor is empty, so this was a genuine middle-click clear: allow it
					old_cache[i] = nil
				end
			else
				-- Empty slot was given a new filter: allow it
				old_cache[i] = new_slot
			end
		end
	end
end)
