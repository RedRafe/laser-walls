if not LaserWall then LaserWall = {} end

local path_g = "__laser-walls__/graphics/"
local stone_wall = table.deepcopy(data.raw["wall"]["stone-wall"])


--[[
  @ WALL_TIER
    name = "Laser-wall"
    icon = path_g .. "Laser-wall.png"
    order = "a[stone-wall]-a[Laser-wall]"
    stack_size = 100
]]
local function WallItem(wall_tier)
  return {
    type = "item",
    name = wall_tier.name,
    icon = wall_tier.icon,
    icon_size = 64,
    subgroup = "defensive-structure",
    order = wall_tier.order,
    place_result = wall_tier.name,
    stack_size = wall_tier.stack_size
  }
end

--[[
  @ WALL_TIER
    name = "laser-wall"
    icon = path_g .. "laser-wall.png"
    energy_required = 10
    ingredients = 
    {
      {"laser", 1},
	    {"stone-wall", settings.startup["laser-wall-recipe-ratio"].value}
    }
    result_count = settings.startup["laser-wall-recipe-ratio"].value
]]
local function WallRecipe(wall_tier)
  return {
    type = "recipe",
    name = wall_tier.name,
    energy_required = wall_tier.energy_required, -- default is 0.5
    enabled = wall_tier.enabled,
    ingredients = wall_tier.ingredients,
    result = wall_tier.name,
	  result_count = wall_tier.result_count
  }
end

--[[
  @ WALL_TIER
    name = "laser-wall"
    icon = path_g .. "laser-wall.png"
    max_health = 350
    resistances = {}
]]
local function WallEntity(wall_tier)
  return {
    type = "wall",
    name = wall_tier.name,
    icon = wall_tier.icon,
    icon_size = 64,
    flags = stone_wall.flags,
    collision_box = stone_wall.collision_box,
    collision_mask = stone_wall.collision_mask,
    selection_box = stone_wall.selection_box,
    minable = { mining_time = 0.2, result = wall_tier.name },
    fast_replaceable_group = "wall",
    max_health = wall_tier.max_health,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    connected_gate_visualization =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      scale = 0.5
    },
    resistances = wall_tier.resistances,
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-single.png",
            priority = "extra-high",
            width = 32,
            height = 46,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -6),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-single.png",
              priority = "extra-high",
              width = 64,
              height = 86,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -5),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-single-shadow.png",
            priority = "extra-high",
            width = 50,
            height = 32,
            repeat_count = 2,
            shift = util.by_pixel(10, 16),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-single-shadow.png",
              priority = "extra-high",
              width = 98,
              height = 60,
              repeat_count = 2,
              shift = util.by_pixel(10, 17),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      straight_vertical =
      {
        layers =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-vertical.png",
            priority = "extra-high",
            width = 32,
            height = 68,
            variation_count = 5,
            line_length = 5,
            shift = util.by_pixel(0, 8),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-vertical.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 5,
              line_length = 5,
              shift = util.by_pixel(0, 8),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-vertical-shadow.png",
            priority = "extra-high",
            width = 50,
            height = 58,
            repeat_count = 5,
            shift = util.by_pixel(10, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-vertical-shadow.png",
              priority = "extra-high",
              width = 98,
              height = 110,
              repeat_count = 5,
              shift = util.by_pixel(10, 29),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      straight_horizontal =
      {
        layers =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-horizontal.png",
            priority = "extra-high",
            width = 32,
            height = 50,
            variation_count = 6,
            line_length = 6,
            shift = util.by_pixel(0, -4),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-horizontal.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 6,
              line_length = 6,
              shift = util.by_pixel(0, -2),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-horizontal-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 36,
            repeat_count = 6,
            shift = util.by_pixel(14, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-horizontal-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 68,
              repeat_count = 6,
              shift = util.by_pixel(14, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-corner-right.png",
            priority = "extra-high",
            width = 32,
            height = 64,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 6),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-corner-right.png",
              priority = "extra-high",
              width = 64,
              height = 128,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, 7),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-corner-right-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 60,
            repeat_count = 2,
            shift = util.by_pixel(14, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-corner-right-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 120,
              repeat_count = 2,
              shift = util.by_pixel(17, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-corner-left.png",
            priority = "extra-high",
            width = 32,
            height = 68,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 6),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-corner-left.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, 7),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-corner-left-shadow.png",
            priority = "extra-high",
            width = 54,
            height = 60,
            repeat_count = 2,
            shift = util.by_pixel(8, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-corner-left-shadow.png",
              priority = "extra-high",
              width = 102,
              height = 120,
              repeat_count = 2,
              shift = util.by_pixel(9, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-t.png",
            priority = "extra-high",
            width = 32,
            height = 68,
            variation_count = 4,
            line_length = 4,
            shift = util.by_pixel(0, 6),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-t.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 4,
              line_length = 4,
              shift = util.by_pixel(0, 7),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-t-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 60,
            repeat_count = 4,
            shift = util.by_pixel(14, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-t-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 120,
              repeat_count = 4,
              shift = util.by_pixel(14, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-ending-right.png",
            priority = "extra-high",
            width = 32,
            height = 48,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -4),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-ending-right.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -3),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-ending-right-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 36,
            repeat_count = 2,
            shift = util.by_pixel(14, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-ending-right-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 68,
              repeat_count = 2,
              shift = util.by_pixel(17, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-ending-left.png",
            priority = "extra-high",
            width = 32,
            height = 48,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -4),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-ending-left.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -3),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-ending-left-shadow.png",
            priority = "extra-high",
            width = 54,
            height = 36,
            repeat_count = 2,
            shift = util.by_pixel(8, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-ending-left-shadow.png",
              priority = "extra-high",
              width = 102,
              height = 68,
              repeat_count = 2,
              shift = util.by_pixel(9, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      filling =
      {
        filename = path_g .. wall_tier.name .. "/wall-filling.png",
          priority = "extra-high",
          width = 24,
          height = 30,
          variation_count = 8,
          line_length = 8,
          shift = util.by_pixel(0, -2),
          tint = wall_tier.tint,
          hr_version =
          {
            filename = path_g .. wall_tier.name .. "/hr-wall-filling.png",
            priority = "extra-high",
            width = 48,
            height = 56,
            variation_count = 8,
            line_length = 8,
            shift = util.by_pixel(0, -1),
            tint = wall_tier.tint,
            scale = 0.5
          }
      },
      water_connection_patch =
      {
        sheets =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-patch.png",
            priority = "extra-high",
            width = 58,
            height = 64,
            shift = util.by_pixel(0, -2),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-patch.png",
              priority = "extra-high",
              width = 116,
              height = 128,
              shift = util.by_pixel(0, -2),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-patch-shadow.png",
            priority = "extra-high",
            width = 74,
            height = 52,
            shift = util.by_pixel(8, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-patch-shadow.png",
              priority = "extra-high",
              width = 144,
              height = 100,
              shift = util.by_pixel(9, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      gate_connection_patch =
      {
        sheets =
        {
          {
            filename = path_g .. wall_tier.name .. "/wall-gate.png",
            priority = "extra-high",
            width = 42,
            height = 56,
            shift = util.by_pixel(0, -8),
            tint = wall_tier.tint,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-gate.png",
              priority = "extra-high",
              width = 82,
              height = 108,
              shift = util.by_pixel(0, -7),
              tint = wall_tier.tint,
              scale = 0.5
            }
          },
          {
            filename = path_g .. wall_tier.name .. "/wall-gate-shadow.png",
            priority = "extra-high",
            width = 66,
            height = 40,
            shift = util.by_pixel(14, 18),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. wall_tier.name .. "/hr-wall-gate-shadow.png",
              priority = "extra-high",
              width = 130,
              height = 78,
              shift = util.by_pixel(14, 18),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      }
    },
    wall_diode_green = util.conditional_return(not data.is_demo,
    {
      sheet =
      {
        filename = path_g .. wall_tier.name .. "/wall-diode-green.png",
        priority = "extra-high",
        width = 38,
        height = 24,
        --frames = 4, -- this is optional, it will default to 4 for Sprite4Way
        shift = util.by_pixel(-2, -24),
        hr_version =
        {
          filename = path_g .. wall_tier.name .. "/hr-wall-diode-green.png",
          priority = "extra-high",
          width = 72,
          height = 44,
          --frames = 4,
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    }),
    wall_diode_green_light_top = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_green_light_right = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_green_light_bottom = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_green_light_left = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_red = util.conditional_return(not data.is_demo,
    {
      sheet =
      {
        filename = path_g .. wall_tier.name .. "/wall-diode-red.png",
        priority = "extra-high",
        width = 38,
        height = 24,
        --frames = 4, -- this is optional, it will default to 4 for Sprite4Way
        shift = util.by_pixel(-2, -24),
        hr_version =
        {
          filename = path_g .. wall_tier.name .. "/hr-wall-diode-red.png",
          priority = "extra-high",
          width = 72,
          height = 44,
          --frames = 4,
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    }),
    wall_diode_red_light_top = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_red_light_right = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_red_light_bottom = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_red_light_left = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.3
    }),

    circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
    circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = data.is_demo and {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
  }
end

local function NewTierLaserWall(wall_tier)
  data:extend({
    WallEntity(wall_tier),
    WallItem(wall_tier),
    WallRecipe(wall_tier),
  })
end


LaserWall.WallEntity = WallEntity
LaserWall.WallItem = WallItem
LaserWall.WallRecipe = WallRecipe
LaserWall.NewTierWall = NewTierLaserWall