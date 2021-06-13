local is_dst = GLOBAL.TheSim:GetGameID() == "DST"
local is_server = GLOBAL.TheNet:GetIsServer()

local VALUE = 1

local quick_pick = {
  "berrybush",
  "berrybush2",
  "bullkelp_plant",
  "blue_mushroom",
  "carrat_planted",
  "cactus",
  "coffeebush",
  "flower_cave",
  "flower_cave_double",
  "flower_cave_triple",
  "grass",
  "green_mushroom",
  "lichen",
  "marsh_bush",
  "oasis_cactus",
  "plant_normal_ground",
  "red_mushroom",
  "reeds",
  "rock_avocado_bush",
  "sapling_moon",
  "sapling",
  "wormlight_plant",
}

local function wilson_ops(inst)
  local harvest = GLOBAL.ActionHandler(
    GLOBAL.ACTIONS.HARVEST, 
    "doshortaction"
  )
  local cook = GLOBAL.ActionHandler(
    GLOBAL.ACTIONS.COOK, 
    "doshortaction"
  )
  inst.actionhandlers[GLOBAL.ACTIONS.HARVEST] = harvest
  inst.actionhandlers[GLOBAL.ACTIONS.COOK] = cook

  return
end

local function enable_quick_pick(inst)
  if inst.components.pickable then
    inst.components.pickable.quickpick = true
    return
  end
  return
end

if not is_dst or (is_dst and is_server) then
  for _, v in pairs(quick_pick) do
    AddPrefabPostInit(v, enable_quick_pick)
  end

  TUNING.EVERGREEN_CHOPS_SMALL = VALUE
  TUNING.EVERGREEN_CHOPS_NORMAL = VALUE
  TUNING.EVERGREEN_CHOPS_TALL = VALUE

  TUNING.DECIDUOUS_CHOPS_SMALL = VALUE
  TUNING.DECIDUOUS_CHOPS_NORMAL = VALUE
  TUNING.DECIDUOUS_CHOPS_TALL = VALUE
  TUNING.DECIDUOUS_CHOPS_MONSTER = VALUE

  TUNING.MUSHTREE_CHOPS_SMALL = VALUE
  TUNING.MUSHTREE_CHOPS_MEDIUM = VALUE
  TUNING.MUSHTREE_CHOPS_TALL = VALUE

  TUNING.MOON_TREE_CHOPS_SMALL = VALUE
  TUNING.MOON_TREE_CHOPS_NORMAL = VALUE
  TUNING.MOON_TREE_CHOPS_TALL = VALUE

  TUNING.ICE_MINE = VALUE

  TUNING.ROCKS_MINE = VALUE
  TUNING.ROCKS_MINE_MED = VALUE
  TUNING.ROCKS_MINE_LOW = VALUE

  TUNING.SPILAGMITE_SPAWNER = VALUE
  TUNING.SPILAGMITE_ROCK = VALUE

  TUNING.MARBLEPILLAR_MINE = VALUE
  TUNING.MARBLETREE_MINE = VALUE
  
  TUNING.CAVEIN_BOULDER_MINE = VALUE

  TUNING.SEASTACK_MINE = VALUE

  AddStategraphPostInit("wilson", wilson_ops)
end
