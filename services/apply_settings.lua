
local myname, ns = ...


local function OnTableChanged()
  for id,value in pairs(ns.dbpc) do
    TradeSkillFrame.RecipeList.collapsedCategories[id] = value
  end

  TradeSkillFrame.RecipeList:Refresh()
end


ns.RegisterCallback("_TABLE_CHANGED", OnTableChanged)
