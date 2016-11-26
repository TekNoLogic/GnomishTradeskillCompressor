
local myname, ns = ...


local DELAY = 0.01


local last_table
local function Check()
  if TradeSkillFrame.RecipeList.pendingRefresh then
    C_Timer.After(DELAY, Check)
    return
  end

  if last_table == TradeSkillFrame.RecipeList.collapsedCategories then
    C_Timer.After(DELAY, Check)
    return
  end

  last_table = TradeSkillFrame.RecipeList.collapsedCategories
  ns.SendMessage("_TABLE_CHANGED")
end


-- This is a bit hackery... it's the first thing called after the table changes
hooksecurefunc(C_TradeSkillUI, "IsRecipeSearchInProgress", Check)
