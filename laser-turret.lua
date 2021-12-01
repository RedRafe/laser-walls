{
  type = "recipe",
  name = "laser-turret",
  enabled = false,
  energy_required = 20,
  ingredients =
  {
    {"steel-plate", 20},
    {"electronic-circuit", 20},
    {"battery", 12}
  },
  result = "laser-turret"
},
{
  type = "electric-turret",
  name = "laser-turret",
  icon = "__base__/graphics/icons/laser-turret.png",
  icon_size = 64, icon_mipmaps = 4,
  flags = { "placeable-player", "placeable-enemy", "player-creation"},
  minable = { mining_time = 0.5, result = "laser-turret" },
  max_health = 1000,
  collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
  selection_box = {{ -1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity(),
  rotation_speed = 0.01,
  preparing_speed = 0.05,
  preparing_sound = sounds.laser_turret_activate,
  folding_sound = sounds.laser_turret_deactivate,
  corpse = "laser-turret-remnants",
  dying_explosion = "laser-turret-explosion",
  folding_speed = 0.05,
  energy_source =
  {
    type = "electric",
    buffer_capacity = "801kJ",
    input_flow_limit = "9600kW",
    drain = "24kW",
    usage_priority = "primary-input"
  },
  folded_animation =
  {
    layers =
    {
      laser_turret_extension{frame_count=1, line_length = 1},
      laser_turret_extension_shadow{frame_count=1, line_length=1},
      laser_turret_extension_mask{frame_count=1, line_length=1}
    }
  },
  preparing_animation =
  {
    layers =
    {
      laser_turret_extension{},
      laser_turret_extension_shadow{},
      laser_turret_extension_mask{}
    }
  },
  prepared_animation =
  {
    layers =
    {
      laser_turret_shooting(),
      laser_turret_shooting_shadow(),
      laser_turret_shooting_mask()
    }
  },
  --attacking_speed = 0.1,
  energy_glow_animation = laser_turret_shooting_glow(),
  glow_light_intensity = 0.5, -- defaults to 0
  folding_animation =
  {
    layers =
    {
      laser_turret_extension{run_mode = "backward"},
      laser_turret_extension_shadow{run_mode = "backward"},
      laser_turret_extension_mask{run_mode = "backward"}
    }
  },
  base_picture =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
        priority = "high",
        width = 70,
        height = 52,
        direction_count = 1,
        frame_count = 1,
        shift = util.by_pixel(0, 2),
        hr_version =
        {
          filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base.png",
          priority = "high",
          width = 138,
          height = 104,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(-0.5, 2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-base-shadow.png",
        line_length = 1,
        width = 66,
        height = 42,
        draw_as_shadow = true,
        direction_count = 1,
        frame_count = 1,
        shift = util.by_pixel(6, 3),
        hr_version =
        {
          filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base-shadow.png",
          line_length = 1,
          width = 132,
          height = 82,
          draw_as_shadow = true,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(6, 3),
          scale = 0.5
        }
      }
    }
  },
  vehicle_impact_sound = sounds.generic_impact,

  attack_parameters =
  {
    type = "beam",
    cooldown = 40,
    range = 24,
    source_direction_count = 64,
    source_offset = {0, -3.423489 / 4},
    damage_modifier = 2,
    ammo_type =
    {
      category = "laser",
      energy_consumption = "800kJ",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "beam",
          beam = "laser-beam",
          max_length = 24,
          duration = 40,
          source_offset = {0, -1.31439 }
        }
      }
    }
  },

  call_for_help_radius = 40,
  water_reflection =
  {
    pictures =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-turret-reflection.png",
      priority = "extra-high",
      width = 20,
      height = 32,
      shift = util.by_pixel(0, 40),
      variation_count = 1,
      scale = 5
    },
    rotate = false,
    orientation_to_variation = false
  }
},