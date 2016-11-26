
local myname, ns = ...


local DELAY = 0.01


local last_table
local function TableChanged()
  if TradeSkillFrame.RecipeList.pendingRefresh then return false end
  return last_table ~= TradeSkillFrame.RecipeList.collapsedCategories
end


local function Check()
  if not TableChanged() then return C_Timer.After(DELAY, Check) end

  last_table = TradeSkillFrame.RecipeList.collapsedCategories
  ns.SendMessage("_TABLE_CHANGED")
end


-- This is a bit hackery... it's the first thing called after the table changes
hooksecurefunc(C_TradeSkillUI, "IsRecipeSearchInProgress", Check)
