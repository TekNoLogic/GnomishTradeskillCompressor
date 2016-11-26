
local myname, ns = ...


local function OnCollapse(self, category_id, collapsed)
  if not category_id then return end
  ns.dbpc[category_id] = collapsed
end


hooksecurefunc(TradeSkillFrame.RecipeList, "SetCategoryCollapsed", OnCollapse)
