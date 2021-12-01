
if not LaserWall then LaserWall = {} end

local function PushEffect(technology_name, recipe_name)
  if data.raw.technology[technology_name] then 
    table.insert(data.raw.technology[technology_name].effects, {
      type = "unlock-recipe",
      recipe = recipe_name
    })
  else
    data.raw.recipe[recipe_name].enabled = true
  end
end

LaserWall.PushEffect = PushEffect