---@param split table<number, string> # https://api.cuberite.org/Writing-a-Cuberite-plugin.html
---@param player table # https://api.cuberite.org/cPlayer.html
function HandleCheckMessagesCommand(split, player)
  -- Format: §yellow[INFO] §white%text% (yellow [INFO], white text following it)
  -- Use: Informational message, such as instructions for usage of a command
  player:SendMessageInfo("Usage: " .. split[1])

  -- Format: §green[INFO] §white%text% (green [INFO] etc.)
  -- Use: Success message, like when a command executes successfully
  player:SendMessageSuccess("yay! " .. (split[2] or ''))

  -- Format: §rose[INFO] §white%text% (rose coloured [INFO] etc.)
  -- Use: Failure message, like when a command was entered correctly but failed to run, such as when the destination player wasn't found in a /tp command
  player:SendMessageFailure("red isn't red")

  -- Prepends Red [FATAL] / colours entire text (depending on ShouldUseChatPrefixes()) and sends message to player.
  -- Use: Something serious, such as a plugin crash, etc.
  player:SendMessageFatal("red is nil") -- something is off

  -- Prepends Rose [WARN] / colours entire text (depending on ShouldUseChatPrefixes()) and sends message to player.
  -- Denotes that something concerning, such as plugin reload, is about to happen.
  player:SendMessageWarning("warning message")

  player:SendMessagePrivateMsg("Private message", "CuberiteExamplePlugin")
  player:SendSystemMessage("System message")
  player:SendAboveActionBarMessage("Test message above action bar")

	-- Send an example composite chat message to the player:
  player:SendMessage("Test message")
	player:SendMessage(cCompositeChat() -- https://api.cuberite.org/cCompositeChat.html
		:AddTextPart("Hello, ")
		:AddUrlPart(player:GetName(), "https://cuberite.org", "u@2") -- Colored underlined link
		:AddTextPart(", ")
		:AddSuggestCommandPart("and welcome.", "/help", "u") -- Underlined suggest-command
		:AddTextPart(" ")
		:AddRunCommandPart("SetDay", "/time set 0") -- Regular text that will execute command when clicked (notice that any player can use the command)
		:SetMessageType(mtJoin) -- It is a join-message
	)

  return true
end

function HandleConsoleCheckMessages(Split)
	LOG("Test message")
end
