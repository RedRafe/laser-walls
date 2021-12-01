require("laser-interface")
require("laser-technology")
require("laser-wall")

local path_g = "__laser-walls__/graphics/"

local laser = {
  {
    name = "laser-interface",
    icon = path_g .. "laser-wall.png",
  }
}

local wall_tier = {
  {
    name = "laser-wall",
    icon = path_g .. "laser-wall.png",
    tint = {
      r = 231/255,
      g = 210/255,
      b = 124/255,
      a = 255/255,
    },
    order = "a[stone-wall]-b[laser-wall]",
    enabled = false,
    energy_required = 5,
    max_health = 500,
    ingredients = 
    {
      { "steel-plate", 5 },
      { "electronic-circuit", 5 },
      { "battery", 4 },
      { "stone-wall", 1 }
    },
    result_count = 1,
    stack_size = 100,
    resistances = {
      {
        type = "physical",
        decrease = 5,
        percent = 40
      },
      {
        type = "impact",
        decrease = 65,
        percent = 75
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 50
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        decrease = 20,
        percent = 80
      },
      {
        type = "laser",
        percent = 100
      }
    }
  }
}

LaserWall.NewTierInterface(laser[1])
LaserWall.NewTierWall(wall_tier[1])
LaserWall.PushEffect("laser-turret", "laser-wall")

