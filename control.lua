local LWControl = {}

LWControl.interface = {
  ['laser-wall'] = 'laser-interface'
}

LWControl.isKey = function(entity_name)
  return LWControl.interface[entity_name] ~= nil
end

-- BUILD INTERFACE
local function on_built(event)
  local entity = event.entity or event.created_entity
  if not entity or not entity.valid then return end

  local entity_name = entity.name
  if not LWControl.isKey(entity_name) then return end

  local interface = entity.surface.create_entity{ 
    name = LWControl.interface[entity_name],
    position = entity.position,
    force = entity.force,
    quality = entity.quality,
  }
  interface.destructible = false
end

-- DESTROY INTERFACE
local function on_destroy(event)
  local entity = event.entity or event.created_entity or event.destination
  if not entity or not entity.valid then return end

  local entity_name = entity.name
  if not LWControl.isKey(entity_name) then return end

  local center = entity.position
  for _, interface in pairs(entity.surface.find_entities_filtered{
    name = LWControl.interface[entity_name],
    position = entity.position,
    radius = 0.5,
  }) do interface.destroy() end
end

local laser_wall_filters = {
  { filter = 'name', name = 'laser-wall' },
  { filter = 'type', type = 'wall', mode = 'and' }
}

-- build events
script.on_event(defines.events.on_built_entity,       on_built, laser_wall_filters)
script.on_event(defines.events.on_entity_cloned,      on_built, laser_wall_filters)
script.on_event(defines.events.on_robot_built_entity, on_built, laser_wall_filters)
script.on_event(defines.events.script_raised_revive,  on_built, laser_wall_filters)
script.on_event(defines.events.script_raised_built,   on_built, laser_wall_filters)
script.on_event(defines.events.on_space_platform_built_entity, on_built, laser_wall_filters)

-- destroy events
script.on_event(defines.events.on_player_mined_entity, on_destroy, laser_wall_filters)
script.on_event(defines.events.on_robot_mined_entity,  on_destroy, laser_wall_filters)
script.on_event(defines.events.on_entity_died,         on_destroy, laser_wall_filters)
script.on_event(defines.events.script_raised_destroy,  on_destroy, laser_wall_filters)

-- @ dolly_event 
--  .player_index: player_index, The index of the player who moved the entity
--  .moved_entity: LuaEntity,    The entity that was moved
--  .start_pos: Position,        The position that the entity was moved from
local function on_moved(dolly_event)
  local entity = dolly_event.moved_entity
  if not entity or not entity.valid then return end

  local entity_name = entity.name
  if not LWControl.isKey(entity_name) then return end

  local old_position = dolly_event.start_pos
  if not old_position then return end

  local old_entity = {
    name     = entity.name,
    valid    = entity.valid,
    surface  = entity.surface,
    position = old_position,
  }

  on_destroy({ entity = old_entity })
  on_built({ entity = entity })
end

script.on_load(
  function()
    -- Picker Dollies compatibility
    if remote.interfaces['PickerDollies'] and remote.interfaces['PickerDollies']['dolly_moved_entity_id'] then
      script.on_event(remote.call('PickerDollies', 'dolly_moved_entity_id'), on_moved)
      remote.call('PickerDollies', 'add_blacklist_name', 'laser-interface')
    end
  end
)