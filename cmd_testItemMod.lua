local enchants = cEnchantments() -- https://api.cuberite.org/cEnchantments.html
enchants:SetLevel(cEnchantments.enchFortune   , 4)
enchants:SetLevel(cEnchantments.enchEfficiency, 6)

---@param split table<number, string> # https://api.cuberite.org/Writing-a-Cuberite-plugin.html
---@param player table # https://api.cuberite.org/cPlayer.html
function HandleTestItemModCommand(split, player)
  item = player:GetEquippedItem()
  if cItem.IsEmpty(item) == false then
    enchanted = cItem(item) -- https://api.cuberite.org/cItem.html
    enchanted.m_CustomName = 'modItem'
    enchanted.m_Enchantments = enchants

    inventory = player:GetInventory()
    inventory:RemoveOneEquippedItem()
    inventory:SetEquippedItem(enchanted)
  end

  return true
end
