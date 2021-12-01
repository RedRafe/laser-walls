local LWControl = {}

LWControl.interface = {
  ["laser-wall"] = "laser-interface"
}

LWControl.isKey = function(entity)
  if LWControl.interface[entity.name] ~= nil then return true end
  return false
end

local function on_built(event)
  local entity = event.entity or event.created_entity
  if LWControl.isKey(entity) then
    local interface = entity.surface.create_entity
    { 
      name = LWControl.interface[entity.name],
      position = entity.position,
      force = entity.force
    }
    interface.destructible = false
  end
end

local function on_destroy(event)
  if LWControl.isKey(event.entity) then
    center = event.entity.position
    for _, entity in pairs(event.entity.surface.find_entities_filtered{
      area = {{center.x-0.5, center.y-0.5}, {center.x+0.5, center.y+0.5}},
      name = LWControl.interface[event.entity.name]}) do
      entity.destroy()
    end
  end	
end

-- build events
script.on_event(defines.events.on_built_entity, on_built)
script.on_event(defines.events.on_robot_built_entity, on_built)
script.on_event(defines.events.script_raised_revive, on_built)
script.on_event(defines.events.script_raised_built, on_built)
-- destroy events
script.on_event(defines.events.on_player_mined_entity, on_destroy)
script.on_event(defines.events.on_robot_mined_entity, on_destroy)
script.on_event(defines.events.on_entity_died, on_destroy)
