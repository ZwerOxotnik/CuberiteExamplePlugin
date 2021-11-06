-- https://api.cuberite.org/

-- Warning: I'm not a developer of Cuberite and not familiar with the API confidently etc.
-- Nevertheless, I hope these examples can help to newcomers etc. Perhaps, there are some issues, so let people know about it.

local root = cRoot:Get() -- https://api.cuberite.org/cRoot.html

-- The most important stuff here (https://api.cuberite.org/Writing-a-Cuberite-plugin.html)
-- function Initialize is called on plugin startup. It is the place where the plugin is set up.
function Initialize(Plugin)
	Plugin:SetName(g_PluginInfo.Name)
  Plugin:SetVersion(2)

  --- https://api.cuberite.org/cPluginManager.html
  -- Add hooks
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_JOINED, OnPlayerJoined)

	-- Bind ingame commands:
	dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")
	RegisterPluginInfoCommands()
	RegisterPluginInfoConsoleCommands()

  LOG("Initialised " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
  return true
end

function OnDisable()
  LOG("Shutting down ...")
end

---@param player table # https://api.cuberite.org/cPlayer.html
local function teleportPlayerToCenter(player)
  -- You can improve it using player:FindTeleportDestination
  player:TeleportToCoords(0, 80, 0) -- x, y, z

  -- It doesn't work for me or I forgot to do something
  player:AddEntityEffect( 1,  60, 2) -- Gives speed 2 for 60 secs
  player:AddEntityEffect(11,  60, 2) -- Gives resistance 2 for 60 secs
  player:AddEntityEffect(22,  60, 2) -- Gives absorption 2 for 60 secs
  player:AddEntityEffect(22, 120, 2) -- Gives fire resistance 2 for 120 secs
  player:AddEntityEffect(22, 120, 2) -- Gives water breathing 2 for 120 secs
end

---@param player table # https://api.cuberite.org/cPlayer.html
function OnPlayerJoined(player)
  -- Safely for the server teleport a joined player to center
  root:GetDefaultWorld():QueueTask(function()
    root:DoWithPlayerByUUID(player:GetUUID(), teleportPlayerToCenter)
  end)

  -- Signalize to Cuberite that we don't need to print that the player joined to this server to other players
  return true
end
