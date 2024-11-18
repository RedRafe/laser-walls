if not LaserWall then
  LaserWall = {}
end

local path_g = '__laser-walls__/graphics/'
local laser_turret = table.deepcopy(data.raw['electric-turret']['laser-turret'])

--[[
  @ LASER
    name = "laser-interface
    icon = path_g .. "laser-wall.png"
]]
local _layers = {
  {
    filename = path_g .. 'transparent.png',
    priority = 'extra-high',
    width = 32,
    height = 42,
    shift = util.by_pixel(0.078125, -0.3),
  },
}

local laser_layers = {
  {
    filename = path_g .. 'transparent.png',
    priority = 'extra-high',
    width = 32,
    height = 42,
    shift = util.by_pixel(0.078125, -0.3),
    direction_count = 1,
  },
}

local function transparent()
  return { layers = _layers }
end

local function LaserInterfaceEntity(laser)
  return {
    type = 'electric-turret',
    name = laser.name,
    icon = laser.icon,
    icon_size = 64,
    hidden = true,
    flags = { 'not-on-map', 'placeable-off-grid', 'not-in-kill-statistics', 'hide-alt-info' },
    collision_box = { { 0, 0 }, { 0, 0 } },
    selection_box = { { 0, 0 }, { 0, 0 } },
    picture = { layers = _layers },
    energy_source = {
      type = 'electric',
      buffer_capacity = '201kJ',
      input_flow_limit = '2400kW',
      drain = '6kW',
      usage_priority = 'primary-input'
    },
    quality_indicator_scale = 0,
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    folding_speed = 0.05,
    preparing_sound = laser_turret.preparing_sound,
    folding_sound = laser_turret.folding_sound,
    damaged_trigger_effect = laser_turret.damaged_trigger_effect,

    folded_animation = { layers = laser_layers },
    glow_light_intensity = 0.5,
    energy_glow_animation = laser_turret.energy_glow_animation,
    graphics_set = {},

    call_for_help_radius = 10,
    attack_parameters = {
      type = 'beam',
      cooldown = 10,
      range = 6,
      source_direction_count = 64,
      source_offset = { 0, -0.4 },
      damage_modifier = 2,
      ammo_category = 'laser',
      ammo_type = {
        energy_consumption = '200kJ',
        action = {
          type = 'direct',
          action_delivery = {
            type = 'beam',
            beam = 'laser-beam',
            max_length = 6,
            duration = 40,
            source_offset = { 0, -0.4 },
          },
        },
      },
    },
  }
end

local function NewTierLaserInterface(laser)
  data:extend({ LaserInterfaceEntity(laser) })
end

LaserWall.LaserInterfaceEntity = LaserInterfaceEntity
LaserWall.NewTierInterface = NewTierLaserInterface
