if not LaserWall then LaserWall = {} end

local path_g = "__laser-walls__/graphics/"
local laser_turret = data.raw["electric-turret"]["laser-turret"]

--[[
  @ LASER
    name = "laser-interface
    icon = path_g .. "laser-wall.png"
]]
local _layers = {
  {
    filename = path_g .. "transparent.png",
    priority = "extra-high",
    width = 32,
    height = 42,
    shift = util.by_pixel(0.078125, -0.3),
  }
}

local laser_layers = {
  {
    filename = path_g .. "transparent.png",
    priority = "extra-high",
    width = 32,
    height = 42,
    shift = util.by_pixel(0.078125, -0.3),
    direction_count = 1
  }
}

function laser_turret_shooting_glow()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-light.png",
    line_length = 8,
    width = 62,
    height = 58,
    frame_count = 1,
    direction_count = 64,
    blend_mode = "additive",
    shift = util.by_pixel(0, -35),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-shooting-light.png",
      line_length = 8,
      width = 122,
      height = 116,
      frame_count = 1,
      direction_count = 64,
      shift = util.by_pixel(-0.5, -35),
      blend_mode = "additive",
      scale = 0.5
    }
  }
end

local function transparent()
  return { layers = _layers }
end

local function LaserInterfaceEntity(laser)
  return {
    type = "electric-turret",
    name = laser.name,
    icon = laser.icon,
    icon_size = 64,
    hidden = true,
    flags =
    {
      "not-on-map",
      "placeable-off-grid",
      "not-in-kill-statistics"
    },
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    picture = { layers = _layers },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "200kJ",
      input_flow_limit = "2400kW",
      drain = "6kW",
      usage_priority = "primary-input"
    },

    rotation_speed = 0.01,
    preparing_speed = 0.05,
    preparing_sound = laser_turret.preparing_sound,
    folding_sound = laser_turret.folding_sound,

    folded_animation =
    {
      layers = laser_layers
    },
    --[[
    preparing_animation =
    {
      layers = laser_layers
    },
    prepared_animation =
    {
      layers = laser_layers
    },
    folding_animation =
    {
      layers = laser_layers
    },
    base_picture =
    {
      layers = _layers
    },
    ]]
    glow_light_intensity = 0.5,
    energy_glow_animation = laser_turret.energy_glow_animation,

    call_for_help_radius = 10,
    attack_parameters =
    {
      type = "beam",
      cooldown = 10,
      range = 6,
      source_direction_count = 64,
      source_offset = {0, -0.4},
      damage_modifier = 2,
      ammo_type =
      {
        category = "laser",
        energy_consumption = "200kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "laser-beam",
            max_length = 6,
            duration = 40,
            source_offset = {0, -0.4 }
          }
        }
      }
    },
  }
end

local function NewTierLaserInterface(laser)
  data:extend({ LaserInterfaceEntity(laser) })
end

LaserWall.LaserInterfaceEntity = LaserInterfaceEntity
LaserWall.NewTierInterface = NewTierLaserInterface
